# **Hero ranking viewer**
### A technical assessment by Leónidas Neftalí González Campos
---
## **Requirements from interviewer**

1. Create an MVC application using HTML (Ideally use Razor for front) + .NET + Entity Framework + PostgreSQL DB (you are free to choose any other DB manager, but ideally is PostgreSQL DB).

2. The app shall see a screen with a button in the middle of the screen which after being pressed should redirect to another screen which lists 10 items fetched from the database. An item has the following information:
    - Name of Hero
    - Age
    - City
    - Rating of Hero
    - Picture
    - History of past ratings (1 to 5 is ok to show, more is unnecessary)
    - A Rating is composed of a score in the range of 0 to 5, and it also includes the name of the person who rated the hero.

3. Heroes must appear in order of its median rating score, the Hero that has a better score median is shown first. And that&#39;s it, no back button no extras required. Code quality and good structure are also factors being evaluated.
## **Technologies implemented**
- PostgreSQL
- Entity Framework Core
- ASP.NET 6.0
- C# 7.0+
- Npgsql
- HTML5
- Razor Pages
- Python (automating data insertion)
##
Please make sure you have all necessary technologies when running this application, since the opposite could lead to compatibility issues, or the application not building!
## **Building the project**
### **Database creation and connection**
For the proper creation of our database, you'll need to first, create a local instance of the database, and then use the given sql scripts to properly import both structure and data.
###
Run the following under your terminal for creation:
```PowerShell
C:\> psql -U {username}
password for user {username}: {password}
```
After logging in, create the database
```SQL
postgres=# Create Database herotest with owner = {user};
postgres=# \c herotest
```
You should now be connected to our empty database, you can use any DBMS such as [DataGrip](https://www.jetbrains.com/datagrip/) to import your data using the provided SQL script at 

> \>/DatabaseInfo/import.sql

at the root of the repository, or by downloading it here: https://drive.google.com/drive/folders/19WY7p7IfhlfWsJ0Wl3BMl06mK38H4Ita?usp=share_link

**Note**: Make sure you are connected to localhost:5432 to create this database, otherwise, you'll need to rewrite the connection string inside [HerotestContext.cs](/Models/HerotestContext.cs). Example:
```C#
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) => optionsBuilder.UseNpgsql($"Host={host};Port={port};user id={user};password={password};Database=herotest;");
```
### **Packages used**
Once you have the database created, you should be able to run the project without much issue, however, if you find yourself with package issues, here's the list of the used packages and versions so that you can re-install them on your own through the *PackageManager* console:
```XML
  <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="7.0.5" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="7.0.5">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="7.0.3" />
  </ItemGroup>
```
---
## **Design and decisions**
### **The many considerations made throughout this project**
As a side note, I must mention that due to currently being employed and with a few stories to take care, the development of this application took place in a single night, therefore some solutions might be not entirely optimal, although we will go through the possibilities and potential risks to the software.
### **Creating the entities**
Since we need to keep a record of heroes, an average rating for each one, and historical ratings, I decided to sacrifice just a little bit of CPU for a more reliable approach, on which we have two tables:
1. Heroes
2. Ratings

None of these tables have a reference to an average rating, therefore, that property will be calculated at runtime, this allows us to always have the correct information each time we do
```C#
Hero hero = this.heroRepository.FindOne(id);
//This will actually query and load the data within the entity's relationships
float avgRating = hero.GetAverageRating();
```
This works for our purposes, but be mindful it might become exponentially more expensive the more data we have, since its time complexity is *O(n ⋅ m)*.
###
Here we have the complete diagram for the entities used:

![DbDiagram](/DatabaseInfo/DB%20diagram.png)
Code:
```C#
//Hero class
public partial class Hero : IComparable<Hero> {
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Age { get; set; }

    public string? City { get; set; }

    public string Picture { get; set; } = null!;

    public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();
  ...
}
//Rating class
public partial class Rating : IComparable<Rating> {
    public Guid Id { get; set; }

    public string Rater { get; set; } = null!;

    public int Score { get; set; }

    public Guid HeroId { get; set; }

    public virtual Hero Hero { get; set; } = null!;
    ...
}
```
This gives us a 1:n relationship between the two entities.
### **Sorting**
Given that we've implemented IComparable for each one of our entities, the sorting process will be fairly simple for us to know which heroes will have a higher score
```C#
//...On hero class

/// <summary>
/// This can be used to rank any collection of heroes given through built-in sorting algorithms
/// </summary>
/// <returns>The difference between the ratings of both heroes</returns>
public int CompareTo(Hero? other) {
  if (other == null) return 1;
  //Doing difference with other first instead of this object, because a higher rating means priority in the list
  float diff = MathF.Round(other.GetAverageRating() - this.GetAverageRating(), 2);
  if (diff < 0f) return -1;
  if (diff > 0f) return 1;
  return 0;
}
```
On the implementation we can simply call it like this:
```C#
//...On HeroService
public Hero[] GetHeroesSorted() {
  //Get all heroes
  Hero[] heroes = this.heroRepository.GetAllWithRelatedData((hero) => hero.Ratings).ToArray();
  //Sort them out (comparison is implemented through the Hero class)
  Array.Sort(heroes);
  //Return
  return heroes;
}
```
And just like that we have our crucial part of the project done, sorting heroes based on their score.
What follows is how to actually get this information, and for better abstraction and flexibility, I opted to implement a generic repository pattern using the following interface:
```C#
public interface IRepository<T> where T : class {
  T? GetById(Guid id);
  IEnumerable<T> GetAll();
  IEnumerable<T> GetAllWithRelatedData(params Expression<Func<T, object>>[] expressionList);
  IEnumerable<T> GetAll(int limit);
  void Add(T entity);
  void AddRange(IEnumerable<T> entities);
  void Remove(T entity);
  void RemoveRange(IEnumerable<T> entities);
  T? FindOne(Expression<Func<T, bool>> expression);
}
```
This decision makes it easier for us to implement any specific repository we want for a generic class, standardizing our work across all entities. For a complete implementation, see: [Repository.cs](/Models/Repositories/Repository.cs)
### **File structure**
I believe that code can be modular and implemented in an elegant manner, that's why I love the Service unit of work pattern, it allows us to do a lot of logic checks without having the Controller layer worrying about it, for this application to work we'll only need [HeroService](/Services/HeroService.cs)
### **Connection with Razor**
The data layer that ends up going to Razor is passed through the ```ViewBag``` property, this is so we can access the sorted array of heroes through C# and embed it into our HTML (basically, code generation, which is always really cool :D!).

*Controller code:*
```C#
public IActionResult Index() {
  return View();
}

[Route("Ranking")]
public IActionResult Ranking() {
  Hero[] heroes = this.heroService.GetHeroesSorted();
  _logger.LogDebug($"Heroes found: {heroes.Length}");
  ViewBag.Heroes = heroes;
  return View();
}
```
*Razor methods:*

```C#
@{
    object RenderHeroes() {
        foreach (Hero hero in ViewBag.Heroes) {
           //Create a new instance of the component every hero pass
            ... A bunch of HTML code here
        }
        return null;
    }

    object RenderRatings(ICollection<Rating> ratings) {
        const int MAX_RATINGS_TO_SHOW = 5;
        int limit = ratings.Count > MAX_RATINGS_TO_SHOW ? MAX_RATINGS_TO_SHOW : ratings.Count;
        for (int i = 0; i < limit; i++) {
            Rating rating = ratings.ElementAt(i);
            ... A little bit more of HTML code generation over there
        }
        return null;
    }

    object RenderNoHeroesMessageIfEmpty() {
        if (ViewBag.Heroes.Length < 1) {
            ... An HTML message to inform the user the data is empty 
        }
        return null;
    }

}
```
## **Conclusion**
There are a lot of other design choices sprinkled throughout the application, but that is the TLDR for now, at the end the application is functional, and quite reliable with upwards of 215 records for ratings and heroes, which leads me to believe that it meets the requirements of the technical assessment.
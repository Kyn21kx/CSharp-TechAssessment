using TechAssessmentMVC.Auxiliars;
using TechAssessmentMVC.Models.Repositories;

namespace TechAssessmentMVC.Services {
	public class HeroService {

		private readonly Repository<Hero> heroRepository;

		public HeroService(IRepository<Hero> heroRepository) {
			this.heroRepository = (Repository<Hero>)heroRepository;
		}

		public Hero[] GetHeroesSorted() {
			//Get all heroes
			Hero[] heroes = this.heroRepository.GetAllWithRelatedData((hero) => hero.Ratings).ToArray();
			//Sort them out (comparison is implemented through the Hero class)
			Array.Sort(heroes);
			//Return
			return heroes;
		}

		//Not fully implemented, but could be useful for a future programmer
		public TransactionResult AddHero(Hero hero) {
			//Check if the hero exists in the DB (we can make an assumption here bc hero.Name is a unique property, but be careful with this)
			Hero? existingHero = this.heroRepository.FindOne((queryHero) => queryHero.Name == hero.Name);
			if (existingHero == null)
				return TransactionResult.RESOURCE_DUPLICATED;
			this.heroRepository.Add(hero);
			return TransactionResult.ADDED;
		}

	}
}

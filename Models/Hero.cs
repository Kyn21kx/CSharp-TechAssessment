using System;
using System.Collections.Generic;

namespace TechAssessmentMVC.Models;

public partial class Hero : IComparable<Hero> {
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Age { get; set; }

    public string? City { get; set; }

    public string Picture { get; set; } = null!;

    public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();


	//This could be a cached reference if we need faster performance
	public float GetAverageRating() {
		float sum = 0f;
		foreach (var rating in this.Ratings) {
			sum += rating.Score;
		}
		//Ratings -> collect -> average
		if (sum < 1f) return 0f;
		return sum / this.Ratings.Count;
	}

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

}

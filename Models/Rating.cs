using System;
using System.Collections.Generic;

namespace TechAssessmentMVC.Models;

public partial class Rating : IComparable<Rating> {
    public Guid Id { get; set; }

    public string Rater { get; set; } = null!;

    public int Score { get; set; }

    public Guid HeroId { get; set; }

    public virtual Hero Hero { get; set; } = null!;

    public int CompareTo(Rating? other) {
        if (other == null) return 1;
        if (this.Score < other.Score) return -1;
        if (this.Score > other.Score) return 1;
        return 0;
    }

}

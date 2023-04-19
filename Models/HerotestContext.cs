using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TechAssessmentMVC.Models;

public partial class HerotestContext : DbContext
{
    public HerotestContext()
    {
    }

    public HerotestContext(DbContextOptions<HerotestContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Hero> Heroes { get; set; }

    public virtual DbSet<Rating> Ratings { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;user id=postgres;password=123;Database=herotest;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.HasPostgresExtension("uuid-ossp");

        modelBuilder.Entity<Hero>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("hero_pkey");

            entity.ToTable("hero");

            entity.HasIndex(e => e.Name, "name_unique").IsUnique();

            entity.Property(e => e.Id)
                .HasDefaultValueSql("uuid_generate_v4()")
                .HasColumnName("id");
            entity.Property(e => e.Age).HasColumnName("age");
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .HasColumnName("city");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .HasColumnName("name");
            entity.Property(e => e.Picture).HasColumnName("picture");
        });

        modelBuilder.Entity<Rating>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("ratings_pkey");

            entity.ToTable("rating");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("uuid_generate_v4()")
                .HasColumnName("id");
            entity.Property(e => e.HeroId).HasColumnName("hero_id");
            entity.Property(e => e.Rater)
                .HasMaxLength(50)
                .HasColumnName("rater");
            entity.Property(e => e.Score).HasColumnName("score");

            entity.HasOne(d => d.Hero).WithMany(p => p.Ratings)
                .HasForeignKey(d => d.HeroId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("ratings_hero_id_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

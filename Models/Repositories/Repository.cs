using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace TechAssessmentMVC.Models.Repositories {
	public class Repository<T> : IRepository<T>, IDisposable where T : class {
		
		/// <summary>
		/// If true, the connection has been closed
		/// </summary>
		public bool Disposed { get; private set; }

		/// <summary>
		/// The amount of operations made with the current repository
		/// </summary>
		public int StatesChanged { get; private set; }

		protected readonly HerotestContext context;

		public Repository(HerotestContext context) { 
			this.context = context;
			this.Disposed = false;
			this.context.SavedChanges += Context_SavedChanges;
		}

		private void Context_SavedChanges(object? sender, Microsoft.EntityFrameworkCore.SavedChangesEventArgs e) {
			this.StatesChanged += e.EntitiesSavedCount;
		}

		public void Add(T entity) {
			this.context.Set<T>().Add(entity);
		}

		public void AddRange(IEnumerable<T> entities) {
			this.context.Set<T>().AddRange(entities);
		}

		public IEnumerable<T> GetAll() => this.context.Set<T>();
		
		public IEnumerable<T> GetAll(int limit) => this.context.Set<T>().Take(limit);

		/// <summary>
		/// Finds the entity in the context with the given Guid
		/// </summary>
		/// <param name="id">The id of the item to look for</param>
		/// <returns>The entity found or null</returns>
		public T? GetById(Guid id) => this.context.Set<T>().Find(id);

		public T? FindOne(Expression<Func<T, bool>> expression) {
			return this.context.Set<T>().Where(expression).FirstOrDefault();
		}

		public void Remove(T entity) {
			this.context.Set<T>().Remove(entity);
		}

		public void RemoveRange(IEnumerable<T> entities) {
			this.context.Set<T>().RemoveRange(entities);
		}

		protected virtual void Dispose(bool disposing) {
			if (this.Disposed) return;
			if (disposing)
				this.context.Dispose();
			this.Disposed = true;
		}

		public void Dispose() {
			Dispose(true);
			GC.SuppressFinalize(this);
		}

		public IEnumerable<T> GetAllWithRelatedData(params Expression<Func<T, object>>[] expressionList) {
			var query = this.context.Set<T>().AsQueryable();
			foreach (var expression in expressionList) {
				query = query.Include(expression);
			}

			return query;
		}
	}
}

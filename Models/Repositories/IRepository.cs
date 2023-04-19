using System.Linq.Expressions;

namespace TechAssessmentMVC.Models.Repositories {
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
}

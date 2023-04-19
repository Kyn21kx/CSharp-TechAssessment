using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using TechAssessmentMVC.Models;
using TechAssessmentMVC.Services;

namespace TechAssessmentMVC.Controllers {
	public class HomeController : Controller {
		private readonly ILogger<HomeController> _logger;
		private readonly HeroService heroService;

		public HomeController(ILogger<HomeController> logger, HeroService heroService) {
			_logger = logger;
			this.heroService = heroService;
		}

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

		public IActionResult Privacy() {
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error() {
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
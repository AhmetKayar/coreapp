using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class ValuesController : Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
    }
}
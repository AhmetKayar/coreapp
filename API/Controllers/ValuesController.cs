using System;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ValuesController : Controller
    {
        [HttpGet]
        public string Index()
        {
            return "Hello Word";
        }
    }
}
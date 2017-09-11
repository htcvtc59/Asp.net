using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CategoryBookMVC.Startup))]
namespace CategoryBookMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

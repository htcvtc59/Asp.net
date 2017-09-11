using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Data_ValidationsMVC.Startup))]
namespace Data_ValidationsMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

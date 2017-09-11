using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LoginAddAccount.Startup))]
namespace LoginAddAccount
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

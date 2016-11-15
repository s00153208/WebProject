using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Newtonsoft.Json;
using Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {

                ApplicationDbContext ctx = new ApplicationDbContext();
                var store = new UserStore<ApplicationUser>(new ApplicationDbContext());
                var userManager = new UserManager<ApplicationUser>(store);
                ApplicationUser user = userManager.FindByNameAsync(User.Identity.Name).Result;
                var query = from n in ctx.Notifications
                            where n.UserId == user.Id
                            select n;
                var serializer = new JavaScriptSerializer();
                var serializedResult = serializer.Serialize(query.ToList());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "createMessage(" + serializedResult + ")", true);

            }
        }

        protected void btnAddNote_Click(object sender, EventArgs e)
        {

        }
    }
}
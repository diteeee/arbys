using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace arbys
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition(
                "jquery",
                new ScriptResourceDefinition
                {
                    Path = "~/admin/assets/js/jquery/jquery.min.js", // Update this path if necessary
                    DebugPath = "~/admin/assets/js/jquery/jquery.js", // Optional, use if you have a non-minified version
                    CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js", // Optional CDN fallback
                    CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js", // Optional CDN fallback
                    CdnSupportsSecureConnection = true
                });
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Endpoints
{
    public partial class EndpointsPrinterFriendly : System.Web.UI.Page
    {
        protected static List<Endpoint> em;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                em = PreviousPage.CurrentEndpoints;

                String str = String.Empty;

                if (em.Count == 0)
                {
                    lblText.Text = "No Endpoints";
                }
                else
                {

                    for (int i = 0; i < em.Count; i++)
                    {

                        //lblText.Text += em.endpoint_list[i].ToString();
                        //lblText.Text += "\n========================================================================================\n";
                       TextBox1.Text += em[i].ToString();
                       TextBox1.Text += "\n========================================================================================\n";
                    }


                }
                    }catch {
                        lblText.Text = "Load Error";
                     }
             }
        
    }
}
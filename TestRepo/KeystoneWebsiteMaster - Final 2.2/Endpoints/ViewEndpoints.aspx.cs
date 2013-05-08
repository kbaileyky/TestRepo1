using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Endpoints
{

  
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected static List<Endpoint> em;
        //protected static List<User> ls;

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    drplstTokens.Items.Clear();
            //    ls = Trinity.OpenStack.User.List(LoginSession.adminURL, LoginSession.userToken.token_id);
            //    foreach (User usr in ls)
            //    {
            //        drplstTokens.Items.Add(usr.name + " " + usr.id);
            //    }


            //}
            //catch
            //{
            //}


            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if(((WebForm1)sender).CurrentEndpoints != null)
                    em = ((WebForm1)sender).CurrentEndpoints;
                else
                    em = new List<Endpoint>();

            } else {
                em = new List<Endpoint>();
            }
            lstbxEndpoints.SelectedIndexChanged += new EventHandler(lstbxEndpoints_SelectedIndexChanged);
        }

        protected void btnListEndpoints_Click(object sender, EventArgs e)
        {
            try
            {
               
                em = new List<Endpoint>();
                lstbxEndpoints.Items.Clear();
               // em = Endpoint.List_Endpoints(LoginSession.adminURL, ls[lstbxEndpoints.SelectedIndex].id, LoginSession.userToken.token_id);
                em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                foreach (Endpoint endp in em)
                {
                    lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id );

                }

                if (em.Count != 0)
                {
                    lnkbtnPrintFV.Visible = true;
                }
                else
               {
                   lnkbtnPrintFV.Visible = false;
               }

     
            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
            }
        }


        protected void lstbxEndpoints_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEndpointInfo.Visible = true;
            if (em != null)
            {

                Endpoint ep = em[lstbxEndpoints.SelectedIndex];
                lblName.Text = ep.name;
                lblID.Text = ep.id;
                lblAdminURL.Text = ep.admin_url;
                lbltype.Text = ep.endpoint_type;
                lblIntURL.Text = ep.internal_url;
                lblpublicURL.Text = ep.public_url;
                lblregion.Text = ep.region;
            }
            else
            {
                lblEndpoint.Text = "Error null Endpoint List";
            }

        }

        public List<Endpoint> CurrentEndpoints
        {
            get
            {
                return em;
            }
        }
    }
}
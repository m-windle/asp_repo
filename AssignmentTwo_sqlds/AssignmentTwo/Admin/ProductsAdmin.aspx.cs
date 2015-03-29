using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentTwo
{
    public partial class ProductsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }

        protected void valDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (calProdDate.SelectedDate == null
                   || calProdDate.SelectedDate == new DateTime(0001, 1, 1, 0, 0, 0))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}
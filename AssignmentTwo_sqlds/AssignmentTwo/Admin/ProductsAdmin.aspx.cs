using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentTwo.Admin
{
    public partial class ProductsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void valDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Calendar calProdDate = dvProductInsert.FindControl("calProdDate") as Calendar;

            try
            {
                if (calProdDate.SelectedDate == null
                        || calProdDate.SelectedDate == new DateTime(0001, 1, 1, 0, 0, 0)
                        || calProdDate.SelectedDate.Equals(null))
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            catch (Exception e)
            {
                args.IsValid = false;
            }
        }

        protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblServerError.Visible = true;
                lblServerError.Text = "A database error occured. Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblServerError.Visible = true;
                lblServerError.Text = "Another user may have updated this entry already";
            }
                
        }

        protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblServerError.Visible = true;
                lblServerError.Text = "A database error occured. Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblServerError.Visible = true;
                lblServerError.Text = "Another user may have updated this entry already";
            }
        }
    }
}
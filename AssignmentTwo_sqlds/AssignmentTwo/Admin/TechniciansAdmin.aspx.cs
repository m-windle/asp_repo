using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentTwo
{
    public partial class TechniciansAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDbError.Visible = false;
        }

        protected void dvTechs_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "A database error occured. Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "Another user may have deleted this entry already";
            }
            else
                ddlTechs.DataBind();
        }

        protected void dvTechs_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "A database error occured. Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "Another user may have updated this entry already";
            }
        }

        protected void dvTechs_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "A database error occured. Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDbError.Visible = true;
                lblDbError.Text = "Another user may have added this entry already";
            }
            else
                ddlTechs.DataBind();
        }


    }
}
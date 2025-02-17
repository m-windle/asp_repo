﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentTwo.Admin
{
    public partial class CustomersAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDbError.Visible = false;
        }

        protected void dvCustomerSelect_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
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
                grdCustomers.DataBind();
        }

        protected void dvCustomerSelect_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
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
            else
                grdCustomers.DataBind();
        }

        protected void dvCustomerSelect_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
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
                grdCustomers.DataBind();
        }
    }
}
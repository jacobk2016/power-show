﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_cs_fields_multilinefield : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.Title = "Order Details";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;

        Obout.SuperForm.BoundField field11 = new Obout.SuperForm.BoundField();
        field11.DataField = "OrderID";
        field11.HeaderText = "Order ID";
        field11.ReadOnly = true;
        field11.InsertVisible = false;

        Obout.SuperForm.BoundField field12 = new Obout.SuperForm.BoundField();
        field12.DataField = "ShipName";
        field12.HeaderText = "Ship Name";

        Obout.SuperForm.MultiLineField field13 = new Obout.SuperForm.MultiLineField();
        field13.DataField = "AdditionalInformation";
        field13.HeaderText = "Information";

        Obout.SuperForm.MultiLineField field14 = new Obout.SuperForm.MultiLineField();
        field14.DataField = "AdditionalInformationHTML";
        field14.HeaderText = "Additional Information";


        SuperForm1.Fields.Add(field11);
        SuperForm1.Fields.Add(field12);
        SuperForm1.Fields.Add(field13);
        SuperForm1.Fields.Add(field14);

        SuperForm1Container.Controls.Add(SuperForm1);
    }
}

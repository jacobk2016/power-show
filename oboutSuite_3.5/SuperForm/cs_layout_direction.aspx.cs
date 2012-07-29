﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_cs_layout_direction : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.FolderStyle = "styles/black_glass";
        SuperForm1.Direction = Direction.Horizontal;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.Width = Unit.Pixel(630);
        SuperForm1.FieldHeaderStyle.Width = Unit.Pixel(110);

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;
        field1.Visible = false;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";

        Obout.SuperForm.DropDownListField field3 = new Obout.SuperForm.DropDownListField();
        field3.DataField = "ShipCountry";
        field3.DisplayField = "ShipCountry";
        field3.HeaderText = "Ship Country";
        field3.DataSourceID = "SqlDataSource2";

        Obout.SuperForm.DateField field4 = new Obout.SuperForm.DateField();
        field4.DataField = "OrderDate";
        field4.HeaderText = "Order Date";
        field4.DataFormatString = "{0:MM/dd/yyyy}";
        field4.ApplyFormatInEditMode = true;

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);

        SuperForm1Container.Controls.Add(SuperForm1);  
    }

    protected void SetDirection(object sender, EventArgs e)
    {
        if (VerticalDirection.Checked)
        {
            SuperForm1.Direction = Direction.Vertical;
            SuperForm1.Width = Unit.Pixel(350);
        }
        else if (HorizontalDirection.Checked)
        {
            SuperForm1.Direction = Direction.Horizontal;
            SuperForm1.Width = Unit.Pixel(630);
        }

        SuperForm1.DataBind();
    }
}

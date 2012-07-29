﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_cs_validation_type : System.Web.UI.Page
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
        
        RangeValidator field4Range = new RangeValidator();
        field4Range.ID = "RangeValidator1";
        field4Range.MinimumValue = "1900/1/1";
        field4Range.MaximumValue = "2039/12/31";
        field4Range.Type = ValidationDataType.Date;
        field4Range.ErrorMessage = "*";

        RangeValidator field5Range = new RangeValidator();
        field5Range.ID = "RangeValidator2";
        field5Range.MinimumValue = "1900/1/1";
        field5Range.MaximumValue = "2039/12/31";
        field5Range.Type = ValidationDataType.Date;
        field5Range.ErrorMessage = "*";

        RangeValidator field6Range = new RangeValidator();
        field6Range.ID = "RangeValidator3";
        field6Range.MinimumValue = "1900/1/1";
        field6Range.MaximumValue = "2039/12/31";
        field6Range.Type = ValidationDataType.Date;
        field6Range.ErrorMessage = "*";

        RangeValidator field7Range = new RangeValidator();
        field7Range.ID = "RangeValidator4";
        field7Range.MinimumValue = "0.00";
        field7Range.MaximumValue = "999.99";
        field7Range.Type = ValidationDataType.Currency;
        field7Range.ErrorMessage = "*";

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";
        field2.Required = true;

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCountry";
        field3.HeaderText = "Ship Country";
        field3.Required = true;

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "OrderDate";
        field4.HeaderText = "Order Date";
        field4.Required = true;
        field4.DataFormatString = "{0:MM/dd/yyyy}";
        field4.ApplyFormatInEditMode = true;
        field4.Validators.Add(field4Range);

        Obout.SuperForm.DateField field5 = new Obout.SuperForm.DateField();
        field5.DataField = "ShippedDate";
        field5.HeaderText = "Shipped Date";
        field5.Required = true;
        field5.DataFormatString = "{0:MM/dd/yyyy}";
        field5.ApplyFormatInEditMode = true;
        field5.Validators.Add(field5Range);

        Obout.SuperForm.DateField field6 = new Obout.SuperForm.DateField();
        field6.DataField = "RequiredDate";
        field6.HeaderText = "Required Date";
        field6.Required = true;
        field6.DataFormatString = "{0:MM/dd/yyyy}";
        field6.ApplyFormatInEditMode = true;
        field6.Validators.Add(field6Range);

        Obout.SuperForm.BoundField field7 = new Obout.SuperForm.BoundField();
        field7.DataField = "Freight";
        field7.HeaderText = "Freight";
        field7.Required = true;
        field7.DataFormatString = "{0:C2}";
        field7.ApplyFormatInEditMode = false;
        field7.Validators.Add(field7Range);

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);

        SuperForm1Container.Controls.Add(SuperForm1);
    }
}

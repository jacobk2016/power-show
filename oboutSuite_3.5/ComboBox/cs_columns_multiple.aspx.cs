﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_columns_multiple : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private ComboBox ComboBox2;
    private ComboBox ComboBox3;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.MenuWidth = Unit.Pixel(325);
        ComboBox1.Width = Unit.Pixel(150);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";

        ComboBox1Container.Controls.Add(ComboBox1);

       
        ComboBox2 = new ComboBox();
        ComboBox2.ID = "ComboBox2";
        ComboBox2.MenuWidth = Unit.Pixel(475);
        ComboBox2.Width = Unit.Pixel(150);
        ComboBox2.DataSourceID = "sds1";
        ComboBox2.DataTextField = "CountryName";
        ComboBox2.DataValueField = "CountryID";

        ComboBox2Container.Controls.Add(ComboBox2);
     
        ComboBox3 = new ComboBox();
        ComboBox3.ID = "ComboBox3";
        ComboBox3.MenuWidth = Unit.Pixel(650);
        ComboBox3.Width = Unit.Pixel(150);
        ComboBox3.DataSourceID = "sds1";
        ComboBox3.DataTextField = "CountryName";
        ComboBox3.DataValueField = "CountryID";

        ComboBox3Container.Controls.Add(ComboBox3);
    }
}

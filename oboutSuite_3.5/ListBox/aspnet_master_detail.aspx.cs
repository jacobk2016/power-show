﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_aspnet_master_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Detail_LoadingItems(object sender, ListBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            int tryout = 0;
            if (int.TryParse(e.Text, out tryout))
            {
                sds2.SelectParameters[0].DefaultValue = e.Text;
            }
        }
    }
}

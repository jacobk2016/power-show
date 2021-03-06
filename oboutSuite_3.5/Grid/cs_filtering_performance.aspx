﻿<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = false;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.EmbedFilterInSortExpression = true;
        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;

        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "200";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "225";



        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);


        grid1.DataSourceID = "ods1";

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
        if (!Page.IsPostBack)
        {
            FilterCriteria criteria = new FilterCriteria();
            criteria.Option.Type = FilterOptionType.EqualTo;
            criteria.Value = "USA";

            grid1.Columns[4].FilterCriteria = criteria;
            
            

            FilterCriteria criteria2 = new FilterCriteria();
            criteria2.Option.Type = FilterOptionType.StartsWith;
            criteria2.Value = "Albuq";

            grid1.Columns[2].FilterCriteria = criteria2;


            
            FilterCriteria criteria3 = new FilterCriteria();
            criteria3.Option.Type = FilterOptionType.EndsWith;
            criteria3.Value = "110";

            grid1.Columns[3].FilterCriteria = criteria3;
        }
    }
</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Filter with Paged ObjectDataSource</b></span>
		<br /><br />
		
		<asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersDataPerformance"
		    SelectMethod="GetOrders" SelectCountMethod="GetOrdersCount" EnablePaging="true" SortParameterName="sortExpression" />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    To achieve the best performance you need to bind the Grid to an ObjectDataSource control that has the Paging feature enabled.<br />
		    By setting the <b>EmbedFilterInSortExpression</b> property to true, the filter expression will be passed down to the SelectMethod method of the ObjectDataSource.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
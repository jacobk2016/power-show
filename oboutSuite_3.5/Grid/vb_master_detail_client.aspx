<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"
        
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = False
        
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"
        
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        
        
        
        ' Creating grid2
        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = False
        grid2.AutoGenerateColumns = False
        grid2.FolderStyle = "styles/premiere_blue"
        grid2.AllowAddingRecords = False
        grid2.ShowFooter = True
        grid2.AllowPageSizeSelection = False
        grid2.AllowPaging = False
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"
        
        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnLoad        
        
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = False
        
        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = False
        
        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "OrderDate"
        oCol2_3.HeaderText = "ORDER DATE"
        oCol2_3.Width = "225"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"
        
        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShippedDate"
        oCol2_4.HeaderText = "SHIPPED DATE"
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}"
        
        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Freight"
        oCol2_5.HeaderText = "FREIGHT"
        oCol2_5.DataFormatString = "{0:C2}"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        
        
        
        ' Creating grid3
        grid3.ID = "grid3"
        grid3.CallbackMode = True
        grid3.Serialize = False
        grid3.AutoGenerateColumns = False
        grid3.FolderStyle = "styles/premiere_blue"
        grid3.AllowAddingRecords = False
        grid3.ShowFooter = True
        grid3.AllowPageSizeSelection = False
        grid3.AllowPaging = False
        grid3.DataSourceID = "sds3"
        grid3.ForeignKeys = "OrderID"
        
        ' creating the columns
        Dim oCol3_1 As Column = New Column()
        oCol3_1.DataField = "OrderID"
        oCol3_1.HeaderText = "ORDER ID"
        oCol3_1.Visible = False
        
        Dim oCol3_2 As Column = New Column()
        oCol3_2.DataField = "OrderID"
        oCol3_2.HeaderText = "ORDER ID"
        oCol3_2.Visible = False
        
        Dim oCol3_3 As Column = New Column()
        oCol3_3.DataField = "UnitPrice"
        oCol3_3.HeaderText = "UNIT PRICE"
        oCol3_3.Width = "185"
        oCol3_3.DataFormatString = "{0:C2}"
        
        Dim oCol3_4 As Column = New Column()
        oCol3_4.DataField = "Quantity"
        oCol3_4.HeaderText = "QUANTITY"
        oCol3_4.Width = "185"
        
        Dim oCol3_5 As Column = New Column()
        oCol3_5.DataField = "Discount"
        oCol3_5.HeaderText = "DISCOUNT"
        oCol3_5.DataFormatString = "{0:F2}%"
        oCol3_5.Width = "185"

        ' add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1)
        grid3.Columns.Add(oCol3_2)
        grid3.Columns.Add(oCol3_3)
        grid3.Columns.Add(oCol3_4)
        grid3.Columns.Add(oCol3_5)


        grid2.DetailGrids.Add(grid3)
        grid1.DetailGrids.Add(grid2)
        
            
            
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

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
		<script type="text/javascript">
		    var infoContainer = null;
		    window.onload = function() {
		        infoContainer = document.getElementById('infoContainer');
		        loadDetailGrids(grid1);		        
		    }
		    
		    function loadDetailGrids(gridObj) {
		        var detailGrids = gridObj.DetailGrids;
		        
		        if(detailGrids) {
		            for(var i=0; i<detailGrids.length; i++) {
		                addOptionToDdl(detailGrids[i].ID);
    		            
		                loadDetailGrids(detailGrids[i]);
		            }
		        }
		    }
		    
		    function addOptionToDdl(value) {
		        var option = document.createElement('OPTION');
	            option.text = value;
	            option.value = value;
	            
	            document.getElementById('ddlDetails').options.add(option);
		    }
		    
		    function displayInfo(ddl) {
		        var infoText = '<br />';
		        if(ddl.value != '0') {
		            var gridObj = eval(ddl.value);    		        		            
    		        
		            infoText += 'Grid ID: ' + gridObj.ID + '<br />';
		            infoText += 'Number of records: ' + gridObj.getTotalNumberOfRecords() + '<br />';
		            for(var i in gridObj.ForeignKeys) {
		                infoText += 'Foreign key: ' + i + ' = ' + gridObj.ForeignKeys[i].Value + '<br />';
		            }
		        } else {
		            infoText = '';
		        }
		        
		        infoContainer.innerHTML = infoText;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Manipulating the Detail Grids on the Client-Side</b></span>		
		
		<br /><br />
		
		<span class="tdText">
		    Select a detail grid to see more information:
		    <select id="ddlDetails" class="tdText" onchange="displayInfo(this)">
		        <option value="0">-- Select --</option>
		    </select>		    
		</span>
		
		<br />
		
		<span id="infoContainer" class="tdText"></span>
		
		<br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
				
		<br /><br />
		
		<span class="tdText">
		    The Grid exposes client-side properties / methods for manipulating the detail grids on the client:<br />
		    <b>DetailGrids</b> - a collection with all the detail grids of a master grid<br />
		    <b>ForeignKeys</b> - a collection with all the foreign keys of a detail grid<br />
		    <b>getDetailGrid</b> - retrieves a detail grid object, based on the value of the foreign key passed as the parameter
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">� Back to examples</a>
		
		</form>
	</body>
</html>
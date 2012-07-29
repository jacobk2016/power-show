<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False		
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowFiltering = True

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
		oCol2.Width = "200"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
		oCol4.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		Dim oCol6 As Column = new Column()
		oCol6.HeaderText = "EDIT"
		oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		
		' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        Dim ods1 As ObjectDataSource = New ObjectDataSource()
        ods1.ID = "ods1"
        ods1.SelectMethod = "GetOrders"
        ods1.TypeName = "OrdersData"
        phGrid1.Controls.Add(ods1)
			
		If Not Page.IsPostBack Then
            grid1.DataSourceID = "ods1"
		End If
	End Sub
	
		
	Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName='" + e.Record("ShipName").ToString().Replace("'", "''") + "', ShipCity='" + e.Record("ShipCity").ToString().Replace("'", "''") + "', ShipPostalCode='" + e.Record("ShipPostalCode").ToString().Replace("'", "''") + "', ShipCountry='" + e.Record("ShipCountry").ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES('" + e.Record("ShipName").ToString().Replace("'", "''") + "', '" + e.Record("ShipCity").ToString().Replace("'", "''") + "', '" + e.Record("ShipPostalCode").ToString().Replace("'", "''") + "', '" + e.Record("ShipCountry").ToString().Replace("'", "''") + "')", myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub		
	</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Binding to an ObjectDataSource</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>DataSourceId</b> property of the Grid to bind it to an ObjectDataSource.
		</span>
		
		<br /><br /><br />				 
				
		<a href="Default.aspx?type=VBNET">� Back to examples</a>
		
		</form>
	</body>
</html>
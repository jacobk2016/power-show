<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim ddl1 As OboutDropDownList
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)
        ddl1.Height = Unit.Pixel(200)
        ddl1.DataSourceID = "sds1"
        ddl1.DataTextField = "ShipCountry"
        ddl1.DataValueField = "ShipCountry"
        ddl1.AppendDataBoundItems = True
        ddl1.FolderStyle = "styles/grand_gray/OboutDropDownList"
        ddl1.AutoPostBack = True

        AddHandler ddl1.SelectedIndexChanged, AddressOf ddl1_SelectedIndexChanged
        
        ddl1.Items.Add(New ListItem("Select a country ..."))

        ddlPlaceHolder.Controls.Add(ddl1)
    End Sub
    
    Protected Sub ddl1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        label1.Text = "A new country was selected: " + ddl1.SelectedValue + "<br /><br />"
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutDropDownList - Server-Side events</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		
		
		<asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    The <b>SelectedIndexChanged</b> server event is raised when the selected item of the drop down list is changed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>
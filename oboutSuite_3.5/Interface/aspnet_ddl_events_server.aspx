<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
    {
        label1.Text = "A new country was selected: " + ddl1.SelectedValue + "<br /><br />";
    }
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
		
		<obout:OboutDropDownList runat="server" ID="ddl1" Width="200" Height="200"
		    DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry"
		    AppendDataBoundItems="true" FolderStyle="styles/grand_gray/OboutDropDownList"
		    OnSelectedIndexChanged="ddl1_SelectedIndexChanged" AutoPostBack="true"
		    >
		    <Items>
		        <asp:ListItem>Select a country ...</asp:ListItem>
		    </Items>		    
		</obout:OboutDropDownList>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    The <b>SelectedIndexChanged</b> server event is raised when the selected item of the drop down list is changed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>
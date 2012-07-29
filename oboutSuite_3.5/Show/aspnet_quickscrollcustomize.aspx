<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	void Page_Load(object sender, EventArgs e) {
	
		if (!IsPostBack)
		{
			ddlScrollDirection.SelectedIndex = 0;
			Show1.ScrollDirection = ScrollDirection.Left;
		}
	}
	
	private void ChangeScrollDirection(object sender, System.EventArgs e)
	{
		Show1.ScrollDirection = (ScrollDirection)Enum.Parse(typeof(ScrollDirection), ddlScrollDirection.SelectedValue.ToString());
	}
	
	override protected void OnInit(EventArgs e)
	{
		this.ddlScrollDirection.SelectedIndexChanged += new System.EventHandler(this.ChangeScrollDirection);
	}
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{	
			padding:7px;
			height:153px;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showDiv
		{
			border:1px solid #cccccc;
		}
		.imageText
		{
			color:#CCCCCC;
			font-weight:bold;
			font-size:15px;
		}
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.tdText 
	    {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
	    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Quick Scroll customize</b></span>
	    <br /><br />
		
		    <table>
		    <tr>
			    <td>
				    <div class="showDiv">
				    <obshow:Show id="Show1" runat="server" Width="345" Height="153" ShowType="show" ManualChanger="false" TransitionType="QuickScroll">
					    <Panels>
						    <obshow:Panel>
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree1.jpg" alt="Panel 1 image" border="0" /><br />
										    <span class="imageText">Image 1</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										    <h4>Panel 1 content</h4>
										    <h5>Panel 1 content</h5>
										    <h6>Panel 1 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
						    <obshow:Panel>
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree2.jpg" alt="Panel 2 image" border="0" /><br />
										    <span class="imageText">Image 2</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										    <h4>Panel 2 content</h4>
										    <h5>Panel 2 content</h5>
										    <h6>Panel 2 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
						    <obshow:Panel Selected="true">
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree3.jpg" alt="Panel 3 image" border="0" /><br />
										    <span class="imageText">Image 3</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										    <h4>Panel 3 content</h4>
										    <h5>Panel 3 content</h5>
										    <h6>Panel 3 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
						    <obshow:Panel>
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree4.jpg" alt="Panel 4 image" border="0" /><br />
										    <span class="imageText">Image 4</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										    <h4>Panel 4 content</h4>
										    <h5>Panel 4 content</h5>
										    <h6>Panel 4 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
						    <obshow:Panel Selected="false">
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree5.jpg" alt="Panel 5 image" border="0" /><br />
										    <span class="imageText">Image 5</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">									
										    <h4>Panel 5 content</h4>
										    <h5>Panel 5 content</h5>
										    <h6>Panel 5 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
						    <obshow:Panel Selected="false">
							    <table class="panelTable">
								    <tr>
									    <td style="padding-top:7px" class="tdText">
										    <img src="images/tree/tree6.jpg" alt="Panel 6 image" border="0" /><br />
										    <span class="imageText">Image 6</span>
									    </td>
									    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										    <h4>Panel 6 content</h4>
										    <h5>Panel 6 content</h5>
										    <h6>Panel 6 content</h6>
									    </td>
								    </tr>
							    </table>
						    </obshow:Panel>
					    </Panels>
				    </obshow:Show>	
				    </div>
			    </td>
		    </tr>
		    <tr>
			    <td align="left" class="tdText" style="padding-left:8px;padding-top:15px;">
				    <table>
					    <tr>
						    <td class="tdText">
							    QuickScroll direction: 
						    </td>
						    <td>
							    <asp:DropDownList AutoPostBack="True" id="ddlScrollDirection" runat="server">
								    <asp:ListItem Value="Left">Left</asp:ListItem>
								    <asp:ListItem Value="Right">Right</asp:ListItem>
								    <asp:ListItem Value="Top">Top</asp:ListItem>
								    <asp:ListItem Value="Bottom">Bottom</asp:ListItem>
							    </asp:DropDownList>
						    </td>
					    </tr>
				    </table>
			    </td>
		    </tr>
	    </table>
    	
	    <br /><br /><br />
    		
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">� Back to examples</a>
            	
		</form>
	</body>
</html>

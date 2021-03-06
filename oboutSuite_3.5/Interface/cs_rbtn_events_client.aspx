<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutRadioButton OboutRadioButton1;
    OboutRadioButton OboutRadioButton2;
    OboutTextBox EventLogger;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutRadioButton1 = new OboutRadioButton();
        OboutRadioButton1.ID = "OboutRadioButton1";
        OboutRadioButton1.FolderStyle = "styles/grand_gray/OboutRadioButton";
        OboutRadioButton1.Text = "Option 1";
        OboutRadioButton1.GroupName = "g1";
        
        OboutRadioButton1.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";
        OboutRadioButton1.ClientSideEvents.OnBlur = "onBlur";
        OboutRadioButton1.ClientSideEvents.OnClick = "onClick";
        OboutRadioButton1.ClientSideEvents.OnFocus = "onFocus";

        PlaceHolder1.Controls.Add(OboutRadioButton1);
        
        
        OboutRadioButton2 = new OboutRadioButton();
        OboutRadioButton2.ID = "OboutRadioButton2";
        OboutRadioButton2.FolderStyle = "styles/grand_gray/OboutRadioButton";
        OboutRadioButton2.Text = "Option 2";
        OboutRadioButton2.GroupName = "g1";
        
        OboutRadioButton2.ClientSideEvents.OnCheckedChanged = "onCheckedChanged";
        OboutRadioButton2.ClientSideEvents.OnBlur = "onBlur";
        OboutRadioButton2.ClientSideEvents.OnClick = "onClick";
        OboutRadioButton2.ClientSideEvents.OnFocus = "onFocus";

        PlaceHolder2.Controls.Add(OboutRadioButton2);
        
        
        EventLogger = new OboutTextBox();
        EventLogger.ID = "EventLogger";
        EventLogger.TextMode = TextBoxMode.MultiLine;
        EventLogger.Width = Unit.Pixel(400);
        EventLogger.Height = Unit.Pixel(200);
        EventLogger.FolderStyle = "styles/premiere_blue/OboutTextBox";
        
        PlaceHolder3.Controls.Add(EventLogger);
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
		</style>
		<script type="text/javascript">
		    function onCheckedChanged(sender, isChecked) {
		        logEvent('The checked state of ' + sender.ID + ' has been changed to: ' + isChecked + '.');
		    }

		    function onClick(sender) {
		        logEvent(sender.ID + ' has been clicked.');
		    }

		    function onFocus(sender) {
		        logEvent(sender.ID + ' has been focused.');
		    }

		    function onBlur(sender) {
		        logEvent(sender.ID + ' has been blured.');
		    }

		    function logEvent(txt) {
		        EventLogger.value(txt + '\n' + EventLogger.value());
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutRadioButton - Client-Side Events</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		    
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder3" />
        
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutRadioButton</b> control exposes several client-side events: <br />
		    <b>OnCheckedChanged, OnClick, OnFocus, OnBlur</b>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>		
		
		</form>    
	</body>
</html>
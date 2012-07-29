<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
		
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton1" GroupName="g1"
		    FolderStyle="styles/grand_gray/OboutRadioButton" Text="Option 1">
		    <ClientSideEvents OnCheckedChanged="onCheckedChanged" OnBlur="onBlur" OnClick="onClick" OnFocus="onFocus" />
		</obout:OboutRadioButton>
		
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton2" GroupName="g1"
		    FolderStyle="styles/grand_gray/OboutRadioButton" Text="Option 2">
		    <ClientSideEvents OnCheckedChanged="onCheckedChanged" OnBlur="onBlur" OnClick="onClick" OnFocus="onFocus" />
		</obout:OboutRadioButton>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="EventLogger" TextMode="MultiLine" 
		    Width="450" Height="200"
		    FolderStyle="styles/premiere_blue/OboutTextBox" />
		    
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutRadioButton</b> control exposes several client-side events: <br />
		    <b>OnCheckedChanged, OnClick, OnFocus, OnBlur</b>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>
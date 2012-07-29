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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
		<script type="text/javascript">
		    function getKeyPressed(e) {
		        if (!e) {
		            e = window.event;
		        }

		        var keyCode;

		        if (e.keyCode) {
		            keyCode = e.keyCode;
		        } else if (e.which) {
		            keyCode = e.which;
		        }

		        return keyCode;
		    }

		    function checkLength(sender) {
		        if (sender.value().length > maxLength) {
		            sender.value(sender.value().substr(0, 300));
		        }
		    }

		    function TextBox_KeyDown(sender, e) {
		        var keyPressed = getKeyPressed(e);

		        checkLength(sender);

		        if (sender.value().length == maxLength) {
		            if (keyPressed < 32 || keyPressed == 8 || (keyPressed >= 33 && keyPressed < 46) || (keyPressed >= 112 && keyPressed <= 123)) {
		                return true;
		            }

		            return false;
		        }

		        return true;
		    }
		    function TextBox_KeyUp(sender) {
		        checkLength(sender);

		        var counterId = (sender.ID == "OboutTextBox1" ? "CharactersCounter1" : "CharactersCounter2");

		        document.getElementById(counterId).innerHTML = maxLength - sender.value().length;
		    }

		    var inputField1 = null;
		    var inputField2 = null;
		    
		    window.onload = function() {
		        var elements = document.getElementsByTagName('TEXTAREA');
		        for (var i = 0; i < elements.length; i++) {
		            if (elements[i].id.indexOf('OboutTextBox1') != -1) {
		                inputField1 = elements[i];
		            }
		        }

		        var elements = document.getElementsByTagName('INPUT');
		        for (var i = 0; i < elements.length; i++) {
		            if (elements[i].type == 'text' && elements[i].id.indexOf('OboutTextBox2') != -1) {
		                inputField2 = elements[i];
		            }
		        }

		        inputField1.onkeydown = function(e) { return TextBox_KeyDown(OboutTextBox1, e); };
		        inputField2.onkeydown = function (e) { return TextBox_KeyDown(OboutTextBox2, e); };
		    }

		    var maxLength = 300;
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - MaxLength with Characters Counter</b></span>
		
		<br /><br />
		
		<table>
		    <tr>
		        <td valign="top">
		            <obout:OboutTextBox runat="server" ID="OboutTextBox1" Width="250" Height="100" TextMode="MultiLine">
		                <ClientSideEvents OnKeyUp="TextBox_KeyUp" />
		            </obout:OboutTextBox>
            		<br />
		            <span class="tdText">
		                <span id="CharactersCounter1">300</span> characters remaining.
		            </span>
		        </td>
		        <td valign="top">
		            <obout:OboutTextBox runat="server" ID="OboutTextBox2" Width="250" MaxLength="300">
		                <ClientSideEvents OnKeyUp="TextBox_KeyUp" />
		            </obout:OboutTextBox>
            		<br />
		            <span class="tdText">
		                <span id="CharactersCounter2">300</span> characters remaining.
		            </span>
		        </td>
		    </tr>
		</table>
		
		<br /><br />
		
		<span class="tdText">
		    This example showcases the use of two OboutTextBox controls (single line and multi line) which have a max length of 300 characters.<br />
		    As the user types in the text boxes, the characters counters will be updated accordingly to display the number of characters remaining for each text box.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>		
		
		</form>    
	</body>
</html>
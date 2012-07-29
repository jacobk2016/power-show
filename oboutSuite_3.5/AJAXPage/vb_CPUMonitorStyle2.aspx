<%@ Page Language="vb" Inherits="vb_CPUMonitorStyle2" Src="vb_CPUMonitorStyle2.aspx.vb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head runat="server">
		<style type="text/css">
			.gridBg {
				background-image:url('images/bg_gray.gif');
				width:520px;
				height:229px;
				overflow:hidden;
			}
			.graph {
				position:relative;
				left:37px;
				top:15px;
				width:467px;
				height:199px;
				overflow:hidden;
			}
			.bar {
				width:8px;
				background-image:url('images/bg_column.gif');
				background-repeat:repeat-y;
				border-left:1px solid white;
				border-top:1px solid white;
				font-size:1px;
			}
			
			td {
				font: 10pt Tahoma; 
				margin: 20px;
			}
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style>
	</head>
	<title>Server CPU load monitor</title>
<body>
	<form runat="server">
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Server CPU load monitor example</span><br /><br /><br />
					This example takes CPU load value from server side every second and displays it in a bar graph.<br /><br />
				</td>
			</tr>
			<tr>
				<td>
					<div class="gridBg">
						<div class="graph">
							<table align="right" id="container" cellspacing="0" cellpadding="0" style="height:200px;"><tr><td valign="bottom" align="right"><div class="bar"></div></td></tr></table>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<script type="text/javascript">
			var tr = document.getElementById("container").firstChild.firstChild;
			var td = tr.firstChild;
			var numBars = 0;
		
			function getResult(val) {
				var tmp = td.cloneNode(true);
				tmp.firstChild.style.height = (Math.round(val) * 2 + 1) + "px";
				tr.appendChild(tmp);
				
				if(numBars > 50)
					tr.removeChild(tr.firstChild);
				else
					numBars++;
			}
		</script>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">� Back to examples</a>
	</form>
</body>
</html>
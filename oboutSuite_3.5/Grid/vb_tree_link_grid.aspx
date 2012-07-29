<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
  	Dim grid1 As Obout.Grid.Grid = New Grid()
        
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		'init tree
		Dim oTree As obout_ASPTreeView_2_NET.Tree  = new obout_ASPTreeView_2_NET.Tree()
		
		' Root node is optional. You can delete this line.
		oTree.AddRootNode("<div style='height: 19px'>Working time</div>", true, "xpMyComp.gif")

		' Populate Treeview.
		oTree.Add("root", "a_0", "<div style=""height: 18px;"">Albert Yap</div>", true, Nothing, Nothing)
		oTree.Add("a_0", "a_1", "<div style=""height: 18px;"">1st half of March</div>", true, "page.gif", Nothing)
		oTree.Add("a_0", "a_2", "<div style=""height: 18px;"">2nd half of March</div>", true, "page.gif", Nothing)
		oTree.Add("a_0", "a_3", "<div style=""height: 18px;"">1st half of April</div>", true, "page.gif", Nothing)
		oTree.Add("a_0", "a_4", "<div style=""height: 18px;"">2nd half of April</div>", true, "page.gif", Nothing)

		oTree.Add("root", "a_5", "<div style=""height: 18px;"">Mike Baker</div>", true, Nothing, Nothing)
		oTree.Add("a_5", "a_6", "<div style=""height: 18px;"">1st half of March</div>", true, "page.gif", Nothing)
		oTree.Add("a_5", "a_7", "<div style=""height: 18px;"">2nd half of March</div>", true, "page.gif", Nothing)
		oTree.Add("a_5", "a_8", "<div style=""height: 18px;"">1st half of April</div>", true, "page.gif", Nothing)
		oTree.Add("a_5", "a_9", "<div style=""height: 18px;"">2nd half of April</div>", true, "page.gif", Nothing)
		oTree.Add("root", "a_10", "<span style='height: 20px; cursor:pointer;color:crimson;'><b><nobr>Load Jan&Feb Dyn.</nobr></b></span>", Nothing, Nothing, "tree_link_grid_sub.aspx")

		oTree.FolderIcons = "../TreeView/tree2/icons"
		oTree.FolderScript = "../TreeView/tree2/script"
		oTree.FolderStyle = "../TreeView/tree2/style/Classic"
						
		oTree.SelectedId = "a_2,a_7"
		    
	    oTree.Width = "160px"
	
		' Write treeview to your page.
		TreeView.Text = oTree.HTML()

		' Init grid
        grid1.ID = "grid1"


		grid1.CallbackMode=true
		grid1.Serialize=true 
		grid1.GenerateRecordIds=true
		grid1.FolderStyle="styles/premiere_blue"
		grid1.AutoGenerateColumns=false
		grid1.AllowAddingRecords=false
		grid1.AllowPaging=false
		grid1.AllowPageSizeSelection=false
		grid1.AllowSorting=false
		grid1.ClientSideEvents.OnClientSelect="onRecordSelect"
		grid1.ClientSideEvents.OnClientDblClick="onDblClick"
		grid1.PageSize= 21

		' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "ID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "100"
		oCol1.Visible=False
		
		' Week 1
        Dim oCol2 As Column = New Column()
        oCol2.DataField = "Mon"
        oCol2.ReadOnly = True
        oCol2.HeaderText = "Mon"
        oCol2.Width = "50"


        Dim oCol3 As Column = New Column()
        oCol3.DataField = "Tue"
        oCol3.ReadOnly = True
        oCol3.HeaderText = "Tue"
        oCol3.Width = "50"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Wed"
        oCol4.ReadOnly = True
        oCol4.HeaderText = "Wed"
        oCol4.Width = "50"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Thu"
        oCol5.ReadOnly = True
        oCol5.HeaderText = "Thu"
        oCol5.Width = "50"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "Fri"
        oCol6.ReadOnly = True
        oCol6.HeaderText = "Fri"
        oCol6.Width = "50"

		' Week 2
        Dim oCol7 As Column = New Column()
        oCol7.DataField = "Mon2"
        oCol7.ReadOnly = True
        oCol7.HeaderText = "Mon"
        oCol7.Width = "50"


        Dim oCol8 As Column = New Column()
        oCol8.DataField = "Tue2"
        oCol8.ReadOnly = True
        oCol8.HeaderText = "Tue"
        oCol8.Width = "50"

        Dim oCol9 As Column = New Column()
        oCol9.DataField = "Wed2"
        oCol9.ReadOnly = True
        oCol9.HeaderText = "Wed"
        oCol9.Width = "50"

        Dim oCol10 As Column = New Column()
        oCol10.DataField = "Thu2"
        oCol10.ReadOnly = True
        oCol10.HeaderText = "Thu"
        oCol10.Width = "50"

        Dim oCol11 As Column = New Column()
        oCol11.DataField = "Fri2"
        oCol11.ReadOnly = True
        oCol11.HeaderText = "Fri"
        oCol11.Width = "50"



		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)
        grid1.Columns.Add(oCol9)
        grid1.Columns.Add(oCol10)
		grid1.Columns.Add(oCol11)

		' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        If Not Page.IsPostBack Then
            BindGrid()
        End If
		
    End Sub
    
	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/timesheet.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT *, (Sun + Mon + Tue + Wed + Thu + Fri + Sat) AS Total,(Sun2 + Mon2 + Tue2 + Wed2 + Thu2 + Fri2 + Sat2) AS Total2 FROM March ORDER BY ID ASC", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

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
				background-color___:#f6f9fc;
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
			<script language="javascript">
			function imgClick( img , value ){
				if ( img.src.indexOf("plusik_r.gif") < 0 )
				{
					img.src = "../TreeView/tree2/style/Classic/plusik_r.gif";

					var td = img.parentNode.nextSibling;
					td.style.display = "none";

					if ( value  == 1)
					{
						grid1.hideColumn("Mon");
						grid1.hideColumn("Tue");
						grid1.hideColumn("Wed");
						grid1.hideColumn("Thu");
						grid1.hideColumn("Fri");
					}else{
						grid1.hideColumn("Mon2");
						grid1.hideColumn("Tue2");
						grid1.hideColumn("Wed2");
						grid1.hideColumn("Thu2");
						grid1.hideColumn("Fri2");
					}
				}else{
					img.src = "../TreeView/tree2/style/Classic/minus_r.gif";

					var td = img.parentNode.nextSibling;
					td.style.display = "";

					if ( value  == 1)
					{
						grid1.showColumn("Mon");
						grid1.showColumn("Tue");
						grid1.showColumn("Wed");
						grid1.showColumn("Thu");
						grid1.showColumn("Fri");
					}else{
						grid1.showColumn("Mon2");
						grid1.showColumn("Tue2");
						grid1.showColumn("Wed2");
						grid1.showColumn("Thu2");
						grid1.showColumn("Fri2");
					}

				}
			}
			
		function onRecordSelect(arrSelectedRecords) {
			var sMessage;
			var node_id;

			if ( 0 < grid1.SelectedRecords.length ) {
				var id = grid1.SelectedRecords[0].ID;

				node_id = "a_" + ( id - 1 );	
			}

			if (tree_selected_id == node_id || node_id == null || node_id == "root_tree1")
			{
				return;
			}
			var node = document.getElementById( node_id );
			node.onclick();
		}

		function onDblClick(id) {
			var node_id;

			if ( 0 <grid1.SelectedRecords.length ) {
				var id = grid1.SelectedRecords[0].ID;

				node_id = "a_" + (id - 1);
			}
			if ( node_id == null || node_id == "root_tree1" )
			{
				return;
			}
			// get -/+ image on Node
			var node = document.getElementById( node_id ).previousSibling.previousSibling.firstChild;
			if (node.onclick)
			{	
				node.onclick();
			}
			

		}
	</script>

	</head>
	<body style="margin: 0px;">	
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using withTreeView</b></span>
		<br /><br />
		<span class="tdtext">When a node is collapsed/expanded (and all its children are hidden) <br>
		the corresponding rows from the Grid are hidden/shown.<br><br>
		When the -/+ buttons on the left of the Weeks are clicked,<br> the groups of columns are hidden/shown.<br><br>
		When the row on the grid is double clicked,<br> the corresponding node is collapsed/expanded.
</span><br/><br/>

<table>
	<tr>
	<td valign="top">
		<div style="padding-top: 35px;">
		<ASP:Literal id="TreeView" EnableViewState="false" runat="server" />
		</div>
	</td>
	<td valign="top">
		<table>
			<tr>
				<td class="tdText"><img src="../TreeView/tree2/style/Classic/minus_r.gif" onclick="imgClick(this, 1);" style="cursor:pointer;" width="19" height="16"/></td><td class="tdText"  width="230" valign="middle">Week 1</td>
				<td class="tdText"><img src="../TreeView/tree2/style/Classic/minus_r.gif" onclick="imgClick(this, 2);" style="cursor:pointer;" width="19" height="16"/></td><td class="tdText" valign="middle">Week 2</td>
			</tr>
		</table>
		<span class="tdText">
		
		
		</span>
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				
	</td>
</tr>
</table>
		<br /><br /><br />
		<a href="Default.aspx?type=VBNET">� Back to examples</a>
		
		</form>
	</body>
</html>
		<script language="javascript">
		grid1.selectRecord(7);
		
		var rowPrefix;

		// find out the row Prefix 
		function getRowPrefix()
		{
			var row0 = grid1.getRecordsIds().split(",")[0];
			
			if ( row0 != null)
			{
				var lastPos = -1;
				for ( var i = row0.length-1; i>=0; i--)
				{
					if ( row0.charAt(i)== '_' )
					{
						lastPos = i;
						break;
					}
				}

				if (lastPos > -1)
				{
					// get Prefix
					return row0.substring(0,lastPos + 1);
				}
			}

			

			return "";
		}

		hideRow();
	

		function hideRow(){
			if ( rowPrefix == null)
			{
				rowPrefix = getRowPrefix();
			}
			var display = "none";

			document.getElementById(rowPrefix + 11).style.display= display;
			document.getElementById(rowPrefix + 12).style.display= display;
			document.getElementById(rowPrefix + 13).style.display= display;
			document.getElementById(rowPrefix + 14).style.display= display;
			document.getElementById(rowPrefix + 15).style.display= display;
			document.getElementById(rowPrefix + 16).style.display= display;
			document.getElementById(rowPrefix + 17).style.display= display;
			document.getElementById(rowPrefix + 18).style.display= display;
			document.getElementById(rowPrefix + 19).style.display= display;
			document.getElementById(rowPrefix + 20).style.display= display;
		}

		function ob_OnNodeCollapse(id)
		{
			var display = "none";
			
			// find out the start and end position of all hide records of child nodes
			var startHideRow = parseInt ( id.replace("a_", "") );
			var endHideRow = parseInt( getChildWithMaxIndex( document.getElementById(id) ).id.replace("a_", "") );

			// hide all records of child nodes.
			for ( var i = startHideRow + 1; i <= endHideRow; i++)
			{
				document.getElementById(rowPrefix + i ).style.display= display;
			}
			if(true){
			}

		}

		function getChildWithMaxIndex(node){
			var lastChild = ob_getLastChildOfNode( node );
			
			if ( lastChild == null)
			{
				return node;
			}else{
				return getChildWithMaxIndex(lastChild);
			}
		}

		// tree1 node expand event
		function ob_OnNodeExpand(id){

			if ( id == "root_tree1") return;
			expandChild( document.getElementById(id) );
		}

		// traveling all expaned child node and show the corresponding record.
		function expandChild(node){
			var display = "";

			var n = ob_getFirstChildOfNode( node );
			while ( n != null )
			{
				// show the record of this node
				document.getElementById(rowPrefix + n.id.replace( "a_", "" ) ).style.display = display;
				if ( ob_isExpanded( n ) )
				{
					expandChild(n);
				}
				

				//
				n = ob_getNodeDown(n);
			}
		}

		function ob_OnNodeSelect(id)
		{
			var row = -1;
		
			if ( id != "root_tree1")
			{
				row = id.replace("a_", "") ;
			}
			if ( row >= 0)
			{
				for ( var i=0; i< 21; i++ )
				{
					if (i== row)
					{
						grid1.selectRecord( i );
					}else{
						grid1.deselectRecord( i );
					}
				}
			}
		}
		</script>

			<style type="text/css">

	.ob_gC 
	{
		cursor: default;
		padding-right: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		padding-left: 0px;
		border-right: 0px;
		border-top: 0px;				
		font-family: Verdana;
		font-size: 10px;
		color: #000000;	
		height: 20px;	
		vertical-align: middle;		
	}
		</style>		
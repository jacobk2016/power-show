<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net"%>
<%@ Page Language="c#" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Import Namespace="obout_ASPTreeView_2_NET" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) {
	
		// treeview
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		string html;
		
		// Root node is optional. You can delete this line.
		//oTree.AddRootNode("I am Root node!", true, "xpMyComp.gif");

		// Populate Treeview.
		oTree.Add("root", "a0", "<span class='pointer'>Personal Folders</span>", true, "oMailbox.gif", null);
		oTree.Add("a0", "a0_0", "<span class='pointer'>Deleted Items</span>", true, "oRecycle.gif", null);
		oTree.Add("a0", "a0_1", "<span class='pointer'>Drafts</span>", true, "oDrafts.gif", null);
		oTree.Add("a0", "a0_2", "<span class='pointer'>Inbox</span>", true, "oInbox.gif", null);
		oTree.Add("a0", "a0_3", "<span class='pointer'>Junk E-mail</span>", true, "oJunk.gif", null);
		oTree.Add("a0", "a0_4", "<span class='pointer'>Outbox</span>", true, "oOutlook.gif", null);
		oTree.Add("a0", "a0_5", "<span class='pointer'>Sent Items</span>", true, "oSent.gif", null);
		oTree.Add("a0", "a0_6", "<span class='pointer'>Search Folders</span>", true, "oSearch.gif", null);
		oTree.Add("a0_6", "a0_6_0", "<span class='pointer'>For Follow Up</span>", true, "oSearchF.gif", null);
		oTree.Add("a0_6", "a0_6_1", "<span class='pointer'>Large Mail</span>", true, "oSearchF.gif", null);
		oTree.Add("a0_6", "a0_6_2", "<span class='pointer'>Unread Mail</span>", true, "oSearchF.gif", null);
		oTree.Add("root", "a1", "<span class='pointer'>mymail.com</span>", false, "oInboxF.gif", null);
		oTree.Add("a1", "a1_0", "<span class='pointer'>Inbox</span>", true, "oInbox.gif", null);
		oTree.Add("a1", "a1_1", "<span class='pointer'>Junk E-mail</span>", true, "oJunk.gif", null);
		oTree.Add("a1", "a1_2", "<span class='pointer'>Sent</span>", true, "oSent.gif", null);
		oTree.Add("a1", "a1_3", "<span class='pointer'>Trash</span>", true, "oSent.gif", null);
		
		html = "<a href='http://www.memobook.com' class=ob_a2>MemoBook.com</a>";
		oTree.Add("a1", "a1_0", html, true, null, null);
		
		// get the resource files paths from the configuration file (web.config)
        oTree.FolderStyle = "../TreeView/tree2/style/Win2003";
        oTree.FolderScript = "../TreeView/tree2/script";
        oTree.FolderIcons = "../TreeView/tree2/icons";

        oTree.DragAndDropEnable = true;
						
		//oTree.SelectedId = "a0_2";
			
		oTree.Width = "150px";
		oTree.EditNodeEnable = false;
		oTree.EventList = "OnNodeSelect";
		
		// Write treeview to your page.
		TreeView.Text = oTree.HTML();
		
		ShowErrorsAtClient = false;
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head runat="server">
		<style>
		.Text
		{
			background-color:white;
			font-size:12px;
		}
		.inputButton
		{
			border:1px solid #6B89AF;
			width:250px;
		}
		body
		{
			font-family:Tahoma;
			font-size:8pt;
		}
		.pointer
		{
			cursor:pointer;
		}
		</style>
	</head>
	<body>
		<div style="height:53px; background-image:url('images/header.gif');border-right:1px solid gray;border-left:1px solid gray;">
			<img src="resources/images/header_buttons.gif" />
		</div>
		<obspl:Splitter CookieDays="0" id="sp1" runat="server" StyleFolder="../Splitter/styles/default">
			<LeftPanel WidthMin="100" WidthMax="400" WidthDefault="180">
				<Content>
					<div style="padding-left:10px;padding-top:10px;padding-right:10px;"> 
						<asp:Literal id="TreeView" EnableViewState="false" runat="server" />
					</div>
				</Content>
			</LeftPanel>
			<RightPanel>
				<Content>
					<obspl:HorizontalSplitter CookieDays="0" id="sp2" runat="server" StyleFolder="../Splitter/styles/default">
						<TopPanel HeightMin="100" HeightMax="600" HeightDefault="250">
							<Content></Content>
						</TopPanel>
						<BottomPanel>
							<Content></Content>
						</BottomPanel>
					</obspl:HorizontalSplitter>
				</Content>
				<Footer Height="0"></Footer>
			</RightPanel>
		</obspl:Splitter>
	</body>
</html>

<script>
// add load event
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}
// first time loading - default category selected - first email is listed in the details area
addLoadEvent(function() {
	document.getElementById('a0_2').onclick();
});

// load, specified by param, an email category
function EmailclientLoad(CategoryID)
{
	CategoryID = CategoryID.replace("a0_", "");
	CategoryID = CategoryID.replace("a1_", "");
	
	if (isNaN(CategoryID))
		CategoryID = 0;
	
	sp2.loadPage("TopContent", "cs_integration_email_client_list.aspx?CategoryID="+CategoryID);
}

// implement the OnNodeSelect event that will request the information from the server
// we redeclared the ob_OnNodeSelect function here - the other option would have been to edit
// the ob_events_xxxx.js file located in the Script folder
function ob_OnNodeSelect(id)
{   
	 if(ob_ev("OnNodeSelect"))
	 {	 
	    if(typeof ob_post == "object")
	    {
	        if(id.indexOf("a0_") != -1 || id.indexOf("a1_") != -1)
	        {	     
				// load the specified category of emails
	            EmailclientLoad(id);
	        }
	    }
	    else
	    {
	        alert("Please add obout_AjaxPage control to your page to use the server-side events");
	    } 
	 }
}
</script>
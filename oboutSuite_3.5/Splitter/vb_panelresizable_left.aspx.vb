imports System

public class panelresizable_left 
	inherits System.Web.UI.Page

	protected spl1 as OboutInc.Splitter2.Splitter
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		spl1.PanelResizable = OboutInc.Splitter2.VerticalPanelResizableType.left
		spl1.CookieDays = 0	
		spl1.StyleFolder="styles/default"
		spl1.LeftPanel.WidthMin = 100
		spl1.LeftPanel.WidthMax = 400
		spl1.LeftPanel.Header.Height = 50
		spl1.LeftPanel.Footer.Height = 50
		spl1.RightPanel.Header.Height = 50
		spl1.RightPanel.Footer.Height = 50
	End Sub
End Class

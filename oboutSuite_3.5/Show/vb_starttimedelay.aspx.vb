imports OboutInc.Show

public class vb_starttimedelay
	inherits System.Web.UI.Page
	
	Protected Dim Show1 as Show
	
	Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Show1.Width=370
		Show1.Height=175
		Show1.ShowType=ShowType.Show
		Show1.TimeBetweenPanels=1000
		Show1.StartTimeDelay=5000
		
	End Sub
	
end class
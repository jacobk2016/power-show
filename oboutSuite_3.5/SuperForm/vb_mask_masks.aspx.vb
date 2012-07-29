﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Imports AjaxControlToolkit
Partial Class SuperForm_vb_mask_masks
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"EmployeeID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit

        SuperForm1.DefaultMode = DetailsViewMode.Insert
        AddHandler SuperForm1.ItemInserted, AddressOf SuperForm1_ItemInserted
        AddHandler SuperForm1.ItemCommand, AddressOf SuperForm1_ItemCommand


        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "EmployeeID"
        field1.HeaderText = "Employee ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "FirstName"
        field2.HeaderText = "First Name"
        field2.Required = True

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "LastName"
        field3.HeaderText = "Last Name"
        field3.Required = True

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "BirthDate"
        field4.HeaderText = "Birth Date"
        field4.DataFormatString = "{0:MM/dd/yyyy}"
        field4.ApplyFormatInEditMode = True
        field4.Required = True

        Dim extender1 As MaskedEditExtender = New MaskedEditExtender()
        extender1.ID = "MaskedEditExtender1"
        extender1.Mask = "99/99/9999"
        extender1.MaskType = MaskedEditType.Date
        field4.Masks.Add(extender1)

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "HireDate"
        field5.HeaderText = "Hire Date"
        field5.DataFormatString = "{0:MM/dd/yyyy}"
        field5.ApplyFormatInEditMode = True
        field5.Required = True

        Dim extender2 As MaskedEditExtender = New MaskedEditExtender()
        extender2.ID = "MaskedEditExtender2"
        extender2.Mask = "99/99/9999"
        extender2.MaskType = MaskedEditType.Date
        field5.Masks.Add(extender2)

        Dim field6 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field6.DataField = "Salary"
        field6.HeaderText = "Salary"
        field6.Required = True

        Dim extender3 As MaskedEditExtender = New MaskedEditExtender()
        extender3.ID = "MaskedEditExtender3"
        extender3.Mask = "9,999,9999"
        extender3.MaskType = MaskedEditType.Number
        extender3.InputDirection = MaskedEditInputDirection.RightToLeft
        field6.Masks.Add(extender3)

        Dim field7 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field7.DataField = "HomePhone"
        field7.HeaderText = "Home Phone"

        Dim extender4 As MaskedEditExtender = New MaskedEditExtender()
        extender4.ID = "MaskedEditExtender4"
        extender4.Mask = "(999)999-9999"
        extender4.MaskType = MaskedEditType.Number
        field7.Masks.Add(extender4)

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)


        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub
    Sub SuperForm1_ItemInserted(ByVal sender As Object, ByVal e As EventArgs)

        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly
    End Sub

    Sub SuperForm1_ItemCommand(ByVal sender As Object, ByVal e As EventArgs)

        SuperForm1.DefaultMode = DetailsViewMode.ReadOnly
    End Sub


End Class

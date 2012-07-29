﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Imports Obout.Interface
Imports Obout.ComboBox

Partial Class SuperForm_vb_templates_combobox_ondemand
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        SuperForm1.AutoGenerateDateFields = True
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit

        AddHandler SuperForm1.DataBound, AddressOf SuperForm1_DataBound
        AddHandler SuperForm1.ItemUpdating, AddressOf SuperForm1_ItemUpdating
        AddHandler SuperForm1.ItemInserting, AddressOf SuperForm1_ItemInserting

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "OrderID"
        field1.HeaderText = "Order ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipName"
        field2.HeaderText = "Ship Name"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipCity"
        field3.HeaderText = "Ship City"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipRegion"
        field4.HeaderText = "Ship Region"

        Dim field5 As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        field5.HeaderText = "Ship Country"
        field5.ItemTemplate = New ShipCountryItemTemplate()

        field5.EditItemTemplate = New ShipCountryEditItemTemplate(SqlDataSource2)

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)

        SuperForm1Container.Controls.Add(SuperForm1)

    End Sub
    Sub SuperForm1_ItemUpdating(ByVal sender As Object, ByVal e As DetailsViewUpdateEventArgs)

        e.NewValues("ShipCountry") = CType(CType(SuperForm1.Rows(4), DetailsViewRow).FindControl("ShipCountry"), Obout.ComboBox.ComboBox).SelectedValue
    End Sub

    Sub SuperForm1_ItemInserting(ByVal sender As Object, ByVal e As DetailsViewInsertEventArgs)

        e.Values("ShipCountry") = CType(CType(SuperForm1.Rows(4), DetailsViewRow).FindControl("ShipCountry"), Obout.ComboBox.ComboBox).SelectedValue
    End Sub

    Sub SuperForm1_DataBound(ByVal sender As Object, ByVal e As EventArgs)

        If (SuperForm1.CurrentMode = DetailsViewMode.Edit) Then

            Dim selectedCountry As String = DataBinder.Eval(SuperForm1.DataItem, "ShipCountry").ToString()
            Dim ShipCountryComboBox As ComboBox = CType(CType(SuperForm1.Rows(4), DetailsViewRow).FindControl("ShipCountry"), ComboBox)

            ' Creating an new item using the selected country and marking it as selected
            Dim item As Obout.ComboBox.ComboBoxItem = New Obout.ComboBox.ComboBoxItem()
            item.Value = selectedCountry
            item.Text = selectedCountry
            item.Selected = True
            ShipCountryComboBox.Items.Add(item)

            ShipCountryComboBox.DataBind()
        End If

    End Sub

    Public Class ShipCountryItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As Literal = New Literal()
            container.Controls.Add(templatePlaceHolder)

            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)

            Dim templatePlaceHolder As Literal = CType(sender, Literal)
            Dim row As DetailsViewRow = CType(templatePlaceHolder.Parent.Parent, DetailsViewRow)
            Dim Form As SuperForm = CType(row.Parent.Parent, SuperForm)

            templatePlaceHolder.Text = DataBinder.Eval(Form.DataItem, "ShipCountry").ToString()
        End Sub
    End Class

    Public Class ShipCountryEditItemTemplate
        Implements ITemplate

        Protected dataSource As SqlDataSource

        Sub New(ByVal _dataSource As SqlDataSource)
            dataSource = _dataSource
        End Sub

        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn

            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim comboBox As Obout.ComboBox.ComboBox = New Obout.ComboBox.ComboBox()
            templatePlaceHolder.Controls.Add(comboBox)

            comboBox.ID = "ShipCountry"
            comboBox.Height = Unit.Pixel(150)
            comboBox.Width = Unit.Percentage(100)
            comboBox.DataValueField = "ShipCountry"
            comboBox.DataTextField = "ShipCountry"
            AddHandler comboBox.LoadingItems, AddressOf ShipCountry_LoadingItems
            comboBox.EnableLoadOnDemand = True

            AddHandler templatePlaceHolder.DataBinding, AddressOf DataBindTemplate
        End Sub

        Sub ShipCountry_LoadingItems(ByVal sender As Object, ByVal e As ComboBoxLoadingItemsEventArgs)

            CType(sender, ComboBox).Items.Clear()
            dataSource.SelectParameters(0).DefaultValue = e.Text + "%"
            CType(sender, ComboBox).DataSourceID = "SqlDataSource2"

        End Sub

        Sub DataBindTemplate(ByVal sender As Object, ByVal e As EventArgs)

            Dim templatePlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
            Dim row As DetailsViewRow = CType(templatePlaceHolder.Parent.Parent, DetailsViewRow)
            Dim form As SuperForm = CType(row.Parent.Parent, SuperForm)

            Dim comboBox As Obout.ComboBox.ComboBox = CType(templatePlaceHolder.Controls(0), Obout.ComboBox.ComboBox)

            comboBox.SelectedValue = DataBinder.Eval(form.DataItem, "ShipCountry").ToString()
        End Sub
    End Class
End Class

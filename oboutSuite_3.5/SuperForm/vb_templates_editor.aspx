﻿<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_templates_editor.aspx.vb" Inherits="SuperForm_vb_templates_editor" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_fRwF span
        {
            position: static !important;            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - HTML Editor Field</b></span>
    
    <br /><br />
    
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
     
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, AdditionalInformationHTML
                       FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, AdditionalInformationHTML=@AdditionalInformationHTML
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, AdditionalInformationHTML)
                        VALUES(@ShipName, @AdditionalInformationHTML)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
        <UpdateParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="AdditionalInformationHTML" DbType="String" />
            <asp:Parameter Name="OrderID" DbType="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="AdditionalInformationHTML" DbType="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br /><br />
    
    <span class="tdText">
        Use the <b>TemplateField</b> class to gain full control over the layout of the field.<br /> 
        A TemplateField allows developers to specify different templates for view / add / edit modes.<br /><br />

        This example showcases the use of a TemplateField object for the "Details" field.<br />
        Using the TemplateField class we can use a HTML Editor to edit the data from the field.
    </span>
</asp:Content>


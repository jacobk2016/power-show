﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_populate_ods.aspx.vb" Inherits="ListBox_vb_populate_ods" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Populating with Data - ObjectDataSource</b></span>	
    
    <br /><br />
      <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    <asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersData" SelectMethod="GetOrders" />
    
    <br /><br />
    
    <span class="tdText">
        The ListBox can be populated from various types of data sources:<br />
        
        <ul>
            <li>DataSourceControls - SqlDataSource, ObjectDataSource, LinqDataSource etc.;</li>
            <li>LINQ - LINQ queries at runtime;</li>
            <li>Collections (generic & non-generic) - IList, IEnumerable, etc.;</li>
            <li>DataSet / DataTable;</li>
            <li>Declarative</li>
        </ul>
        
        <br />
        
        The ListBox presented in this sample is populated from a <b>ObjectDataSource</b> control.<br />
        This is done by setting the <b>DataSourceID</b> property of the ListBox to be the ID <br />
        of the ObjectDataSource control. Also, the <b>DataValueField</b> and <b>DataTextField</b> properties<br />
        need to be used to specify the name of the database fields that will be used to populate the <br />
        Value and Text properties of the generated ListBoxItems.
    </span>
</asp:Content>


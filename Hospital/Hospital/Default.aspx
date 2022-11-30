<%@ Page Title="KwikMedical Hospital Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hospital._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .mydatagrid {
            width: 100%;
            border: solid 2px black;
            min-width: 80%;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: left;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }

            .rows:hover {
                background-color: #db4f46;
                font-family: Arial;
                color: #fff;
                text-align: left;
            }

        .selectedrow {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }

        .mydatagrid a /** FOR THE PAGING ICONS **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                background-color: #db4f46;
                color: #fff;
            }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #db4f46;
            color: #fff;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }
    </style>

    <div class="h3">KwikMedical Hospital Patient Database</div>
    <div class="row">
        <asp:GridView runat="server" ID="PatientGrid" PageSize="6" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="PatientGrid_PageIndexChanging" AutoGenerateColumns="False">

            <Columns>
                <asp:BoundField DataField="patient_nhs_registration" HeaderText="NHS Number" />
                <asp:BoundField DataField="patient_firstname" HeaderText="First Name" />
                <asp:BoundField DataField="patient_secondname" HeaderText="Last Name" />
                <asp:BoundField DataField="patient_address" HeaderText="Address" />
                <asp:BoundField DataField="patient_medical_condition" HeaderText="Medical Conditions" />
            </Columns>
            <HeaderStyle CssClass="header"></HeaderStyle>

            <PagerStyle CssClass="pager"></PagerStyle>

            <RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>

    </div>
    <hr />
    <div class="h3">All Incidents</div>
    <div class="row">
        <asp:GridView runat="server" ID="AllGrid" PageSize="6" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="AllGrid_PageIndexChanging" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="incident_number" HeaderText="Incident Number" />
                <asp:BoundField DataField="incident_reported_time" HeaderText="Time Reported" />
                <asp:BoundField DataField="incident_location" HeaderText="Region" />
                <asp:BoundField DataField="incident_action_taken" HeaderText="Action Taken" />
                <asp:BoundField DataField="incident_diagnosis" HeaderText="Diagnosis" />
                <asp:BoundField DataField="incident_callout_time" HeaderText="Callout Time" />
                <asp:BoundField DataField="patient_nhs_registration" HeaderText="NHS Number" />
                <asp:BoundField DataField="assigned_hospital" HeaderText="Assigned Hospital" />
            </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
    </div>
        <hr />
    <div class="row">
        <div class="col-md-4 mt-md-0 mt-5 text-center" style="margin-bottom: 10px;">
            <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospUpdatePatient" runat="server" Text="Update Selected Patient" />
        </div>
        <div class="col-md-4 mt-md-0 mt-3 text-center" style="margin-bottom: 10px;">
            <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospFilterPatient" runat="server" Text="Filter Selected Patient" />
        </div>
        <div class="col-md-4 mt-md-0 mt-3 text-center">
            <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospDeletePatient" runat="server" Text="Delete Selected Patient" />
        </div>
    </div>

</asp:Content>

﻿<%@ Page Title="KwikMedical Hospital Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hospital._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="styles.css" rel="stylesheet" />

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

    <div id="mainsection" visible="true" runat="server">
        <div class="h3">KwikMedical Hospital Patient Database</div>
        <div class="row">
            <asp:GridView runat="server" ID="PatientGrid" PageSize="8" HorizontalAlign="Center"
                CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
                RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="PatientGrid_PageIndexChanging" AutoGenerateColumns="False">

                <Columns>
                    <asp:BoundField DataField="patient_nhs_registration" HeaderText="NHS Number" />
                    <asp:BoundField DataField="patient_firstname" HeaderText="First Name" />
                    <asp:BoundField DataField="patient_secondname" HeaderText="Last Name" />
                    <asp:BoundField DataField="patient_address" HeaderText="Address" />
                    <asp:BoundField DataField="patient_medical_condition" HeaderText="Medical Conditions" />
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:Button ID="UpdateButton" runat="server" CommandArgument='<%# Eval("patient_nhs_registration") %>' CommandName="_update" Text="Update" OnClick="UpdateButton_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="DeleteButton" runat="server" CommandArgument='<%# Eval("patient_nhs_registration") %>' CommandName="_delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this patient?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="header"></HeaderStyle>

                <PagerStyle CssClass="pager"></PagerStyle>

                <RowStyle CssClass="rows"></RowStyle>
            </asp:GridView>

        </div>
        <hr />
        <div class="h3">All Incidents</div>
        <div class="row">
            <asp:GridView runat="server" ID="AllGrid" PageSize="8" HorizontalAlign="Center"
                CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
                RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="AllGrid_PageIndexChanging" AutoGenerateColumns="False">
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
            <div class="col-md-12 mt-md-0 mt-5 text-center" style="margin-bottom: 10px;">
                <asp:Button class="btn btn-danger mt-3 align-middle" ID="RefreshTables" runat="server" Text="Refresh Database" OnClick="RefreshTables_Click" />
            </div>
        </div>
    </div>


        <div class="wrapper rounded bg-white" id="updateformsection" visible="false" runat="server">
        <div class="form">
            <div class="h3">Edit Patient</div>
            <hr/>
        <div class="h3">Patient Information Form</div>
            <div class="form">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>First Name</label>
                        <asp:TextBox class="form-control" ID="EdFirstName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Last Name</label>
                        <asp:TextBox class="form-control" ID="EdLastName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>NHS Registration Number</label>
                        <asp:TextBox class="form-control" MaxLength="5" ID="EdNHSReg" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="EdAddress" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Underlying Medical Conditions</label>
                        <textarea id="EdMedicalCondition" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="EdEdit" runat="server" Text="Edit Patient"/>
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="EdClear" runat="server" Text="Clear all Form Inputs" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="EdCancel" runat="server" Text="Cancel Edit" OnClick="EdCancel_Click" />
                    </div>
                </div>
             </div>

        </div>
    </div>

</asp:Content>

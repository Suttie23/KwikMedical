<%@ Page Title="KwikMedical Hospital Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hospital._Default" %>

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
        <div class="h1">KwikMedical Hospital Patient Database</div>
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
                </Columns>
                <HeaderStyle CssClass="header"></HeaderStyle>

                <PagerStyle CssClass="pager"></PagerStyle>

                <RowStyle CssClass="rows"></RowStyle>
            </asp:GridView>

        </div>
        <hr />
        <div class="row">
            <div class="h4">Update and Delete Patients (NHS Number)</div>
            <div class="col-md-3 mt-md-0 mt-3">
                <asp:TextBox class="form-control" ID="SelectPatient" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2 mt-md-0 mt-3">
                <asp:Button class="btn btn-danger mt-3 align-middle" ID="UpdateButton" runat="server" Text="Update Patient" OnClick="UpdateButton_Click" />
            </div>
            <div class="col-md-2 mt-md-0 mt-3">
                <asp:Button class="btn btn-danger mt-3 align-middle" ID="DeletePatientButton" runat="server" Text="Delete Patient" OnClick="DeletePatientButton_Click" />
            </div>
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
            <div class="h4">Delete Incidents</div>
            <div class="col-md-3 mt-md-0 mt-3">
                <asp:TextBox class="form-control" ID="InciLookup" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2 mt-md-0 mt-3">
                <asp:Button class="btn btn-danger mt-3 align-middle" ID="DeleteIncidentButton" runat="server" Text="Delete Incident" OnClick="DeleteIncidentButton_Click" />
            </div>
            <div class="col-md-2 mt-md-0 mt-3">
                <asp:Button class="btn btn-danger mt-3 align-middle" ID="RefreshTables" runat="server" Text="Refresh Databases" OnClick="RefreshTables_Click" />
            </div>
        </div>
    </div>


    <div class="wrapper rounded bg-white" id="updateformsection" visible="false" runat="server">
        <div class="form">
            <div class="h3">Edit Patient</div>
            <hr />
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
                        <asp:TextBox class="form-control" MaxLength="5" ID="EdNHSReg" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="EdAddress" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Underlying Medical Conditions</label>
                        <textarea id="EdMedicalCondition" runat="server" style="resize: none; width: 500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="UpdateConfirm" runat="server" Text="Update Patient Records" OnClick="UpdateConfirm_Click" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="UpdateClear" runat="server" Text="Clear all Form Inputs" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="UpdateCancel" runat="server" Text="Cancel Edit" OnClick="UpdateCancel_Click" />
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>

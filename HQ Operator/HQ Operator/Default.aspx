<%@ Page Title="KwikMedical HQ Operator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HQ_Operator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles.css" rel ="stylesheet" />

    <div class="wrapper rounded bg-white">
        <div class="form">
            <div class="h3">Lookup Patient (NHS Registration Number)</div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:TextBox class="form-control" MaxLength="5" ID="HQLookup" runat="server"></asp:TextBox>
                        <asp:Label ID="FindStatus" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQLookupButton" runat="server" Text="Lookup Patient" OnClick="HQLookupButton_Click" />
                    </div>
                </div>
            <hr/>
        <div class="h3">Patient Information Form</div>
            <div class="form">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>First Name</label>
                        <asp:TextBox class="form-control" ID="HQFirstName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Last Name</label>
                        <asp:TextBox class="form-control" ID="HQLastName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>NHS Registration Number</label>
                        <asp:TextBox class="form-control" MaxLength="5" ID="HQNHSReg" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="HQAddress" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Current Location</label>
                        <asp:DropDownList class="form-control" ID="HQLocation" runat="server">
                            <asp:ListItem Enabled="true" Text= "Select Location" Value= "Not Specified"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "City of Edinburgh" Value= "City of Edinburgh"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "East Lothian" Value= "East Lothian"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "West Lothian" Value= "West Lothian"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "Midlothian" Value= "Midlothian"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Medical Condition</label>
                        <textarea id="HQMedicalCondition" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>                
                <hr/>
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQSubmitPatientInformation" runat="server" Text="Submit Patient Information" OnClick="HQSubmitPatientInformation_Click" />
                        <asp:Label ID="SubmitStatus" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQClearForm" runat="server" Text="Clear all Form Inputs" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQRequestAmbulance" runat="server" Text="Request Ambulance" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mt-md-0 mt-3 text-center">
                        <asp:GridView ID="GridViewListPatient" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="726px" AutoGenerateColumns="False">
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                    </div>
                </div>
             </div>

        </div>
    </div>

</asp:Content>


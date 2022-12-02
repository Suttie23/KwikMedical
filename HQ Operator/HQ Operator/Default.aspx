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
                        <label>Underlying Medical Conditions</label>
                        <textarea id="HQMedicalCondition" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label runat="server" ID="HospitalLabel" Visible="false">Please Assign Hospital</label>
                        <asp:DropDownList class="form-control" Visible="false" ID="HospitalList" runat="server">
                            <asp:ListItem Enabled="true" ID="HospSelect" Text= "Select Location" runat="server" Value= "0"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospAstley" Text= "Astley Ainslie Hospital" runat="server" Value= "1"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospChalmers" Text= "Chalmers Hospital" Value= "2"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospCorstorphine" Text= "Corstorphine Hospital" Value= "3"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospEdinDental" Text= "Edinburgh Dental Institute" Value= "4"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospLauriston" Text= "Lauriston Building" Value= "5"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospLeith" Text= "Leith Community Treatment Centre" Value= "6"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospLiberton" Text= "Liberton Hospital" Value= "7"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospPrincess" Text= "Princess Alexandra Eye Pavilion" Value= "8"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospRoyalEd" Text= "Royal Edinburgh Hospital" Value= "9"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospSickKids" Text= "Royal Hospital for Children and Young People" Value= "10"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospRoyalInfirm" Text= "Royal Infirmary of Edinburgh Little France" Value= "11"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospRoyalVictoria" Text= "Royal Victoria Hospital" Value= "12"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospWesternGeneral" Text= "Western General Hospital" Value= "13"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospBelhaven" Text= "Belhaven Hospital" Value= "14"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospEdington" Text= "Edington Cottage Hospital" Value= "15"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospEastLothan" Text= "East Lothian Community Hospital" Value= "16"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospMidlothian" Text= "Midlothian Community Hospital" Value= "17"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospStJohns" Text= "St Johns Hospital" Value= "18"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospStMichaels" Text= "St Michaels Hospital" Value= "19"></asp:ListItem>
                            <asp:ListItem Enabled="false" ID="HospTippethill" Text= "Tippethill House Hospital" Value= "20"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
            
                    </div>
                </div> 
                <hr/>
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQSubmitPatientInformation" runat="server" Text="Submit Patient Information" OnClick="HQSubmitPatientInformation_Click" />
                        <asp:Label ID="SubmitStatus" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQClearForm" runat="server" Text="Clear all Form Inputs" OnClick="HQClearForm_Click" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HQRequestAmbulance1" runat="server" Text="Ambulance Required" OnClick="HQRequestAmbulance1_Click" />
                        <asp:Button class="btn btn-danger mt-3 align-middle" Visible="false" ID="HQRequestAmbulance2" runat="server" Text="Submit Ambulance Request" OnClick="HQRequestAmbulance2_Click" />
                    </div>
                </div>
                <div class="row" id="submittedIncident" runat="server" visible="false">
                    <hr/>
                    <div class="col-md-12 mt-md-0 mt-3 text-center">
                        <asp:Label ID="inciNumberDebug" runat="server" Text=""></asp:Label>
                    </div>
                </div>
             </div>

        </div>
    </div>

</asp:Content>


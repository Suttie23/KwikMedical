using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace HQ_Operator
{
    public partial class _Default : Page
    {

        PatientLogic patLogic = new PatientLogic();
        IncidentLogic inciLogic = new IncidentLogic();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // Submit Patient information
        protected void HQSubmitPatientInformation_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                InsertPat();
            }

        }

        // Lookup Patient by ID
        protected void HQLookupButton_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                FindPatient();
            }

        }

        private void InsertPat()
        {
            try
            {
                var patient = new DataAccessLayer.Models.Patient();
                {
                    patient.patient_nhs_registration = int.Parse(HQNHSReg.Text);
                    patient.patient_firstname = HQFirstName.Text;
                    patient.patient_secondname = HQLastName.Text;
                    patient.patient_address = HQAddress.Text;
                    patient.patient_medical_condition = HQMedicalCondition.InnerText;
                }
                patLogic.CreatePatient(patient);

                Response.Write("<script type=\"text/javascript\">alert('Patient has been submitted');</script>"); ;
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('There was an error submitting the patient, please try again');</script>");
            }

        }

        private void FindPatient()
        {

            int id = 0;
            id = int.Parse(HQLookup.Text);

            try
            {

                var foundpatient = patLogic.GetPatientById(id);
                {
                    if (foundpatient != null)
                    {
                        HQFirstName.Text = foundpatient.patient_firstname;
                        HQLastName.Text = foundpatient.patient_secondname;
                        HQNHSReg.Text = foundpatient.patient_nhs_registration.ToString();
                        HQAddress.Text = foundpatient.patient_address;
                        HQMedicalCondition.InnerText = foundpatient.patient_medical_condition;

                        Response.Write("<script type=\"text/javascript\">alert('Patient Found!');</script>");

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Patient not Found!');</script>");
                    }

                }

            }
            catch (Exception)
            {
                Response.Write("<script type=\"text/javascript\">alert('An Error has ocurred');</script>");
                throw;
            }


        }

        protected void HQClearForm_Click(object sender, EventArgs e)
        {
            HQLookup.Text = "";
            HQFirstName.Text = ""; ;
            HQLastName.Text = "";
            HQNHSReg.Text = "";
            HQAddress.Text = "";
            HQLocation.Text = "Not Specified";
            HQMedicalCondition.InnerText = "";
            SubmitStatus.Text = "";

        }

        protected void HQRequestAmbulance1_Click(object sender, EventArgs e)
        {


            HQRequestAmbulance1.Visible = false;
            HQRequestAmbulance2.Visible = true;

            HospitalLabel.Visible = true;
            HospitalList.Visible = true;

            string region = HQLocation.Text;



            switch (region)
            {
                case "City of Edinburgh":

                    HospAstley.Enabled = true;
                    HospChalmers.Enabled = true;
                    HospCorstorphine.Enabled = true;
                    HospEdinDental.Enabled = true;
                    HospLauriston.Enabled = true;
                    HospLeith.Enabled = true;
                    HospLiberton.Enabled = true;
                    HospPrincess.Enabled = true;
                    HospRoyalEd.Enabled = true;
                    HospSickKids.Enabled = true;
                    HospRoyalInfirm.Enabled = true;
                    HospRoyalVictoria.Enabled = true;
                    HospWesternGeneral.Enabled = true;

                    break;
                case "East Lothian":

                    HospBelhaven.Enabled = true;
                    HospEdington.Enabled = true;
                    HospEastLothan.Enabled = true;

                    break;
                case "Midlothian":

                    HospMidlothian.Enabled = true;

                    break;
                case "West Lothian":

                    HospStJohns.Enabled = true;
                    HospStMichaels.Enabled = true;
                    HospTippethill.Enabled = true;

                    break;
            }

        }

        protected void HQRequestAmbulance2_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                InsertInci();
            }

            HQRequestAmbulance1.Visible = true;
            HQRequestAmbulance2.Visible = false;
            HospitalLabel.Visible = false;
            HospitalList.Visible = false;

            HospAstley.Enabled = false;
            HospChalmers.Enabled = false;
            HospCorstorphine.Enabled = false;
            HospEdinDental.Enabled = false;
            HospLauriston.Enabled = false;
            HospLeith.Enabled = false;
            HospLiberton.Enabled = false;
            HospPrincess.Enabled = false;
            HospRoyalEd.Enabled = false;
            HospSickKids.Enabled = false;
            HospRoyalInfirm.Enabled = false;
            HospRoyalVictoria.Enabled = false;
            HospWesternGeneral.Enabled = false;
            HospBelhaven.Enabled = false;
            HospEdington.Enabled = false;
            HospEastLothan.Enabled = false;
            HospMidlothian.Enabled = false;
            HospStJohns.Enabled = false;
            HospStMichaels.Enabled = false;
            HospTippethill.Enabled = false;

        }

        private void InsertInci()
        {

            try
            {
                var incident = new DataAccessLayer.Models.Incident();
                {
                    incident.incident_reported_time = DateTime.Now;
                    incident.patient_nhs_registration = int.Parse(HQNHSReg.Text);
                    incident.incident_location = HQLocation.Text;
                    incident.assigned_hospital = int.Parse(HospitalList.SelectedValue);
                }
                inciLogic.CreateIncident(incident);

                Response.Write("<script type=\"text/javascript\">alert('Incident Report Sent to Ambulance');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Database Error - Please enter the patient into the system first. If the issue persists, contact support');</script>");
            }

        }
    }
}
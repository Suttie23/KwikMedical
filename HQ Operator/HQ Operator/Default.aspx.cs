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
                    patient.patient_current_location = HQLocation.Text;
                    patient.patient_medical_condition = HQMedicalCondition.InnerText;
                }
                patLogic.CreatePatient(patient);

                SubmitStatus.Text = "Patient Sucessfully Created";
            }
            catch (Exception ex)
            {
                SubmitStatus.Text = ex.Message;
            }

        }

        private void FindPatient()
        {

                int id = 0;
                id = int.Parse(HQLookup.Text);

                try
                {

                    HQFirstName.Text = patLogic.GetPatientById(id).patient_firstname;
                    HQLastName.Text = patLogic.GetPatientById(id).patient_secondname;
                    HQNHSReg.Text = patLogic.GetPatientById(id).patient_nhs_registration.ToString();
                    HQAddress.Text = patLogic.GetPatientById(id).patient_address;
                    HQLocation.Text = patLogic.GetPatientById(id).patient_current_location;
                    HQMedicalCondition.InnerText = patLogic.GetPatientById(id).patient_medical_condition;

                    FindStatus.Text = "Patient Found";

                }
                catch (Exception)
                {
                    FindStatus.Text = "Patient not Found";
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

        protected void HQRequestAmbulance_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                InsertInci();
            }

        }

        private void InsertInci()
        {

            try
            {
                var incident = new DataAccessLayer.Models.Incident();
                {
                    incident.patient_nhs_registration = int.Parse(HQNHSReg.Text);
                    incident.assigned_hospital = 10;
                }
                inciLogic.CreateIncident(incident);

                SubmitStatus.Text = "Incident Report Sent to Ambulance";
            }
            catch (Exception ex)
            {
                SubmitStatus.Text = ex.Message;
            }

        }
    }
}
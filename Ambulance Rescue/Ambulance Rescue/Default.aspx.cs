using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Ambulance_Rescue
{
    public partial class _Default : Page
    {

        // Logic objects
        PatientLogic patLogic = new PatientLogic();
        IncidentLogic inciLogic = new IncidentLogic();
        HospitalLogic hospLogic = new HospitalLogic();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Lookup Incident
        protected void InciLookupIncident_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                FindIncident();
            }

        }

        // Clear Form
        protected void AmbClearForm_Click(object sender, EventArgs e)
        {

            ClearAll();

        }

        // Update Hospital
        protected void AmbUpdateHospital_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                UpdateIncident();
            }

            ClearAll();

        }

        // Clear UI Elements
        private void ClearAll()
        {

            FindStatus.Text = "";
            UpdateStatus.Text = "";
            AmbAction.InnerText = "";
            AmbDiagnosis.InnerText = "";
            InciFirstName.Text = "";
            InciLastName.Text = "";
            InciNHSReg.Text = "";
            InciNumber.Text = "";
            InciLocation.Text = "";
            InciAssignedHospital.Text = "";
            InciMedicalCondition.InnerText = "";
            InciAddress.Text = "";
            Lookup.Text = "";

        }

        // Update Incident
        private void UpdateIncident()
        {

            int id = 0;
            id = int.Parse(InciNumber.Text);

            try
            {
                // Get incident by ID
                var inci = inciLogic.GetIncidentById(id);
                {
                    // Populate fields
                    inci.incident_diagnosis = AmbDiagnosis.InnerText;
                    inci.incident_action_taken = AmbAction.InnerText;                   

                    // Calculate callout length
                    var starttime = inci.incident_reported_time;
                    var endtime = DateTime.Now;
                    TimeSpan span = endtime.Subtract((DateTime)starttime);

                    // Populate field
                    inci.incident_callout_time = span.Minutes.ToString() + " Minutes";
                };

                // Update incident
                inciLogic.UpdateIncident(inci);

                // Success Message
                Response.Write("<script type=\"text/javascript\">alert('Update submitted to hospital');</script>");

            }
            catch (Exception ex)
            {
                // Exception Error Message 
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when updating the hospital');</script>");
            }


        }

        // Search for incident
        private void FindIncident()
        {

            int id;
            // Check if input is valid
            if(int.TryParse(Lookup.Text, out id))
            {
                // continue
            }
            else
            {
                // Error message
                Response.Write("<script type=\"text/javascript\">alert('Field should contain a number');</script>");
            }

            try
            {

                // Get incident by ID
                var foundincident = inciLogic.GetIncidentById(id);
                {
                    // If incident is not empty
                    if (foundincident != null)
                    {
                        // Populate form with related information form patient and incident table
                        InciNumber.Text = foundincident.incident_number.ToString();
                        InciNHSReg.Text = foundincident.patient_nhs_registration.ToString();
                        InciAssignedHospital.Text = hospLogic.GetHospitalById(foundincident.assigned_hospital).hospital_name;
                        InciLocation.Text = foundincident.incident_location;

                        InciFirstName.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_firstname;
                        InciLastName.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_secondname;
                        InciAddress.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_address;
                        InciMedicalCondition.InnerText = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_medical_condition;

                        // Success message
                        Response.Write("<script type=\"text/javascript\">alert('Incident Found!');</script>");

                    }
                    else
                    {
                        // Error message
                        Response.Write("<script type=\"text/javascript\">alert('Incident not Found!');</script>");
                    }

                }

            }
            catch (Exception)
            {
                // Exception error message
                FindStatus.Text = "Incident not Found";
                throw;
            }


        }
    }
}
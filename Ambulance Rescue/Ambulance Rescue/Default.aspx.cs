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

        PatientLogic patLogic = new PatientLogic();
        IncidentLogic inciLogic = new IncidentLogic();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InciLookupIncident_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                FindIncident();
            }

        }

        protected void AmbClearForm_Click(object sender, EventArgs e)
        {

            ClearAll();

        }

        protected void AmbUpdateHospital_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                UpdateIncident();
            }

            ClearAll();

        }

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

        private void UpdateIncident()
        {

            int id = 0;
            id = int.Parse(InciNumber.Text);

            try
            {
                var inci = inciLogic.GetIncidentById(id);
                {
                    inci.incident_diagnosis = AmbDiagnosis.InnerText;
                    inci.incident_action_taken = AmbAction.InnerText;                   

                    var starttime = inci.incident_reported_time;
                    var endtime = DateTime.Now;

                    TimeSpan span = endtime.Subtract((DateTime)starttime);

                    inci.incident_callout_time = span.Minutes.ToString() + " Minutes";
                };
                inciLogic.UpdateIncident(inci);

                Response.Write("<script type=\"text/javascript\">alert('Update submitted to hospital');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when updating the hospital');</script>");
            }


        }

        private void FindIncident()
        {

            int id;
            if(int.TryParse(Lookup.Text, out id))
            {

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Field should contain a number');</script>");
            }

            try
            {


                var foundincident = inciLogic.GetIncidentById(id);
                {
                    if (foundincident != null)
                    {
                        InciNumber.Text = foundincident.incident_number.ToString();
                        InciNHSReg.Text = foundincident.patient_nhs_registration.ToString();
                        InciAssignedHospital.Text = foundincident.assigned_hospital.ToString();
                        InciLocation.Text = foundincident.incident_location;

                        //int nhs = int.Parse(foundincident.patient_nhs_registration);

                        InciFirstName.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_firstname;
                        InciLastName.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_secondname;
                        InciAddress.Text = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_address;
                        InciMedicalCondition.InnerText = patLogic.GetPatientById(foundincident.patient_nhs_registration).patient_medical_condition;

                        Response.Write("<script type=\"text/javascript\">alert('Incident Found!');</script>");

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Incident not Found!');</script>");
                    }

                }

            }
            catch (Exception)
            {
                FindStatus.Text = "Incident not Found";
                throw;
            }


        }
    }
}
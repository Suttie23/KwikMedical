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

        protected void AmbUpdateHospital_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                UpdateIncident();
            }

        }

        private void UpdateIncident()
        {

            try
            {
                var inci = new DataAccessLayer.Models.Incident
                {
                    incident_action_taken = AmbAction.InnerText,
                    incident_diagnosis = AmbDiagnosis.InnerText,
                    incident_callout_time = AmbCalloutLength.Text
                };
                inciLogic.UpdateIncident(inci);

            }
            catch (Exception ex)
            {
                SubmitStatus.Text = ex.Message;
            }


        }

        private void FindIncident()
        {

            int id = 0;
            id = int.Parse(Lookup.Text);

            try
            {



                //InciFirstName.Text = patLogic.GetPatientById(id).patient_firstname;
                InciNumber.Text = inciLogic.GetIncidentById(id).incident_number.ToString();
                InciNHSReg.Text = inciLogic.GetIncidentById(id).patient_nhs_registration.ToString();
                InciAssignedHospital.Text = inciLogic.GetIncidentById(id).assigned_hospital.ToString();

                int nhs = int.Parse(InciNHSReg.Text);

                InciFirstName.Text = patLogic.GetPatientById(nhs).patient_firstname;
                InciLastName.Text = patLogic.GetPatientById(nhs).patient_secondname;
                InciAddress.Text = patLogic.GetPatientById(nhs).patient_address;
                InciLocation.Text = patLogic.GetPatientById(nhs).patient_current_location;
                InciMedicalCondition.InnerText = patLogic.GetPatientById(nhs).patient_medical_condition;


                SubmitStatus.Text = "Incident Found";

            }
            catch (Exception)
            {
                SubmitStatus.Text = "Incident not Found";
                throw;
            }


        }
    }
}
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

            }
            catch (Exception ex)
            {
                UpdateStatus.Text = ex.Message;
            }


        }

        private void FindIncident()
        {

            int id = 0;
            id = int.Parse(Lookup.Text);

            try
            {

                InciNumber.Text = inciLogic.GetIncidentById(id).incident_number.ToString();
                InciNHSReg.Text = inciLogic.GetIncidentById(id).patient_nhs_registration.ToString();
                InciAssignedHospital.Text = inciLogic.GetIncidentById(id).assigned_hospital.ToString();
                InciLocation.Text = inciLogic.GetIncidentById(id).incident_location;

                int nhs = int.Parse(InciNHSReg.Text);

                InciFirstName.Text = patLogic.GetPatientById(nhs).patient_firstname;
                InciLastName.Text = patLogic.GetPatientById(nhs).patient_secondname;
                InciAddress.Text = patLogic.GetPatientById(nhs).patient_address;
                InciMedicalCondition.InnerText = patLogic.GetPatientById(nhs).patient_medical_condition;


                FindStatus.Text = "Incident Found";

            }
            catch (Exception)
            {
                FindStatus.Text = "Incident not Found";
                throw;
            }


        }
    }
}
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

        PatientLogic logic = new PatientLogic();

        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                BindingCategoryData();
            }

        }

        private void BindingCategoryData()
        {
            try
            {
                var listPatient = logic.PatientList();
                GridViewListPatient.DataSource = listPatient;
                GridViewListPatient.DataBind();
            }
            catch(Exception)
            {
                throw;
            }

        }

        // Submit Patient information
        protected void HQSubmitPatientInformation_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                Insert();
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

        private void Insert()
        {
            try
            {
                var patient = new DataAccessLayer.Models.Patient();
                {
                    patient.patient_nhs_registration = HQNHSReg.Text;
                    patient.patient_firstname = HQFirstName.Text;
                    patient.patient_secondname = HQLastName.Text;
                    patient.patient_address = HQAddress.Text;
                    patient.patient_current_location = HQLocation.Text;
                    patient.patient_medical_condition = HQMedicalCondition.InnerText;
                }
                logic.CreatePatient(patient);

                SubmitStatus.Text = "Patient Sucessfully Created";
            }
            catch (Exception ex)
            {
                SubmitStatus.Text = ex.Message;
            }

        }

        private void FindPatient()
        {
            try
            {

                string id = HQLookup.Text;

                var foundpatient = logic.GetPatientById(id);

                    HQFirstName.Text = foundpatient.patient_firstname;
                    HQLastName.Text = foundpatient.patient_secondname;
                    HQNHSReg.Text = foundpatient.patient_nhs_registration.ToString();
                    HQAddress.Text = foundpatient.patient_address;
                    HQLocation.Text = foundpatient.patient_current_location;
                    HQMedicalCondition.InnerText = foundpatient.patient_medical_condition;

                    FindStatus.Text = "Patient Found";

            }
            catch (NullReferenceException e)
            {
                FindStatus.Text = "Patient not Found";
            }

        }

    }
}
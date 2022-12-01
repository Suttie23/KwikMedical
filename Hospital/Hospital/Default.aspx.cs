using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

namespace Hospital
{
    public partial class _Default : Page
    {

        // Create logic objects
        PatientLogic patLogic = new PatientLogic();
        IncidentLogic inciLogic = new IncidentLogic();
        HospitalLogic hospLogic = new HospitalLogic();

        // Populate grids on first load
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PatientGridBind();
                InciGridBind();

            }


        }

        // Refresh Grids
        protected void RefreshTables_Click(object sender, EventArgs e)
        {

            PatientGridBind();
            InciGridBind();

        }

        // Display Grid pages for patient
        protected void PatientGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                PatientGridBind();
                PatientGrid.PageIndex = e.NewPageIndex;
                PatientGrid.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        // Display Grid pages for Incidents
        protected void AllGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                InciGridBind();
                AllGrid.PageIndex = e.NewPageIndex;
                AllGrid.DataBind();
            }
            catch (Exception ex)
            {
            }
        }

        // Bind incident data to grid
        private void InciGridBind()
        {
            try
            {

                var inciList = inciLogic.IncidentList();
                AllGrid.DataSource = inciList;
                AllGrid.DataBind();

            }
            catch (Exception)
            {
                throw;
            }

        }

        // Bind patient data to grid
        private void PatientGridBind()
        {
            try
            {

                var patientList = patLogic.PatientList();
                PatientGrid.DataSource = patientList;
                PatientGrid.DataBind();



            }
            catch(Exception)
            {
                throw;
            }

        }

        // Update Patient
          protected void UpdateButton_Click(object sender, EventArgs e)
          {

            populateUpdate();

          }

        // Populate update form
        private void populateUpdate()
        {
            int id;
            // Check if selected patient number is valid
            if (int.TryParse(SelectPatient.Text, out id))
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

                // Get patient by ID
                var foundpatient = patLogic.GetPatientById(id);
                {
                    // If patient not empty
                    if (foundpatient != null)
                    {
                        // Populate update form
                        EdFirstName.Text = foundpatient.patient_firstname.ToString();
                        EdLastName.Text = foundpatient.patient_secondname.ToString();
                        EdNHSReg.Text = foundpatient.patient_nhs_registration.ToString();
                        EdAddress.Text = foundpatient.patient_address;
                        EdMedicalCondition.InnerText = foundpatient.patient_medical_condition;

                        // Hide main UI and show Update UI
                        mainsection.Visible = false;
                        updateformsection.Visible = true;

                    }
                    else
                    {
                        // Error message
                        Response.Write("<script type=\"text/javascript\">alert('Patient not Found!');</script>");
                    }



                }

            }
            catch (Exception)
            {
                // Error exception message
                Response.Write("<script type=\"text/javascript\">alert('An Error has occured');</script>");
                throw;
            }
        }

        // Delete incident
        protected void DeleteIncidentButton_Click(object sender, EventArgs e)
        {
            int id;
            // Check if input is valid
            if (int.TryParse(InciLookup.Text, out id))
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
                // Delete from database
                inciLogic.DeleteIncident(id);

                // Success Message
                Response.Write("<script type=\"text/javascript\">alert('Incident deleted');</script>");

                // Refresh Grid
                InciGridBind();

            }
            catch (Exception ex)
            {
                // Exception error message
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when deleting the incident');</script>");
            }

            // Reset search form
            InciLookup.Text = "";
        }

        // Delete Patient
        protected void DeletePatientButton_Click(object sender, EventArgs e)
        {

            int id;
            // Check if input is valid
            if (int.TryParse(SelectPatient.Text, out id))
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
                // Delete patient from database
                patLogic.DeletePatient(id);

                // Success message
                Response.Write("<script type=\"text/javascript\">alert('Patient deleted');</script>");

                // Refresh grid
                PatientGridBind();

            }
            catch (Exception ex)
            {
                // Exception error message
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when deleting the patient, please make sure all related incidents are deleted first!');</script>");
            }

            // Reset search form
            SelectPatient.Text = "";

        }

        // Cancel update
        protected void UpdateCancel_Click(object sender, EventArgs e)
        {
            // Hide and show elements
            mainsection.Visible = true;
            updateformsection.Visible = false;
        }

        // Confirm update
        protected void UpdateConfirm_Click(object sender, EventArgs e)
        {
            int id = 0;
            id = int.Parse(EdNHSReg.Text);

            try
            {
                // Get patient by ID
                var patient = patLogic.GetPatientById(id);
                {
                    // Populate fields
                    patient.patient_firstname = EdFirstName.Text;
                    patient.patient_secondname = EdLastName.Text;
                    patient.patient_address = EdAddress.Text;
                    patient.patient_medical_condition = EdMedicalCondition.InnerText;

                };
                // Update record
                patLogic.UpdatePatient(patient);

                // Success Message
                Response.Write("<script type=\"text/javascript\">alert('Updated patient');</script>");

                // Hide and show elements
                mainsection.Visible = true;
                updateformsection.Visible = false;

                // Refresh Database
                PatientGridBind();

            }
            catch (Exception ex)
            {

                // Exception Error Message
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when updating the patient');</script>");
            }
        }

    }
}
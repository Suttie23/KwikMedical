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

        PatientLogic patLogic = new PatientLogic();
        IncidentLogic inciLogic = new IncidentLogic();
        HospitalLogic hospLogic = new HospitalLogic();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PatientGridBind();
                InciGridBind();

            }


        }

        protected void RefreshTables_Click(object sender, EventArgs e)
        {

            PatientGridBind();
            InciGridBind();

        }

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

          protected void UpdateButton_Click(object sender, EventArgs e)
          {

            populateUpdate();

          }

        private void populateUpdate()
        {
            int id;
            if (int.TryParse(SelectPatient.Text, out id))
            {

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Field should contain a number');</script>");
            }

            try
            {


                var foundpatient = patLogic.GetPatientById(id);
                {
                    if (foundpatient != null)
                    {
                        EdFirstName.Text = foundpatient.patient_firstname.ToString();
                        EdLastName.Text = foundpatient.patient_secondname.ToString();
                        EdNHSReg.Text = foundpatient.patient_nhs_registration.ToString();
                        EdAddress.Text = foundpatient.patient_address;
                        EdMedicalCondition.InnerText = foundpatient.patient_medical_condition;

                        mainsection.Visible = false;
                        updateformsection.Visible = true;

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Patient not Found!');</script>");
                    }



                }

            }
            catch (Exception)
            {
                Response.Write("<script type=\"text/javascript\">alert('An Error has occured');</script>");
                throw;
            }
        }

        protected void DeleteIncidentButton_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(InciLookup.Text, out id))
            {

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Field should contain a number');</script>");
            }

            try
            {

                inciLogic.DeleteIncident(id);

                Response.Write("<script type=\"text/javascript\">alert('Incident deleted');</script>");

                InciGridBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when deleting the incident');</script>");
            }

            InciLookup.Text = "";
        }

        protected void DeletePatientButton_Click(object sender, EventArgs e)
        {

            int id;
            if (int.TryParse(SelectPatient.Text, out id))
            {

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Field should contain a number');</script>");
            }

            try
            {

                patLogic.DeletePatient(id);

                Response.Write("<script type=\"text/javascript\">alert('Patient deleted');</script>");

                PatientGridBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when deleting the patient, please make sure all related incidents are deleted first!');</script>");
            }

            SelectPatient.Text = "";

        }

        protected void UpdateCancel_Click(object sender, EventArgs e)
        {
            mainsection.Visible = true;
            updateformsection.Visible = false;
        }

        protected void UpdateConfirm_Click(object sender, EventArgs e)
        {
            int id = 0;
            id = int.Parse(EdNHSReg.Text);

            try
            {
                var patient = patLogic.GetPatientById(id);
                {
                    patient.patient_firstname = EdFirstName.Text;
                    patient.patient_secondname = EdLastName.Text;
                    patient.patient_address = EdAddress.Text;
                    patient.patient_medical_condition = EdMedicalCondition.InnerText;

                };
                patLogic.UpdatePatient(patient);

                Response.Write("<script type=\"text/javascript\">alert('Updated patient');</script>");

                mainsection.Visible = true;
                updateformsection.Visible = false;
                PatientGridBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('An error has occured when updating the patient');</script>");
            }
        }

    }
}
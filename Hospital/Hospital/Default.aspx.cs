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
                //testGridBind();


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

    }
}
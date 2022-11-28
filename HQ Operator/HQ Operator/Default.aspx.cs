using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HQ_Operator
{
    public partial class _Default : Page
    {

        string connectionString = @"server=127.0.0.1;port=3306;database=KwikMedicalDatabase;userid=root;password=1234;";
        MySqlConnection con = null;
        MySqlDataReader reader = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Submit Patient information
        protected void HQSubmitPatientInformation_Click(object sender, EventArgs e)
        {

            con = new MySqlConnection(connectionString);
            con.Open();
            MySqlCommand command = con.CreateCommand();
            command.Parameters.AddWithValue("@patient_firstname", HQFirstName.Text);
            command.Parameters.AddWithValue("@patient_secondname", HQLastName.Text);
            command.Parameters.AddWithValue("@patient_nhs_registration", HQNHSReg.Text);
            command.Parameters.AddWithValue("@patient_address", HQAddress.Text);
            command.Parameters.AddWithValue("@patient_current_location", HQLocation.Text);
            command.Parameters.AddWithValue("@patient_medical_condition", HQMedicalCondition.InnerText);

            command.CommandText = "INSERT INTO Patients (patient_firstname, patient_secondname, patient_nhs_registration, patient_address, patient_current_location, patient_medical_condition)" +
                "VALUES (@patient_firstname, @patient_secondname, @patient_nhs_registration, @patient_address, @patient_current_location, @patient_medical_condition)";
            if (command.ExecuteNonQuery() > 0)
                SubmitStatus.Text = "Submitted Successfully";
            else
                SubmitStatus.Text = "Failed to Submit Patient";
            con.Close();
        }

        // Lookup Patient by ID
        protected void HQLookupButton_Click(object sender, EventArgs e)
        {
            con = new MySqlConnection(connectionString);
            con.Open();
            string cmdText = "SELECT * FROM Patients WHERE patient_nhs_registration ='" + HQLookup.Text + "'";

            MySqlCommand cmd = new MySqlCommand(cmdText, con);
            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                HQNHSReg.Text = reader.GetValue(0).ToString();
                HQFirstName.Text = reader.GetValue(1).ToString();
                HQLastName.Text = reader.GetValue(2).ToString();
                HQAddress.Text = reader.GetValue(3).ToString();
                HQLocation.Text = reader.GetValue(4).ToString();
                HQMedicalCondition.InnerText = reader.GetValue(5).ToString();

                FindStatus.Text = "Patient Found!";
            }
            else
            {
                FindStatus.Text = "Failed to Find Patient";
            }
            con.Close();

        }
    }
}
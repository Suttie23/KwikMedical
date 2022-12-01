using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using DataAccessLayer.Models;

namespace BusinessLogic
{
    public class PatientLogic
    {

        PatientDAL dal = new PatientDAL();

        public List<Patient> PatientList()
        {
            var listPatients = dal.GetPatientsList();
            return listPatients;
        }

        public void CreatePatient(Patient patient)
        {
            dal.CreatePatient(patient);
        }

        public Patient GetPatientById(int? id)
        {

            Patient patient = dal.GetPatientById(id);
            return patient;

        }

        public void DeletePatient(int id)
        {

            dal.DeletePatient(id);

        }

        public void UpdatePatient(Patient patient)
        {

            dal.UpdatePatient(patient);

        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace DataAccessLayer
{
    public class PatientDAL
    {

        KwikMedicalDatabaseEntities db = new KwikMedicalDatabaseEntities();

        public List<Patient> GetPatientsList()
        {
            var patients = db.Patients.ToList();
            return patients;
        }

        public void CreatePatient(Patient patient)
        {
            db.Patients.Add(patient);
            db.SaveChanges();
        }

        public Patient GetPatientById(int? id)
        {

            Patient patient = db.Patients.Find(id);
            return patient;

        }

        public void DeletePatient(string id)
        {

            var patient = db.Patients.Find(id);
            db.Patients.Remove(patient);
            db.SaveChanges();

        }

    }
}

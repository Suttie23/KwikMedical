using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace DataAccessLayer
{
    public class HospitalDAL
    {

        KwikMedicalDatabaseEntities db = new KwikMedicalDatabaseEntities();

        public List<Hospital> GetHospitalsList()
        {
            var hospital = db.Hospitals.ToList();
            return hospital;
        }

        public Hospital GetHospitalById(int? id)
        {

            Hospital hospital = db.Hospitals.Find(id);
            return hospital;

        }

    }
}

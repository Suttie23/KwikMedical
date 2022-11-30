using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using DataAccessLayer.Models;

namespace BusinessLogic
{
    public class HospitalLogic
    {

        HospitalDAL dal = new HospitalDAL();

        public List<Hospital> HospitalsList()
        {
            var listHospitals = dal.GetHospitalsList();
            return listHospitals;
        }

        public Hospital GetHospitalById(int? id)
        {

            Hospital hospital = dal.GetHospitalById(id);
            return hospital;

        }

    }
}

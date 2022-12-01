using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using DataAccessLayer.Models;

namespace BusinessLogic
{
    public class IncidentLogic
    {

        IncidentDAL dal = new IncidentDAL();

        public List<Incident> IncidentList()
        {
            var listIncidents = dal.GetIncidentList();
            return listIncidents;
        }

        public void CreateIncident(Incident incident)
        {
            dal.CreateIncident(incident);
        }

        public Incident GetIncidentById(int id)
        {

            Incident incident = dal.GetIncidentById(id);
            return incident;

        }

        public void UpdateIncident(Incident incident)
        {

            dal.UpdateIncident(incident);

        }

        public void DeleteIncident(int id)
        {

            dal.DeleteIncident(id);

        }

    }
}

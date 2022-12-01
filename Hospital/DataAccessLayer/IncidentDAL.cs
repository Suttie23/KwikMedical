using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace DataAccessLayer
{
    public class IncidentDAL
    {

        KwikMedicalDatabaseEntities db = new KwikMedicalDatabaseEntities();

        public List<Incident> GetIncidentList()
        {
            var incidents = db.Incidents.ToList();
            return incidents;
        }

        public void CreateIncident(Incident incident)
        {
            db.Incidents.Add(incident);
            db.SaveChanges();
        }

        public Incident GetIncidentById(int id)
        {

            Incident incident = db.Incidents.Find(id);
            return incident;

        }

        public void UpdateIncident(Incident incident)
        {

            db.Entry(incident).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

        }

        public void DeleteIncident(int id)
        {

            var incident = db.Incidents.Find(id);
            db.Incidents.Remove(incident);
            db.SaveChanges();

        }

    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using API.Entities;
using API.Models;

namespace API.Controllers
{
    public class блюдаController : ApiController
    {
        private pizzawoolfEF db = new pizzawoolfEF();

        // GET: api/блюда
        [ResponseType(typeof(List<Dishes>))]
        public IHttpActionResult Getблюда()
        {
            return Ok(db.блюда.ToList().ConvertAll(p=>new Dishes(p)));
        }

        // GET: api/блюда/5
        [ResponseType(typeof(блюда))]
        public IHttpActionResult Getблюда(long id)
        {
            блюда блюда = db.блюда.Find(id);
            if (блюда == null)
            {
                return NotFound();
            }

            return Ok(блюда);
        }

        // PUT: api/блюда/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putблюда(long id, блюда блюда)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != блюда.id_блюда)
            {
                return BadRequest();
            }

            db.Entry(блюда).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!блюдаExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/блюда
        [ResponseType(typeof(блюда))]
        public IHttpActionResult Postблюда(блюда блюда)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.блюда.Add(блюда);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = блюда.id_блюда }, блюда);
        }

        // DELETE: api/блюда/5
        [ResponseType(typeof(блюда))]
        public IHttpActionResult Deleteблюда(long id)
        {
            блюда блюда = db.блюда.Find(id);
            if (блюда == null)
            {
                return NotFound();
            }

            db.блюда.Remove(блюда);
            db.SaveChanges();

            return Ok(блюда);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool блюдаExists(long id)
        {
            return db.блюда.Count(e => e.id_блюда == id) > 0;
        }
    }
}
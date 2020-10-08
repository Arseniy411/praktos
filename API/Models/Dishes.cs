using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using API.Entities;

namespace API.Models
{
    public class Dishes
    {
        public Dishes(блюда блюда)
        {
            Id = блюда.id_блюда;
            Name = блюда.наименование;
            price = блюда.цена;
            Idc = блюда.id_категории;

        }
        public long Id { get; set; }
        public string Name { get; set; }
        public long price { get; set; }
        public long Idc { get; set; }
    }
}
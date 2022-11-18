using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOTprojekt
{
    public class VerwaltungSchultag
    {
        public VerwaltungSchultag(Schultag tag)
        {
            Tag = tag;
            stunde = 0;
        }

        private int stunde;

        public Schultag Tag { get; set; }
        public Dictionary<int,VerwaltungFaecher> Schulstunde { get; set; } = new Dictionary<int,VerwaltungFaecher>();

        public void AddSchulstunde(VerwaltungFaecher schulstunde)
        {
            stunde += 1;
            Schulstunde.Add(stunde, schulstunde);
        }
    }
}

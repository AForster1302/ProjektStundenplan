using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOTprojekt
{
    public class VerwaltungSchulwoche
    {
        public List<VerwaltungSchultag> Schulwoche { get; set; } = new List<VerwaltungSchultag>();

        public void AddSchultag(VerwaltungSchultag tag)
        {
            //foreach (var item in Schulwoche)
            //{
            //    if (tag.Tag == item.Tag)
            //    {
            //        return;
            //    }
            //}

            if (!Schulwoche.Any(x => x.Tag == tag.Tag))
            {
                Schulwoche.Add(tag);
            }
        }

        public void Ausgabe()
        {
            //foreach (var Schultag in Schulwoche)
            //{
            //    Console.WriteLine($"Tag: {Schultag.Tag}");
            //    foreach (var Fach in Schultag.Schulstunde)
            //    {
            //        Console.WriteLine($"{Fach.Key} {Fach.Value.Fach}");
            //    }
            //}

            foreach (var schultag in Schulwoche)
            {
                Console.WriteLine($"{schultag.Tag}: ");
                foreach (var fach in schultag.Schulstunde)
                {
                    Console.WriteLine($"{fach.Key}. {fach.Value.Fach}");
                    
                }
                Console.WriteLine();
            }
        }

        public void ExportToCSV()
        {
            using (StreamWriter sw = new StreamWriter("Stundenplan.csv", false, Encoding.UTF8))
            {
                foreach (var schultag in Schulwoche)
                {
                    sw.WriteLine($"{schultag.Tag},");
                    foreach (var fach in schultag.Schulstunde)
                    {
                        sw.WriteLine($"{fach.Key},{fach.Value.Fach},");

                    }
                    sw.WriteLine();
                }
            }
        }
    }
}

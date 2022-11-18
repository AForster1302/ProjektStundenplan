using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOTprojekt
{
    public enum Schultag
    {
        Montag = 1,
        Dienstag = 2,
        Mittwoch = 3,
        Donnerstag = 4,
        Freitag = 5
    }

    public class Program
    {
        static void Main(string[] args)
        {
            VerwaltungSchulwoche bsp = new VerwaltungSchulwoche();

            VerwaltungFaecher Deutsch = new VerwaltungFaecher("Deutsch");
            VerwaltungFaecher Mathematik = new VerwaltungFaecher("Mathematik");
            VerwaltungFaecher Englisch = new VerwaltungFaecher("Englisch");
            VerwaltungFaecher Sport = new VerwaltungFaecher("Sport");
            VerwaltungFaecher Erdkunde = new VerwaltungFaecher("Erdkunde");
            VerwaltungFaecher Kunst = new VerwaltungFaecher("Kunst");
            VerwaltungFaecher Geschichte = new VerwaltungFaecher("Geschichte");
            VerwaltungFaecher Programmierung = new VerwaltungFaecher("Programmierung");
            VerwaltungFaecher Freistunde = new VerwaltungFaecher("Frei");


            VerwaltungSchultag Montag = new VerwaltungSchultag(Schultag.Montag);
            Montag.AddSchulstunde(Deutsch);
            Montag.AddSchulstunde(Deutsch);
            Montag.AddSchulstunde(Mathematik);
            Montag.AddSchulstunde(Mathematik);
            Montag.AddSchulstunde(Kunst);

            VerwaltungSchultag Dienstag = new VerwaltungSchultag(Schultag.Dienstag);
            Dienstag.AddSchulstunde(Geschichte);
            Dienstag.AddSchulstunde(Geschichte);
            Dienstag.AddSchulstunde(Sport);
            Dienstag.AddSchulstunde(Sport);
            Dienstag.AddSchulstunde(Sport);

            VerwaltungSchultag Mittwoch = new VerwaltungSchultag(Schultag.Mittwoch);
            Mittwoch.AddSchulstunde(Englisch);
            Mittwoch.AddSchulstunde(Englisch);
            Mittwoch.AddSchulstunde(Geschichte);
            Mittwoch.AddSchulstunde(Geschichte);
            Mittwoch.AddSchulstunde(Freistunde);

            VerwaltungSchultag Donnerstag = new VerwaltungSchultag(Schultag.Donnerstag);
            Donnerstag.AddSchulstunde(Programmierung);
            Donnerstag.AddSchulstunde(Programmierung);
            Donnerstag.AddSchulstunde(Erdkunde);
            Donnerstag.AddSchulstunde(Erdkunde);
            Donnerstag.AddSchulstunde(Mathematik);

            VerwaltungSchultag Freitag = new VerwaltungSchultag(Schultag.Freitag);
            Freitag.AddSchulstunde(Programmierung);
            Freitag.AddSchulstunde(Programmierung);
            Freitag.AddSchulstunde(Sport);
            Freitag.AddSchulstunde(Sport);
            Freitag.AddSchulstunde(Freistunde);

            bsp.AddSchultag(Montag);
            bsp.AddSchultag(Dienstag);
            bsp.AddSchultag(Mittwoch);
            bsp.AddSchultag(Donnerstag);
            bsp.AddSchultag(Freitag);

            //bsp.Ausgabe();

            string file = @"C:\Users\Adrian\Desktop\SOT Projekt\SOTprojekt\SOTprojekt\bin\Debug\Stundenplan.csv";

            if (File.Exists(file))
            {
                Console.WriteLine($"Datei {file} existiert bereits!");
            }
            else
            {
                bsp.ExportToCSV();
            }

            Console.ReadLine();

        }
    }
}

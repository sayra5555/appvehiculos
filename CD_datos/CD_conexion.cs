using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CD_datos
{
    public class CD_conexion
    {
        private SqlConnection db_conexion = new SqlConnection("Data Source=DESKTOP-9QF8HLG\\SQLEXPRESS;" +
     "Initial Catalog=db_AgenciaCarros;" +
     "Integrated Security=True;Encrypt=False");

        public SqlConnection MtdAbrirConexion()
        {
            if (db_conexion.State == ConnectionState.Closed)
                db_conexion.Open();
            return db_conexion;
        }

        public SqlConnection MtdCerrarConexion()
        {
            if (db_conexion.State == ConnectionState.Closed)
                db_conexion.Close();
            return db_conexion;
        }
    }
}

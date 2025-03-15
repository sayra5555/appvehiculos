using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CD_datos
{
    public class CD_vehiculos
    {
        CD_conexion db_conexion = new CD_conexion();

        public DataTable MtMostrar()
        {
 
            string QryMostrar = "usp_vehiculos_select_mostras";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrar, db_conexion.MtdAbrirConexion());
            DataTable dtMostrar = new DataTable();
            adapter.Fill(dtMostrar);
            db_conexion.MtdCerrarConexion();
            return dtMostrar;
        }

        public void MtInsertar(string marca, string modelo, int año, decimal precio, string estado)
        {

            string usp_Insertar = "usp_vehiculos_inserT_Guardar";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@Marca", marca);
            cmd_Query.Parameters.AddWithValue("@Modelo", modelo);
            cmd_Query.Parameters.AddWithValue("@Año", año);
            cmd_Query.Parameters.AddWithValue("@Precio", precio);
            cmd_Query.Parameters.AddWithValue("@Estado", estado);

            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }

        public void MtUpdate(int VehiculoID, string marca, string modelo, int año, decimal precio, string estado)
        {

            string usp_Insertar = "usp_vehiculos_update_Editar";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@Vehiculo", VehiculoID);
            cmd_Query.Parameters.AddWithValue("@Marca", marca);
            cmd_Query.Parameters.AddWithValue("@Modelo", modelo);
            cmd_Query.Parameters.AddWithValue("@Año", año);
            cmd_Query.Parameters.AddWithValue("@Precio", precio);
            cmd_Query.Parameters.AddWithValue("@Estado", estado);
            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }

        public void MtDelete(int VehiculoID)
        {
            string usp_Insertar = "usp_VEHICULOS_eliminar";
            SqlCommand cmd_Query = new SqlCommand(usp_Insertar, db_conexion.MtdAbrirConexion());

            cmd_Query.CommandType = CommandType.StoredProcedure;
            cmd_Query.Parameters.AddWithValue("@Vehiculo", VehiculoID);
            cmd_Query.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();

        }
          
}

}
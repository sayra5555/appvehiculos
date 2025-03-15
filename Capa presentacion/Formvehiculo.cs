using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CD_datos;

namespace Capa_presentacion
{
    public partial class Formvehiculo : Form
    {
        public Formvehiculo()
        {
            InitializeComponent();
        }


        public void MtdMostrar()
        {

            CD_vehiculos mostrar = new CD_vehiculos();
            DataTable dtMostrar = mostrar.MtMostrar();
            datagriVehiculo.DataSource = dtMostrar;
        }

        private void Formvehiculo_Load(object sender, EventArgs e)
        {
            MtdMostrar();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CD_vehiculos conn = new CD_vehiculos();

            try
            {
                conn.MtInsertar(
                    txtMarca.Text,
                    txtModelo.Text,
                    int.Parse(txtAño.Text),
                    decimal.Parse(txtPrecio.Text),
                    cbxEstado.Text);

                MessageBox.Show("El Vehiculo se agregó con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            CD_vehiculos conn = new CD_vehiculos();

            try
            {
                conn.MtUpdate(
                    int.Parse(txtvehiculoID.Text),
                    txtMarca.Text,
                    txtModelo.Text,
                    int.Parse(txtAño.Text),
                    decimal.Parse(txtPrecio.Text),
                    cbxEstado.Text);

                MessageBox.Show("El Vehiculo se actualizo con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void datagriVehiculo_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void datagriVehiculo_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtvehiculoID.Enabled = false;

            txtvehiculoID.Text = datagriVehiculo.SelectedCells[0].Value.ToString();
            txtMarca.Text = datagriVehiculo.SelectedCells[1].Value.ToString();
            txtModelo.Text = datagriVehiculo.SelectedCells[2].Value.ToString();
            txtAño.Text = datagriVehiculo.SelectedCells[3].Value.ToString();
            txtPrecio.Text = datagriVehiculo.SelectedCells[4].Value.ToString();
            cbxEstado.Text = datagriVehiculo.SelectedCells[5].Value.ToString();
        }

        private void btneliminar_Click(object sender, EventArgs e)
        {
            CD_vehiculos conn = new CD_vehiculos();

            try
            {
                conn.MtDelete(
                    int.Parse(txtvehiculoID.Text));

                MessageBox.Show("El Vehiculo se elimino con éxito", "Correcto",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            MtdMostrar();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            txtAño.Clear();
            txtPrecio.Clear();
            txtModelo.Clear();
            txtMarca.Clear();
            txtvehiculoID.Clear();
            cbxEstado.ResetText();
        

        private void btnsalir_Click(object sender, EventArgs e)
        {
            Close();    
        }
    }
}

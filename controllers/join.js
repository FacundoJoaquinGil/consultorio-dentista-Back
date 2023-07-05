const { db } = require("../db.js");

const mostrar = (req, res) => {
    db.query("SELECT * FROM pacientes p INNER JOIN historialclinico h ON p.idHistorialClinico = h.id_HistorialClinico; ;",
     (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    });
  };

  module.exports = { mostrar };
  // mostrarUno, registrar, editar, eliminar, historialPacientes
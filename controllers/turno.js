const { db } = require("../db.js");

const mostrar = (req, res) => {
  db.query("SELECT * FROM turnos", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
};

const mostrarUno = (req, res) => {
  const { id } = req.params;

  db.query(
    `SELECT * FROM turnos WHERE id_Turnos = ${id}`,
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
};

const registrar = (req, res) => {
    const {idPaciente, fechaTurno, numOrden} = req.body

  db.query(
    "INSERT INTO turnos ( fechaTurno, idPaciente, numOrden) values(?,?,?)",
    [
      fechaTurno,
      idPaciente,
      numOrden
    ],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
};

const editar = (req, res) => {
  const id = req.params.id;
  const {
    idPaciente,
    fechaTurno,
    numOrden,
  } = req.body;
  

  db.query(
    `UPDATE turnos SET id_Turnos = ${idPaciente},
                          fechaTurno = "${fechaTurno}", 
                          numOrden = ${numOrden}
                          WHERE id_Turnos= ${id}`,


    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
};

const eliminar = (req, res) => {
  
  const  id = req.params.id;

  db.query("DELETE FROM turnos WHERE id_Turnos = "+ id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
};

module.exports = { mostrar, mostrarUno, registrar, editar, eliminar };
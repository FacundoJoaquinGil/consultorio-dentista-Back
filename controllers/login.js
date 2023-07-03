const { db } = require("../db.js");

const mostrar = (req, res) => {
  db.query("SELECT * FROM login;", (err, result) => {
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
    `SELECT * FROM login WHERE id_User = ${id}`,
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

  const usuario = req.body.nombre;
  const contraseña = req.body.apellido;

  db.query(
    "INSERT INTO login (usuario, contraseña) values(?,?)",
    [
      usuario,
      contraseña
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
  const id_User = req.params.id;
  const {
    usuario,
    contraseña,
  } = req.body;

  db.query(
    `UPDATE login SET usuario = ${usuario},
                          contraseña = ${contraseña}`,
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
  
  const  id_User = req.params.id;

  db.query("DELETE FROM login WHERE id_User = "+ id_User, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
};

module.exports = { mostrar, mostrarUno, registrar, editar, eliminar };

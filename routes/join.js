const { Router }= require('express')
const router = Router();
const {innerjoin, innerjoin2, innerjoin3} = require ("../controllers/join");


//     ---- Creamos las rutas ----     //

router.get("/",innerjoin)
router.get("/join",innerjoin2)
router.get("/join3",innerjoin3)
// router.put("/editar/:id",editar)
// router.delete("/eliminar/:id",eliminar)


module.exports=router;
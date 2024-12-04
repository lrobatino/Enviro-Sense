var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.post("/cadastrarInfoFabrica", function (req, res) {
    dashboardController.cadastrarInfoFabrica(req, res);
})

router.post("/cadastrarInfoEndereco", function (req, res) {
    dashboardController.cadastrarInfoEndereco(req, res);
})

module.exports = router;
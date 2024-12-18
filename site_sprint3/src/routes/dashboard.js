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

router.get("/calcularMediaDia", function (req, res) {
    dashboardController.calcularMediaDia(req, res);
})

router.get("/calcularMediaSemana", function (req, res) {
    dashboardController.calcularMediaDia(req, res);
})

router.get("/captarCOV", function (req, res) {
    dashboardController.captarCOV(req, res);
})

router.post("/cadastrarAlerta", (req, res) => {
    dashboardController.cadastrarAlerta(req, res);
});

router.get("/puxarAlertas", (req, res) => {
    dashboardController.puxarAlertas(req, res);
});

router.get("/contarAlertas", (req, res) => {
    dashboardController.contarAlertas(req, res);
});

module.exports = router;
var database = require("../database/config");

function listar() {
  var instrucaoSql = `SELECT idFabrica, nome, codAtivacao FROM fabrica`;

  return database.executar(instrucaoSql);
}

module.exports = { listar };

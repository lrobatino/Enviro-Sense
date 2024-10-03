function calcularMonitoramentoCOV() {

    const volumeTintasMes = Number(input_tinta.value);
    const COV = 0.42;                                                     // Estimando uma emissão de 0.42 g/m² de COV da tinta
    const volumePrimerMes = Number(input_primer.value);
    const qtdCarroceriasMes = Number(input_num_carroceria.value);
    const areaCarroceria = Number(input_area_carroceria.value);                                             
    const solventeTinta = (1 / 3) * volumeTintasMes * 0.825        // Diluição de tinta que costuma ser 3:1
    const solventePrimer = (1 / 5) * volumePrimerMes * 0.825       // Diluição de primer que costuma ser 5:1
    const ano = document.querySelector('input[name="ano"]:checked').value;
    var limiteEmissoesCOV = 0

    if (ano === 'antes_2007') {
        if (tipo_de_veiculo.value == 'carro')
            limiteEmissoesCOV = 60;
        else if (tipo_de_veiculo.value == 'caminhao')
            limiteEmissoesCOV = 90;
        else if (tipo_de_veiculo.value == 'onibus')
            limiteEmissoesCOV = 225;
    } else {
        if (tipo_de_veiculo.value == 'carro')
            limiteEmissoesCOV = 45;
        else if (tipo_de_veiculo.value == 'caminhao')
            limiteEmissoesCOV = 70;
        else if (tipo_de_veiculo.value == 'onibus')
            limiteEmissoesCOV = 150;
    }

    /*
    Cálculo de emissão de VOC
    VE = 1000 * [(VC1 * COV1) + (VC2 * COV2) + Solv1 + Solv2 - (RSA + RSB)] / [(B1 * S1) + (B2 * S2)]
    */
    const VE = 1000 * [(volumeTintasMes * COV) + (volumePrimerMes * COV) + solventeTinta + solventePrimer] / (qtdCarroceriasMes * areaCarroceria);

    document.querySelector('.dados').classList.add('hidden');
    document.getElementById('resultados').classList.remove('hidden');
    resultados.innerHTML = `     
    <br>A emissão de COV é <strong>${VE.toFixed(2)} g/m²</strong>, ignorando métodos de controle de COVs!
     <table border="1">
            <tr>
                <th>Atividade</th>
                <th>Instalações licenciadas antes de 2007</th>
                <th>Instalações licenciadas a partir de 2007</th>
            </tr>
            <tr>
                <td>Automóveis</td>
                <td>Menor que 60 g/m²</td>
                <td>15 a 45 g/m²</td>
            </tr>
            <tr>
                <td>Cabine de caminhões, carrocerias de veículos
                    utilitários, pick-up e caminhonete</td>
                <td>90 g/m²</td>
                <td>70 g/m²</td>
            </tr>
            <tr>
                <td>Ônibus, Trator e veículos agrícolas e/ou utilizados
                    na construção civil</td>
                <td>225 g/m²</td>
                <td>150 g/m²</td>
            </tr>
        </table>
        <br>
        `;

    if (VE > limiteEmissoesCOV)
            resultados.innerHTML += `Segundo a tabela apresentada acima, as emissões de COV estão acima do limite estabelecido
             pela CETESB de <strong>${limiteEmissoesCOV.toFixed(2)}g/m².</strong> Você estará sujeito a tomar uma multa e a <strong>perder</strong> a licença de operação da fábrica, 
             tendo o seu fechamento!<br>
             <p class="msg">Quer garantir um monitoramento eficiente da sua fábrica?</p>
             <div class="opcao">
                <a href="home.html" >Clique aqui e conheça a EnviroSense</a>
             </div>`
    else
        resultados.innerHTML += `Segundo a tabela apresentada acima, as emissões de COV estão dentro do acordo estabelecido
             pela lei que são <strong>${limiteEmissoesCOV.toFixed(2)}g/m².</strong>! 
             <br> Parabéns, sua empresa está contribuindo com um ambiente <strong>mais colorido e sustentável</strong>!
             <p class="msg">Quer garantir um monitoramento eficiente da sua fábrica?</p>
             <div class="opcao">
                <a href="home.html">Clique aqui e conheça a EnviroSense</a>
             </div>` 
}   



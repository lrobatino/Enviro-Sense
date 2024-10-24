# Enviro Sense

<p>Este será o repositório do nosso grupo de PI focado no uso do sensor de gás MQ-2 para o monitoramento dos gases poluentes COV.</p>

# Código
```
const int PINO_SENSOR_MQ2 = A2; //Porta analógica de entrada de dados

//Variaveis para arredondamento onde a parte máxima é 1000 e a mínima 100
const int VALOR_MINIMO = 100; 
const int VALOR_MAXIMO = 1000; 

void setup() {
  Serial.begin(9600); //Inicializar o monitor serial
}

void loop() { //Rodar o código em looping para coleta de dados constante
  int valorSensor = analogRead(PINO_SENSOR_MQ2);  //Variavel da leitura dos dados recebidos pelo sensor

  float porcentagem = ((float)(valorSensor - VALOR_MINIMO) / (VALOR_MAXIMO - VALOR_MINIMO)) * 100;  //Conversão para porcentagem

  if(porcentagem < 0){    //Condicional para validar que a porcentagem ficaria entre 0 e 100
    porcentagem = 0;
  } else if(porcentagem > 100){
    porcentagem = 100;
  }

  //Serial.print("Valor de Saída do Sensor: ");   //Saída de dados para o usuário
  //Serial.print(valorSensor);
  Serial.print("Limite_Máximo:");
  Serial.println(45);
  Serial.print("Porcentagem:");
  Serial.println(porcentagem);
  //Serial.println("%");

  delay(1000);  //Atraso de 1 segundo antes de executar o código novamente
}
```

# Trello
<p>Para organização de nosso projeto seguimos a seguinte sistemática no aplicativo Trello.</p>

link: https://trello.com/b/Nfg4aBY8/projeto-pi

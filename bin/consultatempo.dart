import 'dart:convert';
import 'package:intl/intl.dart' as intl;
import 'package:http/http.dart' as http;

Future main() async {
  final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=-22.2138900&lon=-49.9458300&appid=bc08ab07070054a72df94b5ea5db3a4e&lang=pt_br');
  final response = await http.get(url);

  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {  
    //print('Temperatura: ${data['main']['temp']}');
    //print('Data: ${data['dt']}');
    //print('Tempo: ${data['weather'][0]['description']}');
    //print('Cidade: ${data['name']}');
    print("Temperatura de ${kelvinToCelsius(data["main"]["temp"])}°C " 
          "em ${data["name"]} "
          "no dia ${ timestampUnixTodataHora(data["dt"])}"
    );
  } else {
  print('Erro ao fazer requisição: $data');}
}

 String kelvinToCelsius(double tempKelvin) {
     double tempCelsius = tempKelvin - 273.75;
    return tempCelsius.toStringAsPrecision(4);
    }

  String timestampUnixTodataHora(int timestamp){
    DateTime data = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    final formatoSaida = intl.DateFormat("dd/MM/yyyy HH:mm");
    DateTime dataLocal = data.toLocal();
    return formatoSaida.format(dataLocal);
  }


  
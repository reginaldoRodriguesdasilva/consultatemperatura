import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=-22.2138900&lon=-49.9458300&appid=bc08ab07070054a72df94b5ea5db3a4e&lang=pt_br');
  final response = await http.get(url);
  var dateTime = DateTime.now();
  final data = jsonDecode(response.body);

  
  if (response.statusCode == 200) {
    
    print('Tempo: ${data['main']['temp']}');
    print('Data: ${data['dt']}');
    print('Tempo: ${data['weather'][0]['description']}');
    print('Nome: ${data['name']}');
  }
}

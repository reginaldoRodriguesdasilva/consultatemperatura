import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
      .then((response) {
    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      print("Usuario: ${data[0]['userId']}");

      for (int i = 0; i < data.length; i++) {
        print("${i+1}° ITEM");

        print("\tCódigo: ${data[i]['id']}");
        print("\tTitulo: ${data[i]['title']}");
        print("\tCorpo: ${data[i]['body']}");

        //print("Código: ${data[i]['id']}");
        //print("Titulo: ${data[i]['title']}");
        //print("Corpo: ${data[i]['body']}");
      }
      print("<-------------------------------- Outro Jeito ----------------------------->");

      for(final item in data){
        print("Código: ${item['id']}");
        print("\tTitulo: ${item['title']}");
        print("\tCorpo: ${item['body']}");
      }
      //print("Usuario: ${data[1]['userId']}");
      //print("Código: ${data[1]['Id']}");
      //print("Titulo: ${data[1]['title']}");
      //print("Corpo: ${data[1]['body']}");
    } else {
      print('Erro ao fazer requisição: ${response.statusCode}');
    }
  });
}

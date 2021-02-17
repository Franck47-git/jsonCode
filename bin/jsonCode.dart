import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> arguments) async {
  await getUsersInfo(id: 2); 
}

Future getUsersInfo({id =1}) async {
  
  try {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    var body_result = json.decode(response.body);
    if (response.statusCode == 200) {
      for (var i = 0; i < body_result.length; i++) {
        if (body_result[i]['id'] == id) {
          print('=======================ID= 2=======================');
          print(
              'je m\'appelle ${body_result[i]['name']} dit ${body_result[i]['username']} mon email est le suivant: ${body_result[i]['email']}');
              print('%%%%%%%%%%%%%%%%%%%%%%');
          print(
              'Vous pouvez me trouver à la rue : ${body_result[i]['address']['street']}, suite: ${body_result[i]['address']['suite']}, ville : ${body_result[i]['address']['city']}, au numéro: ${body_result[i]['phone']},Longitude:${body_result[i]['address']['geo']['lng']},');
              print('%%%%%%%%%%%%%%%%%%%%%%');
          print(
              'Ma compagnie est ${body_result[i]['company']['name']} ${body_result[i]['company']['catchPhrase']}');
           print('=======================FIN=======================');
        }
      }
      
    }
  } catch (e) {
    print('Page not found try again $e');
  }
}

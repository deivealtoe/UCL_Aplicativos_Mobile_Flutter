import 'package:http/http.dart' as http;

var baseUrl = Uri.https( 'http://jsonplaceholder.typicode.com', '/users/');

class Api {

  static Future getUsers() async{

    var url = baseUrl ;
    return await http.get(url);
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class API{
  static Future<List<dynamic>>fetchApi() async {
    Uri path=Uri.parse('https://fakestoreapi.com/products');
    var response=await http.get(path);
    var decodeResponse=jsonDecode(response.body) as List<dynamic>;
    return decodeResponse;
  }
}
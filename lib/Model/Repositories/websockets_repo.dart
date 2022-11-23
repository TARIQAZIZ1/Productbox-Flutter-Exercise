import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productbox_flutter_exercise/Model/Models/websocketsmodel.dart';
class WebSocektsRepo{

  static Future<Album> fetchAlbum() async {
    final response =
    await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      print('Apis response is :: ${response.body}');
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Loading album failed!');
    }
  }
  static Future<Album> updateAlbum(String title) async {
    final http.Response response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      print('Apis response is :: ${response.body}');
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update the album!');
    }
  }
}
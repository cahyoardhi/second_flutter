import 'dart:convert';

import 'package:app_movies/model/popular_movies.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider{  //Class harus diawali huruf besar
  String apiKey = '468777bd773b70a34288a328b3a48fdd';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response = await client.get('$baseUrl/movie/popular?api_key=$apiKey');

    if(response.statusCode==200){
      
      return PopularMovies.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception(response.statusCode);
    }
  }
}
import 'package:http/http.dart' show Client;

class ApiProvider {
  String apiKey = 'c5a4452c0e67d0999d0bc5c65d8ba011';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();
}

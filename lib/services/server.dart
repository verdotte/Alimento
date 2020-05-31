import 'package:http/http.dart' as http;

class Server {
  final http.Client _client = http.Client();
  get connect => this._client;
  get disconnect => this._client.close();
}

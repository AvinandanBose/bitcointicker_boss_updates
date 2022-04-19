import 'package:http/http.dart' as http;
import 'dart:convert';

class get_data {
  String? baseCountry;
  String? convCountry;
  double? rate;
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/RUB?apikey=2146A327-B80C-4FE1-9D2C-922AB01185A2'));
    String data = response.body;
    dynamic decodeData = jsonDecode(data);

    baseCountry = decodeData['asset_id_base'];
    convCountry = decodeData['asset_id_quote'];
    rate = decodeData['rate'];
    print(baseCountry);
    print(convCountry);
    print(rate);
  }
}

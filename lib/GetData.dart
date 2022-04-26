import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants_url.dart';
import 'coin_data.dart';
class FetchData {
  dynamic rate;
  Future<dynamic> getData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
          Uri.parse('$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey'));
      try {
        if (response.statusCode == 200) {
          String data = response.body;
          dynamic decodeData = jsonDecode(data);
          rate = decodeData['rate'];
          cryptoPrices[crypto] = rate.toStringAsFixed(2);
        }
      } catch (e) {
        print(response.statusCode);
        print(e);
        rethrow;
      }
    }
    print(cryptoPrices);
    return cryptoPrices;
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../key/apikey.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(selectedCurrency) async {

    Map<String, String> cryptos ={} ;

    for(String crypto in cryptoList){
      Uri uri = Uri.parse(
          'https://api-realtime.exrates.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency');
      http.Response res = await http.get(uri,
          headers: {
            'X-CoinAPI-Key': '$apiKey'
          });
      String data = '';
      if (res.statusCode == 200) {
        String data = res.body;
        var ans = jsonDecode(data);
        var rate = ans['rate'];
        double rates = rate;
        cryptos[crypto]=rates.toStringAsFixed(0);
      } else {
        return 0.0;
      }
    }
    return cryptos;
  }
}

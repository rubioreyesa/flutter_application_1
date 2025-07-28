import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getStockQuote(String symbol) async {
  final url = Uri.parse("https://yahoo-finance15.p.rapidapi.com/api/yahoo/qu/quote/$symbol");
  //ignore: avoid_print
  print('here');
  final response = await http.get(
    url,
    headers: {
      "X-RapidAPI-Key": "ac2504ebeemshb6a7abc378c09b5p1b1c82jsn8331af39de64",
      "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // ignore: avoid_print
    print("Stock Price for $symbol: $data");
  } else {
    // ignore: avoid_print
    print("Failed to fetch data: ${response.statusCode}");
  }
}

void main() {
  getStockQuote("AAPL");
}

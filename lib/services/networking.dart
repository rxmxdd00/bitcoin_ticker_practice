import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String? url;

  NetworkHelper(this.url);

  Future getData() async {
    var convertedUrl = Uri.parse(url!);
    http.Response response = await http.get(convertedUrl);

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // var lastPrice = data[crypto][0];
        // print('lastPrice : $lastPrice');
        return data;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data from the API: $e');
    }
  }
}

import 'networking.dart';
import 'package:bitcoin_ticker_tutorial/utilities/coins_data.dart';

// const apiKey = '0394718E-B30B-4F8F-AFBB-70DCF9CB1A09';
// const coinsUrl = 'https://rest.coinapi.io/v1/exchangerate/';

const coinGeckoApiURL = 'https://api.coingecko.com/api/v3/simple/price';

class CoinsModel {
  Future getCoinsRate(String crypto, String currency) async {
    // NetworkHelper networkHelper =
    //     NetworkHelper('$coinGeckoApiURL?ids=$crypto&vs_currencies=$currency');
    // Map<String, dynamic>? coinsData = await networkHelper.getData();
    // print('coinsData: $coinsData');
    // if (coinsData != null) {
    //   var lastPrice = coinsData[crypto][currency.toLowerCase()];
    //   print('lastPrice: $lastPrice');
    // }
    Map<String, dynamic> cryptoPrices = {};
    for (String crypto in cryptoList) {
      NetworkHelper networkHelper =
          NetworkHelper('$coinGeckoApiURL?ids=$crypto&vs_currencies=$currency');
      Map<String, dynamic>? coinsData = await networkHelper.getData();
      if (coinsData != null) {
        var lastPrice = coinsData[crypto][currency.toLowerCase()];
        cryptoPrices[crypto] = lastPrice;
      }
    }
    print(cryptoPrices);

    return cryptoPrices;
  }
}

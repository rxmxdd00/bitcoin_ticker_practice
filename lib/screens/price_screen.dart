import 'package:bitcoin_ticker_tutorial/services/coins.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_tutorial/utilities/coins_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' as io;
import 'package:bitcoin_ticker_tutorial/components/resusable_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'AUD';
  CoinsModel coinsModel = CoinsModel();

  Map<String, dynamic> coinValues = {};
  bool isWaiting = false;

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>>? itemListMap =
        currenciesList.map((currency) {
      return DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
    }).toList();

    return DropdownButton<String>(
        value: selectedCurrency,
        items: itemListMap,
        onChanged: (value) async {
          setState(() {
            selectedCurrency = value;
            updateCoinsDataUI();
          });
        });
  }

  CupertinoPicker getCupertinoPicker() {
    List<Widget> menuList = [];
    for (String currency in currenciesList) {
      menuList.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        print(value);
      },
      children: menuList,
    );
  }

  List<Widget> cardList() {
    List<Widget> itemList = [];

    for (String crypto in cryptoList) {
      itemList.add(
        ReusableCard(
            coinsName: crypto,
            value: isWaiting ? '?' : coinValues[crypto].toString(),
            selectedCurrency: selectedCurrency),
      );
      // updateCoinsDataUI();
    }
    return itemList;
  }

  void updateCoinsDataUI() async {
    isWaiting = true;

    try {
      var data = await coinsModel.getCoinsRate('bitcoin', selectedCurrency!);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    updateCoinsDataUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cardList(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                io.Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}

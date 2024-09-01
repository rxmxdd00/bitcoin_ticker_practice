import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_tutorial/utilities/constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      required this.value,
      required this.selectedCurrency,
      required this.coinsName});

  final String? value;
  final String? selectedCurrency;
  final String? coinsName;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $coinsName = $value $selectedCurrency',
          style: kButtonTitle,
        ),
      ),
    );
  }
}

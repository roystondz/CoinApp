import 'package:flutter/material.dart';
import 'coin.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'USD';
  String? coinBTCValue;
  String? coinETHValue;
  String? coinLTCValue;
  List<DropdownMenuItem> dropDownMenuItems() {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropDownMenuItems.add(newItem);
    }

    return dropDownMenuItems;
  }

  void getData(selectedCurrency) async {
    try {
      Map<String, String> rate = await coinData.getCoinData(selectedCurrency);
      setState(() {
        coinBTCValue = rate['BTC'];
        coinETHValue = rate['ETH'];
        coinLTCValue = rate['LTC'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    dropDownMenuItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coin Today',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: Text(
                    '1 BTC =  ${coinBTCValue} ${selectedCurrency}',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: Text(
                    '1 ETH =  ${coinETHValue} ${selectedCurrency}',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: Text(
                    '1 LTC =  ${coinLTCValue} ${selectedCurrency}',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300.0,
          ),
          Container(
            height: 170,
            color: Colors.lightBlueAccent.shade700,
            alignment: Alignment.center,
            child: DropdownButton(
              items: dropDownMenuItems(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                  getData(selectedCurrency);
                });
              },
              value: selectedCurrency,
              focusColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

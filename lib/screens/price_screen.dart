import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Today',
        style: TextStyle(
          color: Colors.white,

        ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: SizedBox(
                height: 70.0,
                child: Center(
                  child: Text('1 BTC =  10 USD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0
                  ),),
                ),
              ),
            ),
          ),

          Container(
            height: 170,
            color: Colors.lightBlueAccent.shade700,
            child: null,
            alignment: Alignment.center,
          )

        ],
      ),
    );
  }
}

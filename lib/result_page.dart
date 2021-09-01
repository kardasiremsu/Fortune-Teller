import 'package:flutter/material.dart';
import 'package:life_expectancy/calculate.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sonuç sayfası')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  'Beklenen yaşam süresi',
                  style: kMetinStili,
                ),
              )),
          Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  Hesap(_userData).calculate().round().toString(),
                  style: kMetinStili,
                ),
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  child: Text('GERİ DÖN'))),
        ],
      ),
    );
  }
}

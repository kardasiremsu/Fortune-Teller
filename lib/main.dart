import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'constants.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlue[300],
          //accentColor: Colors.pink, (buton)
          scaffoldBackgroundColor: Colors.lightBlue[300]),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: <Widget>[
                  Text(
                    'Haftada kaç gün spor yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(
                    sporGunu.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                      divisions: 7,
                      min: 0,
                      max: 7,
                      value: sporGunu,
                      onChanged: (double newValue) {
                        setState(() {
                          sporGunu = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde kaç sigara içiyorsunuz?',
                    style: kMetinStili,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    value: icilenSigara,
                    divisions: 30,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                      },
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.grey.shade200
                          : Colors.white,
                      child: IconCinsiyet(
                          cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus)),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.grey.shade200
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              boy: boy,
                              kilo: kilo,
                              seciliCinsiyet: seciliCinsiyet,
                              sporGunu: sporGunu,
                              icilenSigara: icilenSigara))));
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinStili,
                )),
          )
        ],
      ),
      /*floatingActionButton: Theme(
        data: ThemeData(accentColor: Theme.of(context).primaryColor),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),*/
    );
  }

  Row buildRowOutlineButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              text,
              style: kMetinStili,
            )),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        SizedBox(
          width: 20,
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                highlightColor: Colors.lightBlue,
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus, size: 10),
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                highlightColor: Colors.lightBlue,
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesomeIcons.minus, size: 10),
              ),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  IconCinsiyet(
      {this.cinsiyet = 'DEFAULT', this.icon = FontAwesomeIcons.addressBook});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50, color: Colors.black54),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        )
      ],
    );
  }
}

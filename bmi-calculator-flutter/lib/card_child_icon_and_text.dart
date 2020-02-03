import 'package:flutter/material.dart';
import 'constants.dart';

class CardChildIconAndText extends StatelessWidget {
  final String cardTextString;

  final IconData fontAwesomeIconData;

  CardChildIconAndText(
      {@required this.cardTextString, @required this.fontAwesomeIconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwesomeIconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardTextString,
          style: kIconStringTextStyle,
        ),
      ],
    );
  }
}

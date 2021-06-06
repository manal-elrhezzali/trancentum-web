import 'package:flutter/material.dart';

import '../../../constants.dart';

class ShowOrReduceButton extends StatelessWidget {
  const ShowOrReduceButton({
    Key key,
    @required this.pressHandler,
    @required this.showAll,
  }) : super(key: key);
  final Function pressHandler;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      width: double.infinity,
      color: bgColor,
      child: FlatButton(
        onPressed: pressHandler,
        child: Text(
          showAll ? "REDUIRE" : "TOUT AFFICHER",
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
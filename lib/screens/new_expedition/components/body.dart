import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive_widget.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Text("I am expediteur Container"),
                        width: double.infinity,
                        height: 500,
                        color: greyColor,
                      ),
                      SizedBox(height: defaultPadding),
                      Container(
                        child: Text("I am retours de fonds Container"),
                        width: double.infinity,
                        height: 500,
                        color: redColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Text("I am destinataire Container"),
                        width: double.infinity,
                        height: 500,
                        color: greenColor,
                      ),
                      SizedBox(height: defaultPadding),
                      Container(
                        child: Text("I am reglement Container"),
                        width: double.infinity,
                        height: 500,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultPadding * 2),
            Container(
              padding: EdgeInsets.all(defaultPadding / 2),
              width: double.infinity,
              color: bgColor,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "CONTINUER",
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

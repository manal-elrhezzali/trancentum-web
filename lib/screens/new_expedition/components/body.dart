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
        child: ResponsiveWidget(
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // something will go here
                  ],
                ),
              ),
              SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                  children: [
                    // something will go here
                  ],
                ),
              ),
            ],
          ),
          mobile: Container(
            //mobile
            child: Text("OOps i am mobile design"),
          ),
        ),
      ),
    );
  }
}

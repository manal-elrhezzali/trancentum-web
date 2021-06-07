import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'section_title.dart';
import 'show_or_Reduce_button.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({
    Key key,
    @required this.pressHandler,
    @required this.showAll,
  }) : super(key: key);
  final Function pressHandler;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Notifications"),
          SizedBox(height: defaultPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: showAll ? 6 : 3,
            itemBuilder: (context, index) {
              return Card(
                color: bgColor,
                elevation: 0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(defaultPadding),
                  leading: Icon(
                    Icons.notification_important_outlined,
                    color: kSecondaryColor,
                  ),
                  title: Text(
                    "I am a notification notification notification notification",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      //TODO: show a dialog(with blur background) when user clicks on notification trash icon
                      // return new BackdropFilter(
                      //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      //     child: Dialog(
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      //       backgroundColor: Color(ColorResources.BLACK_ALPHA_65),
                      //       child: _dialogContent(),
                      //     )
                      // );
                      //Widget _dialogContent() {}
                    },
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: redColor,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: defaultPadding),
          //tout afficher button
          ShowOrReduceButton(
            pressHandler: pressHandler,
            showAll: showAll,
          ),
        ],
      ),
    );
  }
}

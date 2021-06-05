import 'package:flutter/material.dart';
import 'package:trancentum_web_app/models/expedition.dart';

import '../../../constants.dart';
import 'recent_expedition_card.dart';

class RecentExpeditionCardGridView extends StatelessWidget {
  const RecentExpeditionCardGridView({
    Key key,
    @required this.demoRecentExpeditions,
    @required this.crossAxisCount,
    @required this.childAspectRatio,
    @required this.tapHandler,
  }) : super(key: key);

  final List<Expedition> demoRecentExpeditions;
  final int crossAxisCount;
  final double childAspectRatio;
  final Function tapHandler;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      itemCount: (demoRecentExpeditions.length / 2).toInt(), //dummy data
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: 0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => RecentExpeditionCard(
        info: demoRecentExpeditions[index],
        myRecentExpedtions: demoRecentExpeditions,
        tapHandler: tapHandler,
      ),
    );
  }
}
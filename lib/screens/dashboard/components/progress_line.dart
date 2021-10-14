import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/package_status_info.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key key,
    @required this.info,
    @required this.myPackages,
  }) : super(key: key);

  final PackagesStatusInfo info;
  final List<PackagesStatusInfo> myPackages;

  @override
  Widget build(BuildContext context) {
    final expeditionsData = Provider.of<Expeditions>(context, listen: true);
    final nbrOfExpeditions = expeditionsData.itemCount;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: info.color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth *
                expeditionsData.calculatePercentageOfExpeditionsPerStatus(
                        nbrOfExpeditions, info.nbrOfPackages),
            height: 5,
            decoration: BoxDecoration(
              color: info.color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

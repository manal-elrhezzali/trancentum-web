import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';
import 'package:trancentum_web_app/screens/dashboard/components/header.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'all_packages_status.dart';
import 'expeditions_etat_brouillon_datatable.dart';
import 'my_shipments.dart';
import 'recent_expeditions_array.dart';

class DashboardContent extends StatefulWidget {
  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  List<Expedition> _expeditions;
  int _expeditionEnregistreeCount;
  int _expeditionRecueCount;
  int _expeditionChargeeCount;
  int _expeditionLivreeCount;
  int _expeditionRetourCount;
  int _expeditionClotureeCount;

  var _isInit = true;
  var _isLoading = false;

void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("An error occurred!"),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }
  //runs when the widget is created and a more couple of times
  @override
  void didChangeDependencies() {
    //checks if we are running
    //didChangeDependencies dor the first time
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        Provider.of<Expeditions>(context)
            .fetchAndSetExpeditions();
      } catch (error) {
        _showErrorDialog(error.toString());
      }
    }
     setState(() {
          _isLoading = false;
        });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final expeditionsInfo = Provider.of<Expeditions>(context, listen: true).fetchAndSetExpeditions();
    // _expeditions = expeditionsInfo.items;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : (Provider.of<Expeditions>(context, listen: false).items.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Header(),
                      SizedBox(height: defaultPadding),
                      Text(
                        "No shippments added yet!",
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          "assets/images/waiting.png",
                          fit: BoxFit.cover,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                );
              })
            : Consumer<Expeditions>(
                builder: (ctx, expeditionsData, child) {
                  // _expeditions = expeditionsData.items;
                  _expeditionEnregistreeCount =
                      expeditionsData.nbrOfExpeditionsEnregistree;
                  _expeditionRecueCount = expeditionsData.nbrOfExpeditionsRecue;
                  _expeditionChargeeCount =
                      expeditionsData.nbrOfExpeditionsChargee;
                  _expeditionLivreeCount =
                      expeditionsData.nbrOfExpeditionsLivree;
                  _expeditionRetourCount =
                      expeditionsData.nbrOfExpeditionsRetour;
                  _expeditionClotureeCount =
                      expeditionsData.nbrOfExpeditionsCloturee;
                  return SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          Header(),
                          SizedBox(height: defaultPadding),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    MyShipments(
                                      expeditionChargeeCount:
                                          _expeditionChargeeCount,
                                      expeditionClotureeCount:
                                          _expeditionClotureeCount,
                                      expeditionEnregistreeCount:
                                          _expeditionEnregistreeCount,
                                      expeditionLivreeCount:
                                          _expeditionLivreeCount,
                                      expeditionRecueCount:
                                          _expeditionRecueCount,
                                      expeditionRetourCount:
                                          _expeditionRetourCount,
                                    ),
                                    SizedBox(height: defaultPadding),
                                    BrouillonExpeditionsArray(),
                                    SizedBox(height: defaultPadding),
                                    child,
                                    if (Responsive.isMobile(context))
                                      SizedBox(height: defaultPadding),
                                  ],
                                ),
                              ),

                              if (!Responsive.isMobile(context))
                                SizedBox(width: defaultPadding),
                              if (!Responsive.isMobile(context) &&
                                  (_expeditionChargeeCount > 0) &&
                                  (_expeditionClotureeCount > 0) &&
                                  (_expeditionEnregistreeCount > 0) &&
                                  (_expeditionLivreeCount > 0) &&
                                  (_expeditionRecueCount > 0) &&
                                  (_expeditionRetourCount > 0))
                                Expanded(
                                  flex: 2,
                                  child: AllPackagesStatus(
                                    expeditionChargeeCount:
                                        _expeditionChargeeCount,
                                    expeditionClotureeCount:
                                        _expeditionClotureeCount,
                                    expeditionEnregistreeCount:
                                        _expeditionEnregistreeCount,
                                    expeditionLivreeCount:
                                        _expeditionLivreeCount,
                                    expeditionRecueCount: _expeditionRecueCount,
                                    expeditionRetourCount:
                                        _expeditionRetourCount,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: RecentExpeditionsArray(),
              ));
  }
}

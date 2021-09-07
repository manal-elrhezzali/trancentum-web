import 'package:flutter/material.dart';

import 'package:trancentum_web_app/models/package_status_info.dart';
import 'package:trancentum_web_app/responsive.dart';
import 'package:trancentum_web_app/screens/new_expedition/new_expedition_screen.dart';

import '../../../../constants.dart';
import 'header_package_info_card.dart';

class MyShipments extends StatelessWidget{
  final int expeditionEnregistreeCount;
  final int expeditionChargeeCount;
  final int expeditionRecueCount;
  final int expeditionLivreeCount;
  final int expeditionRetourCount;
  final int expeditionClotureeCount; 
    
  MyShipments({@required this.expeditionEnregistreeCount, @required this.expeditionChargeeCount , @required this.expeditionClotureeCount , @required this.expeditionLivreeCount, @required this.expeditionRecueCount , @required this.expeditionRetourCount,});
  
  @override
  Widget build(BuildContext context) {
    
    
    List<PackagesStatusInfo> myPackages = [
    PackagesStatusInfo(
      title: "Enregistrée",
      numOfPackages: expeditionEnregistreeCount,
      color: primaryColor,
    ),
    PackagesStatusInfo(
      title: "Chargée",
      numOfPackages: expeditionChargeeCount,
      color: kPrimaryColor,
    ),
    PackagesStatusInfo(
      title: "Reçue",
      numOfPackages: expeditionRecueCount,
      color: Colors.green,
    ),
    PackagesStatusInfo(
      title: "Livrée",
      numOfPackages: expeditionLivreeCount,
      color: Colors.brown,
    ),
    PackagesStatusInfo(
      title: "Retour",
      numOfPackages: expeditionRetourCount,
      color: Colors.red,
    ),
    PackagesStatusInfo(
      title: "Clôturée",
      numOfPackages: expeditionClotureeCount,
      color: Colors.orange,
    ),
  ];
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mes Expéditions",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            if (_size.width > 390)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(NewExpeditionScreen.routeName);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding /
                        (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                icon: Icon(Icons.add),
                label: Text("Nouvelle Expédition"),
              ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: PackageStatusInfoCardGridView(
            myPackages: myPackages,
            crossAxisCount: _size.width < 650 ? 3 : 6,
            childAspectRatio: _size.width < 650 ? 0.8 : 0.6,
          ),
          tablet: PackageStatusInfoCardGridView(
            myPackages: myPackages,
          ),
          desktop: PackageStatusInfoCardGridView(
            myPackages: myPackages,
            childAspectRatio: _size.width < 1400 ? 0.7 : 0.9,
          ),
        ),
      ],
    );
  }
}

class PackageStatusInfoCardGridView extends StatelessWidget {
  const PackageStatusInfoCardGridView({
    Key key,
    @required this.myPackages,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final List<PackagesStatusInfo> myPackages;

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: myPackages.length, 
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => HeaderPackageInfoCard(
        info: myPackages[index],
        myPackages: myPackages,
      ),
    );
  }
}


  


 
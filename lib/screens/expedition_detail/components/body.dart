import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/models/http_exception.dart';
import 'package:trancentum_web_app/services/expeditions.dart';

import '../../../constants.dart';
import 'expediteur_destinataire_datatable.dart';
import 'infos_generales_datatable.dart';
import 'reglement_datatable.dart';
import 'retour_fonds_datatable.dart';

class Body extends StatefulWidget {
  final Expedition searchedExpedition;

  Body({@required this.searchedExpedition});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  Future<void> _onTapHandler() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Provider.of<Expeditions>(context, listen: false)
          .deleteExpedition(widget.searchedExpedition.codeExpedition);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/');
    } on HttpException catch (error) {
      var errorMessage = 'Could not delete The expedition';
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = "Something went wrong. Please try again later.";
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget buildDataTable(String title, Widget widget) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: redColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: widget,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          // SizedBox(height: defaultPadding),
          buildDataTable(
              "Informations Générales",
              InfoGeneraleDatatable(
                expeditionTrouvee: widget.searchedExpedition,
              )),
          SizedBox(height: defaultPadding),
          buildDataTable(
              "Expediteur / Destinataire",
              ExpediteurDestinataireDatatable(
                expeditionTrouvee: widget.searchedExpedition,
              )),
          SizedBox(height: defaultPadding),
          buildDataTable(
              "Retours de fonds",
              RetourFondsDatatable(
                  expeditionTrouvee: widget.searchedExpedition)),
          SizedBox(height: defaultPadding),
          buildDataTable("Règlements",
              ReglementDatatable(expeditionTrouvee: widget.searchedExpedition)),
          SizedBox(height: defaultPadding * 2),
          if (widget.searchedExpedition.etat == "Brouillon")
            if (_isLoading)
              CircularProgressIndicator()
            else
              Container(
                padding: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                color: redColor,
                child: FlatButton(
                  onPressed: () {
                    _onTapHandler();
                  },
                  child: Text(
                    "Supprimer",
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trancentum_web_app/screens/expedition_detail/expedition_detail_screen.dart';

import '../../../constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  	
final _formKey = GlobalKey<FormState>();

  String searchFieldValue = "";
  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    /////remove these prints
    print(searchFieldValue);

    Navigator.of(context).pushNamed(ExpeditionDetailScreen.routeName,
        arguments: searchFieldValue);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        onSaved: (newValue) => searchFieldValue = newValue,
        validator: (value) {
          if (value.isEmpty) {
            return "Please provide an expedition code";
          }
          return null; //means there is no error
        },
        decoration: InputDecoration(
          hintText: "Code d\'expédition",
          fillColor: bgColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: _saveForm,
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
          ),
        ),
      ),
    );
  }
}

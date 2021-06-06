import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool rememberMeIsChecked = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    var underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: bgColor,
      ),
    );
    return Container(
      width: 500,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: whiteColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: darkBgColor,
              border: underlineInputBorder,
              focusedBorder: underlineInputBorder,
              labelText: "ICE",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(color: whiteColor),
              // suffixIcon: Icon(
              //   Icons.verified_sharp,
              //   color: greenColor,  //redColor if input not valid,
              // ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 20,
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          TextFormField(
            style: TextStyle(color: whiteColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: darkBgColor,
              border: underlineInputBorder,
              focusedBorder: underlineInputBorder,
              labelText: "Mot de passe",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(color: whiteColor),
              suffixIcon: Icon(
                Icons.visibility_off,
                color: redColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 44,
                vertical: 20,
              ),
            ),
          ),
          SizedBox(height: 2 * defaultPadding),
          Row(
            children: [
              Checkbox(
                shape: CircleBorder(),
                value: rememberMeIsChecked,
                activeColor: redColor,
                onChanged: (value) {
                  setState(() {
                    rememberMeIsChecked = value;
                  });
                },
              ),
              SizedBox(width: 10),
              Text(
                "Mémoriser",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              if (_size.width >= 350)
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: redColor,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 2 * defaultPadding),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: redColor,
              child: Text(
                "Se connecter",
                style: TextStyle(
                  fontSize: 16,
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (_size.width < 350) SizedBox(height: defaultPadding),
          if (_size.width < 350)
            InkWell(
              onTap: () {},
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: redColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../responsive_widget.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2 * defaultPadding),
      child: ResponsiveWidget(
        mobile: Container(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo_trancentum_without_bg.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: defaultPadding * 3),
                SignInForm(),
                Spacer(),
              ],
            ),
          ),
        ),
        desktop: Column(
          children: [
            Header(),
            Spacer(),
            SignInForm(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

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
            style: TextStyle(color: Colors.white),
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
            style: TextStyle(color: Colors.white),
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
                  color: Colors.white,
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

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo_trancentum_without_bg.png",
          width: 150,
          height: 150,
        ),
        SizedBox(width: 2 * defaultPadding),
        Text(
          "Se connecter à TranCENTUM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Text(
          "Vous n'avez pas de compte ?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(width: 2 * defaultPadding),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(defaultPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            side: BorderSide(
              color: redColor,
              width: 1,
            ),
          ),
          child: Text(
            "Contactez-nous",
          ),
        ),
      ],
    );
  }
}

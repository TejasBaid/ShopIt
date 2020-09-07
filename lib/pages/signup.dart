import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:shopitapp/keys.dart';
import 'package:shopitapp/models/auth.dart';
import 'package:shopitapp/utilities/color_palette.dart';
import 'login.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var showpass = true;
  var errorMessage;
  String url = '${apiKey}api/auth/signup';
  String email;
  String password;
  Dio dio = new Dio(BaseOptions(contentType: Headers.jsonContentType,responseType: ResponseType.json,validateStatus: (_)=>true,));


  // Controllers
  final _FirstName = TextEditingController();
  final _LastName = TextEditingController();
  final _Email = TextEditingController();
  final _Password = TextEditingController();


  void signup () async{
    var name = _FirstName.text + " " + _LastName.text;
    print(url);
      Auth auth =new Auth(name: name,email: _Email.text,password: _Password.text,signupUrl: url);
      var status = await auth.Signup();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomHeader(text: "Sign up",),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      // override textfield's icon color when selected
                      primaryColor: Color(0xff809FBF),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: _FirstName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.perm_identity,
                                ),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff809FBF).withOpacity(0.6),
                                    ))),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            // override textfield's icon color when selected
                            primaryColor: Color(0xff809FBF),
                          ),
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextField(
                              controller: _LastName,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.perm_identity,
                                  ),
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff809FBF).withOpacity(0.6),
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      // override textfield's icon color when selected
                      primaryColor: Color(0xff809FBF),
                    ),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.86,
                      child: TextField(
                        controller: _Email,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_outline,
                            ),

                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff809FBF).withOpacity(0.6),
                                ))),
                      ),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      // override textfield's icon color when selected
                      primaryColor: Color(0xff809FBF),
                    ),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.86,
                      child: Stack(
                        children: <Widget>[

                          TextField(
                            controller: _Password,
                            obscureText: showpass,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff809FBF).withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (showpass == false) {
                                    showpass = true;
                                  } else {
                                    showpass = false;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                              color: Colors.black, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(text: ' Sign in',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 12),

                            )
                          ]
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: RaisedButton(
                      elevation: 0.5,
                      onPressed: () {
                        signup();
                      },
                      splashColor: Color(0xfffafafa),
                      color: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),


                ],
              ),
            ),
          ),
        ));
  }
}



class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key key,
    this.text
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 2),
          height: 17,
          width: 17,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(60)),
        ),
      ],
    );
  }
}

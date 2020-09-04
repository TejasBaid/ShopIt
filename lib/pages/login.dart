import 'package:flutter/material.dart';
import 'package:shopitapp/models/auth.dart';
import 'signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopitapp/utilities/color_palette.dart';
import 'package:shopitapp/keys.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showpass = true;
  var eyeType = FontAwesomeIcons.solidEye;
  var _Email = TextEditingController();
  var _Password = TextEditingController();
  String url = '${apiKey}api/auth/login';

  void LoginUser() async{
    Auth auth = new Auth(loginUrl: url,email: _Email.text,password: _Password.text);
    var status = await auth.Login();
    print(status);


  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomHeader(text: "Sign in",),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                                    eyeType = FontAwesomeIcons.solidEyeSlash;
                                  } else {
                                    showpass = false;
                                    eyeType = FontAwesomeIcons.solidEye;
                                  }
                                });
                              },
                              icon: Icon(
                                eyeType,
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
                    onTap: () => {
                      Navigator.of(context).pushNamed('/signup')
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Dont Have an account?',
                          style: TextStyle(
                              color: Colors.black, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(text: ' Sign up',
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
                        LoginUser();
                      },
                      splashColor: Color(0xfffafafa),
                      color: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Login",
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


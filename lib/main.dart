import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 5',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DayFive(),
    );
  }
}

class DayFive extends StatefulWidget {
  @override
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;
  static double sizeboxHeight;

  @override
  _DayFiveState createState() => _DayFiveState();
}

class _DayFiveState extends State<DayFive> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Widget build(BuildContext context) {
    bool showPassWord = false;
    bool remember = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            // padding:
            // EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Day 5: SignUp Screen with email and password",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      //color: Colors.white,
                      margin: EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (newValue) => email = newValue,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: "Please Enter your email");
                          } else if (emailValidatorRegExp.hasMatch(value)) {
                            removeError(error: "Please Enter Valid Email");
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.teal),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.teal),
                          alignLabelWithHint: false,
                          filled: false,
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white)
                          // ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(color: Colors.teal)),
                          suffixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      //color: Colors.white,
                      margin: EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: showPassWord,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: "Please Enter your password");
                          } else if (value.length >= 8) {
                            removeError(error: "Password is too short");
                          }
                          return null;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            addError(error: "Please Enter your password");
                            return "";
                          } else if (value.length < 8) {
                            addError(error: "Password is too short");
                            return "";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.teal),
                          labelText: "password",
                          labelStyle: TextStyle(color: Colors.teal),
                          alignLabelWithHint: false,
                          filled: false,
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white)
                          // ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(color: Colors.teal)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassWord
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassWord = !showPassWord;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: Colors.white,
                          checkColor: Colors.teal,
                          hoverColor: Colors.teal,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: Colors.teal),
                        ),
                        Spacer(),
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.teal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                color: Colors.teal,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                _formKey.currentState.save();
                            }
                            // if all are valid then go to success screen,
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                  heroTag: "tag3",
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                      "assets/icons/twitter.svg"),
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                              heroTag: "tag3",
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                  "assets/icons/facebook-2.svg"),
                              onPressed: () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                              heroTag: "tag5",
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.deepOrangeAccent)),
                              backgroundColor: Colors.white,
                              child:
                                  SvgPicture.asset("assets/icons/google.svg"),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " Sign up here",
                      style: TextStyle(
                        color: Colors.teal,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;
  static MediaQueryData _mediaQueryData;
  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = _mediaQueryData.size.width;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}

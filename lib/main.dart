import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  int animTime=1;
  static final double cardSizeFraction = 3;
  double loginButtomMarginTopFraction = cardSizeFraction + .1;

  static final double signupSizeFraction = 2;
  double signupButtomMarginTopFraction = signupSizeFraction + .1;

  List<Widget> screenWidgets = [];

  @override
  Widget build(BuildContext context) {
    screenWidgets.clear();
    if (isLoginCard) {
      screenWidgets.add(
        AnimatedContainer(
          duration: Duration(seconds: animTime),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / cardSizeFraction,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(colors: [Colors.yellow, Colors.blue]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
                // has the effect of softening the shadow
                spreadRadius: 5.0,
                // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: getLoginForm(),
        ),
      );
      screenWidgets.add(
        AnimatedContainer(
          duration: Duration(seconds: animTime),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.2,
          height: 40,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.red,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.yellow],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 20.0,
                  // has the effect of softening the shadow
                  spreadRadius: 5.0,
                  // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                )
              ]),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height /
                  loginButtomMarginTopFraction,
              left: 70,
              right: 70),
          child: FlatButton(
              padding: EdgeInsets.only(left: 100, right: 100),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              /*if (_formKey.currentState.validate()) {
                // If the form is valid, we want to show a Snackbar
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }*/
              setState(() {
                isLoginCard=!isLoginCard;
              });

            },
            child: Text('Login'),
          ),
        ),
      );



    } else {
      screenWidgets.add(
        AnimatedContainer(
          duration: Duration(seconds: animTime),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / signupSizeFraction,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(colors: [Colors.yellow, Colors.blue]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
                // has the effect of softening the shadow
                spreadRadius: 5.0,
                // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: getSignupForm(),
        ),
      );
      screenWidgets.add(
        AnimatedContainer(
          duration: Duration(seconds: animTime),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.2,
          height: 40,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.red,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.yellow],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 20.0,
                  // has the effect of softening the shadow
                  spreadRadius: 5.0,
                  // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                )
              ]),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height /
                  signupButtomMarginTopFraction,
              left: 70,
              right: 70),
          child: FlatButton(
              padding: EdgeInsets.only(left: 100, right: 100),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              /*if (_formKey.currentState.validate()) {
                // If the form is valid, we want to show a Snackbar
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }*/
              setState(() {
                isLoginCard=!isLoginCard;
              });
            },
            child: Text('Signup'),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: screenWidgets
        ),
      ),
    );
  }

  bool isLoginCard = true;

  Widget getLoginForm() {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getFormFields("User name", FormTextType.USERNAME,Icons.photo),
          getFormFields("Password", FormTextType.PASSWORD,Icons.remove_red_eye),
        ],
      ),
    );
  }

  Widget getSignupForm() {
    return Form(
      key: _formKey,
      child: ListView(
        /*crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,*/
        children: <Widget>[
          getFormFields("User name", FormTextType.USERNAME,Icons.photo),
          getFormFields("Password", FormTextType.PASSWORD,Icons.remove_red_eye),
          getFormFields("Mobile Number", FormTextType.MOBILE,Icons.mobile_screen_share),
          getFormFields("Address", FormTextType.ADDRESS,Icons.home),
        ],
      ),
    );
  }

  Widget getFormFields(
    String hintText,
    FormTextType fieldType, IconData photo,
  ) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextFormField(
        decoration: new InputDecoration(
          border: InputBorder.none,
          hasFloatingPlaceholder: true,
          labelText: hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              photo,
              color: Colors.grey,
            ), // icon is 48px widget.
          ),
        ),
        validator: (value) {
          if (fieldType == FormTextType.USERNAME) {
            if (value.isEmpty) {
              return 'Please enter user name';
            }
          } else if (fieldType == FormTextType.PASSWORD) {
            if (value.isEmpty) {
              return 'Please enter password';
            }
          }
          else if (fieldType == FormTextType.MOBILE) {
            if (value.isEmpty) {
              return 'Please enter mobile number';
            }
          } else if (fieldType == FormTextType.ADDRESS) {
            if (value.isEmpty) {
              return 'Please enter address';
            }
          }
        },
      ),
    );
  }
}

enum FormTextType { USERNAME, PASSWORD ,MOBILE,ADDRESS}

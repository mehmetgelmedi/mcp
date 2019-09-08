import 'package:flutter/material.dart';
import 'package:mcp/controllers/user-controller.dart';
import 'package:mcp/pages/home-page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    this.setState(() {
      _emailController.text = "eve.holt@reqres.in";
      _passwordController.text = "pistol";
    });
  }

  final _userController = new UserController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _loginFormKey = GlobalKey<FormState>();
  _displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _loginHandler() {
    final loginForm = _loginFormKey.currentState;
    if (loginForm.validate()) {
      _loader();
      new Future.delayed(new Duration(seconds: 5), () async {
        bool res = await _userController.login(
            _emailController.text, _passwordController.text);
        if (res)
          Navigator.of(_scaffoldKey.currentContext)
              .pushReplacementNamed(HomePage.tag);
        else
          _displaySnackBar("email or password incorrect");
      });
    }
  }

  _forgotHandler() {}

  _loader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => new Dialog(
            child: new Padding(
              padding: EdgeInsets.all(10),
              child: new Row(
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Text("Loading...")
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.network(
              "https://www.maguirescountryparks.co.uk/wp-content/uploads/2016/04/footer-symbol-mcp-logo.png")),
    );

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => !val.contains('@') ? 'Not a valid email.' : null,
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.length < 6 ? 'Password too short.' : null,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: _loginHandler,
        padding: EdgeInsets.all(12.0),
        color: Colors.lightBlueAccent,
        child: Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: _forgotHandler,
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _loginFormKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(
                  height: 48.0,
                ),
                email,
                SizedBox(
                  height: 8.0,
                ),
                password,
                SizedBox(
                  height: 48.0,
                ),
                loginButton,
                forgotLabel,
              ],
            ),
          ),
        ));
  }
}

import '../Utillity/libraries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatefulWidget {
  static const route = "/login";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return LoginPageState();
  }
}

class LoginPageState extends State {
  String _email, _password;
  String animationType = "idle";
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });

    super.initState();
  }

  TextEditingController _emailController;
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void setCookies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true).then((bool success) {
      print("Login in");
    });
  }

  invalidLoginMessage() {
    final snackBar = SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          'Invalid email or password',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
    print("Come here");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("MedEasy"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Center(
            child: Container(
                height: 300,
                width: 300,
                child: CircleAvatar(
                  child: ClipOval(
                    child: FlareActor(
                      "assets/images/teddy_test.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: animationType,
                    ),
                  ),
                  backgroundColor: Colors.white,
                )),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      onSaved: (newValue) => _email = newValue,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }

                        return null;
                      },
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: "email",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hoverColor: Colors.indigo,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      onSaved: (newValue) => _password = newValue,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter  your password';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.security,
                          color: Colors.black,
                        ),
                        labelText: "Password",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hoverColor: Colors.indigo,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.blue,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  if (_passwordController.text.compareTo(_password) == 0) {
                    singIn(context);
                    setState(
                      () {
                        animationType = "success";
                      },
                    );
                  } else {
                    setState(() {
                      animationType = "fail";
                    });
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              // color: Colors.blue,
              child: FlatButton(
                onPressed: null,
                child: Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue),
              child: FlatButton(
                onPressed: () => Navigator.pushNamed(context, Signup.route),
                child: Text(
                  "Signup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Future<void> singIn(BuildContext contex) async {
    await Firebase.initializeApp();

    final _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      try {
        var x = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print(x);
        setCookies();
        Navigator.pushNamed(contex, HomePage.route);
      } catch (e) {
        invalidLoginMessage();
      }
    }
  }
}

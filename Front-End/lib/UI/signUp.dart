import '../Utillity/libraries.dart';

class Signup extends StatelessWidget {
  static const route = "/signup";

  String _email, _password, _username, _accountType;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  invalidLoginMessage() {
    final snackBar = SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          'Something went wrong please try again',
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

  void CreateUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
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
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          // Container(
          //   color: Colors.transparent,
          //   width: MediaQuery.of(context).size.width,
          //   child: Image.asset(
          //     'assets/images/doc.png',
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "Signup",
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
                      onSaved: (newValue) => _username = newValue,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your username';
                        }

                        return null;
                      },
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Username",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                      controller: _emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter  your email address';
                        }
                        return null;
                      },
                      // obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: "Email Address",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                      onSaved: (newValue) => _accountType = newValue,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter account type';
                        }
                        return null;
                      },
                      obscureText: false,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        labelText: "Account Type",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter  your password';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.security,
                          color: Colors.black,
                        ),
                        labelText: "Password",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hoverColor: Colors.indigo,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.blue,
              child: FlatButton(
                // onPressed: () {
                //   CreateUser(_email, _password);
                //   // Navigator.pushNamed(context, HomePage.route);
                // },
                onPressed: () async {
                  await Firebase.initializeApp();
                  try {
                    User user = (await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ))
                        .user;
                    if (user != null) {
                      print("uu");
                      Navigator.pushNamed(context, LoginPage.route);
                    } else {
                      print(_emailController.text);
                      print(_passwordController.text);
                    }
                  } catch (e) {
                    invalidLoginMessage();
                    print("Error");
                    print(e);
                    _emailController.text = "";
                    _passwordController.text = "";
                    // TODO: AlertDialog with error
                  }
                },
                child: Text(
                  "Signup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
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
}

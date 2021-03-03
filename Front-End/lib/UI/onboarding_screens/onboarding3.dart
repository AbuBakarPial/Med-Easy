import '../../Utillity/libraries.dart';

class Onboarding3 extends StatefulWidget {
  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> bottombg;
  Animation<double> topbg;
  Animation<double> title;
  Animation<double> desc;
  Animation<double> btnwidth;
  Animation<double> btnheight;
  Animation<double> btndy;
  Animation<double> indicator1, indicator2, indicator3;

  // User firebaseUser = FirebaseAuth.instance.currentUser;

  void keOnboarding2() {
    animationController.reverse();
    Timer(
      Duration(milliseconds: 500),
      () => Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
        return new Onboarding2();
      }, transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(opacity: animation, child: child);
      })),
    );
  }

  void keHomePage() {
    animationController.reverse();
    Timer(
      Duration(milliseconds: 500),
      () => Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
        return Signup();
      }, transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      })),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate((CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController)));

    btnwidth = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate((CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController)));

    btnheight = Tween<double>(
      begin: 0.0,
      end: 50.0,
    ).animate((CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController)));

    title = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    btndy = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    desc = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.9, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    bottombg = Tween<double>(
      begin: -225.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.3, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    topbg = Tween<double>(
      begin: -250.0,
      end: -50.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator1 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator2 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    indicator3 = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        //frame top
        Positioned(
            top: 0,
            child: Transform.translate(
              offset: Offset(0, this.topbg.value),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Image.asset("assets/images/topbg3.png"),
              ),
            )),

        //frame bottom
        Positioned(
            bottom: 0,
            child: Transform.translate(
              offset: Offset(this.bottombg.value, 50),
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.transparent,
                child: Image.asset("assets/images/bottombg3.png"),
              ),
            )),

        //title
        Positioned(
            top: 75,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text("Medicine Reminder",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color:
                              Color.fromRGBO(64, 74, 105, this.title.value))),
                ],
              ),
            )),

        //indicator
        Positioned(
          bottom: 40,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, this.indicator1.value),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(105, 133, 148, 1),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(width: 16),
                Transform.translate(
                  offset: Offset(0.0, this.indicator2.value),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(105, 133, 148, 1),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(width: 16),
                Transform.translate(
                  offset: Offset(0.0, this.indicator3.value),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(127, 71, 255, 1.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ),

        //button previus
        Positioned(
            bottom: 20,
            left: 20,
            child: Transform.translate(
              offset: Offset(0.0, this.btndy.value),
              child: RaisedGradientButton(
                  radius: 55.0,
                  width: 55.0,
                  height: 55.0,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(167, 133, 246, 1.0),
                      Color.fromRGBO(127, 71, 255, 1.0)
                    ],
                  ),
                  onPressed: () {
                    keOnboarding2();
                  }),
            )),

        //image center
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: this.animation.value,
                  height: this.animation.value,
                  child: Image.asset("assets/images/download.png")),
              SizedBox(height: 32),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 12),
                child: Center(
                  child: Text(
                    "Here you will be able to set Medicine Reminder that can help you to remind the Medicine taking time.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(105, 133, 148, this.desc.value)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("Way...");
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          var isLoggedIn = prefs.getBool('isLoggedIn') == null ? false : true;

          print(isLoggedIn);

          isLoggedIn
              ? Navigator.pushNamed(context, HomePage.route)
              : Navigator.pushNamed(context, LoginPage.route);
        },
        backgroundColor: Color.fromRGBO(127, 71, 255, 1.0),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

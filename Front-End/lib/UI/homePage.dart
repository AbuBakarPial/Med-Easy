import 'package:medEasy/UI/Notification/myMedicineReminder.dart';

import '../Utillity/libraries.dart';

class HomePage extends StatefulWidget {
  static const route = '/homescreen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location _CurrentLocation = Location();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 70.0, left: 50.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'MedEasy',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      letterSpacing: 1.8,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Container(
              height: 450,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0)
                        Navigator.pushNamed(context, PharmacyFind.route,
                            arguments: {
                              "currentLocation": _CurrentLocation,
                            });
                      else if (index == 1)
                        Navigator.pushNamed(context, MedicineSearch.route);
                      // else if (index == 2)
                      // Navigator.pushNamed(context, OrderScreen.route);
                      else if (index == 2)
                        Navigator.pushNamed(context, About.route);
                      else if (index == 3)
                        Navigator.pushNamed(context, Covid.route);
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 100),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 100),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 25,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Hero(
                        //   tag: planets[index].position,
                        //   child:
                        Container(
                          width: 150.0,
                          height: 150.0,
                          margin: const EdgeInsets.only(left: 40, top: 20),
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 3),
                            ],
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              image: AssetImage(planets[index].iconImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Image.asset(planets[index].iconImage),
                        // ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            planets[index].position.toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 200,
                              color: primaryTextColor.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        isExtended: true,
        elevation: 5.2,
        onPressed: () =>
            Navigator.pushNamed(context, MyMedicineRemainder.route),
        child: Container(
          child: Icon(
            Icons.alarm,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

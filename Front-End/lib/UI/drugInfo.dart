import '../Utillity/libraries.dart';
import 'package:dio/dio.dart';

class DrugInfo extends StatefulWidget {
  String name;

  DrugInfo(this.name);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return DrugInfoState(name);
  }
}

class DrugInfoState extends State with SingleTickerProviderStateMixin {
  static const route = '/drug';

  TabController _controller;

  String name;

  DrugInfoState(this.name);

  final _globalKey = GlobalKey<ScaffoldState>();

  Future<Map<String, dynamic>> getAllDrugInformations() async {
    print("Printing name " + name);
    String url =
        "http://10.42.0.1/api/api/search.php?s=" + name + "&key=pialCSE15";

    try {
      Response response = await Dio().get(url);
      var data = response.data;

      print(data);

      return data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[300], Colors.blue[600]]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Drug Info | " + name,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: getAllDrugInformations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null)
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.pink,
                  ));
                else if (snapshot.data["data"].length < 1)
                  return Container(
                    color: Colors.red,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Invalid Drug",
                          style: TextStyle(
                              color: Colors.cyanAccent, fontSize: 30.0),
                        ),
                      ),
                    ),
                  );
                else
                  return Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.blue[300],
                                Colors.blue[600]
                              ])),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child:
                                    Image.asset("assets/images/pill_main.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data["data"][0]["drug_name"],
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    wordSpacing: 1.2,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  snapshot.data["data"][0]["contraindication"],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Scaffold(
                            // backgroundColor: Colors.blue[900],
                            key: _globalKey,
                            appBar: PreferredSize(
                              preferredSize: Size(double.infinity, 60),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.blue[300],
                                        Colors.blue[600]
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: TabBar(
                                      controller: _controller,
                                      isScrollable: true,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicatorColor: Colors.black,

                                      // indicatorPadding: const EdgeInsets.all(30),
                                      // indicatorWeight: 5,
                                      indicator: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                          )),
                                      unselectedLabelColor: Colors.white,
                                      unselectedLabelStyle: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      labelColor: Colors.purple,
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      // labelPadding: const EdgeInsets.all(5),
                                      tabs: [
                                        Tab(
                                          text: "    Overview    ",
                                        ),
                                        Tab(
                                          text: "    Usage     ",
                                        ),
                                        Tab(
                                          text: "     Others    ",
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            body: TabBarView(
                              controller: _controller,
                              physics: ScrollPhysics(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Text(
                                      snapshot.data["data"][0]["drug_use"],
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                ListView(
                                  padding: const EdgeInsets.all(20),
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Drug Usage",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]
                                                ["drug_usage"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Drug Dosage",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]["dosage"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  padding: const EdgeInsets.all(20),
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Precaution",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]
                                                ["precaution"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Side Effect",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]
                                                ["side_effect"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Warning",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]["warning"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Storage Condition",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        "-     " +
                                            snapshot.data["data"][0]
                                                ["storage_condition"],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              })
        ],
      ),
    );
  }
}

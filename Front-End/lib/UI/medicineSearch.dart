import 'package:medEasy/UI/drugInfo.dart';
import 'package:medEasy/Utillity/apiUrl.dart';

import '../Utillity/libraries.dart';
import 'package:dio/dio.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class MedicineSearch extends StatefulWidget {
  static const route = '/medicine-find';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return MedicineSearchState();
  }
}

class MedicineSearchState extends State {
  TextEditingController _searchController;

  GlobalKey<AutoCompleteTextFieldState<String>> _key = new GlobalKey();

  bool dataLoaded = false;

  List<String> drugsName = [];

  getAllDrugInformations() async {
    String url = "http://10.42.0.1/api/api/read.php?key=pialCSE15";

    try {
      Response response = await Dio().get(url);
      var data = response.data["data"];

      print(data);

      setState(() {
        for (int i = 0; i < data.length; i++) {
          drugsName.add(
            data[i]["drug_name"],
          );
        }
        ;
      });
    } catch (e) {
      print(e);
    }
  }

  Route _createRoute(String name) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DrugInfo(name),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllDrugInformations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context)),
            title: Text(
              "Medicines",
              style: TextStyle(
                fontSize: 30.0,
                wordSpacing: 2,
                fontWeight: FontWeight.w900,
                // color:
              ),
            ),
            titleSpacing: 1.5,
            pinned: true,
            floating: true,
            backgroundColor: Colors.blue[300],
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 20),
                    child: Text(
                      "Find your Medicine Informations",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SimpleAutoCompleteTextField(
                      controller: _searchController,
                      key: _key,
                      suggestions: drugsName,
                      submitOnSuggestionTap: true,
                      textSubmitted: (drugName) {
                        print("Shit ..." + drugName);
                        Navigator.push(context, _createRoute(drugName));
                      },
                      style: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () => print("Clicked")),
                        labelText: "Search  Here",
                        labelStyle:
                            TextStyle(fontSize: 18.0, color: gradientEndColor),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            width: 5.0,
                          ),
                        ),
                        hoverColor: Colors.greenAccent,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              if (drugsName.length <= 1)
                return Container(
                    margin: const EdgeInsets.all(100),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ));
              else if (index < drugsName.length)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          _createRoute(
                            drugsName[index],
            
                          )),
                      child: Row(
                        children: <Widget>[
                          Image.asset("assets/images/pills.png"),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              drugsName[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
            }),
          )
        ],
      ),
    ));
  }
}

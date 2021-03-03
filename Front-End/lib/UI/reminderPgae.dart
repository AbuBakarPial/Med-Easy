import '../Utillity/libraries.dart';
import 'package:flutter/cupertino.dart';

import 'dart:ui';

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class PillReminder extends StatefulWidget {
  static const route = "/reminder-page";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();

    return PillReminderState();
  }
}

class PillReminderState extends State {
  final _formKey = GlobalKey<FormState>();

  List<Widget> pills = [];

  final textFieldController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String _time = "Not set";

  var selectedTime = DateTime.now().toUtc().millisecondsSinceEpoch;


  @override
  void dispose() {
    super.dispose();
  }



  addReminder(String name) {
    setState(() {
      pills.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.donut_large,
            color: Colors.blue,
          ),
          Card(
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.all(50),
              // height: 100,
              child: Column(
                children: <Widget>[
                  Text(name),
                  Text(
                    // "${selectedDate.toLocal()}".split(' ')[0],
                    _time,
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
    });
  }

  // user defined function
  void _AddRemindershowDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Add pill reminder"),
          content: Container(
            height: 200,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: textFieldController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    onPressed:
                        //  () => _selectDate(context)
                        () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          // showSecondsColumn: false,
                          onConfirm: (time) {
                        print('confirm $time');
                        print(time.toUtc().millisecondsSinceEpoch);
                        _time =
                            '${time.hour} : ${time.minute} : ${time.second}';
                        setState(() {
                          _time = _time;
                          selectedTime = time.toUtc().millisecondsSinceEpoch;
                          print("Chnaged time");
                          print(selectedTime);
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                      setState(() {});
                    },
                    child: Text(
                      'Select Time',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Add"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  addReminder(textFieldController.text);
                  textFieldController.clear();

                  // _showNotificationsAfterSecond(selectedTime);

                  // Scaffold.of(context).showSnackBar(snackBar);

                  Navigator.of(context).pop();
                }
              },
            ),
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2020,
              maximumYear: 2025,
            ),
          );
        });
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select Reminder date',
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Reminder date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "Pill Reminder",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/pill-reminder.png",
              fit: BoxFit.fill,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "All Reminders : ",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(""),
            ],
          ),
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: (pills.length == 0)
                  ? [Center(child: Text("No reminder addded"))]
                  : pills,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        isExtended: true,
        elevation: 5.2,
        onPressed: _AddRemindershowDialog,
        child: Container(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

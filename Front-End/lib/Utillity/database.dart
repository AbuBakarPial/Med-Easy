import 'libraries.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost() {
  var id = databaseReference.child('/post/').push();

  id.set({
    

  });
}

void createData() {
  databaseReference
      .child("flutterDevsTeam1")
      .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
  databaseReference.child("flutterDevsTeam2").set(
      {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
  databaseReference
      .child("flutterDevsTeam3")
      .set({'name': 'Akshay', 'description': 'Software Engineer'});
}

void readData() {
  databaseReference.once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
  });
}

void updateData() {
  databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
  databaseReference
      .child('flutterDevsTeam2')
      .update({'description': 'Team Lead'});
  databaseReference
      .child('flutterDevsTeam3')
      .update({'description': 'Senior Software Engineer'});
}

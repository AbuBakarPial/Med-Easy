
import '../../../Utillity/libraries.dart';

class MedicineEmptyState extends StatelessWidget {
  const MedicineEmptyState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      .5,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/emergency.png',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No Medicince Added yet',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 1.2),
            ),
          )
        ],
      ),
    );
  }
}

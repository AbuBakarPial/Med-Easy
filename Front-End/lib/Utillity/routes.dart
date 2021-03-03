import 'package:medEasy/UI/Notification/myMedicineReminder.dart';

import 'libraries.dart';

class Routes {
  static routes() {
    return {
      LoginPage.route: (context) => LoginPage(),
      HomePage.route: (context) => HomePage(),
      MedicineSearch.route: (contex) => MedicineSearch(),
      PharmacyFind.route: (contex) => PharmacyFind(),
      About.route: (contex) => About(),
      Signup.route: (context) => Signup(),
      // DrugInfo.route : (contex) => DrugInfo(),
      PillReminder.route: (contex) => PillReminder(),
      MyMedicineRemainder.route: (contex) => MyMedicineRemainder(),
      Onboarding1.route: (contex) => Onboarding1(),
      Covid.route: (contex) => Covid(),
    };
  }

  static initialScreen() {
    return
        // Signup.route;
        // LoginPage.route;
        Onboarding1.route;
    // HomePage.route;
  }
}

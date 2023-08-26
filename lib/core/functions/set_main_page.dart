import 'package:brightness/views/screens/main_screens/bookings.dart';
import 'package:brightness/views/screens/main_screens/profile.dart';
import 'package:brightness/views/screens/main_screens/search.dart';

import '../../views/screens/main_screens/favourit.dart';
import '../../views/screens/main_screens/posts.dart';

setMainPage(int index) {
  if (index == 0) {
    return Posts();
  }
  if (index == 1) {
    return Profile();
  }
  if (index == 2) {
    return Search();
  }
  if (index == 3) {
    return Favourit();
  }
  if (index == 4) {
    return Bookings();
  }
}

import 'package:get/get.dart';

import '../constant/app_strings.dart';
import 'arabic.dart';
import 'english.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppStrings.ar: arabic,
        AppStrings.en: english,
      };
}

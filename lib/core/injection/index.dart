import 'package:get/get.dart';
import 'package:pss_mobile/core/api/config.dart';
import 'package:pss_mobile/core/providers/api.provider.dart';
import 'package:pss_mobile/core/providers/ui.provider.dart';
import 'package:pss_mobile/core/providers/user.provider.dart';
import 'package:pss_mobile/core/providers/sharePreference.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// config global dependencies
Future<void> configureDependencies() async {
  Get.put(ApiProvider());
  Get.put(UIProvider());
  Get.put(SharedPreferenceProvider(await SharedPreferences.getInstance()));
  // depend singleton
  Get.put(ApiClient());
  Get.put(UserProvider());
}

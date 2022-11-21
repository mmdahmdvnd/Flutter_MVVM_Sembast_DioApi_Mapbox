import 'package:injectable/injectable.dart';
import 'package:com.petroimensharif.pishco/di/components/service_locator.dart';

import 'injection.config.dart';
@injectableInit
Future<void> configureMainInjection() async {
  await $initGetIt(getIt);
}

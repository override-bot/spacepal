import 'package:get_it/get_it.dart';
import 'package:spacepal/core/services/postapi.dart';
import 'package:spacepal/core/services/userapi.dart';
import 'package:spacepal/core/viewmodels/post_view_model.dart';
import 'package:spacepal/core/viewmodels/user_view_model.dart';

final locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => PostApi);
  locator.registerLazySingleton(() => UserViewModel);
  locator.registerLazySingleton(() => PostViewModel);
  locator.registerLazySingleton(() => UserApi);
}
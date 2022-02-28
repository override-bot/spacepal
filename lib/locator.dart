import 'package:get_it/get_it.dart';
import 'package:spacepal/core/services/postapi.dart';

final locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => PostApi);
 
}
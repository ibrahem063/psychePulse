import 'package:get_it/get_it.dart';
import 'package:psychepulse/view/users_screen/cubit/cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
        () => psychepulseCubit(),
  );
}
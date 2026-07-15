import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Features/Auth/loginscreen/loginscreen.dart';
import 'package:e_commerce_app/Features/Auth/registerscreen/registerscreen.dart';
import 'package:e_commerce_app/Features/main/account/address/addressscreen.dart';
import 'package:e_commerce_app/Features/main/detailsscreen/detailsscreen.dart';
import 'package:e_commerce_app/Features/main/home/widgets/data.dart';
import 'package:e_commerce_app/Features/main/mainscreen.dart';
import 'package:go_router/go_router.dart';

class RouterGen {
  static GoRouter router = GoRouter(
    initialLocation: AppRouter.login,

    routes: [
      GoRoute(
        path: AppRouter.login,
        name: AppRouter.login,
        builder: (context, state) => const Loginscreen(),
      ),
      GoRoute(
        path: AppRouter.register,
        name: AppRouter.register,
        builder: (context, state) => const Registerscreen(),
      ),
      GoRoute(
        path: AppRouter.home,
        name: AppRouter.home,
        builder: (context, state) => const Mainscreen(),
      ),
      GoRoute(
        path: AppRouter.details,
        name: AppRouter.details,
        builder: (context, state) {
          final data = state.extra as Data;
          return Detailsscreen(data: data);
        },
      ),
      GoRoute(
        path: AppRouter.address,
        name: AppRouter.address,
        builder: (context, state) => const Addressscreen(),
      )
    ],
  );
}

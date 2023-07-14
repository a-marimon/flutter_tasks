import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoNavigator {
  static final routerN = RouterNotifier();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: routerN,
    redirect: routerN._redirectLogic,
    routes: routerN._routes,
  );

  static BuildContext? currentContext() => router.routeInformationParser.configuration.navigatorKey.currentContext;
}

class RouterNotifier extends ChangeNotifier {
  RouterNotifier() {
    //Subscribe to event of user auth or not, and notify changes with  notifyListeners();
  }

  Future<String?> _redirectLogic(BuildContext context, GoRouterState state) async {
    // final user = (buscar del state el usuario (puede ser null en caso de no haber))
    // final omitAuth = ["/"];
    // final areWeLoggingIn = state.location.contains('/auth');
    // if (user == null) {
    //   try {
    //    refrescar el token en caso de JWT, si tod ok continua la session normal, sino entonces...
    //    puedes poseer los tokens tanto de acceso o el refresh en un SecureStorage, la funcion se encarga de buscarlos
    //     return null;
    //   } catch (_) {
    //     si ya estas en el login o en una ruta donde se omita la autenticacion te dejo pasar
    //     return areWeLoggingIn || omitAuth.contains(state.location) ? null : "/auth";
    //   }
    // }
    // si estas en el login y llegas aqui es xq tu usuario esta auth y entonces te mando para home
    // if (areWeLoggingIn) return '/';

    return null;
  }

  List<GoRoute> get _routes => [];
}

fadeTransition(Widget page, GoRouterState state, {Cubic? curves}) => CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: CurveTween(curve: curves ?? Curves.easeInOut).animate(animation),
        child: child,
      ),
    );

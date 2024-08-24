part of 'routes.dart';

class AppRoute {
  static Route? generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
      // return const PageFadeTransition(child: HomePage()).build;

      default:
        throw RouteException();
    }
  }
}

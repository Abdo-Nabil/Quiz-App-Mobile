import 'package:flutter/material.dart';

class NavigatorHelper {
  static push(BuildContext context, route, {hasAnimation = true}) {
    Navigator.of(context).push(
      hasAnimation
          ? MaterialPageBuilder.defaultAnimation(context, route)
          : MaterialPageBuilder.noAnimationBuilder(context, route),
    );
  }

  static pushReplacement(BuildContext context, route, {hasAnimation = true}) {
    Navigator.of(context).pushReplacement(
      hasAnimation
          ? MaterialPageBuilder.defaultAnimation(context, route)
          : MaterialPageBuilder.noAnimationBuilder(context, route),
    );
  }

  static pushAndRemoveUntil(BuildContext context, route,
      {hasAnimation = true}) {
    Navigator.of(context).pushAndRemoveUntil(
      hasAnimation
          ? MaterialPageBuilder.defaultAnimation(context, route)
          : MaterialPageBuilder.noAnimationBuilder(context, route),
      (theRoute) => false,
    );
  }
}

class MaterialPageBuilder {
  static defaultAnimation(BuildContext context, route) {
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }

  static noAnimationBuilder(BuildContext context, route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => route,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

// class NoAnimationPageRoute extends MaterialPageRoute {
//   NoAnimationPageRoute({builder}) : super(builder: builder);
//
//   @override
//   Duration get transitionDuration => const Duration(seconds: 0);
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MangaPage extends StatelessWidget with AutoRouteWrapper {
  const MangaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:co_flutter_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:louhie/features/manga/presentation/cubit/manga_cubit.dart';

class MangaPage extends StatelessWidget with AutoRouteWrapper {
  const MangaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mangaCubit = context.watch<MangaCubit>();
    return Container();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MangaCubit>(
          create: (context) => sl<MangaCubit>()..loadMangaTest())
    ], child: this);
  }
}

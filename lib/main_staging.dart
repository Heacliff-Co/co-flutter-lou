import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:louhie/features/app/app_bloc.dart';
import 'package:louhie/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:co_flutter_core/core.dart';

import 'app/app_run_tasks.dart';
import 'bond_app.dart';

void main() => run(
      () => BlocProvider<AppBloc>(
          create: (context) => sl<AppBloc>(),
          child: ProviderScope(
            child: BondApp(
              appRouter: sl<AppRouter>(),
            ),
          )),
      RunAppTasks(),
    );

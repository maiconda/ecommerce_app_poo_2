import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../services/connection/bloc/connection_cubit.dart';

class GlobalBlocProviderHelper {
  static Widget provide({
    required Widget child,
  }) {
    final getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ConnectionCubit(connectionService: getIt()),
        ),
      ],
      child: child,
    );
  }
}

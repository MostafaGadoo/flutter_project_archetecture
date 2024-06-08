import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubitsProvider extends StatelessWidget {
  const AppCubitsProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<SchoolTypeSelectCubit>(
        //     create: (context) => getIt<SchoolTypeSelectCubit>()),
        //
        // BlocProvider<NavigationBloc>(
        //     create: (context) => getIt<NavigationBloc>()),
      ],
      child: child,
    );
  }
}

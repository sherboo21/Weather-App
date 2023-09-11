import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gst_task/presentation/screens/home/cubit/home_cubit.dart';

class MultiBlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..getWeather(),
        ),
      ];
}

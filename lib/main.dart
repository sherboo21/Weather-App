import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/presentation/stateMangements/bloc/bloc_observer.dart';
import 'app/gst_tasl_app.dart';
import 'data/dataSources/remote/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  return runApp(const GSTTaskApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/router/named_router.dart';
import '../config/router/named_router_impl.dart';
import '../config/theme/app_theme.dart';
import '../presentation/stateMangements/bloc/multi_bloc_providers.dart';

class GSTTaskApp extends StatelessWidget {
  const GSTTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MultiBlocProviders.providers(context),
        child: ScreenUtilInit(
          designSize: const Size(360, 812),
          builder: (context, child) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              initialRoute: Routes.homeRouter,
              onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
              navigatorKey: NamedNavigatorImpl.navigatorState,
              debugShowCheckedModeBanner: false,
              title: 'GST Task',
              theme: AppTheme.lightThemeData,
            ),
          ),
        ));
  }
}
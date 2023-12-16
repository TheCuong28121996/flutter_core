import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/constants/constants.dart';
import 'injection/injection.dart';
import 'router/router.dart';

late final bool kDevEnv;
late final bool kStgEnv;

Future<Widget> initializeApp(String env) async {
  kDevEnv = env == Constants.devEnvironment;
  kStgEnv = env == Constants.stgEnvironment;

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: appRouter,
            title: 'Flutter Base',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        });
  }
}

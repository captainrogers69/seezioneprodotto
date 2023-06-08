import 'package:flutter/material.dart';
import 'package:seezioneprodotto/config/routers/app_router.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/config/themes/app_theme.dart';
import 'package:seezioneprodotto/presentation/bottom/screens/bottom_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seezione Prodotto',
      useInheritedMediaQuery: true,
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      navigatorKey: Navigate.instance.navigationKey,
      home: const BottomScreen(),
    );
  }
}

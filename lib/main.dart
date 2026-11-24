import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';

// App entry.
// TODO: In pubspec.yaml, replace 'surname' with your own surname
// (name: surname_mobprog). The folder name is surname_mobprog.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const _CleanScrollBehavior(),
          title: 'Facebook',
          theme: ThemeData(
            primaryColor: AppColors.facebookBlue,
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 1,
            ),
          ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) => const NewsFeedScreen(),
          },
        );
      },
    );
  }
}

/// Disables Android 12+ Material 3's stretching overscroll effect so lists
/// scroll cleanly without vertically elongating cards at the edges.
class _CleanScrollBehavior extends MaterialScrollBehavior {
  const _CleanScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

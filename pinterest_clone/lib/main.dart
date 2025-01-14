import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'utils/style.dart';

void main() {
  runApp(PinterestCloneApp());
}

class PinterestCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: Consumer<AuthProvider>(
        builder:
            (ctx, auth, _) => MaterialApp(
              title: 'Pinterest Clone',
              theme: AppThemes.lightTheme,
              home: auth.isAuth ? HomeScreen() : AuthScreen(),
              routes: {
                HomeScreen.routeName: (ctx) => HomeScreen(),
                AuthScreen.routeName: (ctx) => AuthScreen(),
              },
            ),
      ),
    );
  }
}

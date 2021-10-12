//import 'package:aid_app/pages/splash_screen.dart';

import 'package:aid_app/classes/authentication_service.dart';
import 'package:aid_app/pages/home_page.dart';
import 'package:aid_app/pages/sing_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advanced Ideas Developers',
        theme: ThemeData(
            primaryColor: Constants.blue, accentColor: Constants.orange),
        //home: SplashScreen(),
        home: AuthenticationWrapper());
  }
}

final streamProvider = StreamProvider.autoDispose((ref) {
  return ref.read<AuthenticationService>(authProvider).authStateChanges;
});

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final firebaseUser = watch(streamProvider);

    return Scaffold(
      body: firebaseUser.when(
        data: (data) {
          if (data != null) {
            return HomePage();
          }
          return SingInPage();
        },
        loading:() => Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, _) => Center(
          child: Text("Error: $err"),
        )
      ),
    );
  }
}

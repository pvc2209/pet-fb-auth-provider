import 'package:fb_auth_provider/pages/home_page.dart';
import 'package:fb_auth_provider/pages/signin_page.dart';
import 'package:fb_auth_provider/providers/auth/auth_provider.dart';
import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final AuthState authState = context.watch<AuthProvider>().state;

    if (authState.authStatus == AuthStatus.unauthenticated) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        // Navigator.of(context).pushNamed(SigninPage.routeName);
        Navigator.pushNamedAndRemoveUntil(
            context, SigninPage.routeName, (route) => route.isFirst);
      });
    } else if (authState.authStatus == AuthStatus.authenticated) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        // Navigator.of(context).pushNamed(HomePage.routeName);
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (route) => route.isFirst);
      });
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// Flutter material.dart & l10n
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import Pages
import 'package:music_app/pages/no_auth/home_page.dart';
import 'package:music_app/pages/trend_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      runApp(Routes(initialPage: const HomeWithNoAuthPage()));
      print("Run App --> Utilisateur non connecté");
    } else {
      runApp(Routes(initialPage: const TrendPage()));
      print("Run App --> Utilisateur connecté");
    }
  });
}

class Routes extends StatelessWidget {
  Routes({
    Key? key,
    required this.initialPage,
  }) : super(key: key);

  final Widget initialPage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('InitialPage'),
            child: initialPage,
          ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

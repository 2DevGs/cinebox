import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'cinebox_main_app.dart';
import 'config/env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSignIn.instance.initialize(
    serverClientId: Env.googleApiKey,
  );

  runApp(
    ProviderScope(
      child: CineboxMainApp(),
    ),
  );
}

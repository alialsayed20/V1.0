import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/app_bootstrap.dart';

Future<void> main() async {
  final ProviderContainer container = await AppBootstrap.initialize();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const BoodeApp(),
    ),
  );
}
import 'package:flutter/material.dart';

import 'package:boode/gen_l10n/app_localizations.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
      ),
      body: Center(
        child: Text(
          l10n.homeTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
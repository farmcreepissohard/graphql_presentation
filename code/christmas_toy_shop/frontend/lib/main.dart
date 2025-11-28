import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/router/app_router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Christmas toy shop',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFEF2F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffE7000B),
          primary: const Color(0xffE7000B),
          secondary: const Color(0xff00A63E),
        ),
        primaryColor: const Color(0xffE7000B),
        dividerColor: const Color(0xffFFC9C9),
      ),
      routerConfig: ref.watch(appRouterProvider),
    );
  }
}

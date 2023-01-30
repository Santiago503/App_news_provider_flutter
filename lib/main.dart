import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/theme/theme.dart';
import 'package:provider/provider.dart';

import 'pages/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme,
          title: 'News App Providers',
          home: const TabsPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';
import '../widgets/list_news.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
        body: (newsService.headlines.isEmpty)

        ? const Center( child: CircularProgressIndicator(), )
        
        : ListNews(newsService.headlines),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

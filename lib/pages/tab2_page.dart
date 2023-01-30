import 'package:flutter/material.dart';
import 'package:news_provider/models/category.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/theme/theme.dart';
import 'package:news_provider/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

     final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              
              _ListCategory(),

              Expanded(
                child: ListNews(newsService.getArticleCategorySelected)
              )

            ],
          )),
    );
  }
}

class _ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context);

    return Container(
      width: double.infinity,
      height: 80,color: Colors.red,
      child: ListView.builder(
        
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.category.length,
          itemBuilder: (context, index) {
    
            String cName = categories.category[index].name;
            cName = cName[0].toUpperCase() + cName.toLowerCase().substring(1);
    
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
    
                    _CategoryBotton(categories.category[index]),
    
                    const SizedBox(height: 5),
    
                    Text(cName),
    
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  const _CategoryBotton(this.categories);

  final Category categories;

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(

      onTap: (() {

        newsService.selectedCategory = categories.name;

      }),

      child: Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categories.icon,
          color: newsService.selectedCategory == categories.name ? MyTheme.primaryColor : Colors.black54,
        ),

      ),
    );
  }
}

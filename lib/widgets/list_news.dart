import 'package:flutter/material.dart';
import 'package:news_provider/models/new_models';
import 'package:news_provider/theme/theme.dart';

class ListNews extends StatelessWidget {
  
  final List<Article> news;
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,

      itemBuilder: (context, index) {

        return _News(news: news[index], index: index);

      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({Key? key, required this.news, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          
          _CardTopBar(index: index, news: news), 
    
          _CardTitle(news: news),
    
          _Cardimage(news: news),
    
          _CardBody(news: news),
    
          const _CardBottoms(),
    
        ],
    );
  }
}


class _CardBottoms extends StatelessWidget {

  const _CardBottoms({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          RawMaterialButton(
            onPressed: () {},
            fillColor: MyTheme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon( Icons.star_border ),
          ),

          const SizedBox(width: 10),

          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon( Icons.more ),
          ),



        ],
      ),
    );
  }
}


class _CardBody extends StatelessWidget {

  final Article news;
  const _CardBody({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text( (news.description !=null) ? news.description! :  '' ),
    );
  }
}


class _Cardimage extends StatelessWidget {
  final Article news;
  const _Cardimage({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
        child: (news.urlToImage != null )

          ? FadeInImage(
            placeholder: const AssetImage('assets/img/giphy.gif'),
            image: NetworkImage( news.urlToImage! ),
          )

          : const Image(image: AssetImage('assets/img/no-image.png')),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article news;

  const _CardTitle({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: Text( news.title, style: const TextStyle( fontSize: 10, fontWeight: FontWeight.w700 ), ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article news;
  final int index;

  const _CardTopBar({Key? key, required this.news, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget> [

            Text('${index + 1}', style: TextStyle(color: MyTheme.primaryColor)),

            Expanded(child: Text(news.title, style: TextStyle(color: MyTheme.primaryColor)))
          ],
        )
        
      );
  }
}

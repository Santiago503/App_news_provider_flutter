import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider/models/category.dart';
import 'package:news_provider/models/new_models';

const _BASE_URL = 'newsapi.org';
const _APINEW = '791b66d1d51242a084222e6fe8701020';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectcategory = 'business';

  List<Category> category = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  get getArticleCategorySelected => categoryArticles[selectedCategory];

  String get selectedCategory => _selectcategory;

  set selectedCategory(String value) {
    _selectcategory = value;

    getArticleByCategory(value);

    notifyListeners();
  }

  NewsService() {
    getTopHeadlines();

    for (var element in category) {
      categoryArticles[element.name] = List.empty(growable: true);
    }
    getArticleByCategory(_selectcategory);
  }

  getTopHeadlines() async {
    final url = Uri.https(
        _BASE_URL, '/v2/top-headlines', {'apiKey': _APINEW, 'country': 'co'});
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticleByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final url = Uri.https(_BASE_URL, '/v2/top-headlines',
        {'apiKey': _APINEW, 'category': category, 'country': 'co'});

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category] = newsResponse.articles;
    notifyListeners();
  }
}

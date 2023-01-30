import 'package:flutter/material.dart';
import 'package:news_provider/pages/tab1_page.dart';
import 'package:news_provider/pages/tab2_page.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);
  //791b66d1d51242a084222e6fe8701020
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
        currentIndex: navigationModel.pageCurrent,
        onTap: (i) => navigationModel.pageCurrent = i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para Ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezado'),
        ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        
        const Tab1Page(),

        const Tab2Page(),
        
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier {
  int _pageCurrent = 0;
  int get pageCurrent => _pageCurrent;

  set pageCurrent(int value) {
    _pageCurrent = value;

    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceIn);

    notifyListeners();
  }

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
}

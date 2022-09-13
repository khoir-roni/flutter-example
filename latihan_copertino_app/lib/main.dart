import 'package:flutter/cupertino.dart';
import 'package:latihan_copertino_app/screens/feed_page.dart';
import 'package:latihan_copertino_app/screens/search_page.dart';
import 'package:latihan_copertino_app/screens/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      //Parameter tabBar berisi widget CupertinoTabBar yang menampilkan item tab.
      tabBar: CupertinoTabBar(items: [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.news),
      label: 'Feeds',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      label: 'Settings',
    ),]),
    //Parameter tabBuilderberisi fungsi untuk menampilkan halaman berdasarkan indeks tab yang dipilih
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return FeedsPage();
          case 1:
            return SearchPage();
          case 2:
            return SettingsPage();
          default:
            return Center(
              child: Text('Page not found!'),
            );
        }
      },
    );

  }
}

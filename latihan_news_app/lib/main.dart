import 'package:flutter/material.dart';
import 'data/model/article.dart';
import 'data/model/article_result.dart';
import 'ui/article_detail_page.dart';
import 'ui/home_page.dart';
import 'theme/styles.dart';
import 'ui/article_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.black,
                secondary: secondaryColor,
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            //untuk mengubah tema tombol
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
            ), // border button 0
          ),
          appBarTheme: const AppBarTheme(elevation: 0),
          textTheme: myTextTheme, // tambahkan myTextTheme sebagai parameter
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: HomePage.routeName, // halaman awal
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ), // tambahkan route ke halaman articleDetailPage
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments
                as String) // daftarkan route navigasi
      },
    );
  }
}

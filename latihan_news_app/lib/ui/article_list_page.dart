import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../theme/styles.dart';
import '../widgets/platform_widget.dart';

import '../data/model/article_result.dart';
import '../widgets/card_article.dart';
import 'article_detail_page.dart';

class ArticleListPage extends StatefulWidget {
  static const routeName = '/article_list';
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late Future<ArticlesResult> _article;
  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();

  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOs,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIOs(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        /*agar setiap kita membuka tab dengan navigation bar tersebut tidak membuat route atau halaman baru. Tujuannya adalah agar tidak ada tag hero yang duplikat karena ada halaman baru.*/
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.articles[index];
                return CardArticle(article: article!);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Material(
                child: Text(snapshot.error.toString()),
              ),
            );
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }

}
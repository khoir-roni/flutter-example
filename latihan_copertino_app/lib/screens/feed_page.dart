import 'package:flutter/cupertino.dart';

import 'category_page.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Feeds Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Page',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            const SizedBox(height: 8),
            //tambahkan button
            CupertinoButton.filled(
              child: const Text('Select Category'),
              onPressed: () {
                popUpMenu(context);
              },
            ),
          ],
        ),
      ),
    );
  }

//Kita akan tampilkan action sheet ketika button diklik. Action sheet adalah komponen iOS yang memberikan dua atau lebih pilihan terhadap pengguna. Flutter telah menyediakan fungsi untuk menampilkannya. Tambahkan kode berikut di dalam parameter onPressed.
  Future<dynamic> popUpMenu(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('Select Categories'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          CategoryPage(selectedCategory: 'Technology'),
                    ),
                  );
                },
                child: const Text('Technology'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          CategoryPage(selectedCategory: 'Business'),
                    ),
                  );
                },
                child: const Text('Business'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          CategoryPage(selectedCategory: 'Sport'),
                    ),
                  );
                },
                child: const Text('Sport'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        });
  }
}

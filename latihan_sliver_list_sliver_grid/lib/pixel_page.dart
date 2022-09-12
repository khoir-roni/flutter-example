import 'package:flutter/material.dart';
import 'package:latihan_sliver_list_sliver_grid/strings.dart';

class PixelPage extends StatelessWidget {
  const PixelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true, // membuat appbar seperti defaul ketika di scroll
                expandedHeight: 200, // ukuran maximal dari appbar
                flexibleSpace: FlexibleSpaceBar(
                  // untuk menampilkan antarmuka
                  background: Image.asset(
                    "assets/pixel_google.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                  title: Text('Google pixel'),
                  titlePadding: const EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$735',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Container(
                        color: Colors.black26,
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.collections,
                              color: Colors.white,
                            ),
                            Text(
                              '6 photos',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Stock hanya 5 buah',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Table(
                    columnWidths: {
                      1: FractionColumnWidth(0.7)
                    }, //digunakan untuk menentukan lebar colum
                    // border: TableBorder.all(
                    //   color: Colors.black,
                    //   // width: 1.0,
                    // ),
                    children: const [
                      TableRow(
                        children: [
                          Text('Display'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(contentSpecsDisplay),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Size'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(contentSpecsSize),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Battery'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(contentSpecsBattery),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

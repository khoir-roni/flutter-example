import 'package:flutter/material.dart';
import 'package:latihan_sliver_list_sliver_grid/models/akademy.dart';

import '../screens/sliver_appbar.dart';

class LearningPathList extends StatelessWidget {
  const LearningPathList({Key? key}) : super(key: key);
  //mari kita buat dulu widget yang berperan sebagai header ketika scrolling. Di dalam LearningPathList tambahkan fungsi yang akan mengembalikan widget SliverPersistentHeader.
  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      //Parameter delegate harus diisi dengan kelas SliverPersistentHeaderDelegate
      delegate: SliverAppBarDelegate(
        minHeight: 60,
        maxHeight: 150,
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // tambahkan header ke dalam CustomScrollView
      slivers: [
        _header('Android Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            androidPaths.map(_buildTile).toList(),
          ),
        ),
        _header('iOS Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            iosPaths.map(_buildTile).toList(),
          ),
        ),
        _header('Multi-Platform App Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: flutterPaths.map(_buildTile).toList(),
        ),
        _header('Front-End Web Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: webPaths.map(_buildTile).toList(),
        )
      ],
    );
  }

//metode _buildTile()untuk menampilkan setiap item ke dalam ListTile.
  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(
        academy.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }
}

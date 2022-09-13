import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  // buat implementasi dari SliverPersistentHeaderDelegate
  //Tambahkan dulu beberapa variabel dan buat constructor-nya.
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

//Tambahkan ketiga properti tersebut ke dalam override method.
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

//Method terakhir berisi apakah widget perlu dibangun ulang. Karena itu lakukan pengecekan apakah terdapat perubahan properti
  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

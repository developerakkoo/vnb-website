import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animate_do/animate_do.dart';

class GalleryDesktop extends StatefulWidget {
  const GalleryDesktop({super.key});

  @override
  State<GalleryDesktop> createState() => _GalleryDesktopState();
}

class _GalleryDesktopState extends State<GalleryDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "G A L L E R Y",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: MasonryGridView.builder(
          itemCount: 6,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInDown(
                    child: Image.asset('assets/images/${index + 1}.jpg')),
              )),
    );
  }
}

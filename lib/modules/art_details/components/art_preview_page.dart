import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/artwork/artwork.dart';

class ArtPreviewPage extends StatelessWidget {
  const ArtPreviewPage({
    Key? key,
    required this.artwork,
  }) : super(key: key);
  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        children: [
          InteractiveViewer(
            child: Center(
              child: Hero(
                tag: artwork.id!,
                child: Image.network(artwork.imgUrl!),
              ),
            ),
          ),
          SafeArea(
              child: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.clear, color: Colors.white),
          ))
        ],
      ),
    );
  }
}

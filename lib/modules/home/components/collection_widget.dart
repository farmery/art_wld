import 'package:art_wld/models/artwork/artwork.dart';
import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({
    Key? key,
    required this.collection,
    required this.collectionName,
  }) : super(key: key);
  final List<Artwork> collection;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final styles = TextStyles();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(children: [
        ...List.generate(
          collection.length,
          (i) {
            final Artwork artwork = collection[i];
            return Center(
              child: Transform.rotate(
                angle: -(3.142 * ((i - 2) * -100)),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(artwork.imgUrl!),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1.0, 2.0),
                        blurRadius: 4.0,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  //TODO: add device width
                  width: (MediaQuery.of(context).size.width - 20) - (i * 10),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/splash_img.png',
                    image: artwork.thumbnail!,
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 34,
          bottom: 16,
          child: Text(
            collectionName,
            style: styles.bodyLight.copyWith(
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 10.0,
                  color: Colors.black26,
                ),
                const Shadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 25.0,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

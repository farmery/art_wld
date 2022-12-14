import 'package:animate_do/animate_do.dart';
import 'package:art_wld/modules/art_details/art_details_page.dart';
import 'package:flutter/widgets.dart';
import '../../../global_widgets/jiggle_controller.dart' as jiggle;
import '../../../models/artwork/artwork.dart';

class ArtworkItemWidget extends StatelessWidget {
  const ArtworkItemWidget({Key? key, required this.artwork}) : super(key: key);
  final Artwork artwork;
  @override
  Widget build(BuildContext context) {
    return jiggle.Bounce(
      duration: const Duration(milliseconds: 200),
      onPressed: () {
        Navigator.push(context, ArtDetailsPage.route(artwork));
      },
      child: FadeIn(
        duration: const Duration(milliseconds: 2000),
        child: Hero(
          tag: artwork.id!,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images/placeholder.png'),
            image: NetworkImage(artwork.thumbnail!),
          ),
        ),
      ),
    );
  }
}

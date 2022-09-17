import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/artwork/artwork.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/text_styles.dart';

class ArtDescriptionContainer extends StatelessWidget {
  const ArtDescriptionContainer({
    Key? key,
    required this.artwork,
  }) : super(key: key);
  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    final styles = TextStyles();
    final colors = AppColors();
    final currency = NumberFormat("#,##0.00", "en_US");

    return SlideInUp(
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 500),
      animate: true,
      from: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(artwork.user!.profileImage!.small!),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      artwork.user?.name ?? 'Jack Ifeanyi',
                      style: styles.tileTitle,
                    )
                  ],
                ),
                Pulse(
                  delay: const Duration(milliseconds: 300),
                  animate: true,
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colors.accent,
                    ),
                    alignment: Alignment.center,
                    child: Text('Follow', style: styles.bodyLight),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              artwork.description ?? 'City of Bones',
              style: styles.largeText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              'This work is a fantastical, environmental machete consisting of drab, cluttered office which is reminiscent of the subject-object hierarchy being destabilized.',
              style: styles.body,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${'\$'}${currency.format(artwork.price)}',
                  style: styles.title),
            ),
            SizedBox(
              height: 100 + MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}

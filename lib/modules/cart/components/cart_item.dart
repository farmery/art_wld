import 'package:art_wld/modules/art_details/art_details_page.dart';
import 'package:art_wld/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../models/artwork/artwork.dart';
import '../cart_vm.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem({
    Key? key,
    this.onDelete,
    required this.artwork,
    required this.cartVm,
  }) : super(key: key);

  final Artwork artwork;
  final CartVm cartVm;
  final VoidCallback? onDelete;

  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
    final cartVm = ref.read(cartVmProvider.notifier);
    final currency = NumberFormat("#,##0.00", "en_US");
    final styles = TextStyles();

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(context, ArtDetailsPage.route(widget.artwork));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag: widget.artwork.id!,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: NetworkImage(widget.artwork.thumbnail!),
                      image: NetworkImage(widget.artwork.imgUrl!),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      widget.onDelete!();
                      cartVm.removeItemFromCart(widget.artwork);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(CupertinoIcons.delete, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    widget.artwork.description ?? 'City of Bones',
                    style: styles.titleLight,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${'\$'}${currency.format(widget.artwork.price)}',
                  style: styles.title),
            ),
          ],
        ),
      ),
    );
  }
}

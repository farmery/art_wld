import 'package:animate_do/animate_do.dart';
import 'package:art_wld/global_widgets/btn.dart';
import 'package:art_wld/models/artwork/artwork.dart';
import 'package:art_wld/modules/cart/cart_view.dart';
import 'package:art_wld/modules/cart/cart_vm.dart';
import 'package:art_wld/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'components/art_description_container.dart';
import 'components/art_preview_page.dart';

class ArtDetailsPage extends ConsumerStatefulWidget {
  const ArtDetailsPage({Key? key, required this.artwork}) : super(key: key);
  final Artwork artwork;

  static Route route(Artwork artwork) => PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: ArtDetailsPage(artwork: artwork),
          );
        },
      );
  @override
  ConsumerState<ArtDetailsPage> createState() => _ArtDetailsPageState();
}

class _ArtDetailsPageState extends ConsumerState<ArtDetailsPage> {
  late AnimationController pulseController;
  late AnimationController spinController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final cart = ref.watch(cartVmProvider);
    final checkedout = cart.contains(widget.artwork);
    return Scaffold(
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: ElasticInRight(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 800),
          from: MediaQuery.of(context).size.width,
          child: Btn(
            onTap: () {
              if (checkedout) {
                Navigator.push(context, CartView.route);
                return;
              }
              addToCart(widget.artwork);
            },
            label: 'Add to Cart',
            icon: checkedout
                ? Spin(
                    manualTrigger: true,
                    spins: 2,
                    controller: (controller) => spinController = controller,
                    child: Pulse(
                      manualTrigger: true,
                      controller: (controller) => pulseController = controller,
                      infinite: false,
                      duration: const Duration(milliseconds: 400),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: colors.white,
                      ),
                    ),
                  )
                : null,
            width: checkedout ? 50 : MediaQuery.of(context).size.width - 32,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.48,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: const [StretchMode.zoomBackground],
              background: Hero(
                tag: widget.artwork.id!,
                child: GestureDetector(
                  onTap: () {
                    previewArt(widget.artwork);
                  },
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage('assets/images/placeholder.png'),
                    image: NetworkImage(widget.artwork.imgUrl!),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: ArtDescriptionContainer(artwork: widget.artwork),
          ),
        ],
      ),
    );
  }

  addToCart(Artwork item) async {
    final cartVm = ref.watch(cartVmProvider.notifier);
    cartVm.addItemToCart(item);
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      pulseController.forward();
    }
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      spinController.forward();
    }
  }

  previewArt(Artwork artwork) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (_, a, a2) {
          return FadeTransition(
              opacity: a, child: ArtPreviewPage(artwork: artwork));
        },
      ),
    );
  }
}

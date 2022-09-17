import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:art_wld/global_widgets/btn.dart';
import 'package:art_wld/modules/home/home_vm.dart';
import 'package:art_wld/utils/app_colors.dart';
import 'package:art_wld/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import '../cart/cart_view.dart';
import 'components/artwork_item.dart';
import 'components/collection_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    final FeaturedArtVm featuredArtVm =
        ref.read(featuredArtVmProvider.notifier);
    featuredArtVm.getFeaturedArtworks(0);
    ref.read(collectionsControllerProvider.notifier).getCollection();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final styles = TextStyles();
    final collections = ref.watch(collectionsControllerProvider);

    return Scaffold(
      floatingActionButton: BounceInRight(
        duration: const Duration(milliseconds: 500),
        delay: const Duration(microseconds: 500),
        from: 100,
        child: Btn(
          width: 50,
          label: '',
          onTap: () {
            Navigator.push(context, CartView.route);
          },
          icon: Icon(Icons.shopping_bag_outlined, color: colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.menu),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SpinPerfect(
                          spins: 1,
                          delay: const Duration(milliseconds: 1200),
                          infinite: false,
                          animate: true,
                          duration: const Duration(milliseconds: 300),
                          child: Hero(
                            tag: 'logo',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                'ArtWld',
                                style: styles.largeText,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 40,
                            child: Lottie.asset('assets/images/artwld.json'))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
                child: Builder(
                  builder: (_) {
                    if (collections == null) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(color: colors.offWhite),
                      );
                    }
                    return CollectionWidget(
                      collectionName: 'Best of Abstract',
                      collection: collections,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured',
                      style: styles.bodyBold,
                    ),
                    const SizedBox(height: 16),
                    Builder(
                      builder: (_) {
                        final artworks = ref.watch(featuredArtVmProvider);
                        if (artworks == null) {
                          return StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            children: List.generate(
                              10,
                              (index) => Flash(
                                delay: Duration(
                                  milliseconds: Random().nextInt(200),
                                ),
                                duration: const Duration(seconds: 2),
                                infinite: true,
                                child: Container(
                                  height: 150 + (index * 15),
                                  color: colors.offWhite,
                                ),
                              ),
                            ),
                          );
                        }
                        return StaggeredGrid.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: List.generate(
                            artworks.length,
                            (index) {
                              final artwork = artworks[index];
                              return ArtworkItemWidget(artwork: artwork);
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

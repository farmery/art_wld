import 'package:art_wld/modules/auth/auth_controller.dart';
import 'package:art_wld/modules/home/home.dart';
import 'package:art_wld/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global_widgets/btn.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    return Builder(
      builder: (_) {
        if (user == null) {
          return const AuthPageContainer();
        }
        return const Home();
      },
    );
  }
}

class AuthPageContainer extends StatefulWidget {
  const AuthPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPageContainer> createState() => _AuthPageContainerState();
}

class _AuthPageContainerState extends State<AuthPageContainer> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.push(context, AuthPageRoute.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class AuthPageRoute extends ConsumerWidget {
  const AuthPageRoute({Key? key}) : super(key: key);

  static Route route = PageRouteBuilder(
    opaque: false,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(opacity: animation, child: const AuthPageRoute());
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = TextStyles();
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash_img.png'),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.5),
              child: Hero(
                  tag: 'logo', child: Text('ArtWld', style: styles.largeText)),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16 + MediaQuery.of(context).padding.bottom,
            child: Btn(
              label: 'Get Started',
              onTap: () {
                final authController =
                    ref.read(authControllerProvider.notifier);
                authController.loginUser();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

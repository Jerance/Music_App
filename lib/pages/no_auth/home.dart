import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/pages/no_auth/Login.dart';
import 'package:music_app/pages/no_auth/SignUp.dart';

import 'package:music_app/utils/translate.dart';
import 'package:music_app/models/silder_home.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class HomeWithNoAuthPage extends StatefulWidget {
  const HomeWithNoAuthPage({Key? key}) : super(key: key);
  @override
  _HomeWithNoAuthPageState createState() => _HomeWithNoAuthPageState();
}

class _HomeWithNoAuthPageState extends State<HomeWithNoAuthPage> {
  bool _isPlayingSlide = false;

  final List<IconData> _icons = [
    Icons.pause_circle_filled,
    Icons.play_circle_fill,
  ];

  void pause() {
    pausePlay = false;
  }

  void play() {
    pausePlay = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColorDark,
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'lib/assets/img/logoMusicApp.png',
                    height: 75,
                    width: 75,
                  ),
                ),
                Text(t(context)!.nomApplication, style: mainTitle),
              ],
            ),
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                  height: 250.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  animateToClosest: true,
                  autoPlay: pausePlay,
                  autoPlayInterval: const Duration(seconds: 10),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: slidesImage.length,
                itemBuilder: (context, index, realIndex) {
                  final url = slidesImage[index];
                  final textSlides = textSlidesImage[index];
                  return buildImage(url, index, textSlides);
                },
              ),
              buildIndicator(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: previous,
                      icon: SvgPicture.asset(
                        "lib/assets/img/icons/backward-solid.svg",
                        color: mainColorLight,
                        width: 25,
                      )),
                  ButtonBar(
                    children: [
                      if (_isPlayingSlide == false)
                        (IconButton(
                            iconSize: 75,
                            icon: Icon(_icons[0]),
                            color: gold,
                            onPressed: () {
                              pause();
                              setState(() {
                                _isPlayingSlide = true;
                              });
                            }))
                      else
                        (IconButton(
                            iconSize: 75,
                            icon: Icon(_icons[1]),
                            color: gold,
                            onPressed: (() {
                              play();
                              setState(() {
                                _isPlayingSlide = false;
                              });
                            })))
                    ],
                  ),
                  IconButton(
                      onPressed: next,
                      icon: SvgPicture.asset(
                        "lib/assets/img/icons/forward-solid.svg",
                        width: 25,
                        color: mainColorLight,
                      )),
                ],
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              style: btnSignUp,
              child: Text(t(context)!.inscription, style: p1),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: btnLogin,
                child: Text(t(context)!.connection, style: p1gold)),
          ],
        ));
  }
}

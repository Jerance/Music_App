import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:music_app/assets/theme/colors.dart';
import 'package:music_app/assets/font/font.dart';

int activeIndex = 0;
int fabIconNumber = 0;
final controller = CarouselController();
bool pausePlay = true;

final slidesImage = [
  "lib/assets/img/illustrations/undraw_audio_player_re_cl20.svg",
  "lib/assets/img/illustrations/undraw_listening_re_c2w0.svg",
  "lib/assets/img/illustrations/undraw_media_player_re_rdd2.svg",
  "lib/assets/img/illustrations/undraw_meditating_re_aiqa.svg",
  "lib/assets/img/illustrations/undraw_social_interaction_re_dyjh.svg",
];

final textSlidesImage = [
  "Bienvenue sur ",
  "Application de streaming musique gratuit",
  "Découvrez l'application",
  "Côté Social Interaction",
  "Découvrez l'application",
];

Widget buildImage(String url, int index, String text) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          SvgPicture.asset(
            url,
            width: 380,
            height: 179,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text, style: textSlides),
          )
        ]);

Widget buildIndicator() => AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      activeIndex: activeIndex,
      count: slidesImage.length,
      effect: const WormEffect(dotColor: goldFullLight, activeDotColor: gold),
    );

void previous() {
  controller.previousPage();
}

void next() {
  controller.nextPage();
}

void animateToSlide(int index) => controller.animateToPage(index);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class BeautyTips extends StatelessWidget {
  const BeautyTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = (MediaQuery.of(context).size.height)-60;
    return SafeArea(
      child: Scaffold(
        backgroundColor: homebackgroundcolor,
        body: Column(
          children: [
            /// header
            header(
              context: context,
              navbartxt: "Beauty Tips Description",
            ),
            Container(
              height: screenheight*0.7,
              width: screenwidth,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Text(
                        'Beauty Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreenbeautyimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'For dull, oily and combination skin',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Massage the skin with iced yoghurt and sprinkle some sugar along with it. Now take orange halves and scrub gently until the granules melt. Wash the face with iced water and see the difference.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "For dull, tired and dry skin",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Massage the skin with papaya. Then make a scrub by mixing oats and honey along with a little cold milk and scrub the skin. Wash off with ice cold milk and water and pat dry.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Suffering from frizzy hair",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Try this simple, quick and easy-to-make spray. Take slices of two lemon and simmer in two cups of water until it reduces to half the amount. Pour the liquid into a spritz bottle and spray on your hair. Not only will there be a wonderful natural sheen but static and fly away hair will be gone!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "For natural hair colour",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "If you have a brownish tinge in your hair and don\'t have the time to henna or colour it, then take a few sprigs of rosemary from the kitchen shelf and simmer them in 2 cups of water along with 2 tsp black tea until it reduces to half the quantity. Mix with 1/4cup of shampoo and every time you shampoo, use this mixture. Leave the shampoo in your hair for about 15 minutes and see the difference it makes.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "For a smooth back",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Planning to wear a low back blouse, backless dress or choli, but have no time to go in for a body scrub to show off a smooth back? Here\'s a quick home remedy. Take 1 cup of sea salt and mix it with half a cup of olive oil. Add 5 drops of sandalwood oil and mix well. Store in a jar and scrub the areas of your body you want to flaunt. Wipe off with a wet towel.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Sixth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Dealing with under eye bags and dark circles",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Take used chamomile tea bags and store them in the freezer. Grate half a cucumber and massage around eye area and then lie down with the tea bags on your eyes for 10 minutes.You will find an instant difference in the way your eyes look and feel.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Seventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Instant face lift",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Wash your face with ice water or simply rub and ice cube with a tsp of honey on the face. Beat an egg white until it peaks and brush onto your skin and let dry. You will feel the stretch in the skin. wash face with icy cold water.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eight Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Quick Hair Care",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Don\'t have the time to shampoo and blow dry your hair even though it is oily? Well, sweat not. Sprinkle talcum and amla powder onto your hair brush and overturn the hair over your head and brush from the nape of the neck to the tips .Now throw your hair back and voila you have bouncy oil free hair in minutes! So these are just a few of my secret \'insta\' beauty recipes. Use them and enjoy but never substitute them for a regular skin and hair care regime.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.asset(homepageimage,
                fit: BoxFit.cover,),
            ),
          ],
        ),
      ),
    );
  }
}

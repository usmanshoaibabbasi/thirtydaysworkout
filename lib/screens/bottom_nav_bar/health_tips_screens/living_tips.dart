import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class LivingTips extends StatelessWidget {
  const LivingTips({Key? key}) : super(key: key);

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
              navbartxt: "Living Tips Description",
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
                        'Livings Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreenlivingimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'Take a Tailgate Time Out',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "It\'s an all-American past-time -- the tailgate party! Tailgating today has progressed far beyond burgers and chips. You\'ll find everything from cheese dip to spicy chicken wings. Don\'t despair: Your tailgate spread doesn\'t have to sideline your weight loss plan. Grilled kabobs are great fare on the field. Just skewer veggies, fruits, and lean meat, and soak in your favorite marinade. Seafood, salsas, wraps, and stews are good eating, too. A Crock-Pot of chili -- loaded with high-fiber, high-protein beans -- is a classic tailgate dish (don\'t forget the Beano). Just remember, alcohol is packed with calories. Enjoy your favorite brew, but switch it out for zero-calorie beverages as the party rolls along. It\'s all in how you play the game!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "Sleep Tips to Help Kid\'s Weight",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Does your child get enough sleep? If not, it could affect more than sleepiness at school. Studies suggest there may be a link between skimping on sleep and being overweight. Sleep shortfalls may increase hunger hormones -- so kids eat more. Also, kids are less likely to get exercise (and burn off calories) when they\'re tired. To help kids and teens get a good night\'s sleep: Remove TVs, computers, and gadgets from kids\' bedrooms. Avoid large meals before bedtime. Develop a regular bedtime routine. Set firm bedtimes and wake times. Make sure the bedroom is quiet, dark, relaxing -- and not too hot or cold. Help kids quiet down a few hours before bedtime. Heavy studying, text messaging, or video games should end in early evening. How much sleep do schoolkids need? It depends on the child. But here are some general guidelines from the National Sleep Foundation: Ages 3-5: 11-13 hours Ages 5-12: 10-11 hours Ages 11-17: 9.5-9.25 hours",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Quit Smoking",
                          style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "If you\'ve finally decided to kick the habit, there\'s good news: Quitting smoking won\'t make you gain weight over the long term. Some people pick up 4 or 5 pounds early on, but that\'s only temporary. To quit successfully, experts agree, get help and support from your doctor, family, friends, and co-workers. A doctor or mental health professional can help you tailor an approach that best suits you. There are many FDA-approved medications to help people quit smoking. Combine medication with other quit strategies -- like avoiding your smoking triggers or changing your daily routine -- and you greatly increase your odds of quitting for good. Another tip: Some foods and drinks make cigarettes taste better; some make them taste worse. Try eating more vegetables and less meat -- and swap that coffee (or alcohol) for a glass of milk. Let your taste buds stifle those cravings!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Holiday Game Plan",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "The challenges of holiday feasting are only too obvious -- wonderful smells and fabulous tastes. We do love our comfort food! But the traditional holiday weight gain is another matter. If it\'s a real problem for you, here\'s good news. With a few simple changes, you can enjoy the feast without gaining the extra 1 to 3 pounds that tend to become permanent baggage. Here\'s your plan: Don\'t arrive starving. Eat something small and healthy, like oatmeal or a whole-grain sandwich, before the big meal. That will keep you full until dinner. Exercise every day. This means big holidays, too. Get the family out with you. Start a new holiday tradition that involves activity. Establish ground rules with yourself. Eat dessert, but only a sliver, for example. Keep track. Write down everything you eat. If you put it in writing, you\'re less tempted to overeat. Eat smaller portions of high-calorie dishes. Enjoy, but don\'t pig out. Save calories for the foods you love. Don\'t eat something just because it\'s there. Chat more, eat less. Shun those high-fat appetizers at holiday parties. If you know you\'ll have trouble resisting those favorite foods, plan for it. Cut back on eating early in the week. Get more exercise before and after the holidays. You can do this!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Exercise Your Brain",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "You know your heart benefits from exercise. Your brain does, too. Studies show that regular, moderate exercise — 30 minutes of walking or a light one-mile run -- helps fight the effects of aging on the brain. No grueling workouts required! All types of exercise count, including walking, bicycling, hiking, swimming, aerobics, and weight training. Ballroom dancing is another good one, especially fun on chilly evenings. How does exercise work to prevent mental decline? Researchers believe exercise may stimulate the body to fight stress that\'s normally occurring in the brain -- stress that causes oxidative damage. All that good stuff from a little exercise!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Sixth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Get More Sleep",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Sleep needs differ, but if you have trouble getting out of bed, tire easily, or have trouble concentrating, you likely aren\'t getting enough. Recent studies suggest this can put you at greater risk of heart disease and psychological problems",
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


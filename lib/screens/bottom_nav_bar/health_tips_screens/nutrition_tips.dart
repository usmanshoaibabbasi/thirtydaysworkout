import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class NutritionTips extends StatelessWidget {
  const NutritionTips({Key? key}) : super(key: key);

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
              navbartxt: "Nutrition Tips Description",
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
                        'Health And Nutrition Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreennutritionimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'Don’t Drink Sugar Calories',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Sugary drinks are the most fattening things you can put into your body. This is because liquid sugar calories don’t get registered by the brain in the same way as calories from solid foods (1). For this reason, when you drink soda, you end up eating more total calories (2, 3). Sugary drinks are strongly associated with obesity, type 2 diabetes, heart disease and all sorts of health problems (4, 5, 6, 7). Keep in mind that fruit juices are almost as bad as soda in this regard. They contain just as much sugar, and the small amounts of antioxidants do NOT negate the harmful effects of the sugar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "Eat Nuts",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Despite being high in fat, nuts are incredibly nutritious and healthy. They are loaded with magnesium, vitamin E, fiber and various other nutrients (9). Studies show that nuts can help you lose weight, and may help fight type 2 diabetes and heart disease (10, 11, 12). Additionally, about 10–15% of the calories in nuts aren’t even absorbed into the body, and some evidence suggests that they can boost metabolism (13). In one study, almonds were shown to increase weight loss by 62% compared to complex carbohydrates (14).",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Avoid Processed Junk Food",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "All the processed junk foods in the diet are the biggest reason the world is fatter and sicker than ever before. These foods have been engineered to be “hyper-rewarding,” so they trick our brains into eating more than we need, even leading to addiction in some people (15). They are also low in fiber, protein and micronutrients (empty calories), but high in unhealthy ingredients like added sugar and refined grains.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Don’t Fear Coffee",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Coffee has been unfairly demonized. The truth is that it’s actually very healthy. Coffee is high in antioxidants, and studies show that coffee drinkers live longer, and have a reduced risk of type 2 diabetes, Parkinson’s disease, Alzheimer’s and numerous other diseases",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Eat Fatty Fish",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Pretty much everyone agrees that fish is healthy. This is particularly true of fatty fish, like salmon, which is loaded with omega-3 fatty acids and various other nutrients (22). Studies show that people who eat the most fish have a lower risk of all sorts of diseases, including heart disease, dementia and depression",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Sixth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Take Care of Your Gut Health With Probiotics and Fiber",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "The bacteria in your gut, collectively called the gut microbiota, are sometimes referred to as the “forgotten organ.” These gut bugs are incredibly important for all sorts of health-related aspects. A disruption in the gut bacteria is linked to some of the world’s most serious chronic diseases, including obesity (31, 32). A good way to improve gut health, is to eat probiotic foods (like live yogurt and sauerkraut), take probiotic supplements, and eat plenty of fiber. Fiber functions as fuel for the gut bacteria",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Seventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Drink Some Water, Especially Before Meals",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Drinking enough water can have numerous benefits. One important factor, is that it can help boost the amount of calories you burn. According to 2 studies, it can boost metabolism by 24–30% over a period of 1–1.5 hours. This can amount to 96 additional calories burned if you drink 2 liters (67 oz) of water per day (35, 36). The best time to drink water is half an hour before meals. One study showed that half a liter of water, 30 minutes before each meal, increased weight loss by 44%",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eight Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Take Vitamin D3 if You Don’t Get Much Sun",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Back in the day, most people got their vitamin D from the sun. The problem is that most people don’t get much sun these days. They either live where there is no sun, or they stay inside most of the day or use sunscreen when they go out. According to data from 2005-2006, about 41.6% of the US population is deficient in this critical vitamin (43). If adequate sun exposure is not an option for you, then supplementing with vitamin D has been shown to have numerous benefits for health. This includes improved bone health, increased strength, reduced symptoms of depression and a lower risk of cancer, to name a few. Vitamin D may also help you live longer",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Ninth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Eat Vegetables and Fruits",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Vegetables and fruits are the “default” health foods, and for good reason. They are loaded with prebiotic fiber, vitamins, minerals and all sorts of antioxidants, some of which have potent biological effects. Studies show that people who eat the most vegetables and fruits live longer, and have a lower risk of heart disease, type 2 diabetes, obesity and all sorts of diseases",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Tenth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Make Sure to Eat Enough Protein",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Eating enough protein is incredibly important, and many experts believe that the recommended daily intake is too low. Protein is particularly important for weight loss, and works via several different mechanisms (53). A high protein intake can boost metabolism significantly, while making you feel so full that you automatically eat fewer calories. It can also cut cravings and reduce the desire for late-night snacking (54, 55, 56, 57). Eating plenty of protein has also been shown to lower blood sugar and blood pressure levels",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eleventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Use Extra Virgin Olive Oil",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Extra virgin olive oil is the healthiest fat on the planet. It is loaded with heart-healthy monounsaturated fats and powerful antioxidants that can fight inflammation (63, 64, 65). Extra virgin olive oil leads to many beneficial effects on heart health, and people who consume olive oil have a much lower risk of dying from heart attacks and strokes",
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

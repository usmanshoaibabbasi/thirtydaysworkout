import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class PregnancyTips extends StatelessWidget {
  const PregnancyTips({Key? key}) : super(key: key);

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
              navbartxt: "Pregnancy Tips Description",
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
                        'Pregnancy Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreenpregnancyimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'Staying Healthy During Pregnancy',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "If you\'re thinking about getting pregnant -- or if you already are -- you probably know some of the basics about taking care of yourself and the baby. Don\'t smoke. Don\'t drink. Get your rest. Here are more tips, from taking vitamins to what to do with the kitty litter, that can help ensure a safe and healthy pregnancy.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "Take a Prenatal Vitamin",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Even when you\'re still trying to conceive, it\'s smart to start taking prenatal vitamins. Your baby\'s neural cord, which becomes the brain and spinal cord, develops within the first month of pregnancy, so it\'s important you get essential nutrients, like folic acid, calcium, and iron, from the very start. Prenatal vitamins are available over the counter at most drug stores, or you can get them by prescription from your doctor. If taking them makes you feel queasy, try taking them at night or with a light snack. Chewing gum or sucking on hard candy afterward can help, too.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Exercise",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Staying active is a must for most moms to be. Regular exercise will help you control your weight, improve circulation, boost your mood, and help you sleep better. Plus, getting into an exercise habit now will help you set a good example for your child after she\'s born. Pilates, yoga, swimming, and walking are all great activities for most pregnant women, but be sure to check with your doctor first before starting any exercise program. Aim for 30 minutes of exercise most days of the week. Listen to your body, though, and don\'t overdo it.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Write a Birth Plan",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Determined to have a doula? Counting on that epidural? Write down your wishes and give a copy to everyone involved with the delivery. According to the American Pregnancy Association, here are some things to consider when writing your birth plan: - Who you want present, including children or siblings of the baby - Procedures you want to avoid - What positions you prefer for labor and delivery - Special clothing you\'d like to wear - Whether you want music or a special focal point - Whether you want pain medications, and what kind - What to do if complications arises.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Educate Yourself",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Even if this isn\'t your first baby, attending a childbirth class will help you feel more prepared for delivery. Not only will you have the chance to learn more about childbirth and infant care, but you can ask specific questions and voice any concerns. You\'ll also become more acquainted with the facility and its staff. Now is also a good time to brush up on your family\'s medical history. Talk to your doctor about problems with past pregnancies, and report any family incidences of birth defects.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Sixth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Practice Kegels",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Kegels strengthen the pelvic floor muscles, which support your bladder, bowels, and uterus. Done correctly, this simple exercise can help make your delivery easier and prevent problems later with incontinence. The best part: No one can tell you\'re doing them, so you can practice kegels in the car, while you\'re sitting at your desk, or even standing in line at the grocery store. Here\'s how to do them right: - Practice squeezing as though you\'re stopping the flow of urine when you use the bathroom. - Hold for three seconds, then relax for three. - Repeat 10 times.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Seventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Change Up Chores",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Even everyday tasks like scrubbing the bathroom or cleaning up after pets can become risky when you\'re pregnant. Exposure to toxic chemicals, lifting heavy objects, or coming in contact with bacteria can harm you and your baby. Here are some things to (hooray!) take off your to-do-list: - Heavy lifting - Climbing on stepstools or ladders - Changing kitty litter (to avoid toxoplasmosis, a disease caused by a parasite which cats can carry) - Using harsh chemicals - Standing for long periods of time, especially near a hot stove Also, wear gloves if you\'re working in the yard where cats may have been, and wash your hands thoroughly after handling raw meat.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eight Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Track Your Weight Gain",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "We know -- you\'re eating for two. But packing on too many extra pounds may make them hard to lose later. At the same time, not can gaining enough weight can put the baby at risk for a low-weight birth, a major cause of developmental problems. Recently the Institute of Medicine (IOM) issued new guidelines for weight gain during pregnancy. Here\'s what the IOM recommends, based on a woman\'s BMI (body mass index) before becoming pregnant with one baby: - Underweight: Gain 28-40 pounds - Normal weight: Gain 25-35 pounds - Overweight: Gain 15-25 pounds - Obese: Gain 11-20 pounds Check in with your doctor frequently to make sure you\'re gaining at a healthy rate.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Ninth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Go Shoe Shopping",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "At last -- a perfect excuse to buy shoes! As your bump grows, so may your feet -- or at least they may feel like they are. That\'s because your natural weight gain throws off your center of gravity, putting extra pressure on your tootsies. Over time this added pressure can cause painful over-pronation, or flattening out of the feet. You may retain fluids, too, which can make your feet and ankles swell. To prevent these problems, wear comfy shoes with good support. Many expectant moms find they need a larger shoe size even after they give birth, so go a step up if you need to.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Tenth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Rethink Your Spa Style",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Pregnancy is definitely a time for pampering, but you need to be careful. Avoid saunas, which can make you overheated. Ditto for hot tubs: According to the American Pregnancy Association, it takes only 10 to 20 minutes of sitting in one for your body temperature to reach 102 degrees Farenheit -- nearly the limit of what\'s considered safe for pregnant women. Also, certain essential oils can cause uterine contractions, especially during the first and second trimester, so check with your massage therapist to make sure only safe ones are being used. On the taboo list: juniper, rosemary, and clary sage",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eleventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Eat Folate-Rich Foods",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Folic acid is crucial for the proper development of the baby\'s neural tube (it covers the spinal cord), and it\'s vital for the creation of new red blood cells,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Twelveth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Recharge with Fruit",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Most doctors recommend limiting caffeine during pregnancy, since it can have harmful effects on you and the baby. Cutting back can be tough, though -- especially when you\'re used to your morning java. For a quick pick-me-up, try nibbling on some fruit. \'The natural sugars in fruits like bananas and apples can help lift energy levels,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Thirteen Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Go Fish",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "In a 2007 study of more than 12,000 children, researchers found that youngsters whose moms ate the most fish during pregnancy had higher I.Q.s, plus better motor and communication skills, than those whose mothers did not eat fish. Scientists say that\'s because fish is high in omega 3s, a nutrient critical to brain development. There\'s just one catch: Some kinds of fish contain mercury, which can be toxic to both babies and adults. To be safe, the FDA recommends that pregnant women eat no more than 12 ounces of fish per week. Stick with canned light tuna, shrimp, salmon, pollack, or catfish. Avoid swordfish, shark, king mackerel, and tilefish, which are all high in mercury.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourteenth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Know When to Call the Doctor",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Being pregnant can be confusing, especially if it\'s your first time. How do you know which twinge is normal and which one isn\'t? According to the Centers for Disease Control and Prevention, you should call your doctor if you have any of these symptoms: - Pain of any kind - Strong cramps - Contractions at 20-minute intervals - Vaginal bleeding or leaking of fluid - Dizziness or fainting - Shortness of breath - Heart palpitations - Constant nausea and vomiting - Trouble walking, edema (swelling of joints) - Decreased activity by the baby.",
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

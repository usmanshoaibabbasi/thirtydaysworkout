import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class YogaTips extends StatelessWidget {
  const YogaTips({Key? key}) : super(key: key);

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
              navbartxt: "Yoga Tips Description",
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
                        'Yoga Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreenyogaimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'Keep a practice journal',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Yoga classes are full of little comments and insights that smooth over life’s rough edges and change the way we see ourselves. But today’s “aha!” experience is often swept away in the flood of tomorrow’s activities. Write it down. A spiral-bound blank book is a great place for recording thoughts about your practice, even if some of your insights turn out to be less than cosmic. Use your notebook to make observations about the classes you are taking, too. Compile lists of postures—the ones you know and the ones that you are learning. List new terms that you think you would like to remember. Write down questions that come up in meditation. You get the idea.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "Become an 'artist'",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Drawing stick figures is a great way to summarize information and remember the fine points about a posture. “Mr. Stick” (or “Mr. Peanut” if you are a bit more talented) takes only moments to sketch. Highlight your drawing with arrows and important cues. Small figures can be used to create short sequences (vinyasas) and even longer practice routines. Of course, if you are a computer whiz you might consider scanning digital photos of postures into your computer and manipulating the images onscreen. But then you’ll miss the fun of creating the image yourself.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Make space in your home",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "By practicing in the same place at home you create a groove in your mind—the memory of past days’ experiences makes it easier to begin today. Store props nearby so that getting started doesn’t require a lot of running around. An inspiring image or statue, an Oriental carpet, or a specially selected cushion can mark this place as special.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Define Your Practice",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "The practice routine you create depends a good deal on you. Define the time you have available for practice, the technique you would like to focus on, and the balance among meditation, breathing, and asana practices. Then consider the details. Are you clear about the order of your practice and the methods you are using? Are there aspects of an asana that need attention or that intrigue you? If a posture or any other practice seems too difficult, could you break it down, or prepare for it with less challenging techniques? What are the steps in the relaxation or meditation methods you have learned? If you have questions, make sure to ask your teacher for help",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Balance the postures with relaxation/meditation",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "These days most yoga classes heavily emphasize asana practice. Some teachers may not include relaxation or meditation in the class routine at all. But don’t neglect them. You need to relax; it will help you feel better; and once you have begun to relax or meditate regularly, the experience will transform you. Many students are attracted to yoga primarily in order to meditate; others are focused on physical health and are not aware of the importance of meditation. Working with the body or mind alone is usually not enough to create the inner strength and equilibrium we hope for. A balanced combination of asana practice and mental centering will engender a sense of well-being",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Sixth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Build a small library of books and CDs",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Yoga videos are invaluable. They offer experience with different styles of yoga as well as with different levels of practice. And audio recordings is a great way to internalize the relaxation and meditation practice of your choice. In addition, a library of a dozen or so yoga-related books will provide a lifelong source of information. My choices would include two to three manual-style books offering practice suggestions and an overview of yoga; a copy of the Bhagavad Gita (Juan Mascaró’s translation is an inspiring starting version); a basic anatomy workbook; a copy of the Yoga Sutra of Patanjali (How to Know God remains a good beginning choice); a book devoted to the spirit and practice of meditation; something on yoga philosophy; an introduction to Ayurveda; and three books that inspire you. Build your library slowly.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Seventh Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Learn to sound out Sanskrit words (if you like languages)",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Sanskrit is an elegant language and it contains technical terms as well as historical names that have been associated with yoga for millennia. It’s an orderly language too, and once you have learned the basics of pronunciation your days of mumbling the sounds will be over. Most Sanskrit syllables begin with a consonant (or two) and end with a vowel. All Sanskrit letters have a fixed pronunciation (unlike English c’s, g’s, a’s, and so on), so once you can pronounce the letter you can sound out the word. This will also make it possible to accurately pronounce the many mantras found in meditation practices.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Eight Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Take breathing breaks",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Breathing is a powerful tool for managing stress. And while a few moments of breath awareness can definitely short-circuit a fit of anger or a moment of anxiety, you might consider extending your breathing breaks and using them on a more regular basis—refreshing yourself for a few minutes or longer once or twice every day. During your break you can close your eyes and count your breaths, or you can simply relax the tensions that have crept into the respiratory muscles. You’ll find that a five-minute period of breath awareness will soothe the subtle strain of daily thinking and recharge your mind. Place reminders (Brake for Breathing!) at one or two key places in your home or office. Better yet, don’t let an afternoon go by without using five minutes for this sort of mini-meditation.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Ninth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Let the practices do their work",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "In the midst of a posture or relaxation exercise it’s easy to feel you should be doing something. And certainly it’s important to make the effort to master a practice. But trying too hard can get in the way just as much as not giving enough effort. So a good question to ask in the middle of any practice is “Am I letting the posture (breathing exercise, meditation focus) do its work?” Try it the next time you practice the relaxation posture, shavasana. Let the posture do its work.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Tenth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Quiet the critics",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "You know the ones—the voices in your head that tell you that you aren’t likely to accomplish much or that you’re really not suited for yoga. Everyone has some doubts about themselves. But if those doubts become a naysaying chorus, they’ve gone too far. Trust that your interest in and appreciation for yoga are really a kind of devotion—a sentiment of greater value than any technical skill you can muster. And remember Krishna’s words in the Bhagavad Gita: “Those who come for shelter, no matter how humble they may be, reach the Path supreme.",
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

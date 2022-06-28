import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class AdultTips extends StatelessWidget {
  const AdultTips({Key? key}) : super(key: key);

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
              navbartxt: "Adult Tips Description",
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
                        'Adult Learners Tips',
                        style: healthTipMainHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            heathscreenadultimg,
                            height: screenwidth*0.35,
                            width: screenwidth*0.35,
                          ),
                        ],
                      ),
                      /// First ParaGraph
                      const SizedBox(height: 10,),
                      Text(
                        'Use Varied Study Materials',
                        style: healthTipsSubHeadingGoogleFont,

                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Don\'t limit your study resources to just your class textbook or reading list. Today, a host of supporting materials is available to help you digest and understand what you\'re studying. Classes often include online resources such as recorded lectures, interactive exercises, videos and more, and some universities even offer personalized learning platforms that let you skip over what you already know so you can focus your time on what you still need to learn. You may discover that you learn better through one medium over another, or that you can benefit from the reinforcement of reviewing materials in multiple learning formats. It\'s also helpful to think about how you learn best—such as through the flexibility of online classes.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Second ParaGraph
                      const SizedBox(height: 20,),
                      Text(
                        "Focus on Time Management",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Often simply finding the time for classes is one of the biggest barriers adult learners face. Having a clear time management plan is a critical piece of the solution. Start by evaluating how much time a course will take. Taking courses online, for example, eliminates commute times and lets you fit study time into your schedule rather than the other way around. When mapping out your class commitments, budget time for attending or watching lectures and other types of lessons online, completing readings, researching projects, and writing papers or assignments. Breaking your work into individual components makes it easier to get it all done.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Third Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Be Well Prepared and Take Notes",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Whether you\'re attending school in the classroom or online on your own time, commit to focusing during the time you\'re dedicating to your lessons. Keep your attention on your professor during lectures or live chats. If you\'re pursuing an online degree, dedicate clear time for studying and research when you won\'t be interrupted and—don\'t try to multi-task. Take good notes, and review your notes from previous lessons before the next one. By writing things in your own words and highlighting key parts of what you\'re studying, you may improve your retention and your ability to understand the class material.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fourth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Don\'t Procrastinate",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Procrastination is one of the biggest reasons that students struggle in college. In some cases, this behavior relates to time management issues. In other cases, however, it\'s related to anxiety, feeling overwhelmed, or not knowing where to begin. Make it a priority to know deadlines for projects and any other course milestones. If you find yourself struggling or you\'re unsure where to start, seek help early on. Use your calendar to remind yourself about upcoming deadlines and consider connecting with another student as an accountability partner. Create a support structure that makes it difficult to procrastinate.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      /// Fifth Paragraph
                      const SizedBox(height: 20,),
                      Text(
                        "Connect with Learning Resources",
                        style: healthTipsSubHeadingGoogleFont,
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Isolation can be a big variable in academic success or failure, especially when you\'re struggling with a class. Connect with support services offered by your school. Reach out to your professor for help or to answer questions. Consult your advisor to find out if there are tutoring services or research librarians that can assist with specific challenges. Other students can be a great resource: You may even work together on group projects or form study session groups. Be sure to also recruit others around you such as family, friends, and even your kids to help where they can and invest in your academic and career success.",
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

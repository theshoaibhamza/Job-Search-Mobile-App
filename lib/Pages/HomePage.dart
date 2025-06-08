import 'package:bigbrains_jobs/APIs/CareerJet.dart';
import 'package:bigbrains_jobs/APIs/Url_Launcher.dart';
import 'package:bigbrains_jobs/Pages/JobsResponsePage.dart';
import 'package:bigbrains_jobs/Widgets/BoldText.dart';
import 'package:bigbrains_jobs/Widgets/LightText.dart';
import 'package:bigbrains_jobs/Widgets/MyButton.dart';
import 'package:bigbrains_jobs/Widgets/MyTextFormField.dart';
import 'package:bigbrains_jobs/Widgets/SmoothNavigator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _title = TextEditingController();

  TextEditingController _location = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double Width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            //
            SizedBox(height: 30),
            Container(
              height: height * 0.25,
              width: Width * 0.50,
              child: Image.asset("lib/Assets/logo.png"),
            ),
            BoldText(text: "BIG BRAINS JOBS", size: Width * 0.07),
            LightText(
              text: "Find The Best Suitable Jobs & internships",
              size: Width * 0.04,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.work_history_outlined),
                  SizedBox(width: 12),
                  BoldText(text: "What", size: Width * 0.05),
                ],
              ),
            ),
            SizedBox(height: 10),
            MyTextFormField(
              height: 0.06,
              width: 0.90,
              hintText: "Enter Job Title",
              controller: _title,
              textInputType: TextInputType.text,
              isNumeric: false,
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 12),
                  BoldText(text: "Where", size: Width * 0.05),
                ],
              ),
            ),
            SizedBox(height: 10),
            MyTextFormField(
              height: 0.06,
              width: 0.90,
              hintText: "Enter City",
              controller: _location,
              textInputType: TextInputType.text,
              isNumeric: false,
            ),

            SizedBox(height: 30),
            MyButton(
              height: 0.06,
              width: 0.90,
              buttonColor: Colors.black,
              child:
                  isLoading
                      ? Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                      : BoldText(text: "Search", color: Colors.white),
              onTap: () async {
                setState(() {
                  isLoading = true;
                });

                //   await CareerJet.fetchJobs(_title.text, _location.text);

                setState(() {
                  isLoading = false;
                });

                MyNavigator.Smooth(
                  context: context,
                  nextScreen: JobResponsePage(
                    keywords: _title.text,
                    location: _location.text,
                  ),
                );
              },
            ),
            Spacer(),
            Container(height: 1, width: double.maxFinite, color: Colors.grey),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await UrlLauncher.launchURL("https://www.bigbrainss.com");
              },
              child: Container(
                height: 40,
                width: double.maxFinite,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                      text: "For More Information Visit,  ",
                      size: Width * 0.04,
                      color: Colors.grey,
                    ),
                    BoldText(text: "Bigbrainss.com ", size: Width * 0.04),
                    Icon(Icons.open_in_new),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

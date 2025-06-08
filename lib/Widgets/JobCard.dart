import 'package:bigbrains_jobs/APIs/Url_Launcher.dart';
import 'package:bigbrains_jobs/Models/Job.dart';
import 'package:bigbrains_jobs/Utils/DateConverter.dart';
import 'package:bigbrains_jobs/Widgets/BoldText.dart';
import 'package:bigbrains_jobs/Widgets/MyButton.dart';
import 'package:bigbrains_jobs/Widgets/SmoothNavigator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JobCard extends StatelessWidget {
  JobCard({super.key, required this.obj});

  Job obj;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Card(
      color: const Color.fromARGB(255, 221, 238, 249),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            BoldText(text: obj.title),
            BoldText(text: obj.company, size: 16),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Container(
                  height: 45,
                  width: width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: BoldText(text: obj.locations, size: 15)),
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                BoldText(text: getPostedAgo(obj.date)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: MyButton(
                    height: 0.050,
                    width: 0.320,
                    buttonColor: Colors.teal,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoldText(
                            text: "Apply Now ",
                            color: Colors.white,
                            size: width * 0.04,
                          ),
                          Icon(
                            Icons.open_in_new,
                            color: Colors.white,
                            size: width * 0.05,
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      bool check = await UrlLauncher.launchURL(obj.url);
                      if (!check) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: BoldText(
                              text:
                                  "Failed To Search Job, Please Try Again Later...",
                              size: 15,
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

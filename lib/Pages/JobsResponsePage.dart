import 'package:bigbrains_jobs/APIs/CareerJet.dart';
import 'package:bigbrains_jobs/Models/Job.dart';
import 'package:bigbrains_jobs/Utils/CityConverter.dart';
import 'package:bigbrains_jobs/Utils/DateConverter.dart';
import 'package:bigbrains_jobs/Widgets/BoldText.dart';
import 'package:bigbrains_jobs/Widgets/JobCard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JobResponsePage extends StatefulWidget {
  JobResponsePage({super.key, required this.keywords, required this.location});

  String keywords;
  String location;

  @override
  State<JobResponsePage> createState() => _JobResponsePageState();
}

class _JobResponsePageState extends State<JobResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: CareerJet.fetchJobs(widget.keywords, widget.location),
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                snapshot.hasError ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              );
            }

            List<Job> jobs = snapshot.data!;

            return Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "You Searched For '${widget.keywords}' in '${widget.location}'.",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //
                Expanded(
                  child: ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      Job obj = jobs[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: JobCard(obj: obj),
                      );
                    },
                  ),
                ),
                //
              ],
            );
          },
        ),
      ),
    );
  }
}

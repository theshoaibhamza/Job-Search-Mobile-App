import 'dart:convert';

import 'package:bigbrains_jobs/Models/Job.dart';
import 'package:bigbrains_jobs/Models/JobResponse.dart';
import 'package:http/http.dart' as http;

class CareerJet {
  static Future<List<Job>> fetchJobs(String keywords, String location) async {
    final url = Uri.parse(
      'https://careerjet-production.up.railway.app/search_jobs?keywords=${keywords}&location=${location}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final jobResponse = JobResponse.fromJson(data);

      // Print or use jobs
      for (var job in jobResponse.jobs) {
        print("Job Title : " + job.title);
        print("Job Description : " + job.description);
        print("Job Location : " + job.locations);
        print("Job Salary : " + job.salary!);
        print("Job Max Salary : " + job.salaryMax!);
        print("Job Min Salary : " + job.salaryMin!);
        print("Job Salary Type : " + job.salaryType!);
        print("Job Currency Code : " + job.salaryCurrencyCode);
        print("Job Company : " + job.company);
        print("Job Date : " + job.date);
        print("Job Site : " + job.site!);
        print("Job Site : " + job.url);
      }

      return jobResponse.jobs;
    } else {
      print('Failed to fetch jobs: ${response.statusCode}');
      return [];
    }
  }
}

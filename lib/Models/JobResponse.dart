import 'package:bigbrains_jobs/Models/Job.dart';

class JobResponse {
  final List<Job> jobs;

  JobResponse({required this.jobs});

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      jobs: List<Job>.from(json['jobs'].map((job) => Job.fromJson(job))),
    );
  }

  Map<String, dynamic> toJson() {
    return {'jobs': jobs.map((job) => job.toJson()).toList()};
  }
}

class Job {
  final String company;
  final String date;
  final String description;
  final String locations;
  final String? salary;
  final String salaryCurrencyCode;
  final String? salaryMax;
  final String? salaryMin;
  final String? salaryType;
  final String? site;
  final String title;
  final String url;

  Job({
    required this.company,
    required this.date,
    required this.description,
    required this.locations,
    this.salary,
    required this.salaryCurrencyCode,
    required this.salaryMax,
    required this.salaryMin,
    required this.salaryType,
    this.site,
    required this.title,
    required this.url,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      company: json['company'] ?? "",
      date: json['date'] ?? "",
      description: json['description'] ?? "",
      locations: json['locations'] ?? "",
      salary: json['salary'] ?? "",
      salaryCurrencyCode: json['salary_currency_code'] ?? "",
      salaryMax: (json['salary_max']) ?? "",
      salaryMin: (json['salary_min']) ?? "",
      salaryType: json['salary_type'] ?? "",
      site: json['site'] ?? "",
      title: json['title'] ?? "",
      url: json['url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'date': date,
      'description': description,
      'locations': locations,
      'salary': salary,
      'salary_currency_code': salaryCurrencyCode,
      'salary_max': salaryMax,
      'salary_min': salaryMin,
      'salary_type': salaryType,
      'site': site,
      'title': title,
      'url': url,
    };
  }
}

class ModelEmployeeApi {
  String status;
  List<Employee>? employees;
  int? totalResults;

  ModelEmployeeApi({
    required this.status,
    required this.employees,
    required this.totalResults,
  });

  factory ModelEmployeeApi.fromJson(Map<String, dynamic> json) =>
      ModelEmployeeApi(
        status: json["status"],
        employees: json["employees"] == null
            ? []
            : List<Employee>.from(
                json["employees"]!.map((x) => Employee.fromJson(x))),
        totalResults: json["totalResults"],
      );
}

class Employee {
  String id;
  String employeeName;
  String designation;

  Employee({
    required this.id,
    required this.employeeName,
    required this.designation,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["employee_name"],
        designation: json["designation"],
      );
}

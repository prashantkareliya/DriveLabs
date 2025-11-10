class InstructorFeedbackRequest {
  String? customerId;
  String? instructorId;
  int? day;
  int? steering;
  int? clutch;
  int? braking;
  int? independance;
  int? gearShifting;
  int? roadSense;

  InstructorFeedbackRequest(
      {this.customerId,
        this.instructorId,
        this.day,
        this.steering,
        this.clutch,
        this.braking,
        this.independance,
        this.gearShifting,
        this.roadSense});

  InstructorFeedbackRequest.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    instructorId = json['instructorId'];
    day = json['day'];
    steering = json['steering'];
    clutch = json['clutch'];
    braking = json['braking'];
    independance = json['independance'];
    gearShifting = json['gear_shifting'];
    roadSense = json['road_sense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['instructorId'] = this.instructorId;
    data['day'] = this.day;
    data['steering'] = this.steering;
    data['clutch'] = this.clutch;
    data['braking'] = this.braking;
    data['independance'] = this.independance;
    data['gear_shifting'] = this.gearShifting;
    data['road_sense'] = this.roadSense;
    return data;
  }
}

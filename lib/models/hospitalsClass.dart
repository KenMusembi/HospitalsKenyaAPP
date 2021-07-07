// To parse this JSON data, do
//
//     final hospitalClass = hospitalClassFromJson(jsonString);

import 'dart:convert';

List<HospitalClass> hospitalClassFromJson(String str) =>
    List<HospitalClass>.from(
        json.decode(str).map((x) => HospitalClass.fromJson(x)));

String hospitalClassToJson(List<HospitalClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HospitalClass {
  HospitalClass({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.officialname,
    this.registrationNumber,
    this.kephLevel,
    this.facilityType,
    this.facilityTypeCategory,
    this.owner,
    this.ownerType,
    this.regulatoryBody,
    this.beds,
    this.cots,
    this.county,
    this.constituency,
    this.subCounty,
    this.ward,
    this.operationStatus,
    this.openWholeDay,
    this.openPublicHolidays,
    this.openWeekends,
    this.openLateNight,
    this.serviceNames,
    this.approved,
    this.publicVisible,
    this.closed,
    this.hospitalLong,
    this.hospitalLat,
    this.hospitalPhoneNumber,
    this.hospitalEmail,
    this.hospitalServicesId,
    this.hospitalPaymentsId,
    this.hospitalInsuranceId,
  });

  int id;
  String createdAt;
  String updatedAt;
  String name;
  String officialname;
  String registrationNumber;
  String kephLevel;
  String facilityType;
  String facilityTypeCategory;
  String owner;
  String ownerType;
  String regulatoryBody;
  String beds;
  String cots;
  String county;
  String constituency;
  String subCounty;
  String ward;
  String operationStatus;
  String openWholeDay;
  String openPublicHolidays;
  String openWeekends;
  String openLateNight;
  String serviceNames;
  String approved;
  String publicVisible;
  String closed;
  String hospitalLong;
  String hospitalLat;
  String hospitalPhoneNumber;
  String hospitalEmail;
  int hospitalServicesId;
  int hospitalPaymentsId;
  int hospitalInsuranceId;

  factory HospitalClass.fromJson(Map<String, dynamic> json) => HospitalClass(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        name: json["Name"],
        officialname: json["Officialname"],
        registrationNumber: json["Registration_number"],
        kephLevel: json["Keph_level"],
        facilityType: json["Facility_type"],
        facilityTypeCategory: json["Facility_type_category"],
        owner: json["Owner"],
        ownerType: json["Owner_type"],
        regulatoryBody: json["Regulatory_body"],
        beds: json["Beds"],
        cots: json["Cots"],
        county: json["County"],
        constituency: json["Constituency"],
        subCounty: json["Sub_county"],
        ward: json["Ward"],
        operationStatus: json["Operation_status"],
        openWholeDay: json["Open_whole_day"],
        openPublicHolidays: json["Open_public_holidays"],
        openWeekends: json["Open_weekends"],
        openLateNight: json["Open_late_night"],
        serviceNames: json["Service_names"],
        approved: json["Approved"],
        publicVisible: json["Public_visible"],
        closed: json["Closed"],
        hospitalLong: json["hospital_long"],
        hospitalLat: json["hospital_lat"],
        hospitalPhoneNumber: json["hospital_phone_number"],
        hospitalEmail: json["hospital_email"],
        hospitalServicesId: json["hospital_services_id"],
        hospitalPaymentsId: json["hospital_payments_id"],
        hospitalInsuranceId: json["hospital_insurance_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "Name": name,
        "Officialname": officialname,
        "Registration_number": registrationNumber,
        "Keph_level": kephLevel,
        "Facility_type": facilityType,
        "Facility_type_category": facilityTypeCategory,
        "Owner": owner,
        "Owner_type": ownerType,
        "Regulatory_body": regulatoryBody,
        "Beds": beds,
        "Cots": cots,
        "County": county,
        "Constituency": constituency,
        "Sub_county": subCounty,
        "Ward": ward,
        "Operation_status": operationStatus,
        "Open_whole_day": openWholeDay,
        "Open_public_holidays": openPublicHolidays,
        "Open_weekends": openWeekends,
        "Open_late_night": openLateNight,
        "Service_names": serviceNames,
        "Approved": approved,
        "Public_visible": publicVisible,
        "Closed": closed,
        "hospital_long": hospitalLong,
        "hospital_lat": hospitalLat,
        "hospital_phone_number": hospitalPhoneNumber,
        "hospital_email": hospitalEmail,
        "hospital_services_id": hospitalServicesId,
        "hospital_payments_id": hospitalPaymentsId,
        "hospital_insurance_id": hospitalInsuranceId,
      };
}

// To parse this JSON data, do
//
//     final phoneInfo = phoneInfoFromJson(jsonString);

import 'dart:convert';

PhoneInfo phoneInfoFromJson(String str) => PhoneInfo.fromJson(json.decode(str));

String phoneInfoToJson(PhoneInfo data) => json.encode(data.toJson());

class PhoneInfo {
  dynamic number;
  dynamic imsi;
  dynamic division;
  dynamic district;
  dynamic region;
  dynamic thana;
  dynamic union;
  dynamic sector;
  dynamic lat;
  dynamic lon;
  dynamic update;
  dynamic coverage;
  dynamic map;
  String? owner;

  PhoneInfo({
    this.number,
    this.imsi,
    this.division,
    this.district,
    this.region,
    this.thana,
    this.union,
    this.sector,
    this.lat,
    this.lon,
    this.update,
    this.coverage,
    this.map,
    this.owner,
  });

  factory PhoneInfo.fromJson(Map<String, dynamic> json) => PhoneInfo(
    number: json["NUMBER"],
    imsi: json["IMSI"],
    division: json["division"],
    district: json["district"],
    region: json["region"],
    thana: json["thana"],
    union: json["union"],
    sector: json["sector"],
    lat: json["lat"],
    lon: json["lon"],
    update: json["update"],
    coverage: json["coverage"],
    map: json["map"],
    owner: json["owner"],
  );

  Map<String, dynamic> toJson() => {
    "NUMBER": number,
    "IMSI": imsi,
    "division": division,
    "district": district,
    "region": region,
    "thana": thana,
    "union": union,
    "sector": sector,
    "lat": lat,
    "lon": lon,
    "update": update,
    "coverage": coverage,
    "map": map,
    "owner": owner,
  };
}

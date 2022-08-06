// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Weather welcomeFromJson(String str) => Weather.fromJson(json.decode(str));

String welcomeToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Weather({
        required this.location,
         required this.current,
    });

    Location location;
    Current current;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    Current({
       
       required this.tempC,
       required this.tempF,
       
      required  this.condition,
        
        
    });

   
    int tempC;
    double tempF;
    
    Condition condition;
  
    

    factory Current.fromJson(Map<String, dynamic> json) => Current(
      
        tempC: json["temp_c"].toInt(),
        tempF: json["temp_f"].toDouble(),
       
        condition: Condition.fromJson(json["condition"]),
       
        
    );

    Map<String, dynamic> toJson() => {
        
        "temp_c": tempC,
        "temp_f": tempF,

        "condition": condition.toJson(),
       
        
    
    };
}

class Condition {
    Condition({
      required  this.text,
      required  this.icon,
      required  this.code,
    });

    String text;
    String icon;
    int code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    Location({
       required this.name,
       required  this.region,
       required  this.country,
        required this.localtime,
    });

    String name;
    String region;
    String country;
    
    String localtime;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
      
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        
        "localtime": localtime,
    };
}

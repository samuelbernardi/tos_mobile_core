import 'package:json_annotation/json_annotation.dart';

part 'environment.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Environment {
  bool isProd;
  int codGestao;
  Api api;
  Mqtt mqtt;
  Ocr ocr;
  Debug debug;

  Environment(
      {this.isProd, this.codGestao, this.api, this.mqtt, this.ocr, this.debug});

  factory Environment.fromJson(Map<String, dynamic> data) =>
      _$EnvironmentFromJson(data);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Api {
  String url;
  String images;

  Api({this.url, this.images});

  factory Api.fromJson(Map<String, dynamic> data) => _$ApiFromJson(data);

  Map<String, dynamic> toJson() => _$ApiToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Mqtt {
  String gate;
  int gatePort;
  int gatePortWeb;
  String username;
  String password;
  int reconnectPeriod;

  Mqtt(
      {this.gate,
      this.gatePort,
      this.gatePortWeb,
      this.username,
      this.password,
      this.reconnectPeriod});

  factory Mqtt.fromJson(Map<String, dynamic> data) => _$MqttFromJson(data);

  Map<String, dynamic> toJson() => _$MqttToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Ocr {
  String imageUrl;

  Ocr({this.imageUrl});

  factory Ocr.fromJson(Map<String, dynamic> data) => _$OcrFromJson(data);

  Map<String, dynamic> toJson() => _$OcrToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Debug {
  bool request;
  bool requestParams;
  bool response;
  bool state;
  bool compressImage;
  String endpoint;
  bool useWs;
  bool mqttPublish;

  Debug(
      {this.request,
      this.requestParams,
      this.response,
      this.state,
      this.compressImage,
      this.endpoint,
      this.useWs,
      this.mqttPublish});

  factory Debug.fromJson(Map<String, dynamic> data) => _$DebugFromJson(data);

  Map<String, dynamic> toJson() => _$DebugToJson(this);
}

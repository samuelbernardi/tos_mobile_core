// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    isProd: json['is_prod'] as bool,
    codGestao: json['cod_gestao'] as int,
    api: json['api'] == null
        ? null
        : Api.fromJson(json['api'] as Map<String, dynamic>),
    mqtt: json['mqtt'] == null
        ? null
        : Mqtt.fromJson(json['mqtt'] as Map<String, dynamic>),
    ocr: json['ocr'] == null
        ? null
        : Ocr.fromJson(json['ocr'] as Map<String, dynamic>),
    debug: json['debug'] == null
        ? null
        : Debug.fromJson(json['debug'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'is_prod': instance.isProd,
      'cod_gestao': instance.codGestao,
      'api': instance.api?.toJson(),
      'mqtt': instance.mqtt?.toJson(),
      'ocr': instance.ocr?.toJson(),
      'debug': instance.debug?.toJson(),
    };

Api _$ApiFromJson(Map<String, dynamic> json) {
  return Api(
    url: json['url'] as String,
    images: json['images'] as String,
  );
}

Map<String, dynamic> _$ApiToJson(Api instance) => <String, dynamic>{
      'url': instance.url,
      'images': instance.images,
    };

Mqtt _$MqttFromJson(Map<String, dynamic> json) {
  return Mqtt(
    gate: json['gate'] as String,
    gatePort: json['gate_port'] as int,
    gatePortWeb: json['gate_port_web'] as int,
    username: json['username'] as String,
    password: json['password'] as String,
    reconnectPeriod: json['reconnect_period'] as int,
  );
}

Map<String, dynamic> _$MqttToJson(Mqtt instance) => <String, dynamic>{
      'gate': instance.gate,
      'gate_port': instance.gatePort,
      'gate_port_web': instance.gatePortWeb,
      'username': instance.username,
      'password': instance.password,
      'reconnect_period': instance.reconnectPeriod,
    };

Ocr _$OcrFromJson(Map<String, dynamic> json) {
  return Ocr(
    imageUrl: json['image_url'] as String,
  );
}

Map<String, dynamic> _$OcrToJson(Ocr instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
    };

Debug _$DebugFromJson(Map<String, dynamic> json) {
  return Debug(
    request: json['request'] as bool,
    requestParams: json['request_params'] as bool,
    response: json['response'] as bool,
    state: json['state'] as bool,
    compressImage: json['compress_image'] as bool,
    endpoint: json['endpoint'] as String,
    useWs: json['use_ws'] as bool,
    mqttPublish: json['mqtt_publish'] as bool,
  );
}

Map<String, dynamic> _$DebugToJson(Debug instance) => <String, dynamic>{
      'request': instance.request,
      'request_params': instance.requestParams,
      'response': instance.response,
      'state': instance.state,
      'compress_image': instance.compressImage,
      'endpoint': instance.endpoint,
      'use_ws': instance.useWs,
      'mqtt_publish': instance.mqttPublish,
    };

class BaseModel {
  var result;
  String? targetUrl;
  bool? success;
  Error? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  BaseModel(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  BaseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['targetUrl'] = targetUrl;
    data['success'] = success;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['unAuthorizedRequest'] = unAuthorizedRequest;
    data['__abp'] = bAbp;
    return data;
  }
}

class Error {
  int? code;
  String? message;
  String? details;
  String? validationErrors;

  Error({this.code, this.message, this.details, this.validationErrors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    details = json['details'];
    validationErrors = json['validationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['details'] = details;
    data['validationErrors'] = validationErrors;
    return data;
  }
}

class ApprovalDetailModel {
  List<ApprovalPreviews> approvalPreviews;
  bool? isEditable;

  ApprovalDetailModel({this.approvalPreviews=const [], this.isEditable});

  ApprovalDetailModel fromJson(Map<String, dynamic> json) {
    if (json['approvalPreviews'] != null) {
      approvalPreviews = <ApprovalPreviews>[];
      json['approvalPreviews'].forEach((v) {
        approvalPreviews.add(ApprovalPreviews.fromJson(v));
      });
    }
    isEditable = json['isEditable'];

    return ApprovalDetailModel(approvalPreviews: approvalPreviews,isEditable: isEditable);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (approvalPreviews != null) {
      data['approvalPreviews'] =
          approvalPreviews!.map((v) => v.toJson()).toList();
    }
    data['isEditable'] = isEditable;
    return data;
  }
}

class ApprovalPreviews {
  late String fieldName;
  late String fieldValue;
  bool? isHidden;

  ApprovalPreviews({this.fieldName='', this.fieldValue='', this.isHidden});

  ApprovalPreviews.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName']??'';
    fieldValue = json['fieldValue']??'';
    isHidden = json['isHidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldName'] = fieldName;
    data['fieldValue'] = fieldValue;
    data['isHidden'] = isHidden;
    return data;
  }
}

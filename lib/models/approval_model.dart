class ApprovalModel {
  int? approvalId;
  String? approvalStatus;
  int? approvalDetailId;
  String? remarks;
  String? approvalDetailStatus;
  ApprovalAuthority? approvalAuthority;
  String? docNo;
  String? docDate;
  Form? form;
  int? approvedById;
  String? companyName;
  String? stationTitle;
  String? costCenterTitle;
  bool isSelected;

  ApprovalModel(
      {this.approvalId,
        this.approvalStatus,
        this.approvalDetailId,
        this.remarks,
        this.approvalDetailStatus,
        this.approvalAuthority,
        this.docNo,
        this.docDate,
        this.form,
        this.approvedById,
        this.companyName,
        this.stationTitle,
        this.costCenterTitle,this.isSelected=false});

  ApprovalModel fromJson(Map<String, dynamic> json) {
    approvalId = json['approvalId'];
    approvalStatus = json['approvalStatus'];
    approvalDetailId = json['approvalDetailId'];
    remarks = json['remarks'];
    approvalDetailStatus = json['approvalDetailStatus'];
    approvalAuthority = json['approvalAuthority'] != null
        ? ApprovalAuthority.fromJson(json['approvalAuthority'])
        : null;
    docNo = json['docNo'];
    docDate = json['docDate'];
    form = json['form'] != null ? Form.fromJson(json['form']) : null;
    approvedById = json['approvedById'];
    companyName = json['companyName'];
    stationTitle = json['stationTitle'];
    costCenterTitle = json['costCenterTitle'];

    return ApprovalModel(
      approvalId: approvalId,
      approvalAuthority: approvalAuthority,
      approvalDetailId: approvalDetailId,
      approvalDetailStatus: approvalDetailStatus,
      approvalStatus: approvalStatus,
      approvedById: approvedById,
      companyName: companyName,
      costCenterTitle: costCenterTitle,
      docDate: docDate,
      docNo: docNo,
      form: form,
      remarks: remarks,
      stationTitle: stationTitle,
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['approvalId'] = approvalId;
    data['approvalStatus'] = approvalStatus;
    data['approvalDetailId'] = approvalDetailId;
    data['remarks'] = remarks;
    data['approvalDetailStatus'] = approvalDetailStatus;
    if (approvalAuthority != null) {
      data['approvalAuthority'] = approvalAuthority!.toJson();
    }
    data['docNo'] = docNo;
    data['docDate'] = docDate;
    if (form != null) {
      data['form'] = form!.toJson();
    }
    data['approvedById'] = approvedById;
    data['companyName'] = companyName;
    data['stationTitle'] = stationTitle;
    data['costCenterTitle'] = costCenterTitle;
    return data;
  }
}

class ApprovalAuthority {
  int? tenantId;
  String? type;
  int? userId;
  var user;
  int? roleId;
  var role;
  int? approvalDetailId;
  String? approvalDetail;
  int? level;
  int? id;

  ApprovalAuthority(
      {this.tenantId,
        this.type,
        this.userId,
        this.user,
        this.roleId,
        this.role,
        this.approvalDetailId,
        this.approvalDetail,
        this.level,
        this.id});

  ApprovalAuthority.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    type = json['type'];
    userId = json['userId'];
    user = json['user'];
    roleId = json['roleId'];
    role = json['role'];
    approvalDetailId = json['approvalDetailId'];
    approvalDetail = json['approvalDetail'];
    level = json['level'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenantId'] = tenantId;
    data['type'] = type;
    data['userId'] = userId;
    data['user'] = user;
    data['roleId'] = roleId;
    data['role'] = role;
    data['approvalDetailId'] = approvalDetailId;
    data['approvalDetail'] = approvalDetail;
    data['level'] = level;
    data['id'] = id;
    return data;
  }
}

class Form {
  String? name;
  String? displayName;
  bool? isApprovalEnabled;
  bool? isActive;
  bool? isNarrationExist;
  bool? isDeleted;
  var deleterUserId;
  var deletionTime;
  var lastModificationTime;
  var lastModifierUserId;
  String? creationTime;
  int? creatorUserId;
  int? id;

  Form(
      {this.name,
        this.displayName,
        this.isApprovalEnabled,
        this.isActive,
        this.isNarrationExist,
        this.isDeleted,
        this.deleterUserId,
        this.deletionTime,
        this.lastModificationTime,
        this.lastModifierUserId,
        this.creationTime,
        this.creatorUserId,
        this.id});

  Form.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    isApprovalEnabled = json['isApprovalEnabled'];
    isActive = json['isActive'];
    isNarrationExist = json['isNarrationExist'];
    isDeleted = json['isDeleted'];
    deleterUserId = json['deleterUserId'];
    deletionTime = json['deletionTime'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['isApprovalEnabled'] = isApprovalEnabled;
    data['isActive'] = isActive;
    data['isNarrationExist'] = isNarrationExist;
    data['isDeleted'] = isDeleted;
    data['deleterUserId'] = deleterUserId;
    data['deletionTime'] = deletionTime;
    data['lastModificationTime'] = lastModificationTime;
    data['lastModifierUserId'] = lastModifierUserId;
    data['creationTime'] = creationTime;
    data['creatorUserId'] = creatorUserId;
    data['id'] = id;
    return data;
  }
}

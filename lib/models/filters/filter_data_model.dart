class FilterDataModel {
  String? docNo;
  List<String>? dateRanges;
  int? formID;
  int? companyId;
  int? stationId;
  int? costCenterId;

  FilterDataModel(
      {this.docNo,
        this.dateRanges,
        this.formID,
        this.companyId,
        this.stationId,
        this.costCenterId});

  FilterDataModel.fromJson(Map<String, dynamic> json) {
    docNo = json['docNo'];
    dateRanges = json['dateRanges'].cast<String>();
    formID = json['formID'];
    companyId = json['companyId'];
    stationId = json['stationId'];
    costCenterId = json['costCenterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docNo'] = docNo;
    if(dateRanges!=null) data['dateRanges'] = dateRanges;
    data['formID'] = formID;
    data['companyId'] = companyId;
    data['stationId'] = stationId;
    data['costCenterId'] = costCenterId;
    return data;
  }
}

class Urls{
  static get baseUrl => 'https://gluoncloudtrading.azurewebsites.net';
  static get login => '$baseUrl/api/TokenAuth/Authenticate';
  static get getPendingApprovals => '$baseUrl/api/services/app/Approval/GetAllPendingApprovals';
  static get getApprovedApprovals => '$baseUrl/api/services/app/Approval/GetAllApprovedApprovals';
  static get getRejectedApprovals => '$baseUrl/api/services/app/Approval/GetAllRejectedApprovals';
  static get companiesDropDown => '$baseUrl/api/services/app/Company/GetAllDropdownCompanies?allow=true';
  static get costCenterDropDown => '$baseUrl/api/services/app/CostCenter/GetAllCostCentersList?allow=true';
  static get stationDropDown => '$baseUrl/api/services/app/Station/GetAllDropdownStations?allow=true';
  static get formDropDown => '$baseUrl/api/services/app/Form/GetAllFormsDropDownDto';
  static get approveSingleApproval => '$baseUrl/api/services/app/Approval/ApproveApprovalProcess';
  static get approveMultipleApprovals => '$baseUrl/api/services/app/Approval/ApproveAllSelectedApprovals';
  static get rejectSingleApproval => '$baseUrl/api/services/app/Approval/RejectApprovalProcess';
  static get rejectMultipleApprovals => '$baseUrl/api/services/app/Approval/RejectAllSelectedApprovals';
  static get approvalDetail => '$baseUrl/api/services/app/Approval/ProcessGetApprovalPreviewData?';
  static get getPDF => '$baseUrl/api/services/app/ReportPdf/GetReportPdf?docId=';

}
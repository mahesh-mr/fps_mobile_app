class StockDetailsModel {
  String? fpsId;
  String? distName;
  String? thalookName;
  String? respCode;
  String? respMessage;
  List<StockDetails>? stockDetails;

  StockDetailsModel(
      {this.fpsId,
      this.distName,
      this.thalookName,
      this.respCode,
      this.respMessage,
      this.stockDetails});

  StockDetailsModel.fromJson(Map<String, dynamic> json) {
    fpsId = json['fpsId'];
    distName = json['distName'];
    thalookName = json['thalookName'];
    respCode = json['respCode'];
    respMessage = json['respMessage'];
    if (json['stockDetails'] != null) {
      stockDetails = <StockDetails>[];
      json['stockDetails'].forEach((v) {
        stockDetails!.add(new StockDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fpsId'] = this.fpsId;
    data['distName'] = this.distName;
    data['thalookName'] = this.thalookName;
    data['respCode'] = this.respCode;
    data['respMessage'] = this.respMessage;
    if (this.stockDetails != null) {
      data['stockDetails'] = this.stockDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockDetails {
  String? commName;
  String? unitType;
  double? cb;

  StockDetails({this.commName, this.unitType, this.cb});

  StockDetails.fromJson(Map<String, dynamic> json) {
    commName = json['commName'];
    unitType = json['unitType'];
    cb = json['cb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commName'] = this.commName;
    data['unitType'] = this.unitType;
    data['cb'] = this.cb;
    return data;
  }
}

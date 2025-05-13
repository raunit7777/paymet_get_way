class PayinDataModel {
  dynamic status;
 dynamic transactionid;
 dynamic amount;
 dynamic utr;
 dynamic date;
 dynamic vpa;

  PayinDataModel(
      {this.status,
        this.transactionid,
        this.amount,
        this.utr,
        this.date,
        this.vpa});

  PayinDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transactionid = json['transactionid'];
    amount = json['amount'];
    utr = json['utr'];
    date = json['date'];
    vpa = json['vpa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['transactionid'] = transactionid;
    data['amount'] = amount;
    data['utr'] = utr;
    data['date'] = date;
    data['vpa'] = vpa;
    return data;
  }
}

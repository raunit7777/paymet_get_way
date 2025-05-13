class PayoutDataModel {
  int? status;
  String? statusParameter;
  List<Msg>? msg;

  PayoutDataModel({this.status, this.statusParameter, this.msg});

  PayoutDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusParameter = json['StatusParameter'];
    if (json['msg'] != null) {
      msg = <Msg>[];
      json['msg'].forEach((v) {
        msg!.add( Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['StatusParameter'] = statusParameter;
    if (msg != null) {
      data['msg'] = msg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String? accountNo;
  String? ifsccode;
  String? amount;
  String? bankname;
  String? orderid;
  Null? payoutid;
  String? status;

  Msg(
      {this.accountNo,
        this.ifsccode,
        this.amount,
        this.bankname,
        this.orderid,
        this.payoutid,
        this.status});

  Msg.fromJson(Map<String, dynamic> json) {
    accountNo = json['account_no'];
    ifsccode = json['ifsccode'];
    amount = json['amount'];
    bankname = json['bankname'];
    orderid = json['orderid'];
    payoutid = json['payoutid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_no'] = accountNo;
    data['ifsccode'] = ifsccode;
    data['amount'] = amount;
    data['bankname'] = bankname;
    data['orderid'] = orderid;
    data['payoutid'] = payoutid;
    data['status'] = status;
    return data;
  }
}

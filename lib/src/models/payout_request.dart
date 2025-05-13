class PayoutRequest {
  final String salt;
  final String merchantId;
  final String merchantToken;
  final String accountNo;
  final String ifscCode;
  final String amount;
  final String bankName;
  final String remark;
  final String orderId;
  final String name;
  final String contact;
  final String email;

  PayoutRequest({
    required this.salt,
    required this.merchantId,
    required this.merchantToken,
    required this.accountNo,
    required this.ifscCode,
    required this.amount,
    required this.bankName,
    required this.remark,
    required this.orderId,
    required this.name,
    required this.contact,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'salt': salt,
      'merchant_id': merchantId,
      'merchant_token': merchantToken,
      'account_no': accountNo,
      'ifsccode': ifscCode,
      'amount': amount,
      'bankname': bankName,
      'remark': remark,
      'orderid': orderId,
      'name': name,
      'contact': contact,
      'email': email,
    };
  }
}

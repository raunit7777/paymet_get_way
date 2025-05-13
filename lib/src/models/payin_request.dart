class PayinRequest {
  final String merchantId;
  final String orderId;
  final String amount;
  final String name;
  final String email;
  final String mobile;
  final String remark;
  final String type;
  final String redirectUrl;

  PayinRequest({
    required this.merchantId,
    required this.orderId,
    required this.amount,
    required this.name,
    required this.email,
    required this.mobile,
    required this.remark,
    required this.type,
    required this.redirectUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'merchantid': merchantId,
      'orderid': orderId,
      'amount': amount,
      'name': name,
      'email': email,
      'mobile': mobile,
      'remark': remark,
      'type': type,
      'redirect_url': redirectUrl,
    };
  }
}

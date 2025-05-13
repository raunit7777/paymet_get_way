class StatusResponse {
  final String status;
  final String orderId;
  final String message;

  StatusResponse({
    required this.status,
    required this.orderId,
    required this.message,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(
      status: json['status'].toString(),
      orderId: json['order_id'],
      message: json['message'],
    );
  }
}

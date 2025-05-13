import 'package:flutter/material.dart';
import 'package:paymet_get_way/getway.dart'; // Make sure this has ApiService and StatusResponse

class PaymentStatusScreen extends StatefulWidget {
  @override
  _PaymentStatusScreenState createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  String paymentStatus = 'Pending';
  String errorMessage = '';

  void getStatus() async {
    try {
      final statusResponse = await ApiService.getPayinStatus(orderId: "0000100");

      setState(() {
        paymentStatus = statusResponse.status ?? 'Unknown';
        errorMessage = '';
      });
    } catch (e, stackTrace) {
      print('❌ Error fetching payment status: $e');
      print('📌 StackTrace:\n$stackTrace');

      setState(() {
        errorMessage = 'Error: $e';
        paymentStatus = 'Error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Status')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            errorMessage.isEmpty
                ? Text('Payment Status: $paymentStatus')
                : Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getStatus,
              child: Text('Check Status'),
            ),
          ],
        ),
      ),
    );
  }
}

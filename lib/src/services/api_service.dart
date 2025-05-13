// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import '../models/payin_request.dart';
// import '../models/payout_request.dart';
// import '../models/status_response.dart';
//
// class ApiService {
//   static const String baseUrl = "https://indianpay.co.in/admin";
//
//   // Payin API Call with error handling
//   static Future<Map<String, dynamic>> initiatePayin(PayinRequest request) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/paynow'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(request.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body); // Success case
//       } else {
//         throw Exception('Failed to initiate Payin');
//       }
//     } catch (e) {
//       // Error Handling
//       throw Exception('Error occurred while making Payin request: $e');
//     }
//   }
//
//   // Payout API Call with error handling
//   static Future<Map<String, dynamic>> initiatePayout(PayoutRequest request) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/single_transaction'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(request.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body); // Success case
//       } else {
//         throw Exception('Failed to initiate Payout');
//       }
//     } catch (e) {
//       // Error Handling
//       throw Exception('Error occurred while making Payout request: $e');
//     }
//   }
//
//   // Payin Status API Call with error handling
//   static Future<StatusResponse> getPayinStatus({required dynamic orderId}) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/payinstatus?order_id=$orderId'),
//       );
//
//       if (response.statusCode == 200) {
//         return StatusResponse.fromJson(jsonDecode(response.body)); // Success case
//       } else {
//         throw Exception('Failed to fetch Payin Status');
//       }
//     } catch (e) {
//       // Error Handling
//       throw Exception('Error occurred while fetching Payin Status: $e');
//     }
//   }
//
//   static Future<String> getPayoutStatus(String orderId) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/payout_status?order_id=$orderId'));
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         // Assuming the API returns a string status like "Success"
//         return data['status'] ?? 'Unknown Status';
//       } else {
//         throw Exception('Failed to load payout status');
//       }
//     } catch (e) {
//       throw Exception('Error occurred while fetching payout status: $e');
//     }
//   }
//
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/payin_request.dart';
import '../models/payout_request.dart';
import '../models/status_response.dart';

class ApiService {
  static const String baseUrl = "https://indianpay.co.in/admin";

  // Helper method to print URLs
  static void _printUrl(String endpoint, {Map<String, dynamic>? params}) {
    final uri = Uri.parse('$baseUrl/$endpoint');
    print('🌐 [API CALL] Hitting URL: ${uri.toString()}');
    if (params != null) {
      print('📦 [PARAMS] Request parameters: $params');
    }
  }

  // Payin API Call with error handling
  static Future<Map<String, dynamic>> initiatePayin(PayinRequest request) async {
    try {
      final endpoint = 'paynow';
      _printUrl(endpoint, params: request.toJson());

      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      print('🔄 [RESPONSE] Status: ${response.statusCode}');
      return jsonDecode(response.body);
    } catch (e) {
      print('❌ [ERROR] Payin request failed: $e');
      throw Exception('Error occurred while making Payin request: $e');
    }
  }

  // Payout API Call with error handling
  static Future<Map<String, dynamic>> initiatePayout(PayoutRequest request) async {
    try {
      final endpoint = 'single_transaction';
      _printUrl(endpoint, params: request.toJson());

      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      print('🔄 [RESPONSE] Status: ${response.statusCode}');
      return jsonDecode(response.body);
    } catch (e) {
      print('❌ [ERROR] Payout request failed: $e');
      throw Exception('Error occurred while making Payout request: $e');
    }
  }

  // Payin Status API Call with error handling
  static Future<StatusResponse> getPayinStatus({required dynamic orderId}) async {
    try {
      final endpoint = 'payinstatus?order_id=$orderId';
      _printUrl(endpoint);

      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
      );

      print('🔄 [RESPONSE] Status: ${response.statusCode}');
      return StatusResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('❌ [ERROR] Payin status request failed: $e');
      throw Exception('Error occurred while fetching Payin Status: $e');
    }
  }

  static Future<String> getPayoutStatus(String orderId) async {
    try {
      final endpoint = 'payout_status?order_id=$orderId';
      _printUrl(endpoint);

      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
      );

      print('🔄 [RESPONSE] Status: ${response.statusCode}');
      print('📦 [DATA] Response body: ${response.body}');

      final data = json.decode(response.body);
      return data['status'] ?? 'Unknown Status';
    } catch (e) {
      print('❌ [ERROR] Payout status request failed: $e');
      throw Exception('Error occurred while fetching payout status: $e');
    }
  }
}
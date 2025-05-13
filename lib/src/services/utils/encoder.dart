import 'dart:convert';

String encodeSalt(String salt) {
  return base64Encode(utf8.encode(salt));
}

import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

class EncryptionService {
  static final EncryptionService _instance = EncryptionService._internal();

  EncryptionService._internal();

  factory EncryptionService() {
    return _instance;
  }

  encrypt.Key? _key;

  void init(String keyString) {
    if (keyString.length != 32) {
      throw Exception('Key must be 32 characters long for AES-256.');
    }
    _key = encrypt.Key.fromUtf8(keyString);
  }

  String encryptData(String value) {
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }

    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key!, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(value, iv: iv);
    final combined = json.encode({
      'iv': iv.base64,
      'value': encrypted.base64,
    });

    return base64UrlEncode(utf8.encode(combined));
  }

  String decryptData(String encryptedValue) {
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }

    final decoded = utf8.decode(base64Url.decode(encryptedValue));
    final Map<String, dynamic> combined = json.decode(decoded);
    final iv = encrypt.IV.fromBase64(combined['iv']);
    final encrypted = encrypt.Encrypted.fromBase64(combined['value']);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key!, mode: encrypt.AESMode.cbc));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}

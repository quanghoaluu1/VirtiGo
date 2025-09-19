
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:virtigo/api/api_endpoint.dart';
import 'package:virtigo/config/dio_client.dart';
import 'package:virtigo/models/auth_response.dart';

class AuthService {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // Future<User?> signUp(String email, String password) async {
  //   final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   return credential.user;
  // }
  //
  // Future<User?> signIn(String email, String password) async {
  //   final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   return credential.user;
  // }
  // Future<void> signOut() async {
  //   await _auth.signOut();
  // }
  // Future<void> resetPassword(String email) async {
  //   await _auth.sendPasswordResetEmail(email: email);
  // }
  // Stream<User?> get userChanges => _auth.userChanges();

  final Dio _dio = DioClient().dio;
  final storage = GetStorage();

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _dio.post(ApiEndpoint.login, data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(response.data);
        await storage.write('token', authResponse.token);
        return authResponse;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> register(String username, String email, String password) async {
    try{


    final response = await _dio.post(
      ApiEndpoint.register,
      data: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    final authResponse = AuthResponse.fromJson(response.data);

    if (authResponse.success) {
      storage.write("token", authResponse.token); // lưu token
    }

    return authResponse;
  }on DioException catch (e) {
      print("❌ DioError:");
      print("   Type: ${e.type}");
      print("   Message: ${e.message}");
      print("   Response: ${e.response}");
      print("   Status: ${e.response?.statusCode}");
      print("   Data: ${e.response?.data}");
      rethrow;
    } catch (e) {
      print("❌ Unexpected error: $e");
      rethrow;
    }
  }
}
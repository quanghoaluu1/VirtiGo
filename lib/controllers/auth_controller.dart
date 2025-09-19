
import 'package:virtigo/models/auth_response.dart';
import 'package:virtigo/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final AuthService _authService = AuthService();

  var isLoading = false.obs; // trạng thái loading
  var authResponse = Rx<AuthResponse?>(null); // response khi login/register
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  /// Đăng nhập
  Future<void> login() async {
    try {
      isLoading.value = true;

      final res = await _authService.login(email.value, password.value);
      authResponse.value = res;

      if (res.success) {
        // Kiểm tra role để điều hướng
        if (res.roles.contains("Admin")) {
          Get.offAllNamed("/admin");
        } else {
          Get.offAllNamed("/home");
        }
      } else {
        Get.snackbar("Đăng nhập thất bại", res.message);
      }
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Đăng ký
  Future<void> register() async {
    try {
      isLoading.value = true;

      final res = await _authService.register(username.value, email.value, password.value);
      authResponse.value = res;

      if (res.success) {
        // Sau khi đăng ký thành công sẽ vào home hoặc admin luôn
        if (res.roles.contains("Admin")) {
          Get.offAllNamed("/admin");
        } else {
          Get.offAllNamed("/home");
        }
      } else {
        Get.snackbar("Đăng ký thất bại", res.message);
      }
    } catch (e) {
      Get.snackbar("Lỗi", e.toString());
      print("Lỗi: " + e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void resetPassword() {
    Get.snackbar("Thông báo", "Tính năng quên mật khẩu đang phát triển");
  }
  /// Đăng xuất
  // void logout() {
  //   authResponse.value = null;
  //   // Xoá token trong storage (AuthService có lưu token khi login/register)
  //   _authService.clearToken();
  //   Get.offAllNamed("/login");
  // }
}
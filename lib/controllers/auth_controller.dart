
import 'package:virtigo/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final AuthService _authService = AuthService();

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> signUp() async{
    try{
      isLoading.value = true;
      User? user = await _authService.signUp(email.value, password.value);
      if (user != null){
        Get.snackbar("Success", 'signup_success'.tr);
      }
    }catch(e){
      Get.snackbar("Error", e.toString());
      print("Sign up error: $e");
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      User? user = await _authService.signIn(email.value, password.value);
      if (user != null) {
        Get.snackbar("Success", 'login_success'.tr);
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar("Error", 'login_error'.tr);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    Get.offAllNamed('/login');
  }

  Future<void> resetPassword() async {
    await _authService.resetPassword(email.value);
    Get.snackbar("Success", "Password reset email sent!");
  }

}
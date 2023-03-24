import 'package:candy/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // 로그인 함수
  Future<void> onLoginButtonTap(BuildContext context) async {
    // 카카오톡 설치 여부 확인
    if (await isKakaoTalkInstalled()) {
      try {
        // 카카오톡으로 로그인 시도
        await UserApi.instance.loginWithKakaoTalk();
        Get.to(const MainPage());
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          Get.to(const MainPage());
        } catch (error) {}
      }
      // 카카오톡이 설치되지 않은 경우
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        Get.to(const MainPage());
      } catch (error) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'CANDY',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onLoginButtonTap(context);
                  },
                  child: Image.asset(
                    'assets/images/kakao/kakao_login_medium_wide.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

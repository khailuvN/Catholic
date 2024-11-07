import 'package:flutter/material.dart';
import 'Man2.dart';

class Man1 extends StatefulWidget {
  @override
  _Man1State createState() => _Man1State();
}

class _Man1State extends State<Man1> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/group1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/logo1.png',
                        height: 57,
                        width: 42,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Chào mừng bạn mới',
                        style: TextStyle(fontSize: 27, color: Color(0xFFA61028)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Đăng ký tài khoản',
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFFA61028),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextField(labelText: 'Họ và Tên'),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'Email của bạn'),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Số điện thoại',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Mật khẩu',
                      obscureText: !_isPasswordVisible,
                      onIconPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      isPasswordField: true,
                      isPasswordVisible: _isPasswordVisible,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Nhập lại mật khẩu',
                      obscureText: !_isConfirmPasswordVisible,
                      onIconPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                      isPasswordField: true,
                      isPasswordVisible: _isConfirmPasswordVisible,
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      text: 'Đăng ký',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thông báo'),
                              content: const Text('Đăng ký thành công!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Đã có tài khoản ?',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Man2()),
                            );
                          },
                          child: const Text(
                            'Đăng nhập.',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isPasswordField;
  final bool? isPasswordVisible;
  final VoidCallback? onIconPressed;

  const CustomTextField({
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.isPasswordField = false,
    this.isPasswordVisible,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 19, color: Colors.black),
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(
            isPasswordVisible! ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onIconPressed,
        )
            : null,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFA61028),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}

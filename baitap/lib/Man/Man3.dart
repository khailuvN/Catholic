import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Man4.dart';

class Man3 extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'Quên mật khẩu',
                      onBackPress: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Center(child: LogoWidget()),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(
                        controller: _phoneController,
                        labelText: 'Nhập số điện thoại',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 70),
                    CustomButton(
                      text: 'Lấy mã xác nhận',
                      color: const Color(0xFFA61028),
                      onPressed: () {
                        String phoneNumber = _phoneController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Man4(phoneNumber: phoneNumber),
                          ),
                        );
                      },
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

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackPress;

  const CustomAppBar({
    required this.title,
    required this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Row(
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: onBackPress,
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/assets/logo1.png', height: 56, width: 60),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Chair',
              style: TextStyle(
                color: Color(0xFFA61028),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 355,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
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

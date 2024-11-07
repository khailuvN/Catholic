import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Man3.dart';

class Man2 extends StatefulWidget {
  @override
  _Man2State createState() => _Man2State();
}

class _Man2State extends State<Man2> {
  bool _isPasswordVisible = false;
  bool isChecked = false;

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
              CustomHeader(
                imagePath: "lib/assets/group2.png",
                logoPath: "lib/assets/logo.png",
                title: "Chào mừng quay lại",
                subtitle: "Đăng nhập",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const CustomTextField(labelText: 'Email'),
                    const SizedBox(height: 25),
                    CustomTextField(
                      labelText: 'Mật khẩu',
                      obscureText: !_isPasswordVisible,
                      isPasswordField: true,
                      onIconPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        CustomCheckbox(
                          label: 'Nhớ đăng nhập',
                          value: isChecked,
                          onChanged: (bool value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Man3()));
                          },
                          child: const CustomUnderlineText(
                            text: 'Quên mật khẩu ?',
                            underlineWidth: 110,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Đăng Nhập',
                      color: const Color(0xFFA61028),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Hoặc',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Đăng nhập bằng google',
                      color: Colors.grey[100]!,
                      iconPath: 'lib/assets/google.png',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Chưa có tài khoản ?',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Đăng ký.',
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

class CustomHeader extends StatelessWidget {
  final String imagePath;
  final String logoPath;
  final String title;
  final String subtitle;

  const CustomHeader({
    required this.imagePath,
    required this.logoPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset(logoPath, width: 42, height: 56),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w400,
              shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black26)],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
              shadows: [Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black26)],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final bool isPasswordField;
  final VoidCallback? onIconPressed;
  final TextInputType? keyboardType;

  const CustomTextField({
    required this.labelText,
    this.obscureText = false,
    this.isPasswordField = false,
    this.onIconPressed,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: onIconPressed,
        )
            : null,
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) => onChanged(newValue!),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 19),
        ),
      ],
    );
  }
}

class CustomUnderlineText extends StatelessWidget {
  final String text;
  final double underlineWidth;

  const CustomUnderlineText({
    required this.text,
    required this.underlineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 19),
        ),
        Container(
          margin: const EdgeInsets.only(top: 1),
          height: 1,
          width: underlineWidth,
          color: Colors.black,
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final String? iconPath;

  const CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) Image.asset(iconPath!, height: 30),
            if (iconPath != null) const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: color == Colors.grey[100] ? Colors.black : Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

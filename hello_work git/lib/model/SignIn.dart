import 'package:flutter/material.dart';
import 'ForgotPassword.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/Group3.jpg',
                height: 50,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Căn tất cả các phần tử về bên trái
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Khoảng cách giữa các phần tử
              const Text(
                "Welcome back, Yoo Jin",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                "Email",
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Forgot Password",
                style: TextStyle(color: Colors.blue),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(
                                0, 206, 166, 1), // Màu nền rgba(0, 206, 166, 1)
                            padding: const EdgeInsets.symmetric(
                                vertical: 15), // Tùy chỉnh độ cao của nút
                          ),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.blue.withOpacity(0.5),
                        child: Image.asset('assets/images/Group9.jpg',
                            width: 50, height: 50),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.yellow.withOpacity(0.5),
                        child: Image.asset('assets/images/Group8.jpg',
                            width: 50, height: 50),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.green.withOpacity(0.5),
                        child: Image.asset('assets/images/Group10.jpg',
                            width: 50, height: 50),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    child: const Text('Back to Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

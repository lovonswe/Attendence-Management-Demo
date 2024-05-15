import 'package:attendence_and_leave_management/widgets/image_grid_view.dart';
import 'package:flutter/material.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  bool _hidePassword = true;

  void changeVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  String url = "https://chaldn.com/_mpimage/red-tomato-25-gm-500-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D64361&q=best&v=1&m=400&webp=1";

  @override
  Widget build(BuildContext context) {
    void goToAttendenceRecordVisualizationPage(){
      //Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendenceRecordVisualization()));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCard(imageUrl: url, title: "Tomato",)));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageCardGridView()));
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 20),
          children: [
            const Text(
              "Share Me",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 10,),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                // helperText: "email format : nahidswe@gmail.com",
                // errorText: "Enter a valid email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: _hidePassword,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        changeVisibility();
                      },
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility))),
            ),
            const SizedBox(height: 5),
            const Text(
              "Forget Password?",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF5E62DB),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                goToAttendenceRecordVisualizationPage();
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFF5E62DB)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                  )),
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromHeight(45))),
              child: const Text(
                "NEXT",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
                height: 30), // Add some space between button and "Or" text
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const NewWidget(text: "Continue with Apple", icon: Icons.apple,),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.black)), // Border color
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))), // Border radius
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image.asset(
                  //   'assets/google_icon.png', // Replace with your Google icon asset path
                  //   height: 24, // Adjust the icon height as needed
                  // ),
                  Icon(Icons.apple),
                  SizedBox(width: 8), // Add space between icon and text
                  Text(
                    "Sign in with Google",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.black)), // Border color
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))), // Border radius
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image.asset(
                  //   'assets/google_icon.png', // Replace with your Google icon asset path
                  //   height: 24, // Adjust the icon height as needed
                  // ),
                  Icon(Icons.facebook, color: Colors.blue,),
                  SizedBox(width: 8), // Add space between icon and text
                  Text(
                    "Sign in with Facebook",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            TextButton(onPressed: () {}, child: const Text("Create a new account"))
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const NewWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(color: Colors.black)), // Border color
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))), // Border radius
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   'assets/google_icon.png', // Replace with your Google icon asset path
          //   height: 24, // Adjust the icon height as needed
          // ),
          Icon(icon, color: Colors.black,),
          const SizedBox(width: 8), // Add space between icon and text
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late double width, height;
  TextEditingController usernameController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: width,
          height: height,
          alignment: Alignment.topCenter,
          color: Colors.teal[200],
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign\nIn",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                      ),
                    )),
                Image.asset(
                  "assets/images/login_mobile.png",
                  height: height * 0.45,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone Number',
                      counterText: "",
                    ),
                    autovalidateMode: AutovalidateMode.disabled,
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      debugPrint(phone.completeNumber);
                    },
                    onTap: () => {scrollController.jumpTo(height)},
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  child: const Text("Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.teal[700],
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

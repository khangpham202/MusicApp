import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:music_app/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUpScreenHeader(size: size),
                SignUpForm(),
                const SignUpScreenFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpScreenFooter extends StatelessWidget {
  const SignUpScreenFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text(
        "OR",
        style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage("assets/images/google.png"),
              width: 20,
            ),
            onPressed: () {},
            label: const Text("Sign-Up with Google"),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                // backgroundColor: const Color(0xFF272727),
                side: const BorderSide(color: Color(0xFF272727)),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have account? ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          const Icon(Icons.arrow_right_alt),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/login");
              },
              child: const Text("Login"))
        ],
      )
    ]);
  }
}

class SignUpScreenHeader extends StatelessWidget {
  const SignUpScreenHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage("assets/images/logo.png"),
          height: size.height * 0.25,
        ),
        const Text(
          "Sign-up,",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const Text(
          "Let's discover the world via music",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);
  final fullName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref().child("Users");

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: const TextStyle(
              color: Colors.black, // set the color of the text
            ),
            controller: fullName,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "FullName",
                hintText: "FullName",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.black, // set the color of the text
            ),
            controller: emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "E-Mail",
                hintText: "E-mail",
                border: OutlineInputBorder()),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.black, // set the color of the text
            ),
            controller: passwordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_outlined))),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
                ? 'Enter.min 6 characters'
                : null,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // backgroundColor: Colors.white,
                    backgroundColor: const Color(0xFF272727),
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text("SIGN-UP"),
              )),
        ],
      ),
    ));
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final Map<String, dynamic> userData = {
        'name': fullName.text.trim(),
        'email': emailController.text.trim(),
      };
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content: Text("Sign-up successfully"),
          backgroundColor: Colors.green));
      DatabaseReference userRef =
          ref.child(FirebaseAuth.instance.currentUser!.uid);
      userRef.push().set(userData);
    } on FirebaseAuthException catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(content: Text("${e.message}"), backgroundColor: Colors.red));
    }
  }
}

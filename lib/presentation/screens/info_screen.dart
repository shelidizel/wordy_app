import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordy_app/core/wordy_theme.dart';
import 'package:wordy_app/models/user.dart';
import 'package:wordy_app/presentation/screens/design_screen.dart';
import 'package:email_validator/email_validator.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController phoneInput = TextEditingController();

  final _formKey = GlobalKey<FormState>();
    

  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      backgroundColor: WordyTheme.light().colorScheme.background,
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Center(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 12, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              color: const Color(0xff373636),
                            ),
                            children: [
                              TextSpan(
                                text: 'Create you profile\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'on wordy app.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: WordyTheme.light()
                                        .colorScheme
                                        .secondary),
                              ),
                            ],
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12, 8),
                    child: PhysicalModel(
                      color: Colors.white.withOpacity(0.5),
                      shadowColor: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      elevation: 5,
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameInput,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: const Text(
                                'Enter your name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: WordyTheme.light().colorScheme.secondary,
                                size: 20,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: PhysicalModel(
                      elevation: 5,
                      color: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          controller: emailInput,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () => emailInput.clear(),
                                  icon: const Icon(Icons.close)),
                              filled: true,
                              fillColor: Colors.white,
                              label: const Text('Enter your email',
                                                 style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: WordyTheme.light().colorScheme.secondary,
                                size: 20,
                              )),
                          validator: (value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            // the email is valid
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: PhysicalModel(
                      elevation: 5,
                      color: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneInput,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: const Text('Enter your phone number',
                                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: WordyTheme.light().colorScheme.secondary,
                                size: 20,
                              )),
                          validator: (value) {
// Indian Mobile number are of 10 digit only
                            if (value?.length != 10)
                              return 'Mobile Number must be of 10 digit';
                            else
                              return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ))),
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            saveUser();
                          }
                        },
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ],
              ))),
    );

    
  }


   

  void saveUser() {
    String name = nameInput.text;
    String email = emailInput.text;
    String phone = phoneInput.text;
    saveUserPreference(name, email, phone).then((bool committed) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop, child: DesignScreen()));
    });
  }
}

Future<bool> saveUserPreference(String name, String email, String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('email', email);
  prefs.setString('phone', phone);
  return prefs.commit();
}

Future<User> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User user = User(
      name: prefs.getString('name'),
      email: prefs.getString('email'),
      phoneNumber: prefs.getString('phone'));

  return user;
}

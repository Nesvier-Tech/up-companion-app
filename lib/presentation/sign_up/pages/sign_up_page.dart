import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:up_companion_app/utils/constants/enums/up_campuses.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = '/sign-up-page';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign-Up')),
        body: const SignUpForm(),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                  top: 18,
                  right: 18,
                  bottom: 18,
                  left: 12,
                ),
                labelText: 'UP Campus',
              ),
              items: <String>[
                'UP Diliman',
                'UP Los Baños',
                'UP Manila',
                'UP Visayas',
                'UP Open University',
                'UP Mindanao',
                'UP Baguio',
                'UP Cebu',
              ].map<DropdownMenuItem<String>>((String upCampusName) {
                return DropdownMenuItem(
                  value: upCampusName,
                  child: Text(upCampusName),
                );
              }).toList(),
              onChanged: (upCampusName) {
                print(upCampusName);
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_rounded),
              label: const Text('Create My Account'),
            ),
            const SizedBox(height: 15),
            Column(
              children: <Widget>[
                const Text(
                  'By creating an account, you agree to our',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => showBarModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: const <Widget>[
                                    Text(
                                      'Privacy Policy Statement',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem nulla pharetra diam sit amet. Nisi quis eleifend quam adipiscing vitae proin sagittis nisl. Tortor pretium viverra suspendisse potenti nullam ac tortor. Magna etiam tempor orci eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada. Proin libero nunc consequat interdum varius sit amet mattis. At risus viverra adipiscing at. Auctor augue mauris augue neque gravida. Enim lobortis scelerisque fermentum dui. Amet mattis vulputate enim nulla. Vel facilisis volutpat est velit egestas dui. Aliquam eleifend mi in nulla posuere. Vitae nunc sed velit dignissim sodales ut eu sem. Egestas quis ipsum suspendisse ultrices gravida dictum fusce ut. A lacus vestibulum sed arcu non odio. Tellus at urna condimentum mattis pellentesque id. Ac odio tempor orci dapibus ultrices in. Dignissim diam quis enim lobortis scelerisque fermentum.',
                                    ),
                                    SizedBox(height: 25),
                                    Text(
                                      'Other Details',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem nulla pharetra diam sit amet. Nisi quis eleifend quam adipiscing vitae proin sagittis nisl. Tortor pretium viverra suspendisse potenti nullam ac tortor. Magna etiam tempor orci eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada. Proin libero nunc consequat interdum varius sit amet mattis. At risus viverra adipiscing at. Auctor augue mauris augue neque gravida. Enim lobortis scelerisque fermentum dui. Amet mattis vulputate enim nulla. Vel facilisis volutpat est velit egestas dui. Aliquam eleifend mi in nulla posuere. Vitae nunc sed velit dignissim sodales ut eu sem. Egestas quis ipsum suspendisse ultrices gravida dictum fusce ut. A lacus vestibulum sed arcu non odio. Tellus at urna condimentum mattis pellentesque id. Ac odio tempor orci dapibus ultrices in. Dignissim diam quis enim lobortis scelerisque fermentum.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      ' and ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      'Terms and Conditions.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

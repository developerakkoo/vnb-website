import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final message = messageController.text;

      final response = await http.post(
        Uri.parse('http://your-server-url/submit'),
        body: {
          'name': name,
          'email': email,
          'message': message,
        },
      );

      if (response.statusCode == 200) {
        // Form submitted successfully
        print('Form submitted successfully');
      } else {
        // Form submission failed
        print('Form submission failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "C O N T A C T  U S",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Contact Us",
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("MIDC, NAShilk, 123456"),
                          Text("MIDC, NAShilk, 123456"),
                          Text("MIDC, NAShilk, 123456"),
                          Text("MIDC, NAShilk, 123456"),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 500,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(46.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2), // Change the color here
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2), // Change the color here
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!value!.contains('@')) {
                                    return 'Invalid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2), // Change the color here
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Enter your message',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                maxLines: 3,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a message';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 24.0),
                              Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 106, 0, 88),
                                      Color.fromARGB(255, 242, 94, 255)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: MaterialButton(
                                  onPressed: _submitForm,
                                  child: Text(
                                    "S U B M I T",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

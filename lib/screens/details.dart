import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pincode = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HomeScreen()));
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'D E T A I L S',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.left,
                "Add Delivery Details",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          filled: true,
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
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _contactNumber,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Contact Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your contact number';
                          } else if (value!.length != 10) {
                            return 'Contact number must be exactly 10 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _address,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _pincode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Pincode',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your pincode';
                          } else if (value!.length != 6) {
                            return 'Pincode must be exactly 6 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _submitForm();
                          }
                        },
                        child: Text('Submit'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _submitForm() async {
    print('Name: ${_name.text}');
    print('Contact Number: ${_contactNumber.text}');
    print('Email: ${_email.text}');
    print('Address: ${_address.text}');
    print('Pincode: ${_pincode.text}');
    // final url = "";
    // final response = await http.post(Uri.parse(url), body: {''});

    // if (response.statusCode == 200) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    // } else {
    //   setState(() {
    //     _isLoading = false;
    //     print("Error Occured");
    //   });
    // }
  }

  @override
  void dispose() {
    _name.dispose();
    _contactNumber.dispose();
    _email.dispose();
    _address.dispose();
    _pincode.dispose();
    super.dispose();
  }
}

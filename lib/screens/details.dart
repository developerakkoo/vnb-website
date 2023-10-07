import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vnbweb/screens/cart.dart';
import 'package:vnbweb/screens/home.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
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
                        controller: _fName,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.purpleAccent, width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _lName,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
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
                        controller: _city,
                        decoration: InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _state,
                        decoration: InputDecoration(
                          labelText: 'State',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your state';
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
                      MaterialButton(
                        minWidth: 100.0,
                        onPressed: () {
                          // print(_email);
                          // print(_password);
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();

                          //   authProvider.login(_email, _password).then((value) =>
                          //       {
                          //         result = json.decode(value.body),
                          //         print("VAlue returned is:- "),
                          //         print(result),
                          //         if (value.statusCode == 200)
                          //           {
                          //             print("Success"),
                          //             print(result['message']),
                          //             print(result['data']['userId']),

                          //             //Show snakbar
                          //             ScaffoldMessenger.of(context).showSnackBar(
                          //                 SnackBar(
                          //                     content:
                          //                         Text("Sign in Successfull"))),
                          //             Navigator.pushNamed(context, '/home')

                          //             // saveData(result[
                          //             //         'AssociateMemberCreated']
                          //             //     ['_id']),
                          //           }
                          //         else if (value.statusCode == 404)
                          //           {
                          //             print(value.message),
                          //             ScaffoldMessenger.of(context).showSnackBar(
                          //                 SnackBar(
                          //                     backgroundColor: Colors.red,
                          //                     content: Text(result['message'])))
                          //           }
                          //         else if (value.statusCode == 400)
                          //           {
                          //             print(value.message),
                          //             ScaffoldMessenger.of(context).showSnackBar(
                          //                 SnackBar(
                          //                     backgroundColor: Colors.red,
                          //                     content: Text(result['message'])))
                          //           }
                          //       });
                          // }
                          // Navigator.pushNamed(context, '/select-city');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.all(20.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF7F00FF),
                                Color(0xffE100FF),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 100.0,
                                minHeight:
                                    50.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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
    print('Name: ${_fName.text}');
    print('Last Name: ${_lName.text}');
    print('Contact Number: ${_contactNumber.text}');
    print('Email: ${_email.text}');
    print('Address: ${_address.text}');
    print('City: ${_city.text}');
    print('State: ${_state.text}');
    print('Pincode: ${_pincode.text}');

    // final data = {
    //   "fName": _fName.text,
    //   "lName": _lName.text,
    //   "number": _contactNumber.text,
    //   "email": _email.text,
    //   "address": _address.text,
    //   "city": _city.text,
    //   "state": _state.text,
    //   "pincode": _pincode.text
    // };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
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
    _fName.dispose();
    _state.dispose();
    _city.dispose();
    _lName.dispose();
    _contactNumber.dispose();
    _email.dispose();
    _address.dispose();
    _pincode.dispose();
    super.dispose();
  }
}

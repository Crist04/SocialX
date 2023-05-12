import 'package:flutter/material.dart';

const String kApiKey ='83af25a1130f4735bda370064b445436';

const kTextFieldInputDecoration = InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 231, 165, 174)),
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.redAccent)),
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.redAccent,
                      ));


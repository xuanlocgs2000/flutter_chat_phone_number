import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  static Country _selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode("84");
  String _countryCode = _selectedCountry.phoneCode;
  String _phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    void _openFilteredCountryPickerDialog() {
      showDialog(
          context: context,
          builder: (_) => Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.blue,
                ),
                child: CountryPickerDialog(
                  titlePadding: EdgeInsets.all(8.0),
                  searchCursorColor: Colors.black,
                  searchInputDecoration: InputDecoration(
                    hintText: "Search",
                  ),
                  isSearchable: true,
                  title: Text("Select your phone code"),
                  onValuePicked: (Country country) {
                    setState(() {
                      _selectedCountry = country;
                      _countryCode = country.phoneCode;
                    });
                  },
                  itemBuilder: _buildDialogItem,
                ),
              ));
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Text(
              "SMS SEND Verrify phone",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            "SEND Verrify phone",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 2),
            onTap: _openFilteredCountryPickerDialog,
            title: _buildDialogItem(_selectedCountry),
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                ))),
                width: 80,
                height: 55,
                alignment: Alignment.center,
                child: Text(
                  _selectedCountry.phoneCode,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.5),
                  )),
                  child: TextField(
                    style: TextStyle(
                      // Định dạng màu chữ tại đây
                      color: Colors.black, // Ví dụ: Màu chữ xanh
                    ),
                    controller: _phoneController,
                    decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OtpPage(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20, top: 50),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "+${country.phoneCode}",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Text(
              "${country.name}",
              style: TextStyle(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

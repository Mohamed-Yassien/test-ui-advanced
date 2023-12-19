import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  Country? selectedCountry;

  selectCountry({
    required Country country,
  }) {
    selectedCountry = country;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                    
                      margin: const EdgeInsets.all(20),

                      flagSize: 25,
                      backgroundColor: Colors.white,
                      textStyle:
                          const TextStyle(fontSize: 16, color: Colors.blueGrey),
                      bottomSheetHeight:
                          500, // Optional. Country list modal height
                      //Optional. Sets the border radius for the bottomsheet.
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      //Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        contentPadding: const EdgeInsets.all(5),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    onSelect: (Country country) {
                      debugPrint('Select country: ${country.displayName}');
                      selectCountry(country: country);
                    });
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    selectedCountry == null
                        ? const Text(
                            'select country',
                          )
                        : Text(
                            selectedCountry?.name ?? '',
                          ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

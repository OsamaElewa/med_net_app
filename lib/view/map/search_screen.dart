import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import 'leaflet_map_widget.dart';

class SearchScreen extends StatefulWidget {
  final String fromScreen;
  const SearchScreen({
    Key? key, required this.fromScreen,
  }) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];

  SearchScreenState();

  Future<void> _fetchSuggestions(String query) async {
    final url = 'https://nominatim.openstreetmap.org/search?format=json&q=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        _suggestions = data.map((item) => item['display_name'] as String).toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Search on the nearest place',
              style: GoogleFonts.abel(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const Spacer(),
            Lottie.asset('assets/lotties/map.json',height: 100.h,width: 100.w),

          ],
        ),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _searchController,
                onChanged: (value) {
                  _fetchSuggestions(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _suggestions.clear();
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = _suggestions[index];
                  return ListTile(
                    title: Text(suggestion,style: const TextStyle(color: Colors.white),),
                    onTap: () async {
                      suggestion_save = suggestion;
                      final confirmedLocation = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(searchedPlace: suggestion),
                        ),
                      );

                      // Handle confirmedLocation as needed, e.g., update state in CurrentLocationScreen.
                      if (confirmedLocation != null) {
                        // Do something with the confirmedLocation, if needed.
                        print('Confirmed Location: $confirmedLocation');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
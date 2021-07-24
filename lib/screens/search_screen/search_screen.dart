import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FormGroup _form = FormGroup({'search': FormControl(value: '')});
  List<String> results = ['Sweet bread', 'bread beans', 'imperial Bread bosun'];
  StreamController<List<Widget>> searchController = StreamController();
  List<Widget> searchResults = [];

  @override
  void dispose() {
    searchController.close();
    super.dispose();
  }

  @override
  void initState() {
    _form.controls['search']!.valueChanges.listen((event) {
      _search(event as String);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgButton(
              svg: ImageConstant.BACK_ICON,
              onTap: () => Navigator.pop(context),
            ),
            Text('Search products'),
            SvgButton(
              svg: ImageConstant.CART_ICON,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            children: [
              ReactiveTextField(
                autofocus: true,
                formControlName: 'search',
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  filled: true,
                  fillColor: Color(0x34E2F2FF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide:
                          BorderSide(color: Resources.LIGHT_BLUE_COLOR)),
                  focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
                  ),
                ),
              ),
              StreamBuilder<List<Widget>>(
                  stream: searchController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Container(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.SEARCH_RESULT_SCREEN),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: searchResults[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: searchResults.length,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  })
            ],
          ),
        ),
      ),
    );
  }

  _search(String search) {
    _setSearchResults([]);
    var formatted =
        results.map((e) => _formatResult(e, search.trim())).toList();
    _setSearchResults(formatted);
  }

  Widget _formatResult(String result, String search) {
    List<String> data = result.toLowerCase().split(search.toLowerCase());
    if (data.length == 1) {
      return RichText(
        text: TextSpan(
          text: data[0],
          style: TextStyle(color: Colors.black),
          children: [
            data[0].contains(search)
                ? TextSpan(
                    text: search,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : TextSpan(text: ''),
          ],
        ),
      );
    }
    List<TextSpan> spans = [];
    for (var i = 0; i < data.length; i++) {
      spans.add(TextSpan(text: data[i]));
      if (i < (data.length - 1)) {
        spans.add(TextSpan(
            text: search, style: TextStyle(fontWeight: FontWeight.bold)));
      }
    }
    return RichText(
      text: TextSpan(children: spans, style: TextStyle(color: Colors.black)),
    );
  }

  _setSearchResults(List<Widget> results) {
    searchResults = results;
    searchController.add(searchResults);
  }
}

import 'package:flutter/material.dart';

class PatientManage extends StatelessWidget {
  final Function onSearch;
  final FocusNode focusSearch;
  final TextEditingController searchController;

  const PatientManage(
      {super.key,
      required this.onSearch,
      required this.focusSearch,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          PatientSearch(
            onSearch: onSearch,
            focusSearch: focusSearch,
            searchController: searchController,
          ),
        ],
      ),
    );
  }
}

class PatientSearch extends StatefulWidget {
  final Function onSearch;
  final TextEditingController searchController;
  final FocusNode focusSearch;

  const PatientSearch(
      {super.key,
      required this.onSearch,
      required this.focusSearch,
      required this.searchController});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  Color _textFieldColorTheme = Colors.black26;

  @override
  void initState() {
    super.initState();
    widget.focusSearch.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _textFieldColorTheme =
          widget.focusSearch.hasFocus ? Colors.teal.shade200 : Colors.black26;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (String v) {
          widget.onSearch();
        },
        controller: widget.searchController,
        focusNode: widget.focusSearch,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _textFieldColorTheme, width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            prefixIcon: Icon(Icons.search, color: _textFieldColorTheme),
            suffixIcon: IconButton(
                onPressed: () {
                  widget.searchController.text = "";
                  widget.onSearch();
                },
                splashColor: Colors.white.withOpacity(0),
                highlightColor: Colors.white.withOpacity(0),
                icon: Icon(Icons.cancel_outlined, color: _textFieldColorTheme)),
            labelText: 'Search hn',
            labelStyle: TextStyle(color: _textFieldColorTheme)),
      ),
    );
  }
}

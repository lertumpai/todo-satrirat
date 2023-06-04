import 'package:flutter/material.dart';

class PatientManage extends StatelessWidget {
  final Function(String) onSearch;
  final FocusNode focusSearch;

  const PatientManage(
      {super.key, required this.onSearch, required this.focusSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          PatientSearch(
            onSearch: onSearch,
            focusSearch: focusSearch,
          ),
        ],
      ),
    );
  }
}

class PatientSearch extends StatefulWidget {
  final Function(String) onSearch;
  final FocusNode focusSearch;

  const PatientSearch(
      {super.key, required this.onSearch, required this.focusSearch});

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  final TextEditingController searchController = TextEditingController();
  Color _textFieldColorTheme = Colors.black26;

  @override
  void initState() {
    super.initState();
    searchController.text = "";
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
          widget.onSearch(searchController.text);
        },
        controller: searchController,
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
                  searchController.text = "";
                  widget.onSearch(searchController.text);
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

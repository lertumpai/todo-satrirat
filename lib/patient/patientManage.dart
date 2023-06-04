import 'package:flutter/material.dart';

class PatientManage extends StatelessWidget {
  final Function(String) onSearch;

  const PatientManage({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          PatientSearch(
              onSearch: onSearch,
          ),
        ],
      ),
    );
  }
}

class PatientSearch extends StatefulWidget {
  final Function(String) onSearch;

  const PatientSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Color _textFieldColorTheme = Colors.black26;

  @override
  void initState() {
    super.initState();
    searchController.text = "";
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _textFieldColorTheme = _focusNode.hasFocus ? Colors.teal.shade200 : Colors.black26;
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
        focusNode: _focusNode,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _textFieldColorTheme, width: 1.5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)
            ),
          ),
          prefixIcon: Icon(Icons.search, color: _textFieldColorTheme),
          suffixIcon: IconButton(
              onPressed: () {
                searchController.text = "";
                widget.onSearch(searchController.text);
              },
              splashColor: Colors.white.withOpacity(0),
              highlightColor: Colors.white.withOpacity(0),
              icon: Icon(Icons.cancel_outlined, color: _textFieldColorTheme)
          ),
          labelText: 'Search hn',
          labelStyle: TextStyle(color: _textFieldColorTheme)
        ),
      ),
    );
  }
}
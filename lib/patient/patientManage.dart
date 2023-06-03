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

class PatientSearch extends StatelessWidget {
  final Function(String) onSearch;

  const PatientSearch({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (String v) {
          onSearch(v);
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          prefixIcon: Icon(Icons.search),
          labelText: 'Search hn',
        ),
      ),
    );
  }
}
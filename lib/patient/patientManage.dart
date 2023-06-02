import 'package:flutter/material.dart';

class PatientManage extends StatelessWidget {
  const PatientManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: const [
          PatientSearch(),
        ],
      ),
    );
  }
}

class PatientSearch extends StatelessWidget {
  const PatientSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
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
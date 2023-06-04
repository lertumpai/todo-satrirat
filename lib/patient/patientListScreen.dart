import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/bloc/patientList.cubit.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientList.dart';
import 'package:todo_satrirat/patient/patientManage.dart';

import 'bloc/patientList.state.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  final FocusNode _focusSearch = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PatientListCubit>().search("");
  }

  @override
  Widget build(BuildContext context) {
    void onDeletePatient(int id) {
      context.read<PatientListCubit>().delete(id);
    }

    void onSearch() {
      context.read<PatientListCubit>().search(searchController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {
                _focusSearch.unfocus();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PatientEditablePage()));
              },
              icon: const Icon(Icons.add_card)),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            PatientManage(
                onSearch: onSearch,
                focusSearch: _focusSearch,
                searchController: searchController),
            const SizedBox(height: 10),
            BlocConsumer<PatientListCubit, PatientListState>(
                listener: (context, state) {
              if (state.status == PatientListStatusEnum.searching ||
                  state.status == PatientListStatusEnum.loading) {
                onSearch();
              }
            }, builder: (context, state) {
              return PatientList(
                patients: state.patients,
                onDeletePatient: onDeletePatient,
                focusSearch: _focusSearch,
              );
            })
          ],
        ),
      ),
    );
  }
}

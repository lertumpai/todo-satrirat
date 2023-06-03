import 'package:flutter/material.dart';

import '../db/model/patient.dart';

class PatientEditable extends StatelessWidget {
  final PatientModel patient;
  final Function(String) onHnChange;
  final Function(String) onNoteChange;

  const PatientEditable({
    super.key,
    required this.patient,
    required this.onHnChange,
    required this.onNoteChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PatientNote(
            patient: patient,
            onHnChange: onHnChange,
            onNoteChange: onNoteChange,
          ),
          const SizedBox(height: 15),
          const PatientToggleList(),
        ],
      ),
    );
  }
}

class PatientNote extends StatefulWidget {
  final PatientModel patient;
  final Function(String) onHnChange;
  final Function(String) onNoteChange;

  const PatientNote({
    super.key,
    required this.patient,
    required this.onHnChange,
    required this.onNoteChange,
  });

  @override
  State<PatientNote> createState() => _PatientNoteState();
}

class _PatientNoteState extends State<PatientNote> {
  final TextEditingController _hnController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hnController.text = widget.patient.hn!;
    _noteController.text = widget.patient.note!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 50, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _hnController,
                  onChanged: widget.onHnChange,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.sticky_note_2_outlined, size: 50, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 5,
                  minLines: 5,
                  style: const TextStyle(fontSize: 20),
                  controller: _noteController,
                  onChanged: widget.onNoteChange,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PatientToggleList extends StatelessWidget {

  const PatientToggleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        itemBuilder: (BuildContext context, int index) {
          if (index == 14) {
            return const SizedBox(height: 1);
          }

          return const PatientToggle();
        },
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: 15,
      ),
    );
  }
}

class PatientToggle extends StatelessWidget {

  const PatientToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Switch(
            activeColor: Colors.teal.shade200,
            value: true,
            onChanged: (bool value) {},
          ),
        ),
        const SizedBox(width: 5),
        const Flexible(
            child: Text("รอส่งเอกสารรอ", style: TextStyle(fontSize: 20), overflow: TextOverflow.clip)
        )
      ],
    );
  }
}

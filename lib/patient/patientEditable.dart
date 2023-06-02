import 'package:flutter/material.dart';

class PatientEditable extends StatelessWidget {
  final int? index;

  const PatientEditable({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          PatientNote(),
          SizedBox(height: 15),
          PatientToggleList(),
        ],
      ),
    );
  }
}

class PatientNote extends StatelessWidget {

  const PatientNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.person, size: 50, color: Colors.black54),
            SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(fontSize: 26),
                  decoration: InputDecoration(
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
          children: const [
            Icon(Icons.sticky_note_2_outlined, size: 50, color: Colors.black54),
            SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 5,
                  minLines: 5,
                  style: TextStyle(fontSize: 26),
                  decoration: InputDecoration(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(
          activeColor: Colors.teal.shade200,
          value: true,
          onChanged: (bool value) {},
        ),
        const SizedBox(width: 5),
        const Flexible(
            child: Text("รอส่งเอกสารรอส่งเอกสารรอส่งเอกสารรอส่งเอกสาร", style: TextStyle(fontSize: 30), overflow: TextOverflow.clip)
        )
      ],
    );
  }
}

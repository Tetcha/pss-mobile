import 'package:flutter/material.dart';
import 'package:pss_mobile/core/constants/style.dart';
import 'package:pss_mobile/core/models/Doctor/doctor.dart';

class DoctorIntro extends StatelessWidget {
  final Doctor doctor;
  const DoctorIntro({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            doctor.photoUrl,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: StyleTheme.textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(doctor.introduction)
            ],
          ),
        ),
        ElevatedButton(onPressed: (() => {}), child: const Text("Book"))
      ],
    );
  }
}

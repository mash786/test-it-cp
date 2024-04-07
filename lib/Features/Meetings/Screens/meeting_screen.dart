import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Features/Meetings/Repository/meeting_repository_implementation.dart';
import 'package:zoom_clone/Features/Meetings/Screens/join_meeting_screen.dart';
import 'package:zoom_clone/Features/Meetings/Widgets/custom_buttons.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final MeetingRepositoryImplementation _meetingRepositoryImplementation =
  MeetingRepositoryImplementation();

  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    String userEmail = ''; // Provide a default or obtain it from somewhere
    _meetingRepositoryImplementation.createMeeting(roomName, userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Meetings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              size: 27.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Added space for better alignment
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: createNewMeeting,
                  child: const CustomButton(
                    text: 'New Meeting',
                    color: Colors.deepOrange,
                    icon: Icons.videocam_sharp,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinMeetingScreen(),
                      ),
                    );
                  },
                  child: const CustomButton(
                    text: 'Join',
                    color: Color.fromRGBO(45, 101, 246, 1),
                    icon: Icons.add_box,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Added space for better alignment
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 20), // Added space for better alignment
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

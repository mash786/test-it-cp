import 'package:flutter/material.dart';
import 'package:zoom_clone/Features/Meetings/Repository/meeting_repository_implementation.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({Key? key}) : super(key: key);

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  bool audioSelected = true;
  bool videoSelected = true;
  final MeetingRepositoryImplementation meetingRepositoryImplementation =
  MeetingRepositoryImplementation();

  late final TextEditingController idController;
  late final TextEditingController nameController;

  @override
  void initState() {
    idController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  joinMeeting() {
    String userEmail = ''; // Provide a default or obtain it from somewhere
    meetingRepositoryImplementation.createMeeting(
      idController.text,
      userEmail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Join a Meeting'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              hintText: 'Meeting ID ',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Join with a Meeting ID',
            style: TextStyle(
              color: Color.fromRGBO(45, 101, 246, 1),
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Name',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 25.0),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(45, 101, 246, 1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              onPressed: joinMeeting,
              child: const Center(
                child: Text(
                  'Join',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          SwitchListTile.adaptive(
            tileColor: Colors.grey,
            activeColor: Colors.green,
            title: const Text(
              'Don\'t Connect To Audio',
              style: TextStyle(color: Colors.white),
            ),
            value: audioSelected,
            onChanged: (bool? value) {
              setState(() {
                audioSelected = value!;
              });
            },
          ),
          const Divider(
            height: 1.0,
            color: Colors.black,
          ),
          SwitchListTile.adaptive(
            tileColor: Colors.grey,
            activeColor: Colors.green,
            title: const Text(
              'Turn Off My Video ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            value: videoSelected,
            onChanged: (bool? value) {
              setState(() {
                videoSelected = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

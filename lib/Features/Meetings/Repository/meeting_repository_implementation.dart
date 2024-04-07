import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/Features/Meetings/Repository/meeting_repository.dart';

class MeetingRepositoryImplementation implements MeetingRepository {
  final JitsiMeet jitsiMeet = JitsiMeet();

  @override
  void createMeeting(String roomName, String userEmail) async {
    try {
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: userEmail, // Using user's email as display name
          email: userEmail,
          // You can set avatar to null or provide a default avatar if needed
          // avatar: null,
        ),
      );
      await jitsiMeet.join(options);
    } catch (e) {
      print("Error starting meeting: $e");
      throw e;
    }
  }
}

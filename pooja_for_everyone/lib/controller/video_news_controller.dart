import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  final String videoUrl;

  VideoController(this.videoUrl);

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    )..initialize().then((_) {
      videoPlayerController.setLooping(true); // Enable looping
      videoPlayerController.play(); // Start playing the video once initialized
      update(); // Notify the UI to update
    }).catchError((error) {
      print('Error initializing video controller: $error');
    });
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}

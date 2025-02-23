import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class VolumeController extends GetxController {
  final List<String> godMantra = [
    'https://drive.google.com/uc?export=download&id=1O2mCA1Touf3OCoYHsBR-9brD1GEhMDp-',
    "https://drive.google.com/uc?export=download&id=1pE7RIx2B_pVN5N7zmS7j6_1DvEec8j53",
    "https://drive.google.com/uc?export=download&id=1OYD2Ey9CxdNFNgF_JhzFrLQ6_wdgzcob",
    "https://drive.google.com/uc?export=download&id=1wdxSOWfmC0as7GUkBeIUUqgcMBaLvVaz",
    "https://drive.google.com/uc?export=download&id=1GT2efDp23qGPRAkWzfI6vQzGjpkq22jN",
    "https://drive.google.com/uc?export=download&id=1204JNfFGNbURPF0hbP4A4vphyLWbdS9l",
    "https://drive.google.com/uc?export=download&id=1qzr3T8oq6V00LqF7nq9J6obd8hByGIbm"
  ];

  var volume = true.obs;
  late final player = AudioPlayer();
  bool isAudioLoaded = false;
  int _getCurrentDayOfWeek() {
    DateTime now = DateTime.now();
    return now.weekday;
  }


  void toggleVolume() {
    if (volume.value) {
      player.stop();
    } else {
      if (isAudioLoaded) {
        player.resume();
      } else {
        playWelcomeAudio();
      }
    }
    volume.value = !volume.value;
  }
  Future<void> preloadAudio() async {
    try {
      int currentDay = _getCurrentDayOfWeek();

      int index = currentDay - 1;
      await player.setSourceUrl(godMantra[index]);
      isAudioLoaded = true;
    } catch (error) {
      // Handle the error gracefully
    }
  }

  Future<void> playWelcomeAudio() async {
    try {
      int currentDay = _getCurrentDayOfWeek();

      int index = currentDay - 1;
      await player.play(UrlSource(godMantra[index]));
      await player.setReleaseMode(ReleaseMode.loop);
    } catch (error) {
      // Handle the error gracefully
    }
  }

  @override
  void onInit() {
    super.onInit();
    playWelcomeAudio();
  }

  @override
  void onClose() {
    player.stop();
    super.onClose();
    player.dispose();
  }
}


class LottieAnimationController extends GetxController {
  var showAnimation = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 3500), () {
      showAnimation.value = false;
      dispose();
    });
  }
}

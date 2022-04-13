String getTimeFromSeconds(int seconds) {
  int minutes = seconds ~/ 60;
  seconds = seconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

/// This class is used in the [SpeedTestResultsScreen] screen.

// ignore_for_file: must_be_immutable
class SpeedTestResultsModel {
  SpeedTestResultsModel({
    this.downloadSpeed,
    this.uploadSpeed,
    this.ping,
    this.jitter,
    this.dateTime,
    this.performanceSpeed,
    this.performanceChange,
  }) {
    downloadSpeed = downloadSpeed ?? '125 Mbps';
    uploadSpeed = uploadSpeed ?? '45 Mbps';
    ping = ping ?? '15 ms';
    jitter = jitter ?? '2 ms';
    dateTime = dateTime ?? 'July 26, 2024, 10:30 AM';
    performanceSpeed = performanceSpeed ?? '125 Mbps';
    performanceChange = performanceChange ?? '+10%';
  }

  String? downloadSpeed;
  String? uploadSpeed;
  String? ping;
  String? jitter;
  String? dateTime;
  String? performanceSpeed;
  String? performanceChange;
}

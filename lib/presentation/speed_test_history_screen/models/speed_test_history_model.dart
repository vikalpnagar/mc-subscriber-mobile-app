class SpeedTestHistoryModel {
  String? date;
  String? downloadSpeed;
  String? uploadSpeed;
  String? id;

  SpeedTestHistoryModel({
    this.date,
    this.downloadSpeed,
    this.uploadSpeed,
    this.id,
  }) {
    date = date ?? '';
    downloadSpeed = downloadSpeed ?? '';
    uploadSpeed = uploadSpeed ?? '';
    id = id ?? '';
  }
}

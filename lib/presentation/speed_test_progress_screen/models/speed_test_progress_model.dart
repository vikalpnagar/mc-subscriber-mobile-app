class SpeedTestProgressModel {
  int? progressPercentage;
  String? downloadSpeed;
  String? uploadSpeed;
  bool? isTestCompleted;

  SpeedTestProgressModel({
    this.progressPercentage,
    this.downloadSpeed,
    this.uploadSpeed,
    this.isTestCompleted,
  }) {
    progressPercentage = progressPercentage ?? 0;
    downloadSpeed = downloadSpeed ?? '0 Mbps';
    uploadSpeed = uploadSpeed ?? '0 Mbps';
    isTestCompleted = isTestCompleted ?? false;
  }

  SpeedTestProgressModel copyWith({
    int? progressPercentage,
    String? downloadSpeed,
    String? uploadSpeed,
    bool? isTestCompleted,
  }) {
    return SpeedTestProgressModel(
      progressPercentage: progressPercentage ?? this.progressPercentage,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      isTestCompleted: isTestCompleted ?? this.isTestCompleted,
    );
  }
}

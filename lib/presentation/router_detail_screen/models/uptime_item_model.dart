/// This class is used in the [uptime_card_widget] widget.

// ignore_for_file: must_be_immutable
class UptimeItemModel {
  UptimeItemModel({
    this.value,
    this.label,
    this.id,
  }) {
    value = value ?? '0';
    label = label ?? 'Time';
    id = id ?? '';
  }

  String? value;
  String? label;
  String? id;
}

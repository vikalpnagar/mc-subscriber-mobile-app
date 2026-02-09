class OnboardingModel {
  int? currentPage;
  int? totalPages;

  OnboardingModel({
    this.currentPage,
    this.totalPages,
  }) {
    currentPage = currentPage ?? 0;
    totalPages = totalPages ?? 3;
  }

  OnboardingModel copyWith({
    int? currentPage,
    int? totalPages,
  }) {
    return OnboardingModel(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

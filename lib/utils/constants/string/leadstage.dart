
class LeadStage{
  static const String aware= "AWARE";
  static const String interested= "INTERESTED";
  static const String desire= "DESIRE";
  static const String closed= "CLOSED";
}

  getStage(String stage) {
    switch (stage) {
      case LeadStage.aware:
        return 1;
      case LeadStage.interested:
        return 2;
      case LeadStage.desire:
        return 3;
      case LeadStage.closed:
        return 4;
      default:
        return 0;
    }
  }

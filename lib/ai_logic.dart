String getAISuggestion(String priority, int hours) {
  if (priority == "High" && hours < 2) {
    return "AI Suggestion: More time should be given to this topic";
  } else if (priority == "Medium") {
    return "AI Suggestion: Revise this topic regularly.";
  } else {
    return "AI Suggestion: This topic is currently in balance.";
  }
}

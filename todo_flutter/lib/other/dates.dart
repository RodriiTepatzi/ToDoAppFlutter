class Dates{

  static String calculateDateShort(DateTime date){
    var dateText = "";
    var currentDate = DateTime.now();
    var diferenceBetweenDates = currentDate.difference(date);
    var daysOfDiff = diferenceBetweenDates.inDays;


    if(daysOfDiff == 1){
      return "ayer";
    }
    if(daysOfDiff >= 2 && daysOfDiff <= 6){
      return "Hace ${daysOfDiff.toString()} días";
    }
    if(daysOfDiff >= 7 && daysOfDiff <= 14){
      return "Hace 1 semana";
    }
    if(daysOfDiff >= 15 && daysOfDiff <= 21){
      return "Hace 2 semanas";
    }
    if(daysOfDiff >= 22 && daysOfDiff <= 28){
      return "Hace 3 semana";
    }
    if(daysOfDiff >= 29 && daysOfDiff <= 60){
      return "Hace 1 mes";
    }

    return dateText;
  }
}
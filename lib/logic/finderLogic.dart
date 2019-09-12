class BirthdayFinder {

  String finder(nicNo) {
    var idNo = nicNo.toString();

    String year = ""; 
    String year1 ="";
    String idNumber = ""; 
    int day; 
    String gender = "";
    String month = "";
    String birthday = "";
    String day1 = "";
    var nonic2 = "";

    if (idNo.length == 11) {
      nonic2 = idNo.substring(2);
      year1 = idNo.substring(0,2);
    } else {
      nonic2 = idNo;
      year1 = "19";
    }

    year = nonic2.substring(0,2);
    idNumber = nonic2.substring(2,5);
    day = int.parse(idNumber);

    if (day > 0) {
      if (day > 500) {
        gender = "Female";

        day = day - 500;
      } else if (day < 500) {
        gender = "Male";

        day = day;
      }

      if (day > 335) {
        day = day - 335;
        month = "December";
      } else if (day > 305) {
        day = day - 305;
        month = "November";
      } else if (day > 274) {
        day = day - 274;
        month = "Octomber";
      } else if (day > 244) {
        day = day - 244;
        month = "September";
      } else if (day > 213) {
        day = day - 213;
        month = "August";
      } else if (day > 182) {
        day = day - 182;
        month = "July";
      } else if (day > 152) {
        day = day - 152;
        month = "June";
      } else if (day > 121) {
        day = day - 121;
        month = "May";
      } else if (day > 91) {
        day = day - 91;
        month = "April";
      } else if (day > 60) {
        day = day - 60;
        month = "March";
      } else if (day > 31) {
        day = day - 31;
        month = "Febuary";
      } else if (day >= 1) {
        day = day;
        month = "January";
      }
      day1 = day.toString();
    }
    birthday = "Birthday: "+ year1 + "" + year + "/" + month + "/" + day1+"\n"+"Gender : "+gender;

    return birthday;
  }

  
}

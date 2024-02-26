class MonthName {
  static String getMonthName(int monthNumber) {
    if (monthNumber == 1) {
      return 'JAN';
    } else if (monthNumber == 2) {
      return 'FEB';
    } else if (monthNumber == 3) {
      return 'MAR';
    } else if (monthNumber == 4) {
      return 'APR';
    } else if (monthNumber == 5) {
      return 'MAY';
    } else if (monthNumber == 6) {
      return 'JUN';
    } else if (monthNumber == 7) {
      return 'JUL';
    } else if (monthNumber == 8) {
      return 'AUG';
    } else if (monthNumber == 9) {
      return 'SEPT';
    } else if (monthNumber == 10) {
      return 'OCT';
    } else if (monthNumber == 11) {
      return 'NOV';
    }
    return 'DEC';
  }
}

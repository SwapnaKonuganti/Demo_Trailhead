@isTest
Public class TestVerifyDate {
@isTest static void TestVerifyDate1 (){
Date day1 =Date.newInstance(2015,1,11);
Date day2 =Date.newInstance(2015,1,10);
Date date_res = VerifyDate.CheckDates (day1,day2);
System.debug(date_res+' Run1: Date1: ' + day1+ 'Date2: ' + day2);
}
@isTest static void TestVerifyDate2 (){
Date day1 =Date.newInstance(2015,1,10);
Date day2 =Date.newInstance(2015,1,15);
Date date_res =VerifyDate.CheckDates (day1,day2);
System.debug(date_res+' Run1: Date1: ' + day1+ 'Date2: ' + day2);
}

@isTest static void TestVerifyDate3 (){
Date day1 =Date.newInstance(2015,1,10);
Date day2 =Date.newInstance(2015,2,17);
Date date_res =VerifyDate.CheckDates (day1,day2);
System.debug(date_res+' Run1: Date1: ' + day1+ 'Date2: ' + day2);
}


}
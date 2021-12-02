trigger UpdateDesc on Student__c (before insert, before update) {
    map<string, string> lststr = new map<string,string>();
    lststr.put('Computer Science', 'cs');
    lststr.put('Electrical', 'E');
    lststr.put('Mechanical', 'ME');
    lststr.put('Maths', 'M');
    lststr.put('IT', 'IT');

    if(trigger.isBefore){
        if(trigger.isInsert){
            for(Student__c s : Trigger.new){
                s.DepartmentCode__c=lststr.get(s.Department__c);
            }
            
        }
        if(trigger.isUpdate){
            for (Student__c stud : Trigger.new){
                if(!(Trigger.oldMap.get(stud.Id).Department__c.equals(stud.Department__c)))
                stud.DepartmentCode__c=lststr.get(stud.Department__c);
            }
        }
    }

}
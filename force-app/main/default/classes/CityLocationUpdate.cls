Public class CityLocationUpdate{
	Public static void UpdateLocation(List<Student__c> lsts){
		set<String> SetClassId= new set<String>();
		set<id> stundentIDs= new set<id>();
		
        for(Student__c objs:lsts){
            if(objs.Class__c != null){
                SetClassId.add(objs.class__c);
                stundentIDs.add(objs.Id);
            }
        }
		List<Class__c> classLst = new List<Class__c>();
		
		Map<id,Class__c> cls = new Map<id,Class__c>([Select Id,name,Location__C,Number_of_Students__c,(select Id from Stundents__r ) from Class__c where ID IN : SetClassId]);
        set<String> listcity = new set<string>(); 
		String CityList;
		for(Student__c objs:lsts){
            Class__c classObj= cls.get(objs.class__c);
             CityList=classObj.Location__c;
			 
			 if (CityList !=null && !CityList.contains(objs.City__c) ){
		 classObj.Location__c=classObj.Location__c+','+objs.City__c;
                 classLst.add(classObj);
		}
            else {
                classObj.Location__c=objs.City__c;
                 classLst.add(classObj);
            }
        }
        update classLst;
        
	}
}
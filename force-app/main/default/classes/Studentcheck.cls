public class Studentcheck {
    public List<studentwrap> lststd{get;set;}
    public List<studentwrap> getStudent(){
        if (lststd==null){
            lststd = new List<studentwrap>();
            for (Student__c s:[Select id, Name,Class__c,City__c from Student__c]){
                if (s.City__c=='Hyderabad'){
                    lststd.add(new studentwrap(s,true));
                }
                else{
                lststd.add(new studentwrap(s));
                }
            }   
        }
        return lststd;
        
    }
    
    public PageReference processSelected(){
        List<Student__c> selectedStudent = new List<Student__c> ();
        
        for(studentwrap st : getStudent()){
            if (st.Slt== true){
              selectedStudent.add(st.stud);  
            }
        }
        return null;
        
    }
    
    Public class studentwrap{
        public Student__c stud{get;set;}
        public Boolean Slt{get;set;}
        
        public studentwrap(Student__c s){
            stud=s;
            Slt=false;
        }
        public studentwrap(Student__c s,Boolean B ){
            stud=s;
            Slt=B;
            
            
        }
    }

}
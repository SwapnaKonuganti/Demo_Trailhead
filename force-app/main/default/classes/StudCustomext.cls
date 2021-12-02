public class StudCustomext {
    Public string greeting{get;set;}
    public StudCustomext(MyStudController controller) {
    Student__C stud = Controller.student;
    if (stud.Name==null){
           greeting='Student';
           }
        }    
  }
public class Demo_Class 
{
    public string eid='swap';
    public string ename='Konug';
    public set<string> set1 = new set<String>();
    
    public set<string> empcal()
    {
        set<string> set2 = new set<String>();
        set2.add(eid);
        set2.add(ename);
        set2.add(eid);
        
        List<string> list2 = new List<String>();
        list2.add(eid);
        list2.add(ename);
        list2.add(eid);
       // string c1= a1+','+a2;
        //system.debug('eid-->'+eid);
        system.debug('set2-->'+set2);
        system.debug('list2-->'+list2);
        return set2;
    }

}
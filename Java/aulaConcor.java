
class aulaConcor extends Thread{
    int begin, end;
    
    public aulaConcor (int begin, int end){
        this.begin = begin;
        this.end = end;
    }
    
    public int getBegin(){
        return this.begin;
    }
    
    public int getEnd(){
        return this.end;
    }
    public void run(){
        for (int i = getBegin(); i < getEnd(); ++i)
        System.out.println(i + " ");
    }
    public static void main(String[] args){
        new aulaConcor(0,200).start();
        new aulaConcor(201,400).start();
        new aulaConcor(401,600).start();
        new aulaConcor(601,800).start();
        new aulaConcor(801,1000).start();
    }
}



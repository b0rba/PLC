import java.util.Scanner;
import java.util.Stack;

public class q1 {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        StringBuilder sb = new StringBuilder();

        while(in.hasNext())
            sb.append(in.nextLine());

        String s = sb.toString();

        System.out.println(inFixToProfix(s));

    }
    static int precedence(char c){
        switch (c){
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
        }
        return -1;
    }
    static StringBuilder inFixToProfix(String a){
        StringBuilder sb = new StringBuilder();
        Stack<Character> stack = new Stack<>();
        Boolean digits = false;

        for (int i = 0; i < a.length(); i++){
            char c = a.charAt(i);

            if (c == '\n' || c == '\t' || c == ' '){}

            else if(Character.isDigit(c))
                sb.append(c);

            else {
                while(!stack.isEmpty() && precedence(c) <= precedence(stack.peek())){
                    if (c == '-' && precedence(stack.peek()) == 1){
                        stack.pop();
                    }
                    sb.append(" " + stack.pop());
                    stack.push(c);
                    sb.append(" ");
                }
            }
        }
        while(!stack.isEmpty())
            sb.append(" " + stack.pop());

        return sb;
    }
}

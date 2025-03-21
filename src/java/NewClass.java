
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class NewClass {

    public static String QuestionsMarks(String str) {
        String[] arr = str.split("");
        int x = 0;
        int indexX = 0;
        int cntResult = 0;
        for (int i = 0; i < arr.length; i++) {
            char ch = str.charAt(i);

            if (Character.isDigit(ch)) {

                if (x == 0) {
                    x = Integer.parseInt(arr[i]);
                    System.out.println(x);
                    indexX = i;
                } else {
                    int xs = x + Integer.parseInt(arr[i]);

                    if (xs == 10) {
                        int cnt = 0;
                        for (int j = indexX; j <= i; j++) {
                            System.out.println("1");
                            if (arr[j].equals("?")) {
                                cnt++;
                            }
                        }
                        if (cnt >= 3) {
                            cntResult++;
                        }

                    }
                    x = Integer.parseInt(arr[i]);
                    indexX = i;
                }

            }
        }
        if (cntResult != 0) {
            return "true";
        } else {
            return "false";
        }
    }

    public static String FindIntersection(String[] strArr) {

        String[] arr1 = strArr[0].split(",");
        String[] arr2 = strArr[1].split(",");

        List<String> list = new ArrayList<>();
        for (int i = 0; i <= arr1.length - 1; i++) {
            for (int j = 0; j <= arr2.length - 1; j++) {
                arr1[i].equals(j);
                if (Integer.parseInt(arr1[i].trim()) == Integer.parseInt(arr2[j].trim())) {
                    list.add(arr2[j]);

                }
            }
        }
        return list.toString().replaceAll(" ", "").replace("[", "").replace("]", "");
    }

    public static String CodelandUsernameValidation(String str) {
        String[] arrStr = str.split("");
        if (arrStr.length < 4 || arrStr.length > 25) {
            return "false";
        }
        int cnt = 0;
        for (int i = 0; i <= arrStr.length - 1; i++) {
            if (!Character.isAlphabetic(str.charAt(0))) {
                return "false";

            }
            if (arrStr[arrStr.length - 1].equals("_")) {
                return "false";
            }
            if (!Character.isAlphabetic(str.charAt(i)) && !Character.isDigit(str.charAt(i)) && !arrStr[i].equals("_")) {
                return "false";
            }

        }

        return "true";
    }

    public static void main(String[] args) {

        String str = "avasad";
        List<String> list = new ArrayList();
   String [] arr = str.split("");
   for(int i = 0 ; i < str.length(); i ++){
     if(str.charAt(i) == '(' || str.charAt(i) == ')'){
       list.add(arr[i]);
     }
   }
   if(list.isEmpty()){
   String only = list.toString().replace(" ", "").replace(",","").replace("[", "").replace("]", "");
    int cnt1 = 0;
    int cnt2 = 0;
  String[] onlyArr = only.split("");
  
    for(int i = 0; i <= onlyArr.length-1; i++){
      if(only.charAt(i) == '(' ){
        cnt1 ++;
      }
      if(only.charAt(i) == ')'){
        cnt2 ++;
      }
    }
    if(cnt1 != cnt2){
        System.out.println("0"); 
    }
    if(cnt1 == 0 || cnt2 == 0){
     System.out.println("0"); 
    }
    
    System.out.println("1"); 

    }
        System.out.println("0");
    }
    
            
}

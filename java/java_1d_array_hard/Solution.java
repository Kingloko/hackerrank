import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int t = sc.nextInt();

    for (int i = 0; i < t; i++) {
      int size = sc.nextInt();
      int jump = sc.nextInt();
      int[] arr = new int[size];
      for (int j = 0; j < size; j++) {
          arr[j] = sc.nextInt();
      }

      boolean[] visited = new boolean[size];

      if (solve(arr, visited, 0, jump, size)) {
        System.out.println("YES");
      } else {
        System.out.println("NO");
      }
    }
  }

  public static boolean solve(int[] arr, boolean[] visited, int curr, int jump, int size)  {
    boolean jumper,plus,minus;
    jumper=plus=minus=false;
    if (curr >= size) {
      return true;
    } else {
      visited[curr] = true;
      if (validJump(arr, visited, curr + jump, size)) {
        jumper = solve(arr, visited, curr + jump, jump, size);
      }
      if (validJump(arr, visited, curr + 1, size)) {
        plus = solve(arr, visited, curr + 1, jump, size);
      }
      if (validJump(arr, visited, curr - 1, size)) {
        minus = solve(arr, visited, curr - 1, jump, size);
      }
    }
    return ((jumper||plus)||minus);
  }

  public static boolean validJump(int[] arr, boolean[] visited, int index, int size) {
    if (index < 0) { return false; }
    if (index < size) {
     if ((arr[index] == 1) || visited[index]) {
      return false;
     }
    }
    return true;
  }
}


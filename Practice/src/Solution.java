import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Solution {

    public static void main(String[] args) {
        Scanner in = new Scanner(new BufferedReader(new InputStreamReader(System.in)));
        int t = in.nextInt(); // Scanner has functions to read ints, longs, strings, chars, etc.
        for (int i = 1; i <= t; ++i) {
            int n = in.nextInt();
            String p = in.next();

            System.out.println("Case #" + i + ": " + sovle2(p));
        }
    }

    private static String solve(int n, String p) {
        String sol = "";
        char direction = p.charAt(p.length()-1);

        int x = 0, y = 0, xOther = 0, yOther = 0;

        for (int i = 0; i < (2 * n - 2); i++) {
            if (x == xOther && y == yOther && p.charAt(i) == 'E') {
                xOther++;
                sol += 'S';
                y++;
            } else if (x == xOther && y == yOther && p.charAt(i) == 'S') {
                yOther++;
                sol += 'E';
                x++;
            } else {
                if (p.charAt(i) == 'E') {
                    xOther++;
                } else {
                    yOther++;
                }
                if (x == n - 1) {
                    direction = 'S';
                }
                if (y == n - 1) {
                    direction = 'E';
                }
                sol += direction;
                if (direction == 'E') {
                    x++;
                } else {
                    y++;
                }
            }
        }
        return sol;
    }

    private static String sovle2(String p) {
        String sol = "";
        for (int i = 0; i < p.length(); i++) {
            if (p.charAt(i) == 'S') {
                sol += 'E';
            } else {
                sol += 'S';
            }
        }
        return sol;
    }
}

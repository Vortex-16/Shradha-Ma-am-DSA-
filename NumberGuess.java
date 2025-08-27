import java.util.Scanner;
import java.util.Random;

public class NumberGuess {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        
        System.out.println("=== Number Guessing Game ===");
        System.out.println("I'm thinking of a number between 1 and 100!");
        
        int target = rand.nextInt(100) + 1;
        int attempts = 0;
        boolean hasWon = false;
        
        while (!hasWon && attempts < 7) {
            System.out.print("Enter your guess: ");
            int guess = sc.nextInt();
            attempts++;
            
            if (guess == target) {
                System.out.println("Congratulations! You guessed it in " + attempts + " attempts!");
                hasWon = true;
            } else if (guess < target) {
                System.out.println("Too low! Try again.");
            } else {
                System.out.println("Too high! Try again.");
            }
            
            if (attempts == 7 && !hasWon) {
                System.out.println("Game over! The number was: " + target);
            }
        }
        
        sc.close();
    }
}

/*
 * project FactorialBigNum
 */

import java.math.BigInteger;

public class FactorialBigNum {

	public static void main(String[] args) {
		int n = 999;
		int num_digits = 0;
		String factorial_string = factorial(n).toString();
		System.out.println(n + "! = " + factorial_string); 
		System.out.println("num digits = " + factorial_string.length());
	}

	public static BigInteger factorial(int n) {
		BigInteger fact = BigInteger.ONE;
		for (int i = 1; i < n; i++) {
			fact = fact.multiply(BigInteger.valueOf(i));
		}
		return fact;
	 }
}

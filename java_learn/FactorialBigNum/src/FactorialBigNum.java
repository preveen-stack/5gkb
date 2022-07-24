/*
 * project FactorialBigNum
 */

import java.math.BigInteger;

public class FactorialBigNum {

	public static void main(String[] args) {
		BigInteger fact = BigInteger.ONE;
		int n = 999;
		for (int i = 1; i < n; i++) {
			fact = fact.multiply(BigInteger.valueOf(i));
		}
		System.out.println(+ n + "! = " + fact); 
	 }
}

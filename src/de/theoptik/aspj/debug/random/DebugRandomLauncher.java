package de.theoptik.aspj.debug.random;

import java.util.Random;

public class DebugRandomLauncher {

	public static void main(String[] args) {

		Random random = new Random();

		for (int i = 0; i < 5; i++) {

			int number = random.nextInt();
			doSomething(number);

		}

	}

	private static void doSomething(int number) {
		// empty
	}

}

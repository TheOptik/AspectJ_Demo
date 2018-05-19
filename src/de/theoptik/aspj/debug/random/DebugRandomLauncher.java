package de.theoptik.aspj.debug.random;

import java.util.Random;

public class DebugRandomLauncher {

	public static void main(String[] args) {

		Random random = new Random();
		for (int i = 0; i < 5; i++) {
			int rand = random.nextInt();
			System.out.println(rand);
		}

	}

}

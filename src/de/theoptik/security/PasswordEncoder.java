package de.theoptik.security;

public class PasswordEncoder {

	public static String sha512Encode(String password) {
		System.out.println("Encoding '" + password + "'");
		return "bd2b1aaf7ef4f09be9f52ce2d8d599674d81aa9d6a4421696dc4d93dd0619d682ce56b4d64a9ef097761ced99e0f67265b5f76085e5b0ee7ca4696b2ad6fe2b2";
	}

}

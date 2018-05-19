package de.theoptik.aspj.misc;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.CodeSignature;

public aspect PasswordsMustBeSHA512Aspect {

	//create a PointCut for all methods with a 'String' parameter in all classes within sub-packages of "de.theoptik."
	pointcut interceptAnyCall() : call(* de.theoptik.aspj..*.*(..,String,..));

	//execute this code before the method is called
	before() : interceptAnyCall(){
		Signature signature = thisJoinPoint.getSignature();
		if (signature instanceof CodeSignature) {
			//get the code signature
			CodeSignature codeSignature = (CodeSignature) signature;

			//get parameter names and their respective types
			String[] parameterNames = codeSignature.getParameterNames();
			Class<?>[] parameterTypes = codeSignature.getParameterTypes();

			//search for a parameter called 'password' and check if it is a String
			for (int i = 0; i < parameterNames.length; i++) {
				if (parameterNames[i].equalsIgnoreCase("password") && parameterTypes[i] == String.class) {
					String passwordArgument = (String) thisJoinPoint.getArgs()[i];
					//match the calue to a SHA512-regex
					Matcher matcher = Pattern.compile("^\\w{128}$").matcher(passwordArgument);
					if (!matcher.matches()) {
						throw new RuntimeException("Passwords must be SHA512 encoded");
					}
				}
			}
		}
	}

}

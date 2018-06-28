package de.theoptik.aspj.misc;

public aspect MyFirstAspect{
	
	int member = 0;

	pointcut pointcutName() :
		call(void de.example.package.MyClass.myMethod(..,String,..));
	
	
	after() throwing: pointcutName(){
		//after Advice implementation
	}
	void around() : pointcutName(){
		//after Advice implementation
	}
	before(): pointcutName(){
		//after Advice implementation
	}

	
	public void printName() {
		System.out.println(this.toString());
	}
	
	@Override
	public String toString() {
		return this.getClass().getSimpleName();
	}
	
}

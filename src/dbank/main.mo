import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue:Float = 300; //var is used to create a variable, this can be changed
  //stable persist the variable so that is is stored 
  // currentValue :=300; //replace current value to 100, assignment in mokoto is ":="

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  let id = 278877974; //let is similar to const in js, once set, it shouldn't be changed
  // id :=

  // Debug.print(debug_show(currentValue))
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) { //func is used to create functions - Nat is any natural number that is positive
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };

  // topUp();

  public func withdraw(amount: Float) { 
    let tempValue:Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else{
      Debug.print("Amount too large to be withdrawn");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  }; 

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime; 
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}
StringList names = new StringList();
PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully

boolean roll = true;
boolean ending = false;
boolean previous = false;
int randomNumber = 0;
String name = "";

void setup(){
  //fullScreen();
  size(1027,768);
  loadNames();
  font = createFont("AvenirNextCondensed-DemiBoldItalic-120", 200);
  textFont(font);
  textAlign(CENTER, CENTER);
  background(0);
}

void draw(){
  if(roll){
    background(0);
    randomNumber = int(random(names.size()));
    fill(255);
    name = names.get(randomNumber);
    text(name, width/2, height/2);
    delay(10);
  }
}

void keyPressed(){
  if(key == ' '){
    println("STOP");
    roll = false;
    if(names.size()-1 >0){
      println("Removing "+names.get(randomNumber));
      names.remove(randomNumber);
      previous = true;
    }
    else{
      background(0);
      text("That's all folks!", width/2, height/2);
      roll = false;
      ending = true;
    }
  }
   if (key == ENTER || key == RETURN){
    println("START");
       roll = true;
       if(ending == true ){
    exit();
  }
 
  }
 
  
}

void loadNames(){
    String[] lines = loadStrings("names.txt");
    for (int i = 0 ; i < lines.length; i++) {
      names.append(lines[i]);
    }
}
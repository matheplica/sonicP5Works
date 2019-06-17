void sendOsc(String msg, float s) {
  OscMessage myMessage = new OscMessage(msg);
  myMessage.add(s);
  oscP5.send(myMessage, sonicPiAdress);
  if(step==5) startSaturn();
 println(" step : "+step);
}
void sendPosition(float mx, float my, float speed) {
  OscMessage myMessage = new OscMessage("/position");
  myMessage.add(map(mx, 0, width, 0, 50));
  myMessage.add(int(map(my, 0, height, 9, 0)));
  myMessage.add(map(constrain(speed, 0, 129), 0, 129, 2, 30));
  oscP5.send(myMessage, sonicPiAdress);
}

  
import processing.sound.*;
import processing.serial.*;


SoundFile mix;
SoundFile birds;
Serial conexaoArduino;
String nomePorta;
float valorSensor;

void setup() {
  size(640, 360, P3D);
  background(255);
  
  nomePorta = Serial.list()[0];
  println(nomePorta);
  conexaoArduino = new Serial(this, nomePorta, 9600);
    
  mix = new SoundFile(this, "D:\\PROJETOS\\BALANÇO\\teste 1.mp3");
  mix.play();
 
  birds = new SoundFile(this, "D:\\PROJETOS\\BALANÇO\\teste 1.mp3");
  birds.play();
 
  }      

void draw() {
    background(0);
    
    if (valorSensor == 0) {
      birds.amp(1);
      mix.amp(0);
      else {
  float rate = map(valorSensor, 0, 255, 0.5, 1); 
  float volbirds = map(valorSensor, 0, 255, 1, 0);
  float volmix = map(valorSensor, 0, 255, 0, 1.3);
  mix.rate(rate); 
  mix.amp(volmix);
  birds.amp(volbirds);
    }

void serialEvent(Serial conexaoArduino)
{
  valorSensor = conexaoArduino.read();
}
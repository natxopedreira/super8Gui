#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "buttonPad.h"
#include "saveVideoPad.h"
#include "ofxOsc.h"

#define PORT_SENDER 12345
#define PORT_RECEIVER 12344
#define HOST "localhost"


enum estado{
    APP_STATE_RECORDER,
    APP_STATE_PROJECTOR
};
class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
    
    void changeLut(int & e);
    void changeState(int & e);
    
    buttonPad botonera;
    saveVideoPad saveDeleteVideo;
    estado  modoUso;
    
    ofxOscSender oscSender;
    ofxOscReceiver oscReceiver;
    
    

};



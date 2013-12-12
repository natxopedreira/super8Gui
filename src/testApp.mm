#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    // register touch events
	ofRegisterTouchEvents(this);
	ofEnableAlphaBlending();
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_LEFT);
    
    botonera.set(0, 0, ofGetWidth(), ofGetHeight());
    botonera.setup("vaca.jpg");
    ofAddListener(botonera.selectionChange, this, &testApp::changeLut);
    
    oscReceiver.setup( PORT_RECEIVER );
    oscSender.setup( HOST, PORT_SENDER );
}

//--------------------------------------------------------------
void testApp::update(){
    
    
    ///escucha para saber si esta grabando o reproduciendo
    while(oscReceiver.hasWaitingMessages()){
		// get the next message
		ofxOscMessage m;
		oscReceiver.getNextMessage(&m);
        
        if(m.getAddress() == "/estado"){
            string estado = m.getArgAsString(0);
            
            if(estado=="play"){
                if(botonera.active) botonera.active = false;
            }else if (estado =="rec"){
                if(!botonera.active) botonera.active = true;
            }
            
        }
    }
}

//--------------------------------------------------------------
void testApp::draw(){
    botonera.draw();
}

//--------------------------------------------------------------
void testApp::changeLut(int & e){
    cout << "quiero el filtro " << e << endl;
    
    
    ofxOscMessage m;
	m.setAddress( "/lutIndex" );
	m.addIntArg( botonera.selectedLut );
    
	oscSender.sendMessage( m );
}


//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}


//
//  buttonPad.h
//  blank
//
//  Created by natxo pedreira on 11/12/13.
//
//

#ifndef __blank__buttonPad__
#define __blank__buttonPad__

#include "ofMain.h"

class areaPad: public ofRectangle{
public:
    int index;
    
    void drawIndex(){
        ofPushStyle();
        ofSetColor(0, 0, 0);
        ofDrawBitmapString(ofToString(index), ofPoint(80,80));
        ofPopStyle();
    }
};

class buttonPad: public ofRectangle{
    
public:
    
    buttonPad();

    void setup(string imgUrl);
    void draw();
    void touchDown(ofTouchEventArgs &touch);

    
    ofImage bgImg;
    
    ofEvent<int> selectionChange;
    
    vector<areaPad> areas;
    
    int selectedLut;
    bool   active;
    
};
#endif /* defined(__blank__buttonPad__) */

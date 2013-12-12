//
//  areaPad.h
//  emptyExample
//
//  Created by natxo pedreira on 12/12/13.
//
//

#ifndef emptyExample_areaPad_h
#define emptyExample_areaPad_h

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

#endif

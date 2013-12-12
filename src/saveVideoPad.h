//
//  saveVideoPad.h
//  emptyExample
//
//  Created by natxo pedreira on 12/12/13.
//
//

#ifndef __emptyExample__saveVideoPad__
#define __emptyExample__saveVideoPad__

#include "areaPad.h"

class saveVideoPad: public ofRectangle{
public:
    
    saveVideoPad();
    void setup(string imgUrl);
    void draw();
    void touchDown(ofTouchEventArgs &touch);
    
    
    ofImage bgImg;
    
    ofEvent<int> selectionChange;
    
    vector<areaPad> areas;
    
    int selectedLut;
    bool   active;
};

#endif /* defined(__emptyExample__saveVideoPad__) */

//
//  buttonPad.cpp
//  blank
//
//  Created by natxo pedreira on 11/12/13.
//
//

#include "buttonPad.h"

buttonPad::buttonPad(){}


//--------------------------------------------------------------
void buttonPad::setup(string imgUrl)
{
    bgImg.loadImage(imgUrl);
    
    int anchoButton = 480/3;
    int altoButton = 320/2;
    selectedLut = 0;
    
    
    /// creamos las areas de los botones
    int orden = 0;
    
    for (int row = 0; row<2; row++) {
        for (int col = 0; col<3; col++) {
        
            areaPad area;
            area.set(anchoButton*col, altoButton*row, anchoButton, altoButton);
            area.index = orden;
            areas.push_back(area);
            orden++;
        }
    }

    ofAddListener(ofEvents.touchDown, this, &buttonPad::touchDown);
    
    active = true;
}

//--------------------------------------------------------------
void buttonPad::draw()
{
    
    
    //bg imagen
    ofSetColor(255, 255, 255, 255);
    bgImg.draw(0, 0);
    
    
    //recatangels
    ofFill();
    ofSetColor(255, 255, 255, 80);
    for (int i = 0; i < areas.size(); i++) {
        if(i!=selectedLut) ofRect(areas[i].x, areas[i].y, areas[i].width, areas[i].height);
        
        ofPushMatrix();
        ofTranslate(areas[i].x, areas[i].y);
        areas[i].drawIndex();
        ofPopMatrix();
    }
    
    //rectangle contours
    ofNoFill();
    ofSetLineWidth(2);
    ofSetColor(0, 0, 0, 255);
    
    for (int i = 0; i < areas.size(); i++) {
        
        ofRect(areas[i].x, areas[i].y, areas[i].width, areas[i].height);
    }
}

//--------------------------------------------------------------
void buttonPad::touchDown(ofTouchEventArgs &touch)
{
    if (this->inside(touch.x, touch.y) && active) {
        ///has tocado dentro del area de los botones
        ///comprueba cual tiene el toque
        int cual = -1;
        for (int i =0; i<areas.size(); i++) {
            if(areas.at(i).inside(touch.x, touch.y)){
                cual = areas.at(i).index;
                if(cual!=selectedLut && cual!=-1){
                    selectedLut = cual;
                    ofNotifyEvent(selectionChange,cual);
                }
            }
        }

    } 
    
}
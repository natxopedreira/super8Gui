//
//  saveVideoPad.cpp
//  emptyExample
//
//  Created by natxo pedreira on 12/12/13.
//
//

#include "saveVideoPad.h"

saveVideoPad::saveVideoPad(){}


//--------------------------------------------------------------
void saveVideoPad::setup(string imgUrl)
{
    bgImg.loadImage(imgUrl);
    
    int anchoButton = 180;
    int altoButton = 180;
    selectedLut = -1;
    
    
    /// creamos las areas de los botones
    
    areaPad areaYes;
    areaYes.set(50, 80, anchoButton, altoButton);
    areaYes.index = 0;
    areas.push_back(areaYes);
    
    areaPad areaNo;
    areaNo.set(60+anchoButton, 80, anchoButton, altoButton);
    areaNo.index = 1;
    areas.push_back(areaNo);
    
    ofAddListener(ofEvents.touchDown, this, &saveVideoPad::touchDown);
    
    active = true;
}

//--------------------------------------------------------------
void saveVideoPad::draw()
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
void saveVideoPad::touchDown(ofTouchEventArgs &touch)
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
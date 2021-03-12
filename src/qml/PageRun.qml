/**
    Copyright (C)2021 Cyril Frausti
    This file is part of JumpRope.

    JumpRope is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JumpRope is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JumpRope.  If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.14
import QtQuick.Controls 2.13
import "../js/time.js" as Time

Page {
    id:root

    function stopAnimation(){
        r_anim.stop()
    }

    function runAnimation(){
        if(r_anim.paused){
            r_anim.resume()
        }
        else{
            r_anim.start();
        }
    }

    function pauseAnimation(){
        r_anim.pause()
    }

    Connections{
        target: timerCount
        onTimeValue :{
            text_value.text = Time.valToTime(time) // getData From c++ Signal
        }
        onFinished: pauseAnimation()
    }

    Rectangle{
        color: "#ffffff"
        anchors.fill: parent

        Text {
            id: text_value
            text: "00 : 00"
            anchors.centerIn: parent
            font.bold: true
            font.pointSize: 35
            font.family: "Open Sans"
            color: textColor
        }


        Rectangle {
            id: rect_anim
            width: 300
            height: 300
            anchors.centerIn: parent
            radius: width
            border.color: mainColor
            border.width: 4
            color: "transparent"

            Rectangle {
                id: rect_mark
                x: 85
                y: 0
                width: 25
                height: 25
                radius: width
                color: mainColor
            }

            RotationAnimation{
                id: r_anim
                target: rect_anim
                loops: Animation.Infinite
                from:0
                to:360
                direction: RotationAnimation.Clockwise
                duration: 2000
            }
        }
    }
}

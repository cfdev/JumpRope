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

    property color workColor: mainColor
    property color warmupColor: "#db2c11"
    property color recupColor: "#008fe8"
    property color pauseColor: "#e8a600"
    property color finishedColor: "#cccccc"

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
        rect_anim.border.color = pauseColor
        r_anim.pause()
    }

    Connections{
        target: timerCount

        // Received Data From C++ Signal
        onTimeValue :{
            text_value.text = Time.valToTime(time)
        }
        onTypeSession:{
            text_type.text = type
            if(type === qsTr("Work")) rect_anim.border.color = workColor
            else if(type === qsTr("Warm-up")) rect_anim.border.color = warmupColor
            else if(type === qsTr("Recuperation")) rect_anim.border.color = recupColor
            else if(type === qsTr("Finished")) rect_anim.border.color = finishedColor
            else rect_anim.border.color = mainColor
        }
        onCountValue:{
            text_count.text = count + " / " + max
        }
        onFinished:{
            stopAnimation()
        }
    }

    Rectangle{
        color: "#ffffff"
        anchors.fill: parent

        Image {
            id: image
            width: 125
            height: 125
            anchors.top: parent.top
            anchors.topMargin: 10
            source: "qrc:/img/design/rope.svg"
            fillMode: Image.PreserveAspectFit
            rotation: -25
        }

        Column{
            id:colText
            anchors.centerIn: parent

            Text {
                id: text_type
                text: "..."
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 18
                font.family: "Open Sans"
                color: textColor
            }

            Text {
                id: text_value
                text: "00 : 00"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 35
                font.family: "Open Sans"
                color: textColor
            }

            Text {
                id: text_count
                text: "x / x"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 18
                font.family: "Open Sans"
                color: textColor
            }
        }


        Rectangle {
            id: rect_anim
            width: colText.width + 100
            height: colText.width + 100
            anchors.centerIn: parent
            radius: width
            border.color: mainColor
            border.width: 4
            color: "transparent"

            Rectangle {
                id: rect_mark
                x: 0
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



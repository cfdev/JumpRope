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
import QtQuick.Window 2.14
import QtQuick.Controls 2.13

Window {
    id: window
    visible: true
    width: 540  //1080
    height: 960 //1920
    title: qsTr("Jump Rope")
    property color mainColor:"#00e9cd"

    /// TOPBAR
    Rectangle {
        id: topbar
        width: window.width
        height: 50
        color: window.mainColor
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: title
            color: "#ffffff"
            text: window.title
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 26
            font.weight: Font.Bold
            font.family: "Open Sans"
        }

        RoundButton {
            id: btnAbout
            anchors.right: topbar.right
            anchors.rightMargin: 10
            anchors.verticalCenter:  parent.verticalCenter
            text: "?"
            onClicked :{
                if(stackView.currentItem !== page_about)
                    stackView.replace(page_about)
            }
        }
    }

    /// CONTENT
    StackView {
        id: stackView
        anchors.top: topbar.bottom
        width: window.width
        height: window.height - topbar.height - footbar.height
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true

        initialItem: PageMain{
            id:page_main
        }
        PageAbout{
            id:page_about
        }
        PageRun{
            id:page_run
        }
    }

    /// BOTTOMBAR    
    Rectangle {
        id: footbar
        width: window.width
        height: 100
        color: window.mainColor
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        BtnStop{
            id: btnStop
            opacity: 0
            enabled: false
            x: 50
            anchors.verticalCenter:  parent.verticalCenter
            onClicked :{
                console.log(" Stop");
                if(stackView.currentItem !== page_main)
                    stackView.replace(page_main);
                btnPlay.resetState();
                btnStop.enabled = false
                btnStop.opacity = 0
                btnAbout.enabled = true
            }
        }

        BtnPlay{
            id: btnPlay
            anchors.verticalCenter:  parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onRun :{
                console.log(" run");
                if(stackView.currentItem !== page_run)
                    stackView.replace(page_run, StackView.PushTransition);
                btnStop.enabled = true
                btnStop.opacity = 1
                btnAbout.enabled = false
            }
            onWait :{
                console.log("he Wait :-) ");
            }
        }
    }
}



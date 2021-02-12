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
import QtQuick.Layouts 1.14

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
        height: 100
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
    }

    /// CONTENT
    StackView {
        id: stackView
        anchors.top: topbar.bottom
        width: window.width
        height: window.height - topbar.height - footbar.height
        anchors.horizontalCenter: parent.horizontalCenter
        initialItem: "PageMain.qml"
    }

    /// BOTTOMBAR    
    Rectangle {
        id: footbar
        width: window.width
        height: 127
        color: window.mainColor
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        BtnStop{
            id: btnStop
            opacity: 0
            x: 50
            width: 100
            height: 100
            anchors.verticalCenter:  parent.verticalCenter
            onClicked :{
                console.log(" Stop");
                stackView.replace("PageMain.qml", StackView.PopTransition);
                btnPlay.resetState();
                btnStop.opacity= 0
            }

        }

        BtnPlay{
            id: btnPlay
            width: 100
            height: 100
            anchors.verticalCenter:  parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onRun :{
                console.log(" run");
                stackView.replace("PageRun.qml", StackView.PushTransition);
                btnStop.opacity = 1
            }
            onWait :{
                console.log("he Wait :-) ");
            }
        }

    }
}



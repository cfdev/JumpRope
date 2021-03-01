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
import QtQuick.Window 2.14

Page {
    id:root

    Rectangle{
        color: "#e3b161"
        anchors.fill: parent;

        Text {
            id: sreenc
            text: qsTr("desktopAvailable : ") + Screen.desktopAvailableWidth + " x " + Screen.desktopAvailableHeight +"<br>"+ qsTr("Size : ") + root.width + " x " + root.height;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
        }

       /* Rectangle {
            id: _animeTest
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            width: 50
            height: 50
            color: "lightsteelblue"
            RotationAnimator on rotation {
                loops: Animation.Infinite
                from: 0;
                to: 360;
                duration: 2000
                running: true
            }
        }*/
    }
}

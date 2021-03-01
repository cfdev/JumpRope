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

import QtQuick 2.0

Item {
    id: root
    property alias icon: img.source
    width: 50
    height: 50

    // define signal
    signal clicked()

    // design
    Rectangle{
        id:body
        color: "#00000000"    // ARGB fully transparent
        anchors.fill: parent

        Image{
            id:img
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: root.icon
        }

        MouseArea{
            id:area
            anchors.fill: parent
            hoverEnabled: true
            onPressed: root.clicked();
            onPressAndHold: timer.start();
            onReleased: timer.stop();
            }

        Timer{
            id: timer
            interval: 50
            repeat: true
            onTriggered: root.clicked();
        }
     }
}

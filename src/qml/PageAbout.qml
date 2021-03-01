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
import QtQuick.Controls 2.13
import QtQuick.Window 2.14


Page {
    id:root

    Rectangle{
        color: "#ffffff"
        anchors.fill: parent;
        Text {
            id: title
            text: qsTr("About");
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;
            anchors.topMargin: 20;
        }
        Text {
            id: textAbout
            text:
                "cfdev - www.cfdev.fr<br>" +
                qsTr("desktopAvailable : ") + Screen.desktopAvailableWidth + " x " + Screen.desktopAvailableHeight +"<br>"+ qsTr("Size : ") + root.width + " x " + root.height

            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: title.bottom;
            anchors.topMargin: 20;
        }
    }
}

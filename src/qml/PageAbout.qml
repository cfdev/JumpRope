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
import QtQuick.Window 2.0

Page {
    id:root

    Rectangle{
        color: "white"
        anchors.fill: parent

        Column{
            width: parent.width
            anchors.centerIn: parent
            spacing: 2

            Text {
                id: title
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("<h2>About</h2>");
            }
            Text {
                id: textAbout
                anchors.horizontalCenter: parent.horizontalCenter
                text:
                    "cfdev - www.cfdev.fr<br>" +
                    qsTr("Author : ") + " Cyril Frausti<br>" +
                    qsTr("desktopAvailable : ") + Screen.desktopAvailableWidth + " x " + Screen.desktopAvailableHeight
            }

            // Custom Component from C++ SystemInfo
            // Todo ...
        }
    }
}

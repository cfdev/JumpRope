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
    height: 200
    property string name: qsTr("title")
    property int value: 0

    Text {
        x: -9
        y: 18
        color: "#646262"
        text: name;
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        font.pointSize: 22
        font.family: "Open Sans"
    }

    Text {
        id: title_value
        x: -12
        y: 92
        color: "#646262"
        // prefix Zeros
        // Since ES2017 padding to a minimum length can be done simply with String.prototype.padStart and String.prototype.padEnd:
        text:   value.toString().padStart(3, "0");
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        font.pointSize: 35
        font.family: "Open Sans"
    }

    Btn {
        id: btn_more
        anchors.left: title_value.right
        anchors.leftMargin: 32
        y: 99
        icon: "qrc:/img/design/btn_more.svg"
        onClicked: {
            if(value<100) root.value++;
        }
    }

    Btn {
        id: btn_less
        anchors.right: title_value.left
        anchors.rightMargin: 32
        y: 99
        icon: "qrc:/img/design/btn_less.svg"
        onClicked: {
            if(value>0) root.value--;
        }
    }
}

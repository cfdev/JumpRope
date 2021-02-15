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
    property int value: 0 // secondes

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
        text: valToTime(value)
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
        font.pointSize: 35
        font.family: "Open Sans"
    }

    Btn {
        id: btn_more
        anchors.left: title_value.right
        anchors.leftMargin: 24
        y: 99
        icon: "qrc:/img/design/btn_more.svg"
        onClicked: {
            root.value++;
        }
    }

    Btn {
        id: btn_less
        anchors.right: title_value.left
        anchors.rightMargin: 24
        y: 99
        icon: "qrc:/img/design/btn_less.svg"
        onClicked: {
            root.value--;
        }
    }

    function valToTime(val)
    {
        // Born value
        if(val <0) val = 0;
        if(val >= 5940) val = 5940;

        // Get minutes
        var minutes = (val/60).toString().split(".")[0];

        // Get secondes
        var seconde = 0;
        var dec = "0." +(val/60).toString().split(".")[1];
        if(Number(dec) > 0) seconde =  Number(dec) * 60;
        seconde = seconde.toFixed(); // Round

        // Return string
        return minutes.toString().padStart(2, "0") + " : " + seconde.toString().padStart(2, "0");
    }
}




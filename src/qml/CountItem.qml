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
    height: 150
    width: parent.width

    property string name: qsTr("title")
    property int value: 1

    Column{
        anchors.centerIn: parent

        Text {
            color: "#646262"
            text: name;
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 22
            font.family: "Open Sans"
        }

        Row{
            spacing: 24

            Btn {
                id: btn_less
                icon: "qrc:/img/design/btn_less.svg"
                onClicked: {
                    if(value>1) root.value--;
                }
            }

            Text {
                id: title_value
                color: "#646262"
                // prefix Zeros
                // Since ES2017 padding to a minimum length can be done simply with String.prototype.padStart and String.prototype.padEnd:
                text:   value.toString().padStart(3, "0");
                font.bold: true
                font.pointSize: 35
                font.family: "Open Sans"
            }

            Btn {
                id: btn_more
                icon: "qrc:/img/design/btn_more.svg"
                onClicked: {
                    if(value<100) root.value++;
                }
            }


        }
    }
}

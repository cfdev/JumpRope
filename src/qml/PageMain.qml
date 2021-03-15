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

Page {
    id:root
    // properties  binding
    property var workTime: itemWork.value
    property var recuptTime: itemRecup.value
    property var count: itemCount.value

    Rectangle{
        color: "white"
        anchors.fill: parent

        Column{
            width: parent.width
            anchors.centerIn: parent
            spacing: 2

            TimeItem{
                id:itemWork
                name: qsTr("Work");
                value: 80
            }

            TimeItem{
                id:itemRecup
                name: qsTr("Recuperation");
                value: 5
            }

            CountItem{
                id:itemCount
                name: qsTr("Count");
                value: 2
            }
        }
    }
}

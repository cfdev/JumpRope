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
import QtQuick.Layouts 1.14

Page {
    id: page

    TimeItem{
        id:itemWork
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: itemRecup.top
        name: qsTr("Work");
        value: 80
    }

    TimeItem{
        id:itemRecup
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        name: qsTr("Recuperation");
        value: 0
    }

    CountItem{
        id:itemCount
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: itemRecup.bottom
        name: qsTr("Count");
        value: 2
    }
}

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

function valToTime(val)
{
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

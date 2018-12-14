RSC OFF.
BRAKES OFF.
GEAR OFF.
set AG1 to false.
set AG2 to false.

set maxAlt to 45000.
set currentThrust to 0.
set startEngine to false.
set maxThrot to 1.
set minThrot to 0.1.
set engStarted to false.
set dvNeededForRTLS to (GROUNDSPEED*2)+1000.
set dv to 10000.
set droneShip1 to Vessel("droneShip1"):GEOPOSITION.
set droneShip2 to Vessel("droneShip2"):GEOPOSITION.
set droneShip3 to Vessel("droneShip3"):GEOPOSITION.
set droneShip4 to Vessel("droneShip4"):GEOPOSITION.
set launchInc to 0.
set reverse to true.

if(reverse = true){
	GEAR OFF.
}

set LZ to LATLNG(-0.097181, -74.557697).
if(ALT:RADAR < 1000){
	set doLaunch to true.
} else{
	set doLaunch to false.
}

//set landingPos to LATLNG(-0.097181, -74.557697).
//print(dv).
set maxOffset to 20.
if(doLaunch = true){
	LOCK steering to UP + R(0, 0, 0).
	set throttle to 0.1.
	WAIT 1.
	STAGE.
}
set throttle to 1.75 * Ship:Mass * 9.81 / Ship:AvailableThrust.

wait 1.
lock dv to deltaVstage().

until SHIP:APOAPSIS > maxAlt or doLaunch = false{
//set dv to SHIP:LIQUIDFUEL-2160.
//lock dv to deltaVstage().
set dvNeededForRTLS to (GROUNDSPEED*2)+1000.
clearscreen.
	print((SHIP:MAXTHRUST * throttle)-20).
	print(SHIP:APOAPSIS).
	print(maxAlt).
	print(dv + "/" + dvNeededForRTLS).
	print(steering:yaw - srfretrograde:yaw).
	print("//////////////////////////////").
	if(ADDONS:TR:HASIMPACT){

		if( (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 < (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 > 1000){
			print("Drone ship 1: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 + " Yes ").
		} else{
			print("Drone ship 1: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 + " No ").
		}

		if( (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 < (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 > 1000){
			print("Drone ship 2: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 + " Yes ").
		} else{
			print("Drone ship 2: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 + " No ").
		}

		if( (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 < (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 > 1000){
			print("Drone ship 3: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 + " Yes ").
		} else{
			print("Drone ship 3: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 + " No ").
		}

		if( (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 > 1000){
			print("Drone ship 4: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 + " Yes ").
		} else{
			print("Drone ship 4: " + (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 + " No ").
		}

		if(dv >= dvNeededForRTLS){
			print("rtls: Yes").
		} else{
			print("rtls: No").
		}

	}
	
	if SHIP:APOAPSIS > 3000 AND SHIP:APOAPSIS < 12000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,5,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-5,0).
		}
		set throttle to 1.75 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	
	if SHIP:APOAPSIS > 12000 AND SHIP:APOAPSIS < 13000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,10,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-10,0).
		}
		set throttle to 1.75 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 13000 AND SHIP:APOAPSIS < 14000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,15,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-15,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 14000 AND SHIP:APOAPSIS < 15000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,20,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-20,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 15000 AND SHIP:APOAPSIS < 35000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,35,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-35,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 35000 AND SHIP:APOAPSIS < 40000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,40,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-40,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 40000 AND SHIP:APOAPSIS < 55000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,45,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-45,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 55000 AND SHIP:APOAPSIS < 65000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,50,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-50,0).
		}
		set throttle to 1.5 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 65000 AND SHIP:APOAPSIS < 70000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,60,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-60,0).
		}
		set throttle to 1.25 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}
	if SHIP:APOAPSIS > 70000{
		if(reverse = true){
			LOCK steering to UP + R(launchInc,70,0).
		}
		else {
			LOCK steering to UP + R(launchInc,-70,0).
		}
		set throttle to 1 * Ship:Mass * 9.81 / Ship:AvailableThrust.
	}

}
//set dv to SHIP:LIQUIDFUEL-2160.
if(doLaunch = true){
	set throttle to 0.
	WAIT 2.
	STAGE.
	WAIT 15.
}

set rtls to false.
set targetdroneShip to droneShip1.
set targetdroneShipString to "drone ship 1".

print("Drone ship 1" + (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000).

print("Drone ship 2" + (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000).

print("Drone ship 3" + (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000).

if( (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 > (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip1:LNG)*1000 > 1000){
	set targetdroneShip to droneShip1.
	set targetdroneShipString to "Drone ship 1".
}

if( (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 > (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip2:LNG)*1000 > 1000){
	set targetdroneShip to droneShip2.
	set targetdroneShipString to "Drone ship 2".
}

if( (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 > (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 AND (ADDONS:TR:IMPACTPOS:LNG - droneShip3:LNG)*1000 > 1000){
	set targetdroneShip to droneShip3.
	set targetdroneShipString to "Drone ship 3".
}

if( (ADDONS:TR:IMPACTPOS:LNG - droneShip4:LNG)*1000 > 1000){
	set targetdroneShip to droneShip4.
	set targetdroneShipString to "Drone ship 4".
}

if(dv >= dvNeededForRTLS){
	set rtls to true.
	set targetdroneShipString to "RTLS".
}
//set rtls to false. // remove
//set targetdroneShip to droneShip2. // remove
//set targetdroneShipString to "drone ship 2". // remove

if(rtls = true){
	set targetPos to LZ.
	set landingPos to LATLNG(targetPos:LAT, targetPos:LNG-0.025).
} else{
	set targetPos to targetdroneShip.
	set landingPos to LATLNG(targetPos:LAT, targetPos:LNG+0.025).
}



RCS ON.
if(rtls = true){
	LOCK STEERING TO up + R(0, 90, 0).
} else{
	LOCK STEERING TO srfretrograde.
}
SET AG1 TO TRUE.

if(rtls = true){
	set skip to true.
	//until steering:yaw - srfretrograde:yaw < 2 or steering:yaw - srfretrograde:yaw > -2{
	//	clearscreen.
	//	print(steering:yaw - srfretrograde:yaw).
	//}

	until ship:velocity:surface:mag > 500{
		clearscreen.
		print(ship:velocity:surface:mag).
	}

	wait 15.
} else{
	set skip to false.
}

if(reverse = true){
	set rtls to false.
	set targetdroneShipString to "RTLS".
	set targetPos to LZ.
	set landingPos to LATLNG(targetPos:LAT, targetPos:LNG-0.025).
	set skip to false.
}

if(rtls = true){
	set firstBurnDist to -150.

} else{
	set firstBurnDist to 600.
}


if(reverse = true){
	set firstBurnDist to -150.
}

until VERTICALSPEED < -1 or skip = true{
	set LNGDiff to (SHIP:GEOPOSITION:LNG - targetPos:LNG)/100.
	SET offsetY TO (ADDONS:TR:IMPACTPOS:LAT - landingPos:LAT)*200.
	clearscreen.
	print("Alt: " + ALT:RADAR).
	print("LNGDiff: " + LNGDiff).
	print("OffsetY: " + offsetY).
	print("Selected ship:	" + targetdroneShipString).
	print("DeltaV: " + dv + "/" + dvNeededForRTLS).
	print((ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1000 + "/" + firstBurnDist).
	print(" ").
	print(" ").
	print("  ").
}

if(reverse = true){
	set rtls to true.
	set skip to false.
}



until (ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1000 < firstBurnDist+75 and (ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1000 > firstBurnDist -75 {
	if(ADDONS:TR:HASIMPACT){
		clearscreen.
		set LNGDiff to (SHIP:GEOPOSITION:LNG - targetPos:LNG)/50.
		SET offsetY TO (ADDONS:TR:IMPACTPOS:LAT - landingPos:LAT)*200.
        if(offsetY > 30){
            SET offsetY TO 30.
        }if(offsetY < -30){
            SET offsetY TO -30.
        }
		if(rtls = true and reverse = false){
			LOCK STEERING TO up + R(offsetY, 90, 0).
			print("rtls").
		} else if(reverse = true){
			LOCK STEERING TO srfretrograde + R(offsetY, 0,0).
			print("reverse").
		}else{
			LOCK STEERING TO srfretrograde + R(offsetY, 0,0).
			print("Normal").
		}
		if((ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1000 < firstBurnDist*2){
			SET throttle to 1.25 * Ship:Mass * 9.81 / Ship:AvailableThrust.
		} else{
			SET throttle to 1.25 * Ship:Mass * 9.81 / Ship:AvailableThrust.
		}
		
		
		print("Alt: " + ALT:RADAR).
		print("LNGDiff: " + LNGDiff).
		print("OffsetY: " + offsetY).
		print((ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1000 + " / " + firstBurnDist).
		print("DeltaV: " + dv + "/" + dvNeededForRTLS).
		print(ship:velocity:surface:mag).
		print(" ").
		print(" ").
		print(" ").
	}
}
set throttle to 0.
RCS on.
BRAKES ON.
set tempOffsetX to 0.
set tempOffsetY to 0.
set canDoSlowDownBurn to true.
set overrideSteering to false.
set atTartget to false.
SET AG2 TO TRUE.
until ADDONS:TR:HASIMPACT = false {
	if(ADDONS:TR:HASIMPACT){
	
	if(rtls = true){
		set LNGDiff to -(targetPos:LNG - SHIP:GEOPOSITION:LNG)/10.
		if(LNGDiff > -0.01){
			set LNGDiff to -0.01.
		}
	} else{
		set LNGDiff to (targetPos:LNG - SHIP:GEOPOSITION:LNG)/10.
		if(LNGDiff < 0.01){
			set LNGDiff to 0.01.
		}
	}
	
	set g to body:mu / (ALT:RADAR + body:radius)^2.
	set decel to ((SHIP:AVAILABLETHRUST-(ship:mass)*g)/ship:mass)+g.
	set engBurnDist to -VERTICALSPEED*(-VERTICALSPEED/decel).
	
	if(ALT:RADAR < engBurnDist and ALT:RADAR < 5000){
		set startEngine to true.
	}

	set tempThrot to 1-(ALT:RADAR-engBurnDist)/100.
	if(startEngine = true){
		
		
		if(ALT:RADAR < 150){
			set throttle to ((-VERTICALSPEED*2)/decel).
			if(-VERTICALSPEED < 12){
				SET AG2 TO TRUE.
			} else{
				SET AG2 TO FALSE.
			}
			GEAR on.
		} else{
		
			if(tempThrot > 0.1){
				set throttle to tempThrot.
			}
		}
		
	}
	
	if(ADDONS:TR:HASIMPACT = false){
		set throttle to 0.
	}
	
	set offsetX to (ADDONS:TR:IMPACTPOS:LNG - landingPos:LNG)*1500.
	set offsetY to (ADDONS:TR:IMPACTPOS:LAT - landingPos:LAT)*1500.

	if(offsetX > 15 and canDoSlowDownBurn = true and ALT:RADAR < 47000){
		set overrideSteering to true.
	}
	if(offsetX > 15 and canDoSlowDownBurn = true and ALT:RADAR < 45000){
		SET AG2 TO FALSE.
		set throttle to 0.8.
	}
	if(offsetX < 15 and canDoSlowDownBurn = true){
		SET AG2 TO TRUE.
		set throttle to 0.
		set canDoSlowDownBurn to false.
		set overrideSteering to false.
	}
	
	if(overrideSteering = true){
		LOCK STEERING TO srfretrograde + R(offsetY/10, 0,0).
	}
	
	
	if(offsetX > maxOffset){
		set offsetX to maxOffset.
	}
	if(offsetX < -maxOffset){
		set offsetX to -maxOffset.
	}
	if(offsetY > maxOffset){
		set offsetY to maxOffset.
	}
	if(offsetY < -maxOffset){
		set offsetY to -maxOffset.
	}
	
	set tempOffsetX to offsetX.
	set tempOffsetY to offsetY.
	
	if(offsetX < 5 and offsetX > -5){
		set tempOffsetX to offsetX*2.
	}
	if(offsetY < 5 and offsetY > -5){
		set tempOffsetY to offsetY*2.
	}
	if(ALT:RADAR < 30000 and ALT:RADAR > 1500){
		
		set landingPos to LATLNG(targetPos:LAT, targetPos:LNG+LNGDiff).
		ADDONS:TR:SETTARGET(landingPos).
		RCS on.
	} 
	if(ALT:RADAR < 1250){
		set landingPos to targetPos.
		set atTartget to true.
	}
	
	if(atTartget = true){
		set tempOffsetX to tempOffsetX*2.
		set tempOffsetY to tempOffsetY*2.
	}

	if(-VERTICALSPEED < 150 and -VERTICALSPEED > 75){
		//LOCK STEERING TO -velocity:surface + R(0,0,0).
		LOCK STEERING TO -velocity:surface + R(-tempOffsetY, -tempOffsetX, 0).
	}
	else if(-VERTICALSPEED <  75){
		LOCK STEERING TO UP + R(tempOffsetY, tempOffsetX, 0).
	} else if(overrideSteering = false){
		//LOCK STEERING TO Up + R(-offsetY,-offsetX,0).
		if(startEngine = false){
			LOCK STEERING TO -velocity:surface + R(-tempOffsetY, -tempOffsetX, 0).
		} else{
			if(-VERTICALSPEED < 125){
				LOCK STEERING TO -velocity:surface + R(tempOffsetY, tempOffsetX, 0).
			} else{
				LOCK STEERING TO -velocity:surface + R(-tempOffsetY, -tempOffsetX, 0).
			}
		}
		//LOCK STEERING TO -velocity:surface + R(0,0,0).
	}
	
	clearscreen.
	print("Alt: " + ALT:RADAR).
	print "Selected ship:	" + targetdroneShipString.
	print("DeltaV: " + dv).
	print("LNGDiff: " + LNGDiff).
	print("engBurnDist: " + engBurnDist).
	print("throttle: " + throttle).
	print("offsetX: " + offsetX).
	print("offsetY: " + offsetY).
	print(" ").
	print(" ").
	print(" ").
	} else{
		SET throttle to 0.
	}
}

SET throttle to 0.










//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////



FUNCTION isp_calc {	//returns the average isp of all of the active engines on the ship
	LOCAL engineList IS LIST().
	LOCAL totalFlow IS 0.
	LOCAL totalThrust IS 0.
	lock g to body:mu / (altitude + body:radius)^2.
	LIST ENGINES IN engineList.
	FOR engine IN engineList {
		IF engine:IGNITION AND NOT engine:FLAMEOUT {
			SET totalFlow TO totalFlow + (engine:AVAILABLETHRUST / (engine:ISP * g)).
			SET totalThrust TO totalThrust + engine:AVAILABLETHRUST.
		}
	}
	IF totalThrust = 0 {
		RETURN 1.
	}
	RETURN (totalThrust / (totalFlow * g)).
}



FUNCTION deltaVstage
{	
	LOCAL Isp is 99.
	set Isp to isp_calc().


	// fuel name list
	LOCAL fuels IS list().
    fuels:ADD("LiquidFuel").
	fuels:ADD("Oxidizer").
    fuels:ADD("SolidFuel").
	fuels:ADD("MonoPropellant").
    
	// fuel density list (order must match name list)
    LOCAL fuelsDensity IS list().
	fuelsDensity:ADD(0.005).
    fuelsDensity:ADD(0.005).
	fuelsDensity:ADD(0.0075).
    fuelsDensity:ADD(0.004).

	// initialize fuel mass sums
	LOCAL fuelMass IS 1.
    
	// calculate total fuel mass
    FOR r IN SHIP:RESOURCES
	{
	    LOCAL iter is 0.
		FOR f in fuels
	    {
		    IF f = r:NAME
			{
			    SET fuelMass TO fuelMass + fuelsDensity[iter]*r:AMOUNT.
		    }.
			SET iter TO iter+1.
	    }.
    }.
	set smass to SHIP:MASS.
	//print("Isp " + Isp).
	//print("fuelMass: " + fuelMass).
	//print("Ship mass: " + smass).

	set massDiff to ln(smass / (smass-fuelMass)).

	
	//print("massDiff: " + massDiff).
	//print("DV: " + Isp*9.81*massDiff + "\n").


    // deltaV calculation as Isp*g0*ln(m0/m1).
	LOCAL deltaV IS Isp*9.81*massDiff.
    
	RETURN deltaV.
}.
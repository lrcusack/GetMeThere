function calculateTime(TrafficFactorInfo,nodes, totalDistance, day, startTime){ 
	integrand = [];
	totalTimeElapsed = 0


	for(i = 0; i < nodes.length;i++){
		totalSizeRatio = nodes[1]/totalDistance
		integrand.append((trafficFactorInfo[nodes[2]][day][(startTime+totalTimeElapsed) - (startTime+totalTimeElapsed)%10]*nodes[2])*totalSizeRatio);
		totalTimeElapsed += ((trafficFactorInfo[nodes[2]][day][(startTime+totalTimeElapsed) - (startTime+totalTimeElapsed)%10]*nodes[2])*totalSizeRatio)
	}
	return sum(integrand)
}


//nodes have to be paired with region [distance,directTime,region!!!]
//trafficFactor
//directTime, distance, lat, lon
//Need totalSizeRatio, totalSizeRatio = object[distance]/totalDistance



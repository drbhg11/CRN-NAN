##################################################################
#		Setting RED Parameters				 #
##################################################################

Queue/RED set thresh_ 5
Queue/RED set maxthresh_ 15
Queue/RED set q_weight_ 0.001
Queue/RED set bytes_ false
Queue/RED set queue_in_bytes_ false
Queue/RED set gentle_ false
Queue/RED set mean_pktsize_ 1000
Queue/RED set setbit_ true
Queue/RED set old_ecn_ true
#Queue/RED set use_mark_p_ true

##################################################################
#	    Setting the Default Parameters			 #
##################################################################

set val(chan)		Channel/WirelessChannel
set val(prop)		Propagation/TwoRayGround
set val(netif)		Phy/WirelessPhy
set val(mac)            Mac/802_11

set val(ifq)		Queue/DropTail/PriQueue
#set val(ifq)		Queue/RED
#set val(ifq) 		CMUPriQueue; 
# Wired Interface queue type DropTail, RED, CBQ, FQ, SFQ, DRR, diffserv RED queues
# Wireless Interface queue type Queue/DropTail/PriQueue, CMUPriQueue

set val(ll)		LL
set val(ant)            Antenna/OmniAntenna
set val(x)		800	
set val(y)		800	
set val(ifqlen)		50		
set val(nn)		107		
set val(stop)		102.0		
set val(rp)             AODV       

##################################################################
#	    Creating New Instance of a Scheduler		 #
##################################################################

set ns_		[new Simulator]

##################################################################
#		Creating Trace files				 #
##################################################################

set tracefd	[open 100node-grid-af180-UDP.tr w]
$ns_ trace-all $tracefd

##################################################################
#	        Creating NAM Trace files			 #
##################################################################

set namtrace [open 100node-grid-af180-UDP.nam w]
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)

set prop	[new $val(prop)]

set topo	[new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

##################################################################
#			802.11a
##################################################################

#Phy/WirelessPhy set freq_ 5.0e+9
#Mac/802_11 set dataRate_ 54.0e6 

##################################################################
#	                 802.11b Settings			 #
##################################################################

#Phy/WirelessPhy set freq_ 2.4e+9
#Mac/802_11 set dataRate_ 11.0e6 

##################################################################
#	                 802.11g Settings			 #
##################################################################

#Phy/WirelessPhy set freq_ 2.4e+9
#Mac/802_11 set dataRate_ 54.0e6  

##################################################################
#	                 802.11n-2.4 Settings			 #
##################################################################

#Phy/WirelessPhy set freq_ 2.4e+9
#Mac/802_11 set dataRate_ 450.0e6   

##################################################################
#	                 802.11n-5 Settings			 #
##################################################################

#Phy/WirelessPhy set freq_ 5.0e+9
#Mac/802_11 set dataRate_ 450.0e6
##################################################################
#	                 802.11af Settings			 #
##################################################################

Phy/WirelessPhy set freq_ 5.0e+9
Mac/802_11 set dataRate_ 18.0e6                  
 
     
##################################################################
#		Node Configuration				 #
##################################################################

        $ns_ node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace ON

##################################################################
#		Creating Nodes					 #
##################################################################

for {set i 0} {$i < $val(nn) } {incr i} {
     set node_($i) [$ns_ node]	
     $node_($i) random-motion 0	
}

##################################################################
#		Initial Positions of Nodes			 #
##################################################################

for {set i 0} {$i < $val(nn)} {incr i} {
	$ns_ initial_node_pos $node_($i) 15
}

##################################################################
#		Topology Design				 	 #
##################################################################

#$ns_ at 10.0 "$node_(0) setdest 10.0 10.0 100.0"
#$ns_ at 10.0 "$node_(6) setdest 310.0 10.0 100.0"
#$ns_ at 10.0 "$node_(1) setdest 10.0 160.0 100.0"
#$ns_ at 10.0 "$node_(4) setdest 160.0 160.0 100.0"
#$ns_ at 10.0 "$node_(2) setdest 10.0 310.0 100.0"
#$ns_ at 10.0 "$node_(5) setdest 50.0 50.0 100.0"
#$ns_ at 10.0 "$node_(3) setdest 10.0 460.0 100.0"

################################################################
# Grid Topology
################################################################

#Nodes with 100meters apart
$ns_ at 1.0 "$node_(0) setdest 10 10 100.0"
$ns_ at 1.0 "$node_(1) setdest 43 202 100.0"
$ns_ at 1.0 "$node_(2) setdest 130 202 100.0"
$ns_ at 1.0 "$node_(3) setdest 231 207 100.0"
$ns_ at 1.0 "$node_(4) setdest 86 165 100.0"
$ns_ at 1.0 "$node_(5) setdest 86 253 100.0"
$ns_ at 1.0 "$node_(6) setdest 182 256 100.0"
$ns_ at 1.0 "$node_(7) setdest 190 166 100.0"
$ns_ at 1.0 "$node_(8) setdest 134 132 100.0"
$ns_ at 1.0 "$node_(9) setdest 131 274 100.0"
$ns_ at 1.0 "$node_(10) setdest 34 272 100.0"
$ns_ at 1.0 "$node_(11) setdest 46 123 100.0"
$ns_ at 1.0 "$node_(12) setdest 234 125 100.0"
$ns_ at 1.0 "$node_(13) setdest 238 269 100.0"
$ns_ at 1.0 "$node_(14) setdest 333 205 100.0"
$ns_ at 1.0 "$node_(15) setdest 316 300 100.0"
$ns_ at 1.0 "$node_(16) setdest 185 330 100.0"
$ns_ at 1.0 "$node_(17) setdest 330 124 100.0"
$ns_ at 1.0 "$node_(18) setdest 45 337 100.0"
$ns_ at 1.0 "$node_(19) setdest 389 271 100.0"
$ns_ at 1.0 "$node_(20) setdest 262 355 100.0"
$ns_ at 1.0 "$node_(21) setdest 400 184 100.0"
$ns_ at 1.0 "$node_(22) setdest 404 131 100.0"
$ns_ at 1.0 "$node_(23) setdest 383 345 100.0"
$ns_ at 1.0 "$node_(24) setdest 453 243 100.0"
$ns_ at 1.0 "$node_(25) setdest 10 235 100.0"
$ns_ at 1.0 "$node_(26) setdest 129 352 100.0"
$ns_ at 1.0 "$node_(27) setdest 10 10 100.0"
$ns_ at 1.0 "$node_(28) setdest 83 202 100.0"
$ns_ at 1.0 "$node_(29) setdest 170 202 100.0"
$ns_ at 1.0 "$node_(30) setdest 271 207 100.0"
$ns_ at 1.0 "$node_(31) setdest 126 165 100.0"
$ns_ at 1.0 "$node_(32) setdest 126 253 100.0"
$ns_ at 1.0 "$node_(33) setdest 222 256 100.0"
$ns_ at 1.0 "$node_(34) setdest 230 166 100.0"
$ns_ at 1.0 "$node_(35) setdest 174 132 100.0"
$ns_ at 1.0 "$node_(36) setdest 171 274 100.0"
$ns_ at 1.0 "$node_(37) setdest 74 272 100.0"
$ns_ at 1.0 "$node_(38) setdest 86 123 100.0"
$ns_ at 1.0 "$node_(39) setdest 274 125 100.0"
$ns_ at 1.0 "$node_(40) setdest 278 269 100.0"
$ns_ at 1.0 "$node_(41) setdest 373 205 100.0"
$ns_ at 1.0 "$node_(42) setdest 356 300 100.0"
$ns_ at 1.0 "$node_(43) setdest 235 330 100.0"
$ns_ at 1.0 "$node_(44) setdest 370 124 100.0"
$ns_ at 1.0 "$node_(45) setdest 85 337 100.0"
$ns_ at 1.0 "$node_(46) setdest 429 271 100.0"
$ns_ at 1.0 "$node_(47) setdest 302 355 100.0"
$ns_ at 1.0 "$node_(48) setdest 440 184 100.0"
$ns_ at 1.0 "$node_(49) setdest 444 131 100.0"
$ns_ at 1.0 "$node_(50) setdest 433 345 100.0"
$ns_ at 1.0 "$node_(51) setdest 493 243 100.0"
$ns_ at 1.0 "$node_(52) setdest 50 235 100.0"
$ns_ at 1.0 "$node_(53) setdest 179 352 100.0"

$ns_ at 1.0 "$node_(54) setdest 30 40 100.0"
$ns_ at 1.0 "$node_(55) setdest 63 232 100.0"
$ns_ at 1.0 "$node_(56) setdest 160 232 100.0"
$ns_ at 1.0 "$node_(57) setdest 261 237 100.0"
$ns_ at 1.0 "$node_(58) setdest 116 195 100.0"
$ns_ at 1.0 "$node_(59) setdest 116 283 100.0"
$ns_ at 1.0 "$node_(60) setdest 202 286 100.0"
$ns_ at 1.0 "$node_(61) setdest 210 206 100.0"
$ns_ at 1.0 "$node_(62) setdest 154 162 100.0"
$ns_ at 1.0 "$node_(63) setdest 151 304 100.0"
$ns_ at 1.0 "$node_(64) setdest 54 302 100.0"
$ns_ at 1.0 "$node_(65) setdest 66 153 100.0"
$ns_ at 1.0 "$node_(66) setdest 254 155 100.0"
$ns_ at 1.0 "$node_(67) setdest 268 299 100.0"
$ns_ at 1.0 "$node_(68) setdest 353 235 100.0"
$ns_ at 1.0 "$node_(69) setdest 336 330 100.0"
$ns_ at 1.0 "$node_(70) setdest 205 360 100.0"
$ns_ at 1.0 "$node_(71) setdest 350 154 100.0"
$ns_ at 1.0 "$node_(72) setdest 65 367 100.0"
$ns_ at 1.0 "$node_(73) setdest 409 301 100.0"
$ns_ at 1.0 "$node_(74) setdest 282 385 100.0"
$ns_ at 1.0 "$node_(75) setdest 420 214 100.0"
$ns_ at 1.0 "$node_(76) setdest 424 161 100.0"
$ns_ at 1.0 "$node_(77) setdest 403 375 100.0"
$ns_ at 1.0 "$node_(78) setdest 473 248 100.0"
$ns_ at 1.0 "$node_(79) setdest 30 265 100.0"
$ns_ at 1.0 "$node_(80) setdest 149 382 100.0"
$ns_ at 1.0 "$node_(81) setdest 5 10 100.0"
$ns_ at 1.0 "$node_(82) setdest 103 232 100.0"
$ns_ at 1.0 "$node_(83) setdest 219 262 100.0"
$ns_ at 1.0 "$node_(84) setdest 291 237 100.0"
$ns_ at 1.0 "$node_(85) setdest 146 195 100.0"
$ns_ at 1.0 "$node_(86) setdest 146 283 100.0"
$ns_ at 1.0 "$node_(87) setdest 242 286 100.0"
$ns_ at 1.0 "$node_(88) setdest 250 196 100.0"
$ns_ at 1.0 "$node_(89) setdest 194 162 100.0"
$ns_ at 1.0 "$node_(90) setdest 191 304 100.0"
$ns_ at 1.0 "$node_(91) setdest 94 302 100.0"
$ns_ at 1.0 "$node_(92) setdest 106 153 100.0"
$ns_ at 1.0 "$node_(93) setdest 294 155 100.0"
$ns_ at 1.0 "$node_(94) setdest 298 299 100.0"
$ns_ at 1.0 "$node_(95) setdest 393 235 100.0"
$ns_ at 1.0 "$node_(96) setdest 376 330 100.0"
$ns_ at 1.0 "$node_(43) setdest 255 360 100.0"
$ns_ at 1.0 "$node_(97) setdest 390 154 100.0"
$ns_ at 1.0 "$node_(98) setdest 105 367 100.0"
$ns_ at 1.0 "$node_(99) setdest 449 301 100.0"
$ns_ at 1.0 "$node_(100) setdest 322 385 100.0"
$ns_ at 1.0 "$node_(101) setdest 460 214 100.0"
$ns_ at 1.0 "$node_(102) setdest 464 161 100.0"
$ns_ at 1.0 "$node_(103) setdest 453 375 100.0"
$ns_ at 1.0 "$node_(104) setdest 513 273 100.0"
$ns_ at 1.0 "$node_(105) setdest 70 265 100.0"
$ns_ at 1.0 "$node_(106) setdest 199 382 100.0"



##################################################################
#		Generating Traffic				 #
##################################################################
#$ns_ node-config -ifqType Queue/RED


####################### UDP ########################


set udp0 [new Agent/UDP]
set sink0 [new Agent/Null]
$ns_ attach-agent $node_(3) $udp0
$ns_ attach-agent $node_(23) $sink0
$ns_ connect $udp0 $sink0
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$ns_ at 10.0 "$cbr0 start" 
$ns_ at 15.0 "$cbr0 stop"
$ns_ at 20.0 "$cbr0 start" 
$ns_ at 35.0 "$cbr0 stop"
$ns_ at 36.0 "$cbr0 start" 
$ns_ at 90.0 "$cbr0 stop"

$ns_ node-config -ifqType Queue/RED

set udp1 [new Agent/UDP]
set sink1 [new Agent/Null]
$ns_ attach-agent $node_(5) $udp1
$ns_ attach-agent $node_(25) $sink1
$ns_ connect $udp1 $sink1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$ns_ at 10.0 "$cbr1 start" 
$ns_ at 48.0 "$cbr1 stop"
$ns_ at 60.0 "$cbr1 start" 
$ns_ at 90.0 "$cbr1 stop"

set udp2 [new Agent/UDP]
set sink2 [new Agent/Null]
$ns_ attach-agent $node_(7) $udp2
$ns_ attach-agent $node_(17) $sink2
$ns_ connect $udp2 $sink2
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$ns_ at 10.0 "$cbr2 start" 
$ns_ at 98.0 "$cbr2 stop"

set udp3 [new Agent/UDP]
set sink3 [new Agent/Null]
$ns_ attach-agent $node_(1) $udp3
$ns_ attach-agent $node_(21) $sink3
$ns_ connect $udp3 $sink3
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$ns_ at 10.0 "$cbr3 start" 
$ns_ at 98.0 "$cbr3 stop"

set udp4 [new Agent/UDP]
set sink4 [new Agent/Null]
$ns_ attach-agent $node_(9) $udp4
$ns_ attach-agent $node_(19) $sink4
$ns_ connect $udp4 $sink4
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$ns_ at 10.0 "$cbr4 start" 
$ns_ at 98.0 "$cbr4 stop"

set udp5 [new Agent/UDP]
set sink5 [new Agent/Null]
$ns_ attach-agent $node_(11) $udp5
$ns_ attach-agent $node_(13) $sink5
$ns_ connect $udp5 $sink5
set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$ns_ at 15.0 "$cbr5 start" 
$ns_ at 40.0 "$cbr5 stop"

set udp6 [new Agent/UDP]
set sink6 [new Agent/Null]
$ns_ attach-agent $node_(17) $udp6
$ns_ attach-agent $node_(13) $sink6
$ns_ connect $udp6 $sink6
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$ns_ at 41.0 "$cbr6 start" 
$ns_ at 80.0 "$cbr6 stop"


##################################################################
#		Simulation Termination				 #
##################################################################

for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop) "$node_($i) reset";
}
$ns_ at $val(stop) "puts \"NS EXITING...\" ; $ns_ halt"

puts "Starting Simulation..."

$ns_ run

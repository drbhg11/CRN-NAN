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
set val(nn)		27		
set val(stop)		102.0		
set val(rp)             AODV       

##################################################################
#	    Creating New Instance of a Scheduler		 #
##################################################################

set ns_		[new Simulator]

##################################################################
#		Creating Trace files				 #
##################################################################

set tracefd	[open 26node-grid-af1-80-TCP.tr w]
$ns_ trace-all $tracefd

##################################################################
#	        Creating NAM Trace files			 #
##################################################################

set namtrace [open 26node-grid-af1-80-TCP.nam w]
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
Mac/802_11 set dataRate_ 1.8e6                  
 
     
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


##################################################################
#		Generating Traffic				 #
##################################################################
#$ns_ node-config -ifqType Queue/RED

set tcp0 [new Agent/TCP]
set sink0 [new Agent/TCPSink]
$tcp0 set packetSize_ 960
$tcp0 set window_ 100
$ns_ attach-agent $node_(24) $tcp0
$ns_ attach-agent $node_(2) $sink0
$ns_ connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns_ at 10.0 "$ftp0 start" 
$ns_ at 15.0 "$ftp0 stop"
$ns_ at 20.0 "$ftp0 start" 
$ns_ at 35.0 "$ftp0 stop"
$ns_ at 36.0 "$ftp0 start" 
$ns_ at 90.0 "$ftp0 stop"

$ns_ node-config -ifqType Queue/RED

set tcp1 [new Agent/TCP]
set sink1 [new Agent/TCPSink]
$ns_ attach-agent $node_(4) $tcp1
$ns_ attach-agent $node_(20) $sink1
$ns_ connect $tcp1 $sink1
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns_ at 10.0 "$ftp1 start" 
$ns_ at 48.0 "$ftp1 stop"
$ns_ at 60.0 "$ftp1 start" 
$ns_ at 90.0 "$ftp1 stop"

set tcp2 [new Agent/TCP]
set sink2 [new Agent/TCPSink]
$ns_ attach-agent $node_(6) $tcp2
$ns_ attach-agent $node_(8) $sink2
$ns_ connect $tcp2 $sink2
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns_ at 10.0 "$ftp2 start" 
$ns_ at 98.0 "$ftp2 stop"

set tcp3 [new Agent/TCP]
set sink3 [new Agent/TCPSink]
$ns_ attach-agent $node_(10) $tcp3
$ns_ attach-agent $node_(22) $sink3
$ns_ connect $tcp3 $sink3
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns_ at 10.0 "$ftp3 start" 
$ns_ at 50.0 "$ftp3 stop"

set tcp4 [new Agent/TCP]
set sink4 [new Agent/TCPSink]
$ns_ attach-agent $node_(14) $tcp4
$ns_ attach-agent $node_(18) $sink4
$ns_ connect $tcp4 $sink4
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns_ at 10.0 "$ftp4 start" 
$ns_ at 40.0 "$ftp4 stop"

set tcp5 [new Agent/TCP]
set sink5 [new Agent/TCPSink]
$ns_ attach-agent $node_(16) $tcp5
$ns_ attach-agent $node_(12) $sink5
$ns_ connect $tcp5 $sink5
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ns_ at 15.0 "$ftp5 start" 
$ns_ at 80.0 "$ftp5 stop"

set tcp6 [new Agent/TCP]
set sink6 [new Agent/TCPSink]
$ns_ attach-agent $node_(6) $tcp6
$ns_ attach-agent $node_(22) $sink6
$ns_ connect $tcp6 $sink6
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns_ at 51.0 "$ftp6 start" 
$ns_ at 80.0 "$ftp6 stop"

##################################################################
#		Simulation Termination				 #
##################################################################

for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop) "$node_($i) reset";
}
$ns_ at $val(stop) "puts \"NS EXITING...\" ; $ns_ halt"

puts "Starting Simulation..."

$ns_ run

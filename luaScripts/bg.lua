-- send background traffic.


-- Config --
txPort = "0" -- out port.
rxPort = "0" -- in port.
-- benchmarkDuration = 60
delayInterval = 1000 -- how long to wait between checking current bit-rate.

-- Setup -- 
print("STARTUP COMPLETE\n");
pktgen.screen("off"); -- uncomment this to shut the info screen off.

-- pktgen.set(txPort, "rate", 100); -- set tx rate.
-- pktgen.set(txPort, "size", 512); -- set tx pkt size.
pktgen.start(txPort);

-- Run the benchmark -- 
print("Rx Pkts / s");
getRates = function ()
	print(pktgen.portStats(rxPort, "rate")[tonumber(rxPort)].pkts_rx);
	pktgen.delay(delayInterval);
end

while true do 
	getRates() 
end

-- no stop / teardown --

-- -- stop --
-- pktgen.stop(txPort);
-- for i=benchmarkDuration,benchmarkDuration+3,1 do getRates(i) end
-- -- Teardown --
-- print("benchmark done.");
-- pktgen.screen("on");
-- pktgen.quit();
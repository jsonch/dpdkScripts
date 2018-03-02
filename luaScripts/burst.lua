-- send background traffic.


-- Config --
txPort = "0" -- out port.
rxPort = "0" -- in port.
-- benchmarkDuration = 60
delayInterval = 1000 -- how long to wait between checking current bit-rate.

-- Setup -- 
pktgen.screen("off"); -- uncomment this to shut the info screen off.


print("STARTUP COMPLETE\n");

sendBurst = function(burstSize)
	txPreCount = pktgen.portStats(txPort, "port")[tonumber(txPort)].opackets
	rxPreCount = pktgen.portStats(rxPort, "port")[tonumber(rxPort)].ipackets
	pktgen.set(txPort, "count", burstSize) -- set burst size.
	pktgen.start(txPort)
	pktgen.delay(3000)
	txPostCount = pktgen.portStats(txPort, "port")[tonumber(txPort)].opackets
	rxPostCount = pktgen.portStats(rxPort, "port")[tonumber(rxPort)].ipackets
	txCount = txPostCount - txPreCount
	rxCount = rxPostCount - rxPreCount
	print(burstSize .. "," .. txCount .. "," .. rxCount)
end

print("burstSize, txCount, rxCount")

for i=10000,110000,10000 do
	sendBurst(i)
end

pktgen.quit()

-- end



-- -- pktgen.set(txPort, "rate", 100); -- set tx rate.
-- -- pktgen.set(txPort, "size", 512); -- set tx pkt size.
-- pktgen.start(txPort);

-- -- Run the benchmark -- 
-- print("Rx Pkts / s");
-- getRates = function ()
-- 	print(pktgen.portStats(rxPort, "rate")[tonumber(rxPort)].pkts_rx);
-- 	pktgen.delay(delayInterval);
-- end

-- while true do 
-- 	getRates() 
-- end

-- no stop / teardown --

-- -- stop --
-- pktgen.stop(txPort);
-- for i=benchmarkDuration,benchmarkDuration+3,1 do getRates(i) end
-- -- Teardown --
-- print("benchmark done.");
-- pktgen.screen("on");
-- pktgen.quit();
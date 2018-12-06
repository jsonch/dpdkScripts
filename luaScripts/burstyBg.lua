-- send background traffic in bursts.

-- Config --
txPort = "0" -- out port.
rxPort = "0" -- in port.
-- benchmarkDuration = 60
delayInterval = 1000 -- how long to wait between checking current bit-rate.

-- Setup -- 
pktgen.screen("off"); -- uncomment this to shut the info screen off.

-- Send 1MB burst, wait for 1MB of time @ 10G
-- 1.25 GB/s ~ 1.25MB/ms
pktLen = 1024
burstCt = 1250
pktgen.set(txPort, "size", pktLen); -- set tx pkt size.
pktgen.set(txPort, "rate", 100); -- set tx pkt size.
pktgen.set(txPort, "count", burstCt) -- set burst size.

myIp = "10.0.0.3/24"

tgtIp = "10.0.0.4"
tgtMac = "7c:fe:90:1c:36:81"

pktgen.set_ipaddr(txPort, "dst", tgtIp)
pktgen.set_ipaddr(txPort, "src", myIp)
pktgen.set_mac(txPort, tgtMac)


print("STARTUP COMPLETE\n");

print("burstCt, txCount, rxCount")

for i=0,10000000,1 do
	-- txPreCount = pktgen.portStats(txPort, "port")[tonumber(txPort)].opackets
	-- rxPreCount = pktgen.portStats(rxPort, "port")[tonumber(rxPort)].ipackets
	-- print(txPreCount)
	pktgen.start(txPort)
	pktgen.delay(100) -- wait 1 MS
	-- txPostCount = pktgen.portStats(txPort, "port")[tonumber(txPort)].opackets
	-- rxPostCount = pktgen.portStats(rxPort, "port")[tonumber(rxPort)].ipackets
	-- txCount = txPostCount - txPreCount
	-- rxCount = rxPostCount - rxPreCount
	-- print(burstCt .. "," .. txCount .. "," .. rxCount)
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
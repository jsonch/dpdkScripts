burstSize=1
-- configurable burst size.
-- send at 4 Gb/s for 50% total utilization.
sendRate=40
-- send background traffic.


-- Config --
sendDuration = 20
txPort = "0" -- out port.
myIp = "10.0.0.2/24"

tgtIp = "10.0.0.7"
tgtMac = "24:8a:07:5b:15:35"
-- Setup -- 
pktgen.screen("off"); -- uncomment this to shut the info screen off.

-- print all the functions in pktgen
-- for key,value in pairs(pktgen) do
--     print("found member " .. key);
-- end

-- Run --
pktgen.set(txPort, "burst", burstSize);
pktgen.set(txPort, "rate", sendRate);
pktgen.set(txPort, "size", 200);
pktgen.set_ipaddr(txPort, "dst", tgtIp)
pktgen.set_ipaddr(txPort, "src", myIp)
pktgen.set_mac(txPort, tgtMac)

file = io.open("rxBw.csv", "w");

print("STARTUP COMPLETE, sending packets.\n");

pktgen.start(txPort);

print("Mbps");
-- Low Tput baseline.
getRates = function (ts)
	file:write(pktgen.portStats(txPort, "rate")[tonumber(txPort)].mbits_rx .. "\n");
	print(pktgen.portStats(txPort, "rate")[tonumber(txPort)].mbits_rx);
	pktgen.delay(1000);
end
for i=1,sendDuration,1 do getRates(i) end



pktgen.stop(txPort);
file:close();
print ("traffic generation done.")
pktgen.quit();

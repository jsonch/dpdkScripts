-- send background traffic.


-- Config --
sendDuration = 30
txPort = "0" -- out port.
myIp = "10.0.0.3/24"

tgtIp = "10.0.0.4"
tgtMac = "7c:fe:90:1c:36:81"
-- Setup -- 
pktgen.screen("off"); -- uncomment this to shut the info screen off.

-- print all the functions in pktgen
-- for key,value in pairs(pktgen) do
--     print("found member " .. key);
-- end

-- Run --
pktgen.set(txPort, "burst", 64);
pktgen.set(txPort, "rate", 50.08);
pktgen.set(txPort, "size", 1024);
pktgen.set_ipaddr(txPort, "dst", tgtIp)
pktgen.set_ipaddr(txPort, "src", myIp)
pktgen.set_mac(txPort, tgtMac)

file = io.open("flowBw.csv", "w");

print("STARTUP COMPLETE, sending packets.\n");

pktgen.start(txPort);

print("Mbps");
getRates = function (ts)
	file:write(pktgen.portStats(txPort, "rate")[tonumber(txPort)].mbits_tx .. "\n");
	print(pktgen.portStats(txPort, "rate")[tonumber(txPort)].mbits_tx);
	pktgen.delay(1000);
end
for i=1,sendDuration,1 do getRates(i) end

pktgen.stop(txPort);
file:close();
print ("traffig generation done.")
pktgen.quit();

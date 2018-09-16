-- send background traffic.


-- Config --
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
pktgen.set(txPort, "rate", 50);
pktgen.set(txPort, "size", 1400);
pktgen.set_ipaddr(txPort, "dst", tgtIp)
pktgen.set_ipaddr(txPort, "src", myIp)
pktgen.set_mac(txPort, tgtMac)


print("STARTUP COMPLETE, sending packets.\n");

pktgen.start(txPort);
pktgen.delay(10*1000);
pktgen.stop(txPort);
print ("traffig generation done.")
pktgen.quit();
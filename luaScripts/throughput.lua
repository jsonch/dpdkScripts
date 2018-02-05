-- send 512 B packet out of port 0, measure port 0 throughput rx rate once every 100 ms, save to log.

getRates = function (ts)
	-- prints("rates", pktgen.portStats("0", "rate"));
	file:write(ts .. ", " .. pktgen.portStats("0", "rate")[0].mbits_rx .. "\n");
	print(ts .. ", " .. pktgen.portStats("0", "rate")[0].mbits_rx .. "\n");
	pktgen.delay(delayInterval);
end

startUp = function ()
	-- pktgen.screen("off");

	pktgen.set("0", "rate", 100); -- set tx rate.
	pktgen.set("0", "size", 512); -- set tx pkt size.
	file:write("ts,Mbps.\n");
	pktgen.start("0");
	pktgen.delay(1000);
end

tearDown = function ()
	pktgen.stop("0");
	print("benchmark done.");
	-- pktgen.screen("on");
end

-- MAIN -- 
package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

file = io.open("throughput.txt", "w");
delayInterval = 100

startUp()

for i=1,100,1 do getRates(i) end
file:close();

tearDown()



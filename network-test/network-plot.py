
# pip3 install matplotlib

import matplotlib.pyplot as plt

file1 = open('network-test-latency.txt', 'r')
lines = file1.readlines()
dns=[]
rrt=[]

for line in lines:
    pair = line.split(" ")
    dns.append(pair[0])
    rrt.append(float(pair[1][:-1]))
    print(float(line.split(" ")[1][:-1]))

plt.bar(dns, rrt, color ='blue', width = 0.4)

plt.xlabel("DNSs")
plt.ylabel("RRTs")
plt.xticks(rotation='vertical')
plt.title("Round trip time average latency")
plt.subplots_adjust(bottom=0.35, top=0.9)

plt.savefig('network-plot.png')
plt.show()
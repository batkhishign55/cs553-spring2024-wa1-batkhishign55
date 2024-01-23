[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/W7vBTdCz)
### CS553 Cloud Computing Written Assignment 1 Repo
**Illinois Institute of Technology**  
 
**Student**
* Batkhishig Dulamsurankhor (bdulamsurankhor@hawk.iit.edu)  A20543498 


## File structure
```bash
├── README.md                               # readme
├── disk-benchmark                          # disk-benchmark related files
│   ├── disk-benchmark-background-log.txt   # benchmark output
│   ├── disk-benchmark-background.sh        # benchmark script
│   └── disk-benchmark-output.png           # output screenshot
├── hw1-report.pdf                          # hw report pdf
└── network-test                            # network test related files
    ├── network-plot.py                     # result plot py script
    ├── network-test-latency.txt            # latency output
    ├── network-test-machine-list.txt       # dns list
    ├── network-test-output.png             # output screenshot
    ├── network-test.sh                     # test script
    └── network_plot.png                    # result plot output screenshot
```

## Running disk benchmark test

Go to ```disk-benchmark``` directory:
```bash
cd disk-benchmark
```

Add execute privilege to ```disk-benchmark-background.sh```:
```bash
chmod +x disk-benchmark-background.sh
```

Run the test:
```bash
./disk-benchmark-background.sh
```

Output of the test will be in ```disk-benchmark-background-log.txt``` file.

## Running network test

Go to ```network-test``` directory (Assuming you are in ```disk-benchmark directory```):
```bash
cd ../network-test
```

Add execute privilege to ```network-test.sh```:
```bash
chmod +x network-test.sh
```

Run the test:
```bash
./network-test.sh
```

Output of te test will be in ```network-test-latency.txt``` file.

Install ```matplotlib``` library:

```bash
pip3 install matplotlib
```

Run the plotting script:

```bash
python3 network-plot.py
```

The script will show the visualized latency result.
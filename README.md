# Server Stats

A simple Bash script that analyzes basic Linux server performance statistics.

## Features

* Total CPU Usage
* Memory Usage (Used, Free, Percentage)
* Disk Usage (Used, Free, Percentage)
* Top 5 Processes by CPU Usage
* Top 5 Processes by Memory Usage
* OS Version
* System Uptime
* Load Average
* Logged-in Users
* Recent Failed Login Attempts

## Requirements

* Linux Server
* Bash Shell
* Standard Linux utilities (`top`, `ps`, `free`, `df`, `uptime`, `who`)

## Installation

Clone the repository:

```bash
git clone https://github.com/prashantkumar4217/server-stat.git
cd server-stats
```

Make the script executable:

```bash
chmod +x server-stats.sh
```

## Usage

Run the script:

```bash
./server-stats.sh
```

## Example Output

The script displays:

* CPU utilization
* Memory statistics
* Disk usage
* Top resource-consuming processes
* System information



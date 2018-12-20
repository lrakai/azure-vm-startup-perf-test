# azure-vm-startup-perf-test

Benchmark the deployment times for a variety of configurations of an ARM template.  The test can perform deployment benchmarking for the following:

- VM startup time performance of various SKUs and disk configurations for Azure VMs
- VM Extension runtime of various SKUs and disk configurations for Azure VMs
- Any parameterized ARM template

## Sample results

### Azure VM Startup Times

These results correspond to the ARM template in `infra/arm-template.json` and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

| Description                 | Name           | Total deploy (mm:ss.0) | VM deploy (mm:ss.0) | Max IOPS | RAM (GB) | VCPU | Cost/mth | Note          | 
|-----------------------------|----------------|------------------------|---------------------|----------|----------|------|----------|---------------| 
| A2 unmanaged hdd            | a2unmanhdd     | 04:15.1                | 03:48.1             | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 unmanaged premium ssd    | a2unmanpssd    |                        |                     | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2 managed hdd              | a2manhdd       | 03:51.7                | 03:25.6             | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed standard ssd     | a2mansssd      | 03:51.7                | 03:22.7             | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed premium ssd      | a2manpssd      |                        |                     | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2v2 unmanaged hdd          | a2v2unmanhdd   | 06:52.6                | 02:51.2             | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 unmanaged premium ssd  | a2v2unmanpssd  |                        |                     | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| A2v2 managed hdd            | a2v2manhdd     | 03:44.6                | 03:20.4             | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed standard ssd   | a2v2mansssd    | 03:51.8                | 03:25.3             | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed premium ssd    | a2v2manpssd    |                        |                     | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| b2s unmanaged hdd           | b2sunmanhdd    | 04:16.8                | 03:45.8             | 1600     | 4        | 2    | $53.57   |               | 
| b2s unmanaged premium ssd   | b2sunmanpssd   | 03:27.0                | 03:02.0             | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed hdd             | b2smanhdd      | 04:02.9                | 03:39.3             | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed standard ssd    | b2smansssd     | 03:36.4                | 03:07.0             | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed premium ssd     | b2smanpssd     | 03:40.6                | 03:13.8             | 1600     | 4        | 2    | $53.57   |               | 
| b2ms unmanaged hdd          | b2msunmanhdd   | 03:58.8                | 03:28.9             | 2400     | 8        | 2    | $89.28   |               | 
| b2ms unmanaged premium ssd  | b2msunmanpssd  | 03:29.0                | 03:04.2             | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed hdd            | b2msmanhdd     | 04:11.4                | 03:41.9             | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed standard ssd   | b2msmansssd    | 03:39.0                | 03:09.8             | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed premium ssd    | b2msmanpssd    | 03:36.8                | 03:09.2             | 2400     | 8        | 2    | $89.28   |               | 
| DS1v2 unmanaged hdd         | ds1v2unmanhdd  | 05:31.0                | 04:59.0             | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 unmanaged premium ssd | ds1v2unmanpssd | 04:03.0                | 03:34.6             | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed hdd           | ds1v2manhdd    | 04:13.9                | 03:46.7             | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed standard ssd  | ds1v2mansssd   | 03:46.3                | 03:20.3             | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed premium ssd   | ds1v2manpssd   | 03:39.2                | 03:10.0             | 3200     | 3.5      | 1    | $87.05   |               | 
| F1s unmanaged hdd           | f1sunmanhdd    | 04:53.4                | 04:25.7             | 4000     | 2        | 1    | $76.63   |               | 
| F1s unmanaged premium ssd   | f1sunmanpssd   | 03:27.7                | 03:00.3             | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed hdd             | f1smanhdd      | 03:58.3                | 03:31.9             | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed standard ssd    | f1smansssd     | 03:26.4                | 02:58.8             | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed premium ssd     | f1smanpssd     | 03:35.8                | 03:14.4             | 4000     | 2        | 1    | $76.63   |               | 


### Azure VM Extension Runtimes

These results correspond to the ARM template in `infra/arm-template.scriptExtension.json` and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

| Description                 | Name           | Total deploy (mm:ss.0) | VM deploy (mm:ss.0) | VM Extension (mm:ss.0) | Max IOPS | RAM (GB) | VCPU | Cost/mth | Note          | 
|-----------------------------|----------------|------------------------|---------------------|------------------------|----------|----------|------|----------|---------------| 
| A2 unmanaged hdd            | a2unmanhdd     | 18:17.8                | 03:30.3             | 14:19.6                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 unmanaged premium ssd    | a2unmanpssd    |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2 managed hdd              | a2manhdd       | 23:45.5                | 08:31.3             | 14:46.1                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed standard ssd     | a2mansssd      | 23:10.9                | 04:12.0             | 18:35.8                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed premium ssd      | a2manpssd      |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2v2 unmanaged hdd          | a2v2unmanhdd   | 15:03.9                | 03:19.4             | 10:58.3                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 unmanaged premium ssd  | a2v2unmanpssd  | 00:00.0                | 00:00.0             |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| A2v2 managed hdd            | a2v2manhdd     | 22:39.5                | 03:22.2             | 18:51.1                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed standard ssd   | a2v2mansssd    | 14:56.0                | 03:41.6             | 10:43.5                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed premium ssd    | a2v2manpssd    |                        |                     |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| b2s unmanaged hdd           | b2sunmanhdd    | 12:00.2                | 04:41.6             | 06:47.1                | 1600     | 4        | 2    | $53.57   |               | 
| b2s unmanaged premium ssd   | b2sunmanpssd   | 13:18.2                | 02:52.6             | 09:58.4                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed hdd             | b2smanhdd      | 12:36.2                | 05:18.9             | 06:52.3                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed standard ssd    | b2smansssd     | 14:37.8                | 03:42.4             | 10:27.7                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed premium ssd     | b2smanpssd     | 13:35.4                | 03:16.0             | 09:51.3                | 1600     | 4        | 2    | $53.57   |               | 
| b2ms unmanaged hdd          | b2msunmanhdd   | 10:33.0                | 03:45.0             | 06:03.1                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms unmanaged premium ssd  | b2msunmanpssd  | 09:46.7                | 03:22.4             | 05:55.9                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed hdd            | b2msmanhdd     | 12:56.2                | 05:21.7             | 07:05.8                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed standard ssd   | b2msmansssd    | 14:31.9                | 03:29.1             | 10:37.4                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed premium ssd    | b2msmanpssd    | 16:34.6                | 06:12.4             | 09:54.8                | 2400     | 8        | 2    | $89.28   |               | 
| DS1v2 unmanaged hdd         | ds1v2unmanhdd  | 15:34.1                | 06:00.5             | 09:05.6                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 unmanaged premium ssd | ds1v2unmanpssd | 21:25.4                | 03:09.0             | 17:50.7                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed hdd           | ds1v2manhdd    | 14:31.5                | 05:25.4             | 08:35.4                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed standard ssd  | ds1v2mansssd   |                        |                     |                        | 3200     | 3.5      | 1    | $87.05   | Timed Out     | 
| DS1v2 managed premium ssd   | ds1v2manpssd   |                        |                     |                        | 3200     | 3.5      | 1    | $87.05   | Timed Out     | 
| F1s unmanaged hdd           | f1sunmanhdd    | 14:33.9                | 04:41.5             | 09:16.4                | 4000     | 2        | 1    | $76.63   |               | 
| F1s unmanaged premium ssd   | f1sunmanpssd   |                        |                     |                        | 4000     | 2        | 1    | $76.63   | Timed Out     | 
| F1s managed hdd             | f1smanhdd      | 14:15.1                | 04:41.3             | 09:08.8                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed standard ssd    | f1smansssd     | 12:56.9                | 03:22.1             | 09:05.8                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed premium ssd     | f1smanpssd     | 12:21.6                | 03:31.4             | 08:25.4                | 4000     | 2        | 1    | $76.63   |               | 

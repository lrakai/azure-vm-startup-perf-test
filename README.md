# azure-vm-startup-perf-test

Benchmark the deployment times for a variety of configurations of an ARM template. The test can perform deployment benchmarking for the following:

- VM startup time performance of various SKUs and disk configurations for Azure VMs
- VM Extension runtime of various SKUs and disk configurations for Azure VMs
- Any parameterized ARM template

## Run the Benchmark

1. Choose (or modify) the template in `infra/` for your benchmark test suite

1. Configure the parameters in `Parameters.ps1` to use your selected template and test cases

1. Run the test suite:

    ```ps1
    .\New-TestSuite.ps1
    ```

1. Inspect the resulting CSV table in the output

All tests are performed in parallel to save time. All resources are automatically deleted at the end to save costs.

## Sample results

All tests used a Windows Server 2016 datacenter image and were deployed in `SouthCentralUS`. See ARM templates in `infra/` for more details.

### Azure VM Startup Times

\[12/20/2018\] These results correspond to the ARM template in `infra/arm-template.json` and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

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


### Azure VM Custom Script Extension Runtimes

#### Large (`src/bootstrap.ps1`)

\[12/20/2018\] These results correspond to the ARM template in `infra/arm-template.scriptExtension.json` with the script set to `src/bootstrap.ps1` (Install complete AzureRm PowerShell module, download the `bootstrap.ps1` script, and disable IE ESC, Windows Update, Windows Defender, UAC) and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

| Description                 | Name           | Total deploy (mm:ss.0) | VM deploy (mm:ss.0) | VM Extension (mm:ss.0) | Max IOPS | RAM (GB) | VCPU | Cost/mth | Note          | 
|-----------------------------|----------------|------------------------|---------------------|------------------------|----------|----------|------|----------|---------------| 
| A2 unmanaged hdd            | a2unmanhdd     | 18:17.8                | 03:30.3             | 14:19.6                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 unmanaged premium ssd    | a2unmanpssd    |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2 managed hdd              | a2manhdd       | 23:45.5                | 08:31.3             | 14:46.1                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed standard ssd     | a2mansssd      | 23:10.9                | 04:12.0             | 18:35.8                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed premium ssd      | a2manpssd      |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2v2 unmanaged hdd          | a2v2unmanhdd   | 15:03.9                | 03:19.4             | 10:58.3                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 unmanaged premium ssd  | a2v2unmanpssd  |                 |              |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
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

#### Medium (`src/bootstrap.lite.ps1`)

\[12/20/2018\] These results correspond to the ARM template in `infra/arm-template.scriptExtension.json` with the script set to `src/bootstrap.lite.ps1` (install AzureRM.Compute PowerShell module) and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

| Description                 | Name           | Total deploy (mm:ss.0) | VM deploy (mm:ss.0) | VM Extension (mm:ss.0) | Max IOPS | RAM (GB) | VCPU | Cost/mth | Note          | 
|-----------------------------|----------------|------------------------|---------------------|------------------------|----------|----------|------|----------|---------------| 
| A2 unmanaged hdd            | a2unmanhdd     | 12:17.4                | 03:19.7             | 08:22.4                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 unmanaged premium ssd    | a2unmanpssd    |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2 managed hdd              | a2manhdd       | 12:43.6                | 03:28.2             | 08:49.6                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed standard ssd     | a2mansssd      | 12:16.3                | 03:29.5             | 08:19.1                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed premium ssd      | a2manpssd      |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2v2 unmanaged hdd          | a2v2unmanhdd   | 11:54.4                | 02:55.2             | 08:32.9                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 unmanaged premium ssd  | a2v2unmanpssd  |                        |                     |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| A2v2 managed hdd            | a2v2manhdd     | 12:08.0                | 03:02.3             | 08:36.1                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed standard ssd   | a2v2mansssd    | 12:03.8                | 03:40.4             | 07:59.7                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed premium ssd    | a2v2manpssd    |                        |                     |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| b2s unmanaged hdd           | b2sunmanhdd    | 10:29.9                | 04:43.4             | 05:02.2                | 1600     | 4        | 2    | $53.57   |               | 
| b2s unmanaged premium ssd   | b2sunmanpssd   | 08:09.7                | 03:07.0             | 04:30.5                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed hdd             | b2smanhdd      | 13:00.3                | 05:34.2             | 07:00.9                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed standard ssd    | b2smansssd     | 08:33.5                | 03:22.5             | 04:41.0                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed premium ssd     | b2smanpssd     | 08:34.5                | 03:34.0             | 04:36.0                | 1600     | 4        | 2    | $53.57   |               | 
| b2ms unmanaged hdd          | b2msunmanhdd   | 08:36.7                | 03:32.0             | 04:41.5                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms unmanaged premium ssd  | b2msunmanpssd  | 08:41.2                | 03:20.7             | 04:50.7                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed hdd            | b2msmanhdd     | 10:23.9                | 04:57.1             | 04:58.9                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed standard ssd   | b2msmansssd    | 09:49.1                | 04:34.9             | 04:46.2                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed premium ssd    | b2msmanpssd    | 08:46.4                | 03:49.0             | 04:33.1                | 2400     | 8        | 2    | $89.28   |               | 
| DS1v2 unmanaged hdd         | ds1v2unmanhdd  | 12:33.7                | 05:13.7             | 06:51.9                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 unmanaged premium ssd | ds1v2unmanpssd | 11:02.1                | 03:03.6             | 07:33.3                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed hdd           | ds1v2manhdd    | 13:15.3                | 05:16.2             | 07:35.7                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed standard ssd  | ds1v2mansssd   | 15:21.2                | 03:38.4             | 11:16.0                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed premium ssd   | ds1v2manpssd   | 11:56.2                | 03:31.9             | 07:54.9                | 3200     | 3.5      | 1    | $87.05   |               | 
| F1s unmanaged hdd           | f1sunmanhdd    | 11:59.6                | 03:53.0             | 07:35.3                | 4000     | 2        | 1    | $76.63   |               | 
| F1s unmanaged premium ssd   | f1sunmanpssd   | 10:25.7                | 03:11.2             | 06:43.8                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed hdd             | f1smanhdd      | 13:27.3                | 04:51.4             | 08:11.9                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed standard ssd    | f1smansssd     | 11:03.4                | 03:10.6             | 07:27.9                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed premium ssd     | f1smanpssd     | 10:58.1                | 03:25.4             | 07:09.0                | 4000     | 2        | 1    | $76.63   |               | 

#### Small (`src/bootstrap.vlite.ps1`)

\[12/20/2018\] These results correspond to the ARM template in `infra/arm-template.scriptExtension.json` with the script set to `src/bootstrap.vlite.ps1` (empty script) and benchmarks the deployment time of different VM SKUs and disk configurations (managed/unmanaged and HDD/SSD/Premium SSD):

| Description                 | Name           | Total deploy (mm:ss.0) | VM deploy (mm:ss.0) | VM Extension (mm:ss.0) | Max IOPS | RAM (GB) | VCPU | Cost/mth | Note          | 
|-----------------------------|----------------|------------------------|---------------------|------------------------|----------|----------|------|----------|---------------| 
| A2 unmanaged hdd            | a2unmanhdd     | 11:10.9                | 04:10.8             | 06:34.1                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 unmanaged premium ssd    | a2unmanpssd    |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2 managed hdd              | a2manhdd       | 11:42.0                | 04:10.8             | 07:00.9                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed standard ssd     | a2mansssd      | 10:37.9                | 03:18.2             | 06:54.4                | 4x500    | 3.5      | 2    | $133.92  |               | 
| A2 managed premium ssd      | a2manpssd      |                        |                     |                        | 4x500    | 3.5      | 2    | $133.92  | Not Supported | 
| A2v2 unmanaged hdd          | a2v2unmanhdd   | 09:35.9                | 02:44.4             | 06:17.9                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 unmanaged premium ssd  | a2v2unmanpssd  |                        |                     |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| A2v2 managed hdd            | a2v2manhdd     | 12:02.0                | 03:33.9             | 08:04.9                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed standard ssd   | a2v2mansssd    | 11:11.6                | 03:47.7             | 06:57.1                | 4x500    | 4        | 2    | $101.18  |               | 
| A2v2 managed premium ssd    | a2v2manpssd    |                        |                     |                        | 4x500    | 4        | 2    | $101.18  | Not Supported | 
| b2s unmanaged hdd           | b2sunmanhdd    | 08:44.7                | 04:29.5             | 03:40.3                | 1600     | 4        | 2    | $53.57   |               | 
| b2s unmanaged premium ssd   | b2sunmanpssd   | 07:02.1                | 02:58.9             | 03:35.6                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed hdd             | b2smanhdd      | 09:21.0                | 05:16.3             | 03:34.8                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed standard ssd    | b2smansssd     | 07:55.6                | 03:45.5             | 03:45.2                | 1600     | 4        | 2    | $53.57   |               | 
| b2s managed premium ssd     | b2smanpssd     | 07:21.8                | 03:18.9             | 03:37.2                | 1600     | 4        | 2    | $53.57   |               | 
| b2ms unmanaged hdd          | b2msunmanhdd   | 08:47.9                | 04:45.5             | 03:38.4                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms unmanaged premium ssd  | b2msunmanpssd  | 11:04.6                | 03:06.2             | 03:55.8                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed hdd            | b2msmanhdd     | 09:11.1                | 04:57.1             | 03:47.9                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed standard ssd   | b2msmansssd    | 07:36.4                | 03:13.6             | 03:53.0                | 2400     | 8        | 2    | $89.28   |               | 
| b2ms managed premium ssd    | b2msmanpssd    | 07:18.9                | 03:14.1             | 03:37.7                | 2400     | 8        | 2    | $89.28   |               | 
| DS1v2 unmanaged hdd         | ds1v2unmanhdd  | 11:40.0                | 04:22.4             | 06:46.1                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 unmanaged premium ssd | ds1v2unmanpssd | 11:08.8                | 03:09.9             | 07:26.5                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed hdd           | ds1v2manhdd    | 11:51.3                | 05:06.6             | 06:21.3                | 3200     | 3.5      | 1    | $87.05   |               | 
| DS1v2 managed standard ssd  | ds1v2mansssd   |                        |                     |                        | 3200     | 3.5      | 1    | $87.05   | Timed Out     | 
| DS1v2 managed premium ssd   | ds1v2manpssd   | 12:55.5                | 03:20.2             | 09:07.6                | 3200     | 3.5      | 1    | $87.05   |               | 
| F1s unmanaged hdd           | f1sunmanhdd    | 10:05.6                | 03:35.8             | 05:57.1                | 4000     | 2        | 1    | $76.63   |               | 
| F1s unmanaged premium ssd   | f1sunmanpssd   | 08:49.0                | 02:57.7             | 05:24.3                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed hdd             | f1smanhdd      | 14:16.1                | 07:34.7             | 06:16.0                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed standard ssd    | f1smansssd     | 11:19.1                | 03:11.9             | 07:43.2                | 4000     | 2        | 1    | $76.63   |               | 
| F1s managed premium ssd     | f1smanpssd     | 09:02.8                | 02:56.2             | 05:44.4                | 4000     | 2        | 1    | $76.63   |               | 
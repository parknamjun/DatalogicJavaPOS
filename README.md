# HelloDatalogicJavaPOS

[HelloDatalogicJavaPOS](https://datalogic.github.io/javapos/develop/hellodatalogicjavapos), a hello world program for Datalogic JavaPOS

[Datalogic JavaPOS API](https://datalogic.github.io/javapos/overview), Overview

[Developing with JavaPOS](https://datalogic.github.io/javapos/develop/overview)

## Introduction
### Magellan 1500i for windows
```text
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\OLEforRetail\ServiceOPOS\SCANNER\MagellanSC]
"IncludeCR"="1"
"WarholParsing"="0"
@="ServiceOPOS.ServiceOPOSScanner"
"ConvertBCDtoASCII"="1"
"WMIOnClaim"="0"
"UPCEANCheckDigitCalc"="1"
"DeviceNameOverride"="DATALOGIC PSC RS232 Scanner"
"CheckIHSOnClaim"="0"
"AbstractDevice"="817614FD_C918_4060_9767_CC92B6CF5C43"
"RTSControl"="1"
"ScanDataEqualsScanDataLabel"="0"
"FirmwareUpdate"="0"
"Parity"="None"
"BaudRate"="9600"
"DataBits"="8"
"Port"="COM9"
"StopBits"="1"
```
### Magellan 1500i for linux
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE JposEntries PUBLIC "-//JavaPOS//DTD//EN"
                             "jpos/res/jcl.dtd">
<JposEntries>
    <JposEntry logicalName="MagellanSC">
        <creation factoryClass="com.dls.jpos.service.DLSScannerInstanceFactory"
                  serviceClass="com.dls.jpos.service.DLSScannerService"/>
        <vendor name="DLA" url="http://www.adc.datalogic.com"/>
        <jpos category="Scanner" version="1.14"/>
        <product description="ScannerService" name="ScannerService" url="http://www.adc.datalogic.com"/>
        <!--Other non JavaPOS required property (mostly vendor properties and bus specific properties i.e. RS232 )
        For Linux: sudo dmesg | grep tty
        Virtualbox Comport Mapping(Ex. Windows COM9): COM4 -> /dev/ttyS3
        <prop name="portName" value="/dev/ttyS3"/>
        -->
        <prop name="portName" value="COM9"/>
        <prop name="deviceBus" type="String" value="RS232"/>
        <prop name="baudRate" type="String" value="9600"/>
        <prop name="dataBits" type="String" value="8"/>
        <prop name="stopBits" type="String" value="1"/>
        <prop name="parity" type="String" value="0"/>
    </JposEntry>
</JposEntries>
```
### Datalogic JavaPOS library path
* Windows: C:\Program Files (x86)\Datalogic\JavaPOS\lib
* Linux: /usr/local/Datalogic/JavaPOS/
```text
# ls -l /usr/local/Datalogic/JavaPOS/
-rwxr-x--- 1 root root 467721  2월  6 17:56 JavaPOS.jar
drwxr-xr-x 2 root root   4096  2월  7 09:11 SupportJars

# ls -l /usr/local/Datalogic/JavaPOS/SupportJars
-rwxr-x--- 1 root root  264192  2월  6 17:56 appframework-1.0.3.jar
-rwxr-x--- 1 root root  631281  2월  6 17:56 beansbinding-1.2.1.jar
-rwxr-x--- 1 root root   61573  2월  6 17:56 CMDFW.jar
-rwxr-x--- 1 root root  501879  2월  6 17:56 commons-lang3-3.8.1.jar
-rwxr-x--- 1 root root  285903  2월  6 17:56 DLRFIDLibrary.jar
-rwxr-x--- 1 root root   11254  2월  6 17:56 jargs.jar
-rwxr-x--- 1 root root  350896  2월  6 17:56 JavaPOSTest.jar
-rwxr-x--- 1 root root    5646  2월  6 17:56 javax.usb.properties
-rwxr-x--- 1 root root  121395  2월  6 17:56 jcl.jar
-rwxr-x--- 1 root root 1729586  2월  6 17:56 jna-5.9.0.jar
-rwxr-x--- 1 root root 1343236  2월  6 17:56 jna-platform-5.9.0.jar
-rwxr-x--- 1 root root  299756  2월  6 17:56 jpos114-controls.jar
-rwxr-x--- 1 root root  731303  2월  6 17:56 jpos114.jar
-rwxr-x--- 1 root root   34133  2월  6 17:56 jpos-dls-ext.jar
-rwxr-x--- 1 root root    4971  2월  6 17:56 jpos.properties
-rwxr-x--- 1 root root   30788  2월  6 17:56 jsr80.jar
-rwxr-x--- 1 root root  129834  2월  6 17:56 jsr80-ri.jar
-rwxr-x--- 1 root root  153562  2월  6 17:56 jssc.jar
-rwxr-x--- 1 root root     879  2월  6 17:56 log4j2.xml
-rwxr-x--- 1 root root  276756  2월  6 17:56 log4j-api-2.12.4.jar
-rwxr-x--- 1 root root 1682736  2월  6 17:56 log4j-core-2.12.4.jar
-rwxr-x--- 1 root root  755235  2월  6 17:56 nrjavaserial-3.21.0.jar
-rwxr-x--- 1 root root  118119  2월  6 17:56 swing-layout-1.0.3.jar
-rwxr-x--- 1 root root  117412  2월  6 17:56 swing-layout-1.0.4.jar
-rwxr-x--- 1 root root   11007  2월  6 17:56 swing-worker-1.1.jar
-rwxr-x--- 1 root root  108256  2월  6 17:56 Win32Hid.dll
-rwxr-x--- 1 root root  134880  2월  6 17:56 Win64Hid.dll
-rwxr-x--- 1 root root 1386397  2월  6 17:56 xercesImpl-2.12.0.jar
-rwxr-x--- 1 root root  220536  2월  6 17:56 xml-apis-2.12.0.jar
```

### Run for Ubuntu 22.04.2 LTS (GNU/Linux 5.15.133.1-microsoft-standard-WSL2 x86_64)
* Hello beep Build & Run
```shell    
~/work//scriptps/hellodatalogic/BuildHelloDatalogicJavaPOS.sh
~/work/DatalogicJavaPOS/dist_via_jdk/HelloDatalogicJavaPOS.sh
```
* Scanner Reader Build & Run
```shell    
~/work//scriptps/barcodereader/BuildBarCodeReaderExample.sh
~/work/DatalogicJavaPOS/dist_via_jdk/BarCodeReaderExample.sh
```
* Linux Log path
```text
# log path
export TEMP=/tmp
```
* windows Log path
```text
# log path
set TEMP=/tmp
```

* Result
```text
Hello Datalogic JavaPOS.
Do you hear the scanner beep?
Scanner open.
Scanner beeped
```
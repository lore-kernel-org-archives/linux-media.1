Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com [136.143.188.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137741A569
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 21:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275090; cv=pass; b=sVE7ffh2H4AKu0yhEtDLe92fr9sNLNMjRfNDfex+oHxn7a4LZkFkxeP/MzgD9h2e5mqFrb8vfs/VY0XERWNgnY2zj7ba8z3dUUdRg70LdbFCKw842emugFS5SlQopMucS4t+iUFdrBBbXKqY+vYCwD+a3y+zGffy+mOOB/xK+jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275090; c=relaxed/simple;
	bh=Bxkk9DFKGs8tcbjNjtf32NGwpG4cXXbGodGdUm2CMJg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tCXKXSfjo2xzwf54ttdFo5PI9MfKSqxRBlc0MAj3L5Q6w9wJEerkCsaSFjLCGZSpSYN2nKnKr2TqL0BjdAEMAxmdQArTm6SWGqvwUGRZcoEGkzOsNnUCWcTW4NZRWC0hs+dJL1XaJVCwN8hqMYaXPOcOyc3uiXV33bAJ5vYn1yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=drinkybird.net; spf=pass smtp.mailfrom=drinkybird.net; dkim=pass (1024-bit key) header.d=drinkybird.net header.i=me@drinkybird.net header.b=XQDZgPpD; arc=pass smtp.client-ip=136.143.188.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=drinkybird.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=drinkybird.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=drinkybird.net header.i=me@drinkybird.net header.b="XQDZgPpD"
ARC-Seal: i=1; a=rsa-sha256; t=1785275085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FlAQwwtOYwFjDiu8BtN9W6XGLV68OWwl+HyW4osbIm6wnV3j+SE1tgaQ569Mbl5CjQymqEh33rlli+3HxjcAyBnPNjN5ZMYobLuG/+iU1p33uh/nFxx2pZA1gKLnazBqjNormrz2PktqrGelZn6/d+khQx+K4x5ECnG3mvTVY4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785275085; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=EYF/WcReZYyMkjkJqyXogTfK7a/2MbQsM3qManzpyy0=; 
	b=Lk6J8Ka213JMoFu/watAqSpngCHgcW0ZwOHBhQ5cMgbUYQlto8Y37XydybHVObrtKgbQ4tqIK3u+Bqn8KbQNiY1AsuNbUww2sFC9K/relPRkzq2nKXB0ypFDZ4LtLaIu331474GXNdkLWQ6AJG6gvkhpYix1gZThTtU7o7KRSzg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=drinkybird.net;
	spf=pass  smtp.mailfrom=me@drinkybird.net;
	dmarc=pass header.from=<me@drinkybird.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785275085;
	s=zoho; d=drinkybird.net; i=me@drinkybird.net;
	h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=EYF/WcReZYyMkjkJqyXogTfK7a/2MbQsM3qManzpyy0=;
	b=XQDZgPpDNZGbrzW4uc57kvFkLn/A+lvqAva+21aIcVLBak5tczyfASg6HdFzoGjh
	LcDRKC70Om8IwX7Q/K43g+WIQMzXLFD1G3tXI9QzNHBxA1Lo3YyEdwp6Ff4SvH0Tldy
	eg60ypA/l4BTnv+9C8zEC0wq6VdwojW4+REzW0zc=
Received: by mx.zohomail.com with SMTPS id 1785275081747846.456487778238;
	Tue, 28 Jul 2026 14:44:41 -0700 (PDT)
Message-ID: <5ef59031-0853-41a7-8d11-c345fe535daf@drinkybird.net>
Date: Tue, 28 Jul 2026 22:44:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-media@vger.kernel.org
From: Sean Baggaley <me@drinkybird.net>
Subject: Autosuspend quirk on AVerMedia Live Gamer HD 2 capture card
Autocrypt: addr=me@drinkybird.net; keydata=
 xjMEZgcDDxYJKwYBBAHaRw8BAQdAzSGxiP3QHcFnzycLc7AXc/pP8j/MJ6s+WN4PP4Sd+bHN
 IVNlYW4gQmFnZ2FsZXkgPG1lQGRyaW5reWJpcmQubmV0PsKZBBMWCgBBFiEEQjMlja1vgonM
 AsnbZV8OxoCsKVcFAmYHAw8CGwMFCQWjNqEFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQZV8OxoCsKVfvagD/bs6rHna5RjvNGbcd+zllzjzqDJqqk4r8SzYBdLWce5kBAN/5I+eI
 z8GAy/8xVrMfX7aw++uJ/8uXapjlAg0h+jwEzjgEZgcDDxIKKwYBBAGXVQEFAQEHQMCz9RdB
 A1k62BdxMNr5Yc1Cc+zwIlgzgFzaNSsaXewCAwEIB8J+BBgWCgAmFiEEQjMlja1vgonMAsnb
 ZV8OxoCsKVcFAmYHAw8CGwwFCQWjNqEACgkQZV8OxoCsKVcTtAEAylVIfoNbto7FiJUeYkTC
 siNKTWtmoXqGS0QiTsg405UBALkgq8V9sCfeZbPq/GJKkY/K1jOJesvN9JGALFCJQ3EP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi all,

It appears the AVerMedia Live Gamer HD 2 capture card (USB ID 07ca:1570)
does not deal very well with USB autosuspend; by default, when not being
captured, it gets stuck in a loop where every few seconds it will turn
off and turn back on, causing audio devices to disappear and reappear,
its LED to flash, spamming dmesg, etc. This only happens when not in
use; everything is fine when the video device is actually being used.

Previously, I used usbcore.autosuspend=-1 to disable autosuspend
entirely, but recently learnt quirks exist, and finally ended up doing
some proper digging... turns out uvcvideo has a
UVC_QUIRK_DISABLE_AUTOSUSPEND quirk, and using
'echo 32768 | sudo tee /sys/module/uvcvideo/parameters/quirks' stops
the issue without totally disabling USB autosuspend for everything.

Doing so also suggests to report it here, so I guess here I am. Never
used these lists before, so I'm not sure how things usually go, but if
it helps I appended a dmesg excerpt, lsusb info, and just for good
measure, the lspci info of the PCIe USB controller the device is glued
to.

Thanks, Sean

---

dmesg gets spammed with this, over and over, every few seconds, until
the end of time (or application of workaround):

[ 3545.140800] [    T350] usb 7-1: USB disconnect, device number 22
[ 3547.132744] [    T350] usb 7-1: new high-speed USB device number 23 using xhci-pci-renesas
[ 3547.270074] [    T350] usb 7-1: New USB device found, idVendor=07ca, idProduct=1570, bcdDevice= 1.00
[ 3547.270077] [    T350] usb 7-1: New USB device strings: Mfr=6, Product=7, SerialNumber=3
[ 3547.270078] [    T350] usb 7-1: Product: AVerMedia USB Device
[ 3547.270079] [    T350] usb 7-1: Manufacturer: AVerMedia
[ 3547.270080] [    T350] usb 7-1: SerialNumber: 53106326013650
[ 3547.271931] [    T350] uvcvideo 7-1:1.0: Found UVC 1.00 device AVerMedia USB Device (07ca:1570)
[ 3547.297523] [    T350] uvcvideo 7-1:1.0: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
[ 3549.704246] [    T350] usb 7-1: USB disconnect, device number 23
[ 3550.309662] [    T350] usb 7-1: new high-speed USB device number 24 using xhci-pci-renesas
[ 3550.446696] [    T350] usb 7-1: New USB device found, idVendor=07ca, idProduct=1570, bcdDevice= 1.00
[ 3550.446700] [    T350] usb 7-1: New USB device strings: Mfr=6, Product=7, SerialNumber=3
[ 3550.446701] [    T350] usb 7-1: Product: AVerMedia USB Device
[ 3550.446702] [    T350] usb 7-1: Manufacturer: AVerMedia
[ 3550.446703] [    T350] usb 7-1: SerialNumber: 53106326013650
[ 3550.448460] [    T350] uvcvideo 7-1:1.0: Found UVC 1.00 device AVerMedia USB Device (07ca:1570)
[ 3550.453302] [    T350] uvcvideo 7-1:1.0: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.


lsusb -v -d 07ca:1570 output:

Bus 007 Device 012: ID 07ca:1570 AVerMedia Technologies, Inc. AVerMedia USB Device
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x07ca AVerMedia Technologies, Inc.
   idProduct          0x1570 AVerMedia USB Device
   bcdDevice            1.00
   iManufacturer           6 AVerMedia
   iProduct                7 AVerMedia USB Device
   iSerial                 3 53106326013650
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x01d6
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              150mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass         14 Video
       bFunctionSubClass       3 Video Interface Collection
       bFunctionProtocol       0
       iFunction               8 AVerMedia Live Gamer HD 2
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      0
       iInterface              8 AVerMedia Live Gamer HD 2
       VideoControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdUVC               1.00
         wTotalLength       0x004d
         dwClockFrequency      120.000000MHz
         bInCollection           1
         baInterfaceNr( 0)       1
       VideoControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Camera Sensor
         bAssocTerminal          0
         iTerminal               0
         wObjectiveFocalLengthMin      0
         wObjectiveFocalLengthMax      0
         wOcularFocalLength            0
         bControlSize                  3
         bmControls           0x00000000
       VideoControl Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      5 (PROCESSING_UNIT)
       Warning: Descriptor too short
         bUnitID                 3
         bSourceID               1
         wMaxMultiplier          0
         bControlSize            2
         bmControls     0x0000000f
           Brightness
           Contrast
           Hue
           Saturation
         iProcessing             0
         bmVideoStandards     0x09
           None
           SECAM - 625/50
       VideoControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             2
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               4
         iTerminal               0
       VideoControl Interface Descriptor:
         bLength                28
         bDescriptorType        36
         bDescriptorSubtype      6 (EXTENSION_UNIT)
         bUnitID                 4
         guidExtensionCode         {c66d125b-0480-0844-8c26-b8363a84de63}
         bNumControls           17
         bNrInPins               1
         baSourceID( 0)          3
         bControlSize            3
         bmControls( 0)       0x07
         bmControls( 1)       0xfe
         bmControls( 2)       0x01
         iExtension              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              8 AVerMedia Live Gamer HD 2
       VideoStreaming Interface Descriptor:
         bLength                            14
         bDescriptorType                    36
         bDescriptorSubtype                  1 (INPUT_HEADER)
         bNumFormats                         1
         wTotalLength                   0x00bd
         bEndpointAddress                 0x89  EP 9 IN
         bmInfo                              0
         bTerminalLink                       2
         bStillCaptureMethod                 0
         bTriggerSupport                     0
         bTriggerUsage                       0
         bControlSize                        1
         bmaControls( 0)                     0
       VideoStreaming Interface Descriptor:
         bLength                            11
         bDescriptorType                    36
         bDescriptorSubtype                  6 (FORMAT_MJPEG)
         bFormatIndex                        1
         bNumFrameDescriptors                5
         bFlags                              0
           Fixed-size samples: No
         bDefaultFrameIndex                  1
         bAspectRatioX                       0
         bAspectRatioY                       0
         bmInterlaceFlags                 0x00
           Interlaced stream or variable: No
           Fields per frame: 1 fields
           Field 1 first: No
           Field pattern: Field 1 only
         bCopyProtect                        0
       VideoStreaming Interface Descriptor:
         bLength                            34
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         1
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                294617088
         dwMaxBitRate                294912000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         166833
         bFrameIntervalType                  2
         dwFrameInterval( 0)            166666
         dwFrameInterval( 1)            166833
       VideoStreaming Interface Descriptor:
         bLength                            34
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           480
         dwMinBitRate                331444224
         dwMaxBitRate                331776000
         dwMaxVideoFrameBufferSize      691200
         dwDefaultFrameInterval         166833
         bFrameIntervalType                  2
         dwFrameInterval( 0)            166666
         dwFrameInterval( 1)            166833
       VideoStreaming Interface Descriptor:
         bLength                            30
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         3
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            720
         wHeight                           576
         dwMinBitRate                331776000
         dwMaxBitRate                331776000
         dwMaxVideoFrameBufferSize      829440
         dwDefaultFrameInterval         200000
         bFrameIntervalType                  1
         dwFrameInterval( 0)            200000
       VideoStreaming Interface Descriptor:
         bLength                            38
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         4
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1280
         wHeight                           720
         dwMinBitRate                737280000
         dwMaxBitRate                884736000
         dwMaxVideoFrameBufferSize     1843200
         dwDefaultFrameInterval         166666
         bFrameIntervalType                  3
         dwFrameInterval( 0)            166666
         dwFrameInterval( 1)            166833
         dwFrameInterval( 2)            200000
       VideoStreaming Interface Descriptor:
         bLength                            46
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         5
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                           1920
         wHeight                          1080
         dwMinBitRate                994332672
         dwMaxBitRate                1990656000
         dwMaxVideoFrameBufferSize     4147200
         dwDefaultFrameInterval         166666
         bFrameIntervalType                  5
         dwFrameInterval( 0)            166666
         dwFrameInterval( 1)            166833
         dwFrameInterval( 2)            200000
         dwFrameInterval( 3)            333333
         dwFrameInterval( 4)            333667
       VideoStreaming Interface Descriptor:
         bLength                             6
         bDescriptorType                    36
         bDescriptorSubtype                 13 (COLORFORMAT)
         bColorPrimaries                     1 (BT.709,sRGB)
         bTransferCharacteristics            1 (BT.709)
         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0
       iInterface              8 AVerMedia Live Gamer HD 2
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x89  EP 9 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x1400  3x 1024 bytes
         bInterval               1
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         2
       bInterfaceCount         2
       bFunctionClass          1 Audio
       bFunctionSubClass       2 Streaming
       bFunctionProtocol       0
       iFunction               9 AVerMedia Live Gamer HD 2
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol      0
       iInterface              9 AVerMedia Live Gamer HD 2
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               1.00
         wTotalLength       0x003a
         bInCollection           1
         baInterfaceNr(0)        3
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0602 Digital Audio Interface
         bAssocTerminal          0
         bNrChannels             1
         wChannelConfig     0x0000
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             5
         wTerminalType      0x0603 Line Connector
         bAssocTerminal          0
         bNrChannels             1
         wChannelConfig     0x0000
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID             2
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               3
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 3
         bSourceID               4
         bControlSize            1
         bmaControls(0)       0x01
           Mute Control
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype      5 (SELECTOR_UNIT)
         bUnitID                 4
         bNrInPins               2
         baSourceID(0)           1
         baSourceID(1)           5
         iSelector               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              9 AVerMedia Live Gamer HD 2
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              9 AVerMedia Live Gamer HD 2
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bDelay                  1 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                11
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             2
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            1 Discrete
         tSamFreq[ 0]        48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x8a  EP 10 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00c0  1x 192 bytes
         bInterval               4
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         0 Undefined
           wLockDelay         0x0000
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0016
   bNumDeviceCaps          2
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000006
       BESL Link Power Management (LPM) Supported
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x000e
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat           4 micro seconds
     bU2DevExitLat           4 micro seconds
Device Status:     0x0000
   (Bus Powered)


lspci -s 04:00.0 -vvv -nn output:

04:00.0 USB controller [0c03]: Renesas Electronics Corp. uPD720202 USB 3.0 Host Controller [1912:0015] (rev 02) (prog-if 30 [XHCI])
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 41
         IOMMU group: 23
         Region 0: Memory at fc700000 (64-bit, non-prefetchable) [size=8K]
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [70] MSI: Enable- Count=1/8 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [90] MSI-X: Enable+ Count=8 Masked-
                 Vector table: BAR=0 offset=00001000
                 PBA: BAR=0 offset=00001080
         Capabilities: [a0] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <4us, L1 unlimited
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
                 LnkSta: Speed 5GT/s, Width x1
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [150 v1] Latency Tolerance Reporting
                 Max snoop latency: 1048576ns
                 Max no snoop latency: 1048576ns
         Kernel driver in use: xhci-pci-renesas
         Kernel modules: xhci_pci, xhci_pci_renesas

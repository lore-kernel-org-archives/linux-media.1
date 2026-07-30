Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353A455197
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428313; cv=none; b=q7QAdZcGcnJagC/AjYYmr+XeUXmetIipLnHv1PJ+CWBnmT1eO8s863V7R+jNCMVyzt5flY8iDa6omvM8BZcpu+PU57YUWCS5o3v19o6xClCmFd2mt3W8CDMm/Lsg2DOB38WdxtSovLiA4etzzaYMhBoHiCwizfxwFzDU+KhjSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428313; c=relaxed/simple;
	bh=oxydx2RUC76A/ql7KN2Bk4TwRMWPIrD4pl0c8sARiv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ndQ5mgngMxzzdjqRSpRMcRRg5nnr7IczmvdwF6mI7RSLWKYtUrFZWgjFdjyeDoTheXQF17vcu5KwmOvTN/zS+zzhVnq2z0VgD9SDgMIR27S5UTKMi7q3MhGzEnrukMQ1/KASP1drcNsCbOnVII+g2ggSxb4vBw1EOUDvKDfDA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SIM88ZdY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SIM88ZdY"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39eb257e9fbso225131fa.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785428308; x=1786033108; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6rP/iGB7jC4rfYwxCDXBlhthUkvd3zlEUiZc7UuAMg=;
        b=SIM88ZdYR0DKkgV5Dy452dobMiTfd2MQEYpbmVwC0Xoaj+mDJJ25M/Q704cBgEU8Mx
         HB9gwLCYp2oag0jvUsdA9/KctHtClxW8tiuVgu5/NwyLweN3l/OfJXnYIi4NO/nJ3oOK
         AFaGwwSsJOUPYUJrCaNcmgZGT5uRkFoeN2XEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428308; x=1786033108;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D6rP/iGB7jC4rfYwxCDXBlhthUkvd3zlEUiZc7UuAMg=;
        b=si9gFk4a7oHexHzZfVL5DDEwGohT+jFNRGWyY9c/vPqgtLy/lWFcBGqn8OgNPbqSjd
         un7EE9WlKHQPzJ8TDO7JTjaMb+/CXxq28ppxpB6akoyqTC1JhChwUCUR6ICMeJorCcsS
         O7NcZ5g8D7zkNMc1nvHeQX1Wdhauv57SgnlGhH6fmPzuV3yhuvodLIs24DlDYq8Fril1
         5N2Bk/gIbZi1tVn+l6+HLbHXv2LFleliv/K954FTdpOdBPI3Ebon9FdNJa/on2DoIqQZ
         hmoe3Go7VQgaaEdxTcHYHgbMU2ttBCy7JSSAODO2Tf7bE4s8kYkdDUfpmce3wyotvHZb
         BcnQ==
X-Gm-Message-State: AOJu0Ywywre2NAuxE9V+L2092QxTKCXNrEApzxDJCa4CY500cHMzddAC
	0El1GjvC2k1CYDJrRUILonzyAr0xMUmN645teq0F9hjhPUfoxiFY7uWRJtHXrRowKw==
X-Gm-Gg: AR+sD12+6a84QcviKq3h5RcESTiH5XAQbdM4MgBbPwS633lhgWxbWJSV2IHBYd3A+gL
	2ld6HGwqfZPZ/yyP3YGyi8gxxZ4xFhImOZJFInb96ODkSCT8C9MQhE6Zq4G9LWU+bf6wMHGJyoW
	ZotNq3t7LKR4CRz1EqhzIq2dNcOteyw8+t0KMKA7xnbMIYXtf8elYohB8y8VLP5XRmfdmIeTMTq
	oT0nQWvlIDjOcna9QLiPTARfdbIJeSqwTNBwY/QkLiWEvE8ixSQItCGY7GFHisZQcCnY406vK8K
	PCs3D7nMbordxnqAdWyVp8sk6hlp9p47BaPN/jZMGTblCesPyhDxYpqewM7PdoqiBlVdkvUTUAi
	fG4KkWwMBexKxiDEVQFf8D3dhsZFdmgqPj46wPCi6y91OuoGap2QJc52W5JKJTnVF98IT4iKIc2
	as5G7gG/qL07xnTXMSeJR80DIKxMrorAeKsiG26kcCpygbiUcYCC7Qamijqgu80FEB0jRYEopMA
	DIVpm3rnd0NmeGQtKJ50AaHKHJNL7lKKr/3DXnu01sqh+1ExhZ7ctQ=
X-Received: by 2002:a05:651c:211d:b0:39c:7200:b9b9 with SMTP id 38308e7fff4ca-39f6d0e1a1cmr5725371fa.13.1785428308335;
        Thu, 30 Jul 2026 09:18:28 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6a79ab21sm3802031fa.15.2026.07.30.09.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:18:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 30 Jul 2026 16:18:23 +0000
Subject: [PATCH] media: uvcvideo: Add autosuspend quirk for AVerMedia Live
 Gamer HD 2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-uvc-avermedia-v1-1-7272dd394d83@chromium.org>
X-B4-Tracking: v=1; b=H4sIAE55a2oC/x3MSwqAIBRG4a3EHSeY0nMr0UDsr+4gCyUJxL0nD
 b/BOYkCPCPQVCXyiBz4cgVNXZE9jNsheC0mJVUney3FE60wEf7EykaMVstGoUU3aCrN7bHx+//
 mJecPYeLODl8AAAA=
X-Change-ID: 20260730-uvc-avermedia-9c3012e5e683
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sean Baggaley <me@drinkybird.net>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

A user has reported that this device gets stuck in a loop where every
few seconds it will turn off and turn back on, causing audio devices
to disappear and reappear, its LED to flash, spamming dmesg, etc.
This only happens when not in use; everything is fine when the video
device is actually being used.

They also reported that using the AUTOSUSPEND quirk via module parameters
fixes the issue.

Add the device to the quirk list.

ID 07ca:1570 AVerMedia Technologies, Inc. AVerMedia USB Device
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

Reported-by: Sean Baggaley <me@drinkybird.net>
Closes: https://lore.kernel.org/linux-media/5ef59031-0853-41a7-8d11-c345fe535daf@drinkybird.net/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..30adde5a8bc9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2851,6 +2851,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_fix_bandwidth },
+	/* AVerMedia Live Gamer HD 2 capture card */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x07ca,
+	  .idProduct		= 0x1570,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* ViMicro Vega */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

---
base-commit: 7b1734e1761258d78651263706182f1d772c0d3b
change-id: 20260730-uvc-avermedia-9c3012e5e683

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


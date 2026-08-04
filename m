Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9D3F3271
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823192; cv=pass; b=fO6LmxEpCChOys5/QlJfvgALa9pMtup2XHbxQt4gSmy/RprC67304pah25T+K62XtPVKHkKfR7IErU1GD20i6HLDaHX63/E9hXGM97TWxotaypT1rdIvlBH5pb84MmSpaJzeG8s9l9460GVgGKlJ7ZtQ44VNOepmBasLyCmchng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823192; c=relaxed/simple;
	bh=uzsTPCYUYf5IdEpljqmf0chQS9e7eN8wLKQjJV3+2YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exT4CUeFViCsnXLTozBCwDuSsTOgDoUf76A77MMoxhq9vZ+4ao+ktOri8geF6LuS8d8haWWlsgfWnvokfFeGxngllmpi4yAptKsk+ef73C2nyx2zbit4og/XxyMpfKI+tXheQofy29V2pZ5BKF8VedU6JcrqVgPpR1/KRw4qrpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qk6xn9xt; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qk6xn9xt"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b29599b81cso5891733e87.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785823187; cv=none;
        d=google.com; s=arc-20260327;
        b=hQOXqNdx2LHWRpvE4BdQfZxCwIzOYpJxkI5SW8XX28ECpOTDuPP1IIWNl/puryoCSO
         7+l2ccczR4uHhDA/WXJxQS8A4njuvvU0QqVRdcFxRqN2zhH8MvrGbzy58R0IBDaZhVqE
         I6SPmlM0mNyyXWGGsHMeVmGJchU75HGtuGI2fiO8XdE0W0JW8PL5/Lh8orCTqs7xZ7rr
         cQi7d43CmUcMx3fsoNHjbe+OI3R7HG9f4zlMr/c9K711iq2r5UBNBARF6rBX6CjM6qV1
         lUqmiDTMirUCmXZv1PzZmkreXHeKm7kFYgRLu9BZHPBiZcgABgikFC/U1Kh9HMvgnVRF
         7CMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=54broTigytBiwG+o3+ipJ5f6u5D+bdZ9a2N1Cva629A=;
        fh=17A+Tgh0fvdUnjnaqeZoKTiqJqgGywKI5jXjhTHNtxM=;
        b=DxTqQ9mYcseN4TPKuzp/LAFOkkOXqUariR4THohRGMxtzCZWDd2D50nP/nRjUKckSW
         mZmqXxxX9gh6yAmueIy1/9RTdGD8N5WiEYYSxl0TUlJ58EV04OJZ9phqbkJolIqslX+B
         OVDiW0lXWYUBqCWAgKtSESL4kmxnk0ZCiIW+MDIr1XHKELwmoJpWqBJ/IEN62Ow0/9zd
         iMyjsjTVp14QKoWwzxzfzrE9rlcmGsiJw+gUfgiXArrHGNUagBeN0D2MCe8ouHrD+sxb
         dHG5Z4PjBq5bbGpAzTO4rEQ6Hc0J3UInprSM3g69bmPf7A5a2A2hBAvsWld4xWQ1Jqgq
         LO0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785823187; x=1786427987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=54broTigytBiwG+o3+ipJ5f6u5D+bdZ9a2N1Cva629A=;
        b=qk6xn9xttZ4Jv5onCYpUzWhkQ8yQ7cQccLA0PLZInS5JFWk8QtdW8enbPkFNen6S/r
         DjkT7HriEO95WYiVV52WoR9+1bPO0/0XPTFpHgf4AXt+nlO06maQkE1xq2aEEBJlHIzR
         XFDcMSbRerBJSLr6vh7nSywuGYjZBbPt1jP6R8Jw5rNgmNshxKPwiFGqRGpgPiXlkN0U
         a0RvzPrxT0HxTyRU0pgw2WzIQ4Qzvbyxo2iYEYlq/Bj0MZMpTyzm+DM/ymd30FJWhQYz
         Lv+htKtaj2unAcqNwYV37b7WDOwfLJ8Vai+R1bxNLyx0VwOsXGwo6yY8tNKy2lgNTKkT
         JFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823187; x=1786427987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54broTigytBiwG+o3+ipJ5f6u5D+bdZ9a2N1Cva629A=;
        b=QIlA7naZjqg05sWdV6cii6qdBLHcfSTjuwzuhyJPUEcZ3UaMVsF7jRyGf6AeAhhjAC
         1p/zBD4zOalk4UdL9MKfs5rJYC06wNvlMhF6voo3Bl+NbHx6aQcDo7ps8Gnh3NHMmRIe
         CCpbGR+4W8vY0vE9l3m+0hS19jyz6oV9nI1+u0XXoG6VbdyrUS89bQ6IPRmEv7aqipo3
         PGyIlnMaZG8UrMpB6aEek7i4URHQmuvaDSP7AjXNU3kPsa7DhT6K2Dy7ktg0XsUws5Im
         xQNho40vAJG7JOTyKXpN466fV6861lNbmY49rS4u+8/Z0b9UMoEQO+XJ5vIsTmL/tRdL
         dD0g==
X-Forwarded-Encrypted: i=1; AHgh+RoKnR9QnVyXI4tcC5P+Vc7enpYpsmmuj82ENdKoiDw+4rzS6L/ChRxHwgY4/usEn7S2C2TdogwuB6ci3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+DB2vBuNXwEUMPw/dXG9Zlq6H4ToTUy6g31QPRanFhq0mlRg
	7aUSDyKhW6wUuUrVXFim4Ldm7s9JJZJc/lH/dS6Q5zK92i2/4dz/6ryS8ZaPJPGlsog3rKFttKY
	1Y7uv9O92YVhmDRR/dV5xzuL1ov3jyGOt7NyC+MO5
X-Gm-Gg: AR+sD13VqxMiXf8EMA73Jqiu5j+oPqTGAb2vcidc3jbi28nZsFsdjpDH3VF9WPx6HiW
	unI4a1pym241Joe0zoYxqmxoNiv9FmqFYVOyQDPuDfKPSRU6aDS6M9dH8BxqtAQDxtFU6uyguHg
	Lvj9ryT1qgG9/ZKgrYGqEu0rBN59d9zEGwVZncJeOLsjDmiLYRLN8yA7CQ0D63rBqmV8AqLYbeP
	N6mwtAqMnkhcQgM9DK50S9pSIMp3EDHq1BX7XFEKyx6MiU3ANjoq3BwKgYOQPUvwinv+aBaxVLv
	pHn3ygmKWRkX8I8foO2S87pGdmcNaaRyD3vrL0CmngelSXnGBKOLlAUEpbyoBaIcvsqJ4aCg5uo
	=
X-Received: by 2002:a05:6512:3e24:b0:5ae:bd4d:852 with SMTP id
 2adb3069b0e04-5b2e4f1c795mr2460914e87.5.1785823186057; Mon, 03 Aug 2026
 22:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803065811.3490286-1-yunkec@google.com> <CANiDSCu2TxQOGPNGV_mOwT1xsKH+LRnGU42Qf2C6CCRNnXgSTw@mail.gmail.com>
In-Reply-To: <CANiDSCu2TxQOGPNGV_mOwT1xsKH+LRnGU42Qf2C6CCRNnXgSTw@mail.gmail.com>
From: Yunke Cao <yunkec@google.com>
Date: Tue, 4 Aug 2026 14:59:33 +0900
X-Gm-Features: AUfX_myLU65Y9jioBv8jf5NEprLqQfibL4EXoMMYy_lvwvGA2Hq5OYCY04OamI4
Message-ID: <CANqU6FdC-bMfV+jSePTQbonmZG=AWVsB7_PT6Zy4eRQzORrDrw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for invalid dev_sof in
 Logitech C925e
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo, thanks for the review! Attaching the full lsusb output below:

Bus 003 Device 006: ID 046d:085b Logitech, Inc. Logitech Webcam C925e
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x046d Logitech, Inc.
  idProduct          0x085b
  bcdDevice            0.16
  iManufacturer           0
  iProduct                2 Logitech Webcam C925e
  iSerial                 1 2F2036AF
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x09c7
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0
      iInterface              0
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x00d6
        dwClockFrequency      300.000000MHz
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
        bmControls           0x00020a2e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Focus (Absolute)
          Zoom (Absolute)
          PanTilt (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000175b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 6
        guidExtensionCode         {23e49ed0-1178-4f31-ae52-d2fb8a8d3b48}
        bNumControls           10
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0xff
        bmControls( 1)       0x03
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 8
        guidExtensionCode         {69678ee4-410f-40db-a850-7420d7d8240e}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          1
        bControlSize            2
        bmControls( 0)       0x3b
        bmControls( 1)       0x03
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 9
        guidExtensionCode         {1f5d4ca9-de11-4487-840d-50933c8ec8d1}
        bNumControls           17
        bNrInPins               1
        baSourceID( 0)          1
        bControlSize            3
        bmControls( 0)       0xf3
        bmControls( 1)       0xff
        bmControls( 2)       0x23
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                10
        guidExtensionCode         {49e40215-f434-47fe-b158-0e885023e51b}
        bNumControls            7
        bNrInPins               1
        baSourceID( 0)          1
        bControlSize            2
        bmControls( 0)       0xaa
        bmControls( 1)       0x07
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                11
        guidExtensionCode         {ffe52d21-8030-4e2c-82d9-f587d00540bd}
        bNumControls            2
        bNrInPins               1
        baSourceID( 0)          1
        bControlSize            2
        bmControls( 0)       0x00
        bmControls( 1)       0x41
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                12
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff003b}
        bNumControls           11
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x07
        bmControls( 1)       0x7f
        iExtension              0
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x0751
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     4
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors               19
        guidFormat
{32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                            90
        dwMinBitRate                  1152000
        dwMaxBitRate                  6912000
        dwMaxVideoFrameBufferSize       28800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                  4608000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            432
        wHeight                           240
        dwMinBitRate                  8294400
        dwMaxBitRate                 49766400
        dwMaxVideoFrameBufferSize      207360
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                 28672000
        dwMaxBitRate                172032000
        dwMaxVideoFrameBufferSize      716800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                184320000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         416666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            416666
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           1333333
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            50
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            864
        wHeight                           480
        dwMinBitRate                 33177600
        dwMaxBitRate                159252480
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         416666
        bFrameIntervalType                  6
        dwFrameInterval( 0)            416666
        dwFrameInterval( 1)            500000
        dwFrameInterval( 2)            666666
        dwFrameInterval( 3)           1000000
        dwFrameInterval( 4)           1333333
        dwFrameInterval( 5)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 55296000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  4
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           1333333
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            42
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                141557760
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         666666
        bFrameIntervalType                  4
        dwFrameInterval( 0)            666666
        dwFrameInterval( 1)           1000000
        dwFrameInterval( 2)           1333333
        dwFrameInterval( 3)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            38
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval        1000000
        bFrameIntervalType                  3
        dwFrameInterval( 0)           1000000
        dwFrameInterval( 1)           1333333
        dwFrameInterval( 2)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                114688000
        dwMaxBitRate                172032000
        dwMaxVideoFrameBufferSize     2867200
        dwDefaultFrameInterval        1333333
        bFrameIntervalType                  2
        dwFrameInterval( 0)           1333333
        dwFrameInterval( 1)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                165888000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        18
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1296
        dwMinBitRate                238878720
        dwMaxBitRate                238878720
        dwMaxVideoFrameBufferSize     5971968
        dwDefaultFrameInterval        4999998
        bFrameIntervalType                  1
        dwFrameInterval( 0)           4999998
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        19
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1536
        dwMinBitRate                283115520
        dwMaxBitRate                283115520
        dwMaxVideoFrameBufferSize     7077888
        dwDefaultFrameInterval        4999998
        bFrameIntervalType                  1
        dwFrameInterval( 0)           4999998
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors               17
        bFlags                              1
          Fixed-size samples: Yes
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
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                            90
        dwMinBitRate                  1152000
        dwMaxBitRate                  6912000
        dwMaxVideoFrameBufferSize       28800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  1536000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                  4608000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            352
        wHeight                           288
        dwMinBitRate                  8110080
        dwMaxBitRate                 48660480
        dwMaxVideoFrameBufferSize      202752
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            432
        wHeight                           240
        dwMinBitRate                  8294400
        dwMaxBitRate                 49766400
        dwMaxVideoFrameBufferSize      207360
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           448
        dwMinBitRate                 28672000
        dwMaxBitRate                172032000
        dwMaxVideoFrameBufferSize      716800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 38400000
        dwMaxBitRate                230400000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        12
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            864
        wHeight                           480
        dwMinBitRate                 33177600
        dwMaxBitRate                199065600
        dwMaxVideoFrameBufferSize      829440
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        13
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           720
        dwMinBitRate                 55296000
        dwMaxBitRate                331776000
        dwMaxVideoFrameBufferSize     1382400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        14
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 47185920
        dwMaxBitRate                283115520
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        15
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         166666
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        16
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                114688000
        dwMaxBitRate                688128000
        dwMaxVideoFrameBufferSize     2867200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        17
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
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
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0180  1x 384 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0280  1x 640 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03b0  1x 944 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0a80  2x 640 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       8
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       9
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0be0  2x 992 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      10
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1380  3x 896 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      11
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x13fc  3x 1020 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0
      iFunction               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        iFeature                0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                255 frames
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
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0044  1x 68 bytes
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
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                255 frames
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
        tSamFreq[ 0]        24000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0064  1x 100 bytes
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
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                255 frames
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
        tSamFreq[ 0]        32000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0084  1x 132 bytes
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
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)


On Tue, Aug 4, 2026 at 2:38=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Yunke
>
> On Mon, 3 Aug 2026 at 08:58, Yunke Cao <yunkec@google.com> wrote:
> >
> > Logitech C925e SOF does not increases at a stable rate of 1kHz.
> > Add a quirk for this camera to make hwtimestamp usable.
> >
> > Before applying the quirk:
> > ```
> > seq:     31 ts: 1075.543294 delta: 29.423 ms fps: 34.94
> > seq:     32 ts: 1075.573022 delta: 29.728 ms fps: 34.90
> > seq:     33 ts: 1075.602353 delta: 29.331 ms fps: 34.87
> > seq:     34 ts: 1075.632031 delta: 29.678 ms fps: 34.84
> > seq:     35 ts: 1076.177759 delta: 545.728 ms fps: 23.00
> > seq:     36 ts: 1076.213255 delta: 35.496 ms fps: 23.12
> > seq:     37 ts: 1076.209371 delta: -3.884 ms fps: 23.82
> > seq:     38 ts: 1076.232233 delta: 22.862 ms fps: 24.11
> > seq:     39 ts: 1076.264682 delta: 32.449 ms fps: 24.24
> > seq:     40 ts: 1076.287318 delta: 22.636 ms fps: 24.52
> > seq:     41 ts: 1076.285949 delta: -1.369 ms fps: 25.16
> > seq:     42 ts: 1076.317714 delta: 31.765 ms fps: 25.28
> > seq:     43 ts: 1076.317085 delta: -0.629 ms fps: 25.89
> > seq:     44 ts: 1076.339919 delta: 22.834 ms fps: 26.13
> > seq:     45 ts: 1076.212836 delta: -127.083 ms fps: 28.91
> > seq:     46 ts: 1076.242494 delta: 29.658 ms fps: 29.00
> > seq:     47 ts: 1076.271852 delta: 29.358 ms fps: 29.09
> > seq:     48 ts: 1076.301739 delta: 29.887 ms fps: 29.17
> > seq:     49 ts: 1076.330887 delta: 29.148 ms fps: 29.26
> > seq:     50 ts: 1076.360639 delta: 29.752 ms fps: 29.33
> > seq:     51 ts: 1076.390095 delta: 29.456 ms fps: 29.41
> > ```
> >
> > After applying the quirk:
> > ```
> > seq:     31 ts: 203.782342 delta: 33.460 ms fps: 30.94
> > seq:     32 ts: 203.815492 delta: 33.150 ms fps: 30.91
> > seq:     33 ts: 203.849017 delta: 33.525 ms fps: 30.88
> > seq:     34 ts: 203.882190 delta: 33.173 ms fps: 30.86
> > seq:     35 ts: 203.915672 delta: 33.482 ms fps: 30.83
> > seq:     36 ts: 203.948902 delta: 33.230 ms fps: 30.81
> > seq:     37 ts: 203.982335 delta: 33.433 ms fps: 30.78
> > seq:     38 ts: 204.015475 delta: 33.140 ms fps: 30.76
> > seq:     39 ts: 204.048992 delta: 33.517 ms fps: 30.74
> > seq:     40 ts: 204.082208 delta: 33.216 ms fps: 30.72
> > seq:     41 ts: 204.115675 delta: 33.467 ms fps: 30.70
> > seq:     42 ts: 204.148995 delta: 33.320 ms fps: 30.69
> > seq:     43 ts: 204.182354 delta: 33.359 ms fps: 30.67
> > seq:     44 ts: 204.215605 delta: 33.251 ms fps: 30.66
> > seq:     45 ts: 204.249004 delta: 33.399 ms fps: 30.64
> > seq:     46 ts: 204.282259 delta: 33.255 ms fps: 30.63
> > seq:     47 ts: 204.315686 delta: 33.427 ms fps: 30.61
> > seq:     48 ts: 204.348945 delta: 33.259 ms fps: 30.60
> > seq:     49 ts: 204.382337 delta: 33.392 ms fps: 30.59
> > seq:     50 ts: 204.415570 delta: 33.233 ms fps: 30.58
> > seq:     51 ts: 204.449069 delta: 33.499 ms fps: 30.56
> > seq:     52 ts: 204.482218 delta: 33.149 ms fps: 30.55
> > seq:     53 ts: 204.515706 delta: 33.488 ms fps: 30.54
> > seq:     54 ts: 204.548940 delta: 33.234 ms fps: 30.53
> > seq:     55 ts: 204.582403 delta: 33.463 ms fps: 30.52
> > seq:     56 ts: 204.615563 delta: 33.160 ms fps: 30.51
> > seq:     57 ts: 204.649057 delta: 33.494 ms fps: 30.50
> > seq:     58 ts: 204.682301 delta: 33.244 ms fps: 30.49
> > seq:     59 ts: 204.715735 delta: 33.434 ms fps: 30.48
> > seq:     60 ts: 204.748890 delta: 33.155 ms fps: 30.48
> > ```
> >
> > lsusb -v
>
> Could you provide the full lsusb output if you still have access to the d=
evice?
>
> Thanks
> >
> > Bus 003 Device 005: ID 046d:085b
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType          1
> >   bcdUSB               2.00
> >   bDeviceClass            239
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1
> >   bMaxPacketSize0        64
> >   idVendor           0x046d
> >   idProduct          0x085b
> >   bcdDevice            0.16
> >   iManufacturer           0
> >   iProduct                2 Logitech Webcam C925e
> >   iSerial                 1 2F2036AF
> >   bNumConfigurations      1
> >
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index e289cc71ba98..5b9ea19ad9f2 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2706,6 +2706,15 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DE=
VICE_SOF) },
> > +       /* Logitech HD Pro Webcam C925e */
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x046d,
> > +         .idProduct            =3D 0x085b,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D 0,
> > +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DE=
VICE_SOF) },
> >         /* Logitech Rally Bar Huddle */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > --
> > 2.55.0.508.g3f0d502094-goog
> >
>
>
> --
> Ricardo Ribalda

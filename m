Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034596;
	b=Si1SVFHYPLjClH5ymK7TqGJstHDwhqks4VEQ8s2FPmt1p8zZfTHDcL9AfDHT5ZDQhw2P
	 T6Jt2esuM7jKHdL7nlxgMD1pYKhFRJGcmQWPBKbacJ7jd0W3bavRD1QW7lUkA/1IPL0Pi
	 rGjWx7DADdtUxfdyKrPNkNlImwmwZ1WNtkApjOWZnI4qf0nzjcqFIHPZvJ1MoHDwxvcWM
	 RsamO9nt4/C/Jn+kItOnc98bBFT2Qlz+zmEXIAk7qOBh/2d6qy2t1SoZH2gqEEy3WsUhz
	 FhEzE063btgbpw8w1NCOxWdWXCaMCOC3lcrFVQvC6rA8HKyiF2xEby/r/3MyXUceD8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RwtjDMSebZjhhRGPxiipQETOoNpPtrYNz1raFVJpXDA=;
	b=LuwMoeIgI9Ben9NaAaQjON3JyzyrcnFsA08rkWgqc8zo5rPM9LsNzeCslNyUZRQQtgiZ
	 I+okVrrA8zmy3ukjhDEWyISOlAVz7TsgNFB6wowjCFl7O3RY36pKrT2qcKBS9Jqk7NdHj
	 F9wrBXt1LKlFmqSwB4bmFAM//UilfrGF4Fz/0Wlu8rTHSRotQZBdICCHHWdv4xl92vJvn
	 JvRLKQtcgNwOYlMV91OXduDmT8h6mTsbK4GvE6N8vMU5GE4NcByXPjcswp9FxfDlLESNZ
	 5fex4A2ZRpeWsGP47Y12gHrPoTEiJa1kAdA06EWVdAmqDLPkAM70VCrtMWDU91bbjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REs0tDWc;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DD606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D4DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=REs0tDWc
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8451a619da7so829007a34.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034595; x=1795639395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwtjDMSebZjhhRGPxiipQETOoNpPtrYNz1raFVJpXDA=;
        b=REs0tDWcfq3cqjhf+YdyNVH0Z8XjjJq30rA+8cEsEFILi1EipqxZYvnq3kxNv64oYy
         g7IzQDDhurZBowfcEvAweLflRVVnB9xpTTRjjqd76TNU+w/9ULXIEkg/v3lf+Y4bv9Xo
         foCW+mvd08di93RSLx/nl6wNi6ZOq020OUSp3ZwT7gUIpG/zEpDcVZis6b7TqsOc+BVN
         dulFPaWpH8p5UZpP2K0Nnkq/cUYijk5hvzVzKgUEhoUPKcVOdXKa08TBKr93a0eSc50H
         7BfNGSwvsHq+WzodvECPPZ/SdJdH2R/AkJcS3iDA29XrJerZ+l6exlv+PbTkGjmKdxTR
         m0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034595; x=1795639395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwtjDMSebZjhhRGPxiipQETOoNpPtrYNz1raFVJpXDA=;
        b=StYvLwy4VHKbWvb3Qfzv0ppUUAKY/aU+0lflz8cdb8RMQo0KVr9xOdNgWHgb/tvq35
         N9p16s81v6tooUo0Eu+32fIcHD/5lFiHAJOV0JcZRgHo9LWzUIxGsnH58wB9lsouTkE5
         Ed1Nzjr626uKOebbZ4Nj9wxfZeTLgjbGoC98vmomlSGobp6yb+KNcS3wRGr9Be6urXSe
         HY6qvNgU0/XK54fxzQ2WiPq8qMGY7fYY911FfKWxGlfxPc4STZJhBePL+txPQMsjKEI4
         5NGXeC/vWxzwoKhZ2DxmawFjaRvVsbY0ZmlJyy4H/94vBH4l1AIzqIgDICw14/MvH4W5
         o69g==
X-Forwarded-Encrypted: i=1; AL+hErGV2nnW4btbI2XMsoX+1Unn+Bs9fP1A20tX+tsBE6/I5P38mlVbJFZV5TdN13sUp+pg4fESfDFFHBsocA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lEXuvxhEwbyO+clTvXHoB7rhgI/xUi9n4JNUhV4hTmui2E2zS
	7mzEAMkNVsv8wJaZ/XuqLvIYpOFbA9JAkx6i+oyQW6acQJt/msxOBqc=
X-Gm-Gg: AYBFou2F2w3hgMOEB4FcL6fSe5DUWnAZnCXRvhJeWMfwQPrrJ2kgP+CiaNUoDnSnx30
	83EcVua7EdMa7/jf/hlGj/ijXaaCKUNLeRborjL9JVoI/lnwqT+2ZWwemc/W5159vgWpoWX94GZ
	XUPplpbs6+o//IcD+ftVJmIxXaa71QN0/4UJevXRk9JRxBJQSdtbSlPANHtUMLl+ey6SGK5U+qW
	ziKjRXK/DpAs9q4qwqw0fHfxng5kZZa9Iur+bEk7tSBaRtMPoH+USHz4F7PrlANpnK3T0ZssSwh
	8R53cUmC++Lu5TclbVQjqUXgknX3NT0AHi6Om8TQ1dlOQhIr2e3DOrXH1XdTrMBvmnfE94mWDft
	MyYu8IrxHJaAsR8g+3qiH8CwyTSbDjwEIR8DFxFhWVXRJDD3YpuxO2CG10PvVZ1aSGUyZOHyoSV
	xx280XlKPGUdoBXMClH/lyyl2uraGgkPRbKZPtpklTUBbnPxHu4Y4DA1lmtRiYXKffMh1uExIbS
	P7y/choKmQOZG3Z8B1G0EKJ49bVbNIheM/I/fY6Q+OIQ3M0EJzZDwsM7ZgpFpCTdBigqBOairZk
	CklVUeuy7YIfeAOvPaDXK6tnWtm87netgqVHeg9J/zUmnzOQZt/AxsQT
X-Received: by 2002:a05:6830:2b06:b0:81f:da91:c984 with SMTP id 46e09a7af769-862f096051fmr4055189a34.11.1795034595253;
        Wed, 18 Nov 2026 12:43:15 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:14 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 0/8] Add driver for StarTech USB3HDCAP capture device
Date: Wed, 18 Nov 2026 14:42:57 -0600
Message-ID: <20261118204305.28268-1-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a V4L2/ALSA driver for the StarTech USB3HDCAP (and Micomsoft
XCAPTURE-1 variant), a USB 3.0 video capture device based on the
MST3367 HDMI receiver, TW9900 composite decoder, and CS53L21 audio codec.

The driver supports composite, S-Video, component, and HDMI inputs,
including audio capture.

Tested on all four inputs at various resolutions. All v4l2-compliance
tests pass, including streaming tests, with these two v4l2-compliance bugs
patched:

https://lore.kernel.org/linux-media/20261116214655.6979-1-matthew.laux@gmail.com/T/#u
https://lore.kernel.org/linux-media/20261116214755.7040-1-matthew.laux@gmail.com/T/#u

The first 6 patches are changes to the existing upstream tw9900 driver to
prepare for my driver. The 7th is a driver for the MST3367 chip. The 8th
is the bridge device driver and "everything else".

I tried to use patterns from existing drivers wherever possible and
welcome all feedback. This is my own work. I accepted two small PRs to my
out-of-tree in-development version on GitHub that were LLM-assisted, for
a total of 4 lines. I am committed to sticking around to make any
improvements required.

Thanks,
Matthew

Changelog:

v6: fix 2 possible usages of uninitialized variables (one could not
    happen, one could)

v5: refactor to use subdevices, so it's no longer targeting staging.
    support HDMI on the XCAPTURE-1
    detect HDMI timings from the chip instead of using a fixed table
    fix (valid) Sashiko automated review feedback
    fix composite/S-Video audio on the XCAPTURE-1

v4: add USB to Kconfig "depends on"... oops. fixes randconfig

v3: fix truncation warnings in (u8) casts >= 0x80, static-ify mode table

v2: remove unused CSC matrix control, remove version.h include,
    fix all remaining `check`-level checkpatch issues, update TODO

v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: 485c038f10ae 2026-10-30 13:45:36

Compliance test for usb3hdcap device /dev/video0:

Driver Info:
	Driver name      : usb3hdcap
	Card type        : StarTech USB3HDCAP
	Bus info         : usb-0000:00:14.0-2
	Driver version   : 7.0.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 4 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 1):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 1):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 1):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 2):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 2):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 2):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 3):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 3):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 3):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 1:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 2:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 3:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for usb3hdcap device /dev/video0: 167, Succeeded: 167, Failed: 0,
Warnings: 0

Matthew Laux (8):
  media: tw9900: Disable regulator on runtime resume failure
  media: tw9900: accept the TW9910 chip ID
  media: tw9900: add saturation, hue and sharpness controls
  media: tw9900: use runtime PM autosuspend and power down on suspend
  media: tw9900: allow board-specific register tables via platform data
  media: tw9900: add S-Video input and progressive source detection
  media: Add subdevice driver for the Mstar MST3367 HDMI receiver
  media: add driver for StarTech USB3HDCAP

 MAINTAINERS                                   |   14 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mst3367.c                   | 1085 ++++++++++++++++
 drivers/media/i2c/tw9900.c                    |  256 +++-
 drivers/media/usb/Kconfig                     |    1 +
 drivers/media/usb/Makefile                    |    1 +
 drivers/media/usb/usb3hdcap/Kconfig           |   15 +
 drivers/media/usb/usb3hdcap/Makefile          |    8 +
 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
 .../media/usb/usb3hdcap/usb3hdcap-composite.c |  209 ++++
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1108 +++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  202 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  525 ++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  239 ++++
 include/media/i2c/mst3367.h                   |   27 +
 include/media/i2c/tw9900.h                    |   38 +
 17 files changed, 4031 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/i2c/mst3367.c
 create mode 100644 drivers/media/usb/usb3hdcap/Kconfig
 create mode 100644 drivers/media/usb/usb3hdcap/Makefile
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap.h
 create mode 100644 include/media/i2c/mst3367.h
 create mode 100644 include/media/i2c/tw9900.h


base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3


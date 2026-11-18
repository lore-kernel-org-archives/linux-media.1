Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029715;
	b=h4le7ERbhkvXI9Ne/ZpQ54HQx7f0Y0b1evCjsAHkPj9QyV2SHXRv8iSbkJ8zhokTXfpN
	 q6xiU42YggsODPNQ7uRTHQupHV2OkrZVqfgfldpAgafuEyx6WUk4fw7j9JKtCDk5xNvDe
	 8U+eNu1r7842HmGYGE2FMlRzgwQqWM7xYtFyuOn2AN6l3/huI6oQQBnNWOcE6UtivXAO9
	 QjR34CltyW6j/2MVIHunLPpsWQq9EEMcVHLt5+PnFKFM2SdkknNCe9KzG5C/jWJRAjlCX
	 +G042QN2fzAdy+trE0HSAZPl/F/gjHqxYW6W1aJztAlbyJObMYuW5suS2qSccjRO4rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
	b=EFZs1+Bw1hoKmtWv6AZ5Wn7pzQ+77LZJjy9H+dNmHFvumNJ2jRZ2TaY3TNJx2vMZbepz
	 8hSj+dr6TTwHpwtq1U0JRGB5jr0Sdp4Dqj3SZ9JSbmmvLenpQktZRSoNLqAXu9B5sFK/G
	 zx8ywGNPhgz/tr77Kgks5DfHyS+PHmK7MZMRN5pWCdzQiR+kiKZFTZIB9tApfVRdBidWZ
	 g5o2e8s6hZlByw2VwH055qLffLB+HfZhKkPow0lreIJkmPn2NHxwgYkLbnR7FqfeGnTCN
	 39wZfriaEn1he/uJuXp3vmxnZTwldg0w5dJE9Dz395tj6GsJFA0PLk4x3ooiozec8/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XhG0kODF;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A9606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91A9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XhG0kODF
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702dedeb70dso897263eaf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029714; x=1795634514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
        b=XhG0kODFgIge3YT+uZxRbeQzqh5GLCJcI/501iQVfQWj40icyssFW7nIYWTsFSffS2
         JuIFYivkc8vYpm8+IZbNOwGc8HCLG7Dk97i+8wbREkqj0NINQi1x4ATn/BFbFlKFqtUR
         xyDZsleZqBOGl1dpG45l+Qh0OeXEv09/xsiikHAk7Pp/WAyHRkalGzTPy4cV7wQIW5nM
         /zfh6MZeSeJFGyvRhybjl9wD4VSbpIitxu2IpG2VNy6RVLzJvaXyScI0as82LV5uP/cZ
         O+pYgFvL5fzZwnLlvXIFXdvqVn0GF8qEec7udxXO3h2f3D19RVarzgqynbGxSvQzJ46u
         hkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029714; x=1795634514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
        b=WqUM8eBPKPo86juyyvq3i0daXUtBUK6ZTWwDaYjzmGzfgrRhwUo1FxJZllKErexAvS
         kHGJI5WQhC9CABUVyraaQEAw2WTDW0VrkkDh4+UFWGMNITHzxqlp9vUz+gPGBXTmSZRO
         ++PnS0BHNTLZuM4qDGCAoWQn8QRyLddvxVvJjvplkZcUuWo5dMyuigP6GNFW7VFZ0Zzq
         VaVCnI9kKvivdHxMgGR9aikdDipLTAjq+z+wfI68PMUyvOG2MOmcqNKx5QRX7dlvcfwy
         5hnTV99ny8tw4LNpPXDb93u4nUnrAYfmCietgFMjJe2JFzDkyGNx1QAaI5zGKRTQ5Sep
         YHJg==
X-Forwarded-Encrypted: i=1; AL+hErGLlnT41OEqaGj6T5fcyNnkGaEtpU6Z65xGvjA2rrJN0NjhrNXCT9DLYJdEW8JKRN/XQzmqhiv+6n8TNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9no7aFEB1wg7GLK/J+CmKPbBsb73jPXbyALH7SUbJZ8rEvaJDA
	D8e4h4gcWngegvBrgbb/ZMhg1EwiiSntShEkGcZTUFUDRScNSTOdgbI=
X-Gm-Gg: AYBFou2r9euqZkuqhu+g5BuGrVZBEyyqSTUYobdSRosetiy7nvh29istlF6t+Vwhz3o
	kxFmVnDOocW+orw7kaS3c/f3hl4CtZpt6JQQ88xQMBVqASRW0Syj9UabJOeTDC4lbXF2c0JI9+U
	UPuygjiasfH108ENll3pCOm67vxFcT2qUgY7FYpHBHSLxJAE8SAzqpT7gyIfRJQAuf9/L8r3PEd
	dKqy4qyalmPySZHQNuMRr+S0gqUiN5xLlAxU8WaJe94Ryknwr5ETC5CEYy0Z9was5j7Nvwh8Iwx
	R9FU9bhhMSGA8H4bQSyRkknal+N35K5PzNgbYPqjnIFhHXl1shNccoRmvKaOKA99Z4VrIPWYAb+
	OEC5NiOFOpiChsLqozk70tIBNlepU8toUT9B1oouyTAS3e5FbZnBKnFBVgf2zKaOyvmi9siurUl
	Ac014tFZRP+CPcBXhqpzbiNb6dbddoTxyiPv0SMFzp9a77fHolmFb9WWJnDNm5oz5r0M2HEftVW
	yMKiVKchO0nIN+hfryk0SeKE/9/SKCd7pahckBduVV+uxmWhr61nYI6BVx+rfKQc2lVOf7EMOKh
	Sqd7odUjpGzW8qH+dBfX08G7LZh34Ib9hwhb6EpdjoycUlQwQ1MvulAn
X-Received: by 2002:a05:6820:c5d4:10b0:71a:fb85:d063 with SMTP id 006d021491bc7-71b18618ca9mr2045803eaf.80.1795029713272;
        Wed, 18 Nov 2026 11:21:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:21:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 0/8] Add driver for StarTech USB3HDCAP capture device
Date: Wed, 18 Nov 2026 13:21:16 -0600
Message-ID: <20261118192124.23330-1-matthew.laux@gmail.com>
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
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1107 +++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  202 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  525 ++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  239 ++++
 include/media/i2c/mst3367.h                   |   27 +
 include/media/i2c/tw9900.h                    |   38 +
 17 files changed, 4030 insertions(+), 32 deletions(-)
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


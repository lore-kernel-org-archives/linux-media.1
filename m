Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233344;
	b=OCj9HNkmmgW0CI6TFQvNaamYDjBekMSXKGuJrW8XWW4HKwFulCyX+Tu0Wr26zm7Iw8oe
	 nqpK79ckpuLgr9Q2HVrSX/v4VHNwKYnY6Gw5zQydhy/cb4Mc7atOvLeHSgLyKQ7ERz9FZ
	 5aBT6207uOMNf1pfkvWnViSik69IKsO52nu+7cHLHTEo/g6uwjhziaiQcpQOlQ1eSknyQ
	 a9bom/7673dmt5IOJ/QrcIieqI4jvUvWZbDZ5js53S4DXV+6XsqnHAF7AEkyHLOIW9uyJ
	 wrKHNao1ds+T2NA5YNyFx/IEryFlu6GCOo4rEOzIhtemT6q0BBoIVSeus3PGd6+jQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jn4kf5W7lzfWnr06Y2ZW00xRkwmTnr7Hlmhw1WVwvLU=;
	b=db4E64CMtTNbr98rvS3m76wYh5uQOHMmjmA7BPSbV9hPWEgbkrkUxuxV0mu8RySzcbX0
	 mN+vqxlsrGXBfyUD70IuMk9SEW3SgOovko0FXFYCU8jTvDDI0NVRjmnu6G6fx2zFqH9PO
	 lzvKvsNKbRmMVuJ5lA4svZsmGYwKERayNfmfqWzBuEYPyaZw8lh9n9mg/fNVciXc9ZBm+
	 sfe/zei0vrzBLEYLfYMn2W+KOTPadtTRFRnnnfrLZiv0R1COF+P4cId5lXtj4pLzIaMBJ
	 1IQ3uJhcQkFPQ1li8A7JU2t//o5CnKYIIvxsZS+x2RvgCVzby9EWAoivGvRdzIf52cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2YPSEfF;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E340606A6BD
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E340606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2YPSEfF
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70059e4dab6so947503eaf.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233339; x=1795838139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn4kf5W7lzfWnr06Y2ZW00xRkwmTnr7Hlmhw1WVwvLU=;
        b=X2YPSEfFi5vaFVVRhwllZw0ddenYAWIvuJqKnKm7TvaGho1dkz+gbX8ueys17lDn3W
         ENI3qJpxBNwEJ0Bfm1LImglO+giY8zAsEYBLB6OUq1OXX6NQmBI72dTBT2yXItigtGJ+
         Ez1rGiC5byy55wu4tobGb5aOSaaDFmSxAF+1I4OsSvHOdWBpAWsHpT9t+1uO6U/EdFXA
         A3QcCRK2OHinatM4lwoJSfsvp9zlmoEasd7/J8T29DjJRESHn+IA1/g2CFuACy77C5pZ
         Eyf3m6o8RxjHgtfVa9szcn1gvR1NQd1duC7Ao9EtA6AzIE/aJKShS2DW1AF766MbBCQG
         8mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233339; x=1795838139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn4kf5W7lzfWnr06Y2ZW00xRkwmTnr7Hlmhw1WVwvLU=;
        b=Mvj54BKkGVRgyf6kCtLNhImO4/d5GfIgXQuX4aPpdlBVkxVKEQeKYoIXy0OZW4WCtL
         2EoUZxnnipS+fbGaxGYUaRPJOEAFO67gumyS0XvGvCAJpthnMc+XgC9Yp0oFhlP8FzPV
         uqpHTbRe0+6h5bShPECSaSXqD7UV5OV4UptKSwWImrw+spDVGWvJQKGYijynpTBUUrJ7
         2Yl5RYcZcSSpTeWf/ynY0XFV0FZtBFxxmOaHJYYmvG+Jz2KfsV8QHNe34c9sJkRdVEzB
         jzebynYARkyFXIMz18YMR5i0sJ+MxbFVHP1yDvobsT00aIG2PZukrIDcyinrxigCrvGd
         ReQA==
X-Forwarded-Encrypted: i=1; AL+hErE0Z4jZ1PwT47oCqR2ziqvQbwrkWhU9MkMtL+SahoYOjFoDkFHXbeaqdj6Q90lv7ahF6Ow8ZDnxe9oJTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5HZdo4hVJuY5ZJpMqgjT3WLWqeVyJLgE+Tlu/gEMEmZ70C8kv
	tWuzry8vORKeoiYTG9Y2HDhVMieOObxWYVRWU3EyMiSZs96lN8ODXHo=
X-Gm-Gg: AYBFou2bmxj/YXDb2/h0SB8/DhNSBAVEpG8KOxYkE23sMe+ZZYhZnNGrjuhC+15cSK+
	D6jqZfstKr93ln71ss7hEy51HUt3GX7m8qwP9MMVLdcQs9XIl9s9SJwxZqK0B7LlL00KIe7wIYz
	BP/LSYED4Csf1yvorcAavy0LFEGHI8ifOEUQQJ3d8nId+0zIspyJhvIyEXxqLWeqWb4PMSXVqzx
	uJE3725sTTyP0Qsvp0aUSH7KWDJPkNJa9RPQajOAdZMyIrSQaIf0Hj9Yrm9/A/C4ftpCgVoShKj
	mgt57dMtNzOuChjWEvP4aEsG/C0swMhGNj3DjRiLoOLpD59ctdbu3dMyg52Pyct6+K+2GVu33HW
	pmDCKOXh8zfmAmBX2FUdY4Bn3LRzk4MWMcS9OLEhFuxnhewBkW+K0fXuVkuoEUdGKppB/TxwfZZ
	+rITn75jwTyRJ5a+S5iKioU6B3VRFwncIKJN230HG9ALJh6bYu67OyDOqDb7wZGGOGeo4t5uRtM
	W825+d9is3v126ydOsZ61Emiz365Q6x2FRa+MjslTEmq0IBtzaVzkKL/rS356Q6+a1V0dz6pVof
	sozncla5AocIgsMDeeiE/Owag1xLnu/cdBWR8qbDC35kz07quwOEe/PQ
X-Received: by 2002:a05:6820:5616:b0:716:cfaa:133a with SMTP id 006d021491bc7-71b3962b41bmr3118869eaf.89.1795233339171;
        Fri, 20 Nov 2026 19:55:39 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:37 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 00/12] Add driver for StarTech USB3HDCAP capture device
Date: Fri, 20 Nov 2026 21:55:11 -0600
Message-ID: <20261121035523.26764-1-matthew.laux@gmail.com>
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

The first 10 patches are changes to the existing upstream tw9900 driver to
prepare for my driver. The 11th is a driver for the MST3367 chip. The 12th
is the bridge device driver and "everything else".

I tried to use patterns from existing drivers wherever possible and
welcome all feedback. This is my own work. I accepted two small PRs to my
out-of-tree in-development version on GitHub that were LLM-assisted. I
also used LLM help to split the tw9900 fixes into logical commits, and for
help understanding/fixing Sashiko feedback. I am committed to sticking
around to make any improvements required.

Thanks,
Matthew

Changelog:

v7: rework ioctls to follow the API better:
      - S_STD/S_DV_TIMINGS now apply immediately and update the format
      - add QUERYSTD
      - QUERY_DV_TIMINGS now gets the timings from the chip
    detection now only happens in S_INPUT (or first open)
    starting streaming no longer can change the required buffer size
    size the parse buffer from the iso packet size
    use V4L2's AVI InfoFrame parsing instead of my own
    report the field height in get_fmt for interlaced timings
    accept vtotal alternating by one line when detecting interlaced
    split "use runtime PM autosuspend and power down on suspend"
    2 new tw9900 runtime PM fixes

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

Matthew Laux (12):
  media: tw9900: Disable regulator on runtime resume failure
  media: tw9900: release the device when stopping the stream fails
  media: tw9900: accept the TW9910 chip ID
  media: tw9900: add saturation, hue and sharpness controls
  media: tw9900: program all mode registers in the PAL table
  media: tw9900: power off the device on remove if still active
  media: tw9900: power down analog blocks in runtime suspend
  media: tw9900: use runtime PM autosuspend
  media: tw9900: allow board-specific register tables via platform data
  media: tw9900: add S-Video input and progressive source detection
  media: Add subdevice driver for the Mstar MST3367 HDMI receiver
  media: add driver for StarTech USB3HDCAP

 MAINTAINERS                                   |   14 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mst3367.c                   | 1134 ++++++++++++++++
 drivers/media/i2c/tw9900.c                    |  271 +++-
 drivers/media/usb/Kconfig                     |    1 +
 drivers/media/usb/Makefile                    |    1 +
 drivers/media/usb/usb3hdcap/Kconfig           |   15 +
 drivers/media/usb/usb3hdcap/Makefile          |    8 +
 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
 .../media/usb/usb3hdcap/usb3hdcap-composite.c |  212 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1173 +++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  200 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  499 +++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  241 ++++
 include/media/i2c/mst3367.h                   |   27 +
 include/media/i2c/tw9900.h                    |   38 +
 17 files changed, 4135 insertions(+), 34 deletions(-)
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


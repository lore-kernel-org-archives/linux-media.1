Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636248;
	b=AujDBQyjxPp1hleq8hHHnnJir+vOlTZIOwuFMCfteaNzlGdc6YsNSz0YUpigVuQP7eYX
	 koTDwaQEkEbEHzLBIHc2tRYtm2TAvD6e8WnjLBULR1cmSOu8StJt0qAFN61Cwxlg0e6Pi
	 N2RsFxeQq+QYzCDBDtNFTJpF1eQjfI34SKJedYU7MYPsx30ZUxAXMLLf/3gYu03p3XkBJ
	 o6JMWNImaQLBZGY++fKA6kPtzBvVpwDDfnDidwpeaQsG7mq3rgVm7GaINoM493128WI4/
	 0C8Xmi7/vaKtAMBi4iXqc8uiP2ISPJDHfL2x9fBB0HrEcGBG48VWxTD/44ztb3C+AdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SPK0PyrT238oR6vC8j0bcRYBbN1hwHybEJspLfxQp6Y=;
	b=K5E/UtjjkgDSOb2gndwYAI1RwxuIULRXYQK6vfjX+Ui4QyE18WwCMmkzwv9HH7wTcGOm
	 xX8bw4FjJCB7p1dHSHPUomLWvfM4eip0Nc5tzAui7G/bZ5bb3SyOJiL0vhi1Hm122T2/K
	 X9tm631SkhIRgEz34xtK/t2EouRSAa2Tmr8ui5KBewZgb158mWt7eqf5PdzRfYpVmSRfn
	 +cBs3N+ypCVqykkmp9ImV2lTenb5jjVsId9dJs/LJ19wmwkdwAWs2+Y4Ke9j80fcPoMfY
	 49M4ULsRCOYWJM93grSuXxNhfgFWmHp8Q6sy6b6oIRfwhf/klARIpxb5A+gaBkcZWlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYfDZzQh;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68DB606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYfDZzQh
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-571eb508edaso2705700b6e.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636247; x=1796241047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPK0PyrT238oR6vC8j0bcRYBbN1hwHybEJspLfxQp6Y=;
        b=CYfDZzQhsFL0dXzlPIbWVR/D87/bZOQulSy5ZDVNN8bQ+ynKM/fW6ofu6F1unISm/N
         KG8tBqYCR9lH/48mhlLD+U5V/GORcUC8fVW9KcrF5ky5RvPB15q7szpvaDurHCyATz1x
         jenuHk3aQgTjy+nG88cIPBS7tvHfDX1Vbq4yZi+Gq2wbAuscrsy2p1wmFceLK+lwvLtn
         HLCTUmQRr/6MP4/zJVkq6d+RMLQUbzWd7Wih4eJNunhhL87YUSbpzPNGdlfQ6vUfkO/B
         amLOvNUkYBV/w229zmrpBq3GIx5xvy3aVse360zMKT4LoFYBqTEeIXTRcRZJyEqJmmI5
         sJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636247; x=1796241047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPK0PyrT238oR6vC8j0bcRYBbN1hwHybEJspLfxQp6Y=;
        b=iWOYLSYS6u/lBNvO+AHuZ9PKiZGLXCFOuFCVzbz3T5j4B/QnzeG08pzTRDkMGZJt4B
         KpexzTb+UyhC2auIGMMAnQSCkb970+hUXuiESVLSnnXyC0/C9VG/QAUzT4MSPTye1+aA
         71lzgrUEBhzD7gEdrtknsk8wvTd3hsljpFMYgR2q/h8pQmBKm+4j1/goNcvMpJUt+PPi
         IRPCc/oMXITxtRA7DmrD1mLnuGeCbg2f9zH1O3oJaW/lSLTiukhtBa+48jTuHG9JecD1
         0iYsmozCpN+7pGSGRRI16vtIYnSSRtsJkjNpRhDRMr7uAIPLSSGdzg1G0fnYWVd26PdE
         bbvA==
X-Forwarded-Encrypted: i=1; AL+hErFzVZcxik/qHvxx0U5U4eJIyrU/GLl2ZwC8bPVrTlffAIUptri5u1h2kl6nRTjHv2lOEtiCyjImxqjFsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fS0+tp6lUXGamrdRJ3cOo2mTTw6PN9/3utmehfBTdcQRvUnGs
	NkQaTmzMVpeJv9dur31Q9xywkS/pVWfdx9uPtAdiW3IJ7f8JnkRwRVA=
X-Gm-Gg: AZFdTZeUQchg4nMHgVC1KTkOJnE4xRbQjUzUAXetsi1QaIKqdP1h+H0c9FxeOtyN5z0
	Az/9vlcFxXZccZ4GArr5jbcEYsdH2D1Ja596XQnw8/8/OaBcFBq/RvgWylDujAglsg/dIADak5Y
	EWvdqaZACzT5y2PHP8uGwR0qCuM7FPl76Up/VC0LNWB71xG+gvPzXzEJ4n8+oXDZx7YXlyXLMxd
	lo5vc4gfoOjM4Uw3TawIeufnXybgKH/C9RuW9bqr0t9w/5adSCRqbuBqcZjxipBl92HvvIQQjoV
	gGkkUqrOtXgmnwmJ1sMpFcBopeUii0tZGZHZ+FnhoHKyDWm3QK87mYz7bKuxRvlA7ZwFigtcPt7
	31YagbF1tCMWINW7SuFnAy1djEGV3L9ToaLh+37HxlWNCilMF1OOLgRDJareOdlqRbtly85KyHJ
	tHfEQzxqxaYdy3OkuIFMXcSDr44IlatDCMKX6k6C1ZRkq2KbPfw2bLokKdL8EDNKemRiE7pMmSA
	CTo1dGwSeHTp0T2Y9aHCB6tNSMo7NreboHiRuil8xi2casDf61p2eb6Z7n3F0hLbdYlW0sFAWRD
	WcbXIUWgFgK8WChWgIEclKpV+6TE52Hei2HkdiG2QP2uQZxnJZ0dRQiI
X-Received: by 2002:a05:6808:4fcb:b0:574:524d:f242 with SMTP id 5614622812f47-57a0b34c96fmr20603944b6e.26.1795636246519;
        Wed, 25 Nov 2026 11:50:46 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:45 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 00/12] Add driver for StarTech USB3HDCAP capture device
Date: Wed, 25 Nov 2026 13:49:39 -0600
Message-ID: <20261125194951.19072-1-matthew.laux@gmail.com>
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

Tested on all four inputs at various resolutions. Almost all
v4l2-compliance tests pass, including streaming tests, with these two
v4l2-compliance bugs patched:

https://lore.kernel.org/linux-media/20261116214655.6979-1-matthew.laux@gmail.com/T/#u
https://lore.kernel.org/linux-media/20261116214755.7040-1-matthew.laux@gmail.com/T/#u

The exception is the V4L2_EVENT_SOURCE_CHANGE test, which fails because
I don't support source change events (yet).

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

v8: remove RX power control
    remove no-op source change event subscribe
    add vidioc_expbuf
    support VB2_DMABUF and drop VB2_USERPTR
    allow QUERY_DV_TIMINGS during streaming - hardware allows it
    only autodetect on first open
    expose AVI InfoFrame through debugfs, use hdmi_infoframe_unpack
    use scoped_guard in tw9900 progressive commit
    fix return vales for hdmi_poll_signal/component_poll_signal
      (-ENOLINK/-ENOLCK, Sashiko)
    make vendor_out static (Sashiko)
    fix odd widths causing an out of bounds write (Sashiko)

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

$ edid-decode -I avi
edid-decode InfoFrame (hex):

82 02 0d 65 52 a8 00 10 00 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0x65

AVI InfoFrame
  Version: 2
  Length: 13
  VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
  Y: Color Component Sample Format: YCbCr 4:4:4
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: Rec. ITU-R BT.709
  M: Picture Aspect Ratio: 16:9
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Default
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Limited Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

$ v4l2-compliance -a -s -d /dev/video0
v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: d2e89246cefc 2026-10-30 13:45:36

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
        Standard Controls: 6 Private Controls: 0

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
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Control ioctls (Input 1):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 6 Private Controls: 0

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
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Control ioctls (Input 2):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                warn: v4l2-test-controls.cpp(1162): V4L2_CID_DV_RX_POWER_PRESENT not found for input 2
                fail: v4l2-test-controls.cpp(1175): doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 6 Private Controls: 0

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
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Control ioctls (Input 3):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                warn: v4l2-test-controls.cpp(1162): V4L2_CID_DV_RX_POWER_PRESENT not found for input 3
                fail: v4l2-test-controls.cpp(1175): doioctl(node, VIDIOC_SUBSCRIBE_EVENT, &sub)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 6 Private Controls: 0

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
        test VIDIOC_EXPBUF: OK
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
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
                warn: v4l2-test-buffers.cpp(2227): Cannot test DMABUF, specify --expbuf-device
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
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
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
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
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
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF (no poll): OK (Not Supported)
        test DMABUF (select): OK (Not Supported)

Total for usb3hdcap device /dev/video0: 167, Succeeded: 165, Failed: 2, Warnings: 3

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
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mst3367.c                   | 1207 +++++++++++++++++
 drivers/media/i2c/tw9900.c                    |  271 +++-
 drivers/media/usb/Kconfig                     |    1 +
 drivers/media/usb/Makefile                    |    1 +
 drivers/media/usb/usb3hdcap/Kconfig           |   15 +
 drivers/media/usb/usb3hdcap/Makefile          |    8 +
 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
 .../media/usb/usb3hdcap/usb3hdcap-composite.c |  212 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1148 ++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  200 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  499 +++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  238 ++++
 include/media/i2c/mst3367.h                   |   27 +
 include/media/i2c/tw9900.h                    |   38 +
 17 files changed, 4181 insertions(+), 34 deletions(-)
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


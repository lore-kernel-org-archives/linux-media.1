Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC693B0ADB
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669916; cv=none; b=FZwCm1e4PLIWGYE3rmrx2JM4mruzx6EpP//v6Espm83yS1TXqSM5roE89EQEVGo6h0Eq045tGBWfEIyKNPtSmMH4erlVaH1BIguyKEfIeYX3kkaoLpTjqlfDhRhkge/rNGXa9OW+Egs8tOOf/iVGgkhu1mLhFTK0CbpfJULRx/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669916; c=relaxed/simple;
	bh=OMEeJF72pnpHjS5uxuA8xqW/sbG9TMnD+MinRPUhXs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qGoLKqCG8YKgQ3S3KHoMymTBH7D4WS4vpvbyMLmI/e0YoNLsVp8xe5BU5i2ZtMlmDUJEIUm5LZPhWmi6X81ywEivuNt/+N3+A1/0WTlvOLiDQ6D1p6LVwkPADtvANxukf+NdejlAu0XR0qf9a+y2P0DgWPMxnygwFrpIiSbbq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hlavki.eu; spf=pass smtp.mailfrom=hlavki.eu; dkim=pass (2048-bit key) header.d=hlavki.eu header.i=@hlavki.eu header.b=C7NddD+2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hlavki.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hlavki.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hlavki.eu header.i=@hlavki.eu header.b="C7NddD+2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so20362855e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hlavki.eu; s=google; t=1790669911; x=1791274711; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/GfqKUvORqiJW4q7GPn3t7z4bEPHb/Nll+6wwzZ07g=;
        b=C7NddD+2gpdcHDGezIYFzw9LIEnZRzOkFBwzBOvyHGgjB0VXjnhbWqy3BjbAtKi7sj
         nuf39e6aF0oyelbBO3LR4oUi9tqUDGueL/IVBx0vIr61QD1JbZBx+o14PvZXUNloPolR
         912xY3wn17fizOH/6F753cjVai9d6Y02iTSqhWtDe1WQAcRGhvSpItnui0AZB9PUVjGF
         ESiGSXD2BjQ2KQebizXK5qhQ9kKsXS/aY+S1QV70F+YfrPnp9fN6sojMHXRE4kRn5VZ9
         Ob8yvVqvyZlKFYUH/BSw6PlkBCjNtMDqt/l+drLqYqVWImJHJphYDHLFlhwVjepVPxwl
         mXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669911; x=1791274711;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s/GfqKUvORqiJW4q7GPn3t7z4bEPHb/Nll+6wwzZ07g=;
        b=Juf3FaIGOLzRPweeubv3o8J5AFI1e7DWvIHQmzQudgJQ6RqJuGq0keLPxlemQb1cRy
         /Nmu0ZlyCF9cHhqCb18VTA515ncWYAwrwwAvRMuJQix3cGv8rt0xwfMhbNTIGZHAoKou
         YUt1qC9JSqPCrRXds4w9aKuxl8Uv1YSnxDXasw6fM9F+M4gnLzpnO08dd2J1IHVnCuhB
         LuSM8bzpswzYp8En/M1vNuwAVcIj9PSwicPwMLljAaGCTVMMnPUCJLbJTwDqvcAgnQC7
         SSCErOocKrGBEPl0cLbURAINKzB/X24PB1phgT/CsWsrAE3jYzCI9l2Tvn55/Nc/h/1B
         hKfg==
X-Gm-Message-State: AFuF++mjxxdPJJ/DO/tL+3VBfjXqNuIjI0Garbar8h9bz76CRAgbjC7M
	7QnnuYHHa/USFo6EuLMtNgsSklTlS2FuvyNx5HiCu6A5oNa9z+qZPaNP4JZXBox952zCNTy29p6
	o8Oj2zfc=
X-Gm-Gg: AYBFou2tAC4SMDGL8OHf/SHgHh0WKtUZ72kCNduLi3cE4t8sYnptJKx3hSjXZUxa6md
	zmt+g0m7WKA9VHbkp51a+ANDPgip5yFngncRQMhiQG7EOqIYL9pCnTV6oqLQ0SZaIvdmlCz7Ogi
	lQE+Bfq0iZN6SSlSQGnvxohzx/MLThHgwby29GoSD7aq8lLxgkVtcpqEiswyyCyuef2sDgt7hIt
	qNCUDaWFyFR8Aw73I7P0HQeKNUppClxvgLxzmNb3PR0igghYySBowSWSzNMIeJFJnaYMnT/E7Bk
	vwsbFNmQasvnwY9bK22C+gefDEiLUsZdkGCR7b7RyIbj0sia+g3Yknzlgv1PLQXFQZ2F/L4gd1s
	/NBGQiMrDHTl7KkPfGc54+6gSj4pVBoxZz3cvBUwGfDLBmy24uPPv9Z2/terSzN4wo7gkPHFWlu
	SKT+K1teP8IEdH74vCFKDg3ngjHWSY92Jg3Yd1u/Ikw2TyWjFSJ3rRrMAeg8fephiXKVE5S9twj
	DVt+KbmjfyOsnvIMMtPccYQ9w==
X-Received: by 2002:a05:600c:8a1b:10b0:49f:fc13:18a5 with SMTP id 5b1f17b1804b1-49ffc131b24mr99167645e9.6.1790669910872;
        Tue, 29 Sep 2026 01:18:30 -0700 (PDT)
Received: from hlknb.localnet ([95.80.234.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm82510775e9.9.2026.09.29.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:18:30 -0700 (PDT)
From: miso@hlavki.eu
To: linux-media@vger.kernel.org
Cc: Jimmy Su <jimmy.su@intel.com>, Jason Chen <jason.z.chen@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject:
 [BUG] ov08x40: 2-lane 1928x1088 1500 Mbps mode delivers only the first line
 of each frame (Dell XPS 14, IPU7)
Date: Tue, 29 Sep 2026 10:18:29 +0200
Message-ID: <jOlmjcuoT4uLPTqIMMDtqQ@hlavki.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartai3wMjvOQFC0BNp7G5J-XA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartai3wMjvOQFC0BNp7G5J-XA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: miso@hlavki.eu
To: linux-media@vger.kernel.org
Date: Tue, 29 Sep 2026 10:18:29 +0200
Message-ID: <jOlmjcuoT4uLPTqIMMDtqQ@hlavki.eu>
MIME-Version: 1.0

Hi,

I won't lie, this is the AI report, anyhow I tried to make it as much 
informative as I am cappable of.

On a Dell XPS 14 (Panther Lake, IPU7) the ov08x40 uses its 2-lane
1500 Mbps modes. 3856x2176 streams correctly, but 1928x1088
(mode_1928x1088_regs_1500mbps) does not: only the first line of each
frame reaches memory, and frames arrive at ~3.6 fps instead of 30 fps.

Hardware / software
-------------------
- Dell XPS 14 DA14260, BIOS 1.11.0 (08/04/2026)
- IPU7 8086:b05d rev 04 (Core Ultra Series 3), intel-ipu7 staging
  driver, firmware intel/ipu/ipu7ptl_fw.bin (linux-firmware 20260728)
- Sensor ACPI HID OVTI08F4, "ov08x40 17-0036", routed through the
  Intel CVS (intel_cvs) to "Intel IPU7 CSI2 0"
- 2 data lanes, link frequency 749 MHz; the driver exposes only
  3856x2176 and 1928x1088, i.e. the *_1500mbps modes
- Kernel 7.2.7 (openSUSE Tumbleweed 7.2.7-1-default).
  drivers/media/i2c/ov08x40.c is identical in v7.2, v7.3-rc5 and
  linux-next / media next as of 2026-09-29 (apart from the
  v4l2_subdev_client_info pad-op signature change).

Reproducer (plain V4L2, no libcamera)
-------------------------------------
Link "Intel IPU7 CSI2 0":1 -> "Intel IPU7 ISYS Capture 0":0 enabled.

  for e in '"ov08x40 17-0036":0' '"Intel CVS":0' '"Intel CVS":1' \
           '"Intel IPU7 CSI2 0":0'; do
          media-ctl -d /dev/media0 -V "$e [fmt:SGRBG10_1X10/1928x1088]"
  done
  v4l2-ctl -d /dev/video0 \
          --set-fmt-video=width=1928,height=1088,pixelformat=BA10
  v4l2-ctl -d /dev/video0 --stream-mmap=4 --stream-count=12 \
          --stream-to=raw.bin --verbose

1928x1088 result
----------------
  cap dqbuf: 0 seq: 4 bytesused: 4247552 ts: 88565.237943
      delta: 278.494 ms fps: 3.59 field: None (ts-monotonic, ts-src-eof)

- bytesperline 3904; bytesused 4247552 (= 3904 * 1088). DQBUF
  returns normally for every frame.
- Row 0 of every frame holds plausible image data (10-bit values
  71..559, changing from frame to frame).
- Rows 1..1087 read back as 0xffff in every frame, including the
  line padding.
- The frame interval is a constant 278.494 ms. With the defaults the
  driver sets for this mode (VTS 0x115c = 4444 lines, vblank 3356,
  hblank 472) I would expect ~33 ms.
- Same result with test_pattern=1 (Vertical Color Bar Type 1): only
  row 0 is valid, so this looks like a timing / MIPI output problem
  in the binned mode rather than in the pixel readout.

3856x2176 result (same link frequency, lanes and pipeline)
----------------------------------------------------------
- Constant 35.000 ms interval (28.57 fps); all 2176 rows hold valid
  10-bit data.

Frame interval vs. vertical blanking
------------------------------------
Same reproducer, with vertical_blanking set on the sensor subdev
before streaming:

  mode       vblank  VTS     interval     per VTS line  valid rows
  1928x1088   3356    4444   278.494 ms   62.67 us      1/1088
  1928x1088   7800    8888   556.987 ms   62.67 us      1/1088
  1928x1088  16688   17776  1113.973 ms   62.67 us      1/1088
  3856x2176    324   5000*    35.000 ms    7.00 us      2176/2176
  3856x2176   2824  10000*    70.001 ms    7.00 us      2176/2176

  * normal mode: the VTS register is (height + vblank) << 1

The interval follows VTS exactly, so the timing comes from the sensor
itself. In the binned mode it runs at 62.67 us per line, while the
driver advertises hblank 472 at 320 MHz (~7.5 us per line), i.e. the
line time is ~8.4x too long. A longer frame does not let more lines
through.

Secondary: PIXEL_RATE is wrong for the 749 MHz modes
----------------------------------------------------
link_freq_to_pixel_rate() hardcodes OV08X40_DATA_LANES = 4, and the
control's maximum is derived from the 400 MHz entry (320 MHz). On
this 2-lane system V4L2_CID_PIXEL_RATE reads 320000000 in both modes,
whereas 749 MHz * 2 * 2 lanes / 10 bits = 299.6 MHz.

Impact
------
libcamera's simple pipeline picks the smallest sensor mode that
covers the requested output, so any ordinary webcam request (640x480,
1280x720) selects 1928x1088 on this machine. The 0xffff lines then
also crash libcamera's software ISP statistics code (a missing bounds
check; I'm reporting that to libcamera separately). Only requests
larger than 1928x1088 give a usable image, via the 3856x2176 mode.

I'm happy to test patches or collect more data (register dumps, CSI-2
receiver state).

Thanks,
Miso Hlavac

--nextPartai3wMjvOQFC0BNp7G5J-XA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEl7BcJF7ASeA/Y9HKnSD0SxOmcrYFAmq7dFUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEJ0g9EsTpnK2HHkP/jpYPOBSLWTOMWK6M1n4
kNXF0ZStz55nsypGbMqJmxZaWrIBsqnWVPuBvUJsXVjdArChEOE/tZmvVZBI7q2v
/4NnTYujBXk+WRtV+3gOdLAsfgGYhff0Y/jnRqjbupqTWIp641ojf5MRKJXaeOcc
n0CjLATOg4OiR+u1IMc/sVETLS/B7EC7hvbN/rNfQPX5c1AxG5fz7c3p0AHzVL/M
WqA6kxPTz7c8AcFe2kFaN3qhxwb/5GlguDPmthhVIT8x4uQ1WgEeDaeGDCBobWnf
+Lx1agc5wzNTstMbSMynoC1ZSfkNvUP0jXpTEmOMtUsHq4Cci2cqUwdP46BtZdPG
1dhx5Emr5PGAL7Ka5awNr0tX/r4SMDkEd79gqhLZUGOujPzMxOulwQ25OeOKstzi
AcXU/Ebi08d+eDfHGHEXVC4zE1e+EK4K3BibftXd5VT9WNcdYrSbYOTfhSaoAu4P
hXMTjQk7XaULLUdBHNHxZUe3nL0jMWc+fj0lGV9rnSwwppJDZ4qrkaZozgdrBbhc
dBZ42P2gxqxPlUbrUZhH4FWQaM201M0bKkE4hEAvc77UjBF5isHD63Q6ZY2tXktR
WW1rOc/1ui1WkyTegk61Slm8KWBHqtz+pmLu4+goJyh1zf84NNl2tTq6iPTGcfyC
7ZB2ajRtLwKFPj8eHxa9FpU6
=KrHS
-----END PGP SIGNATURE-----

--nextPartai3wMjvOQFC0BNp7G5J-XA--




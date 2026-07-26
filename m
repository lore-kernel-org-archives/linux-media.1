Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9B378D92
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785102269; cv=none; b=crulb8Uz8+nywtU6Sm6T+iGeG2GAm9+uFyM7Drpnb1+3TON54MXWn8A2NrY/LUdHM3uSlszOG/qGroI9IBWTj42QrXjf1bKoEowgFKyisTEIY+h+DSAjKd0mgBR+l/lx4RSPK8NfWRGkOuODyx44Cbq2IePBXbi2H8Hi+NxSBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785102269; c=relaxed/simple;
	bh=3r1zOqa5+RgkugWfFKeAF3R6T55eM7D56/8iT0BbnrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ih6Js8Vxhj0gwbYWp6TleBdIgZJMZBim5+YkMTS6TWCDYskDAF2EkDBD4+STyI51U9Aycqrot2V2lKeF5dpoF4aEwU3DHJD8QEluoAL+reHqACrEBg5I45VUq+gGKVRtPHoCLVTaqUmNB1bOSHF6I/lqHcmu9C7QAXWOF8UHuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=s+ZvStjk; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="s+ZvStjk"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c1372f84dso15275421cf.2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 14:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785102266; x=1785707066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEQpXj2RlhoskWyh45iESbS++OWZ6aLZrVcvDrUwOms=;
        b=s+ZvStjkJYi4UVKS5p1i2B+vYiX8NRVYdoWZaviNtQuRQ+FQOO8nJl/mM/yY2vY8qk
         rx2/OKGA8WFo7s0rYJ6D2Mh1p1fuoKxGHHqPSbrVymjoX8iO8Sa+YIW9QFmrngYddfMn
         GvK83T69+2loYX4kKDMcUBAsR15pOqGh3uuV9kJIPmmrs0Xa2B6DEiYmTXIyvtGnDlqA
         z3KySBDZHUgPaUjeyCTJnAihitT+o1aDZMkUyj8rd1zSUa/TmHPki8jh/Pae8mUou+08
         u83OguWIYedc3Z9Dtpdawoojyoih8C1fqvW1VOE1MQfXx681W9g8Q8Uy5fcYaCR7Bf81
         qfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785102266; x=1785707066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEQpXj2RlhoskWyh45iESbS++OWZ6aLZrVcvDrUwOms=;
        b=CgAFzfniF29L4ny8bovd3hq61cRdx1T35lTkeI3NIBH9g2yNLLX7me/U1e9NyXHVie
         KPxUS6pLUuwyZuLlIze/iERTL0Z0B2Tp4/RFPztY36OWlCA4jSk4+etmwAQ38UhPE45s
         Ydu53Zrg9nU73cTkzHDtUEFuYuBlsCfBxwSUb3d+mfvsCvfFuWw5o3M+uQiBYa81G4HQ
         nmsnjCypg36XB3mFwgZoZFtzRuv34KffNGUGJFC8/eWRTuDyBuhbNn1ZLZ0nf9w9JIm4
         AkjclZSlFHiFDTuQioHorYXE383NWjz1Ir6UFFQ+6GqROf5LlZrFRM3KmtN4Cp8/Tw4C
         d7Nw==
X-Gm-Message-State: AOJu0YxEBXIwkHmJ335uhE6LDF6rIXwKLiEhlASUHWyxPfcm8r+jNPyl
	RD9BiscSvsKmwDyZvEKUuyLdaRavwIp/xgCoHi8DR+CujPt36sVdlBLyvenCvWkAI5oEV/SPYO3
	0fIAboueNWKGin1OhUYPuIPjAIy/35sdE5ptNSO5YBsWeOrUvyK1mFJ3obltGT3Gj+sxxwSRpVr
	Tw0l5hXcMcXnbUOu1YF98x5L0m/eiw5HuL1QCiOGmEFDLji8k17Q==
X-Gm-Gg: AR+sD13/CnOlLSq9OWx2Z4IvqOysXSf4N3oBmYjdbK7eU88QWORum2v86cb6MSHHjyO
	b7StTX6Bo5Ghi6zDNJw88CD8npKVX3D2bSiTETXUkKp+lWCJdOzg2DIZM2MasgVDjTO7v+VwA9Q
	KIie4oqD0EyYU85nhk9z/clSLMplbdtmijT1QbkWV5fn26d1BUmNftZSAknBj+6fI6D+HHJmU2G
	0FV/LzGvnoR2PpJIbXZZY74X5+/UTIFwT5/tvrjyMNPV4HANmgbsxYk3RS9IJtfsHGClqBGMzXB
	DGMy/q1Tg7NaOk5NABtDFBaNGSYljTnykyCMs/NnQSjVRkI1193B1DI2DE0MtS4i6laRCjgvmRj
	s9TeRc23nJ2cRFZH5CRPOvgOFyFe+vJBcJkORhzPJDHitdBuMe6uqHhKFicTqyB4R8sFPLHBl5C
	BZxw6HhXyQkN+BV+Qr/XHQSA9fwDF+bjJ4YZ/rsKpYK5sllPDuyVz7bk8vl2fTwz7KW3fzBFuUD
	zJDBe1Aetxe/gf9Z04=
X-Received: by 2002:a05:622a:6099:b0:51c:bb79:a52d with SMTP id d75a77b69052e-529a830ab20mr58478131cf.14.1785102266291;
        Sun, 26 Jul 2026 14:44:26 -0700 (PDT)
Received: from jake-laptop ([153.67.53.72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27cedccsm41487031cf.4.2026.07.26.14.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 14:44:24 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: add Himax HM1092 monochrome IR sensor support
Date: Sun, 26 Jul 2026 17:43:59 -0400
Message-ID: <20260726214401.19042-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Himax HM1092, a monochrome infrared
image sensor. It has a 1280x720 pixel array and a single usable mode:
648x368 at 30fps, 10-bit raw (MEDIA_BUS_FMT_SGRBG10_1X10) over one
MIPI CSI-2 data lane. It is ACPI-enumerated with HID HIMX1092, sits on
I2C, and on the machines that carry it provides the infrared stream
used for face authentication.

Patch 1 adds the sensor driver, its Kconfig and Makefile entries and a
MAINTAINERS entry. Patch 2 adds the sensor to ipu-bridge so the
software fwnode graph gets built; that patch was posted on its own
previously and is repeated here so the series stands alone.

The driver uses the V4L2 CCI regmap helpers for register access, the
.enable_streams/.disable_streams subdev ops and runtime PM, and it
validates the firmware-supplied endpoint description before publishing
its own bus configuration.

Only the one mode is implemented, and that is a limit of what can be
verified rather than of the part. The pixel array is 1280x720 and the
vendor reference board advertises larger windows, but the only
sequence I have that this silicon is known to accept is the one that
programs 648x368, and nothing in the shipping firmware path exercises
anything else. I would rather expose one mode that is known to work
than enumerate modes I cannot test. get_selection() reports the full
1280x720 array as V4L2_SEL_TGT_NATIVE_SIZE so userspace can still see
the real geometry.

Link frequency:

The single change that made this sensor work is the link frequency, so
it is worth putting in the archive. Anyone deriving the number from
this sensor's PLL registers or from the vendor mode descriptor lands
on the same wrong value.

The vendor's mode descriptor states 360960000. That number is the
per-lane bit rate. V4L2_CID_LINK_FREQ is defined as the DDR clock,
which is half the bit rate: 180480000. Publishing the bit rate makes
the CSI-2 receiver configure its D-PHY for 721 Mbps while the sensor
transmits at roughly 361 Mbps. The result is deceptive - the clock
lane toggles and nothing reports an error - but no packet is ever
framed and the receiver generates no start-of-frame at all. With
180480000 in both the sensor driver and the ipu-bridge entry, the link
comes up and frames arrive. pixel_rate is 36096000; the register
sequence programs HTS=1620 and VTS=741.

This is also why the driver parses and checks the endpoint rather than
trusting its own constants. A sensor driver that publishes a lane
count and link frequency unconditionally probes "successfully" against
firmware that disagrees, and the failure that follows looks like a
receiver bug rather than a configuration mismatch. The check earned
its place during testing; see below.

Provenance of the register table:

The initialisation sequence is a 238-entry register table and there is
no public register documentation for this part. Stating its origin
plainly so that it can be judged on the facts rather than discovered
later:

  - The table was extracted from the register table embedded in the
    vendor's proprietary Windows driver binary hm1092.sys (Intel 2D
    Imaging / USB IO Vision Driver for Camera, version 81.26100.0.13),
    which stores it at offset 0x26B34 of the .rdata section as
    16-byte entries.

  - It was then cross-checked against a USB/I2C bus capture of that
    same driver programming the sensor. The two agree.

Both values and order are reproduced verbatim, including writes that
appear redundant, because the sequence is only known to work as
captured. I have no further information about what the individual
registers do.

The control defaults follow from the same constraint. The tail of the
init table leaves exposure at 0x00b4 and analogue gain at 0, and the
control handler setup that runs at stream-on writes the control
defaults back to the sensor. Defaulting the controls to anything else
would quietly stream a configuration this silicon has never been shown
to stream with, so the defaults match the table.

Pixel format:

The sensor is monochrome and MEDIA_BUS_FMT_Y10_1X10 would be the
honest description of its output. SGRBG10 is reported instead because
the vendor pipeline configuration for this part declares
bayer_order=GRBG and the IPU firmware graph is selected from that
declaration. The mono data is carried unchanged either way.

This is a compatibility choice, not a hardware constraint. The IPU
CSI-2 receiver does accept Y10 - mainline IPU6 exposes Y10_1X10 for
other sensors - so nothing in the hardware forces the Bayer code. See
the open questions at the end.

The vision bridge:

On the platform this was developed against, the sensor sits behind a
Synaptics SVP7500 vision bridge. That bridge is still required on this
hardware: it performs the sensor ownership transfer away from the
firmware and applies the MIPI configuration from the ACPI SSDB at its
own probe time. It is handled by a separate out-of-tree driver and is
a separate concern from this series.

The sensor driver has no dependency on it, and that is not an
assumption - it was checked two ways. The built module has no
undefined cvs_* symbols and no module dependency on the bridge driver,
and the sensor still streams with the bridge driver's configuration
call disabled entirely. Nothing in this series references the bridge
driver, links against it, or requires it to be loaded.

For completeness, since it will otherwise be the first question: the
drivers/media/i2c/cvs driver merged in 7.2-rc1 cannot serve this
platform. It registers as an in-graph MEDIA_ENT_F_VID_IF_BRIDGE subdev
and requires fwnode graph endpoints on the bridge device. This
platform's firmware does not describe any, so that driver defers probe
indefinitely and the sensor never appears. The bridge here is
control-plane only and is not a member of the media graph. That is a
problem to solve in the bridge driver, not in the sensor driver, and
it does not affect this series.

Testing:

What was tested. This source - the version in this series, with the
CCI register layer, enable_streams, runtime PM and endpoint validation
- was built, installed and booted, and it streams:

  - Machine: a Dell XPS 16 DA16260 with an Intel Panther Lake IPU7,
    running 7.2.0-rc4 with the out-of-tree Intel IPU7 driver stack
    (the IPU7 ISYS/PSYS drivers are not in mainline).

  - The sensor binds and brings up its CSI-2 link exactly as firmware
    describes it: one data lane on CSI-2 port 2, link frequency
    180480000. The probe log is clean - no errors, and no
    informational spam.

  - Capture through the IPU7 CSI-2 receiver produced 12 start-of-frame
    events on csi2-2 and 8 frames, 3956736 bytes, with an 87.9% byte
    difference between consecutive frames: live sensor output, not a
    static or repeated buffer.

  - Endpoint validation was exercised for real rather than merely
    compiled. On the test machine the firmware graph initially
    advertised 360960000 - the per-lane bit rate - and
    hm1092_check_hwcfg() rejected the probe with -EINVAL instead of
    streaming into the 2x mismatch described above. Correcting the
    firmware description made the check pass and the sensor stream. It
    caught a genuine link-frequency disagreement on real hardware.

  - System suspend and resume (s2idle) with this driver loaded. The
    sensor survives the cycle and still streams afterwards.

  - The link frequency claim, both directions: at 180480000 the
    receiver reports 360 Mbps and start-of-frame events occur; at
    360960000 it reports 721 Mbps and there are zero start-of-frame
    events.

  - Independence from the vision bridge, as described above.

  - Build: clean at W=1 with no warnings.

What was NOT tested, stated explicitly:

  - Anything beyond one machine, one sensor mode and one kernel.
    Everything above is a single Dell XPS 16 DA16260, the single
    648x368 30fps mode, on 7.2.0-rc4. No other IPU7 board has been
    tried.

  - Any IPU6 platform. The ipu-bridge entry in patch 2 is expected to
    be what IPU6 machines need, but I have no such hardware and cannot
    claim it.

  - Any configuration without the Synaptics SVP7500 bridge in front of
    the sensor. The driver does not depend on the bridge driver, but
    it has only ever run on a board where that bridge is present and
    has already applied its ACPI SSDB configuration. I do not know how
    this part behaves wired directly to a CSI-2 receiver.

  - Exposure, gain and test-pattern controls beyond the values the
    initialisation table programs. The image was verified to be live,
    not to be correctly exposed under driver control.

  - There is no devicetree path to test: the device is ACPI-only, so
    no binding is added (as with hi556 and ov2740).

Open questions for maintainers:

These are decisions I do not think a submitter should make alone.

  - SGRBG10 versus Y10_1X10. The part is monochrome. Reporting SGRBG10
    matches the vendor pipeline configuration that the IPU firmware
    graph is selected from; reporting Y10_1X10 is truthful about the
    data. The driver side of the change is mechanical, but it needs a
    matching change wherever the vendor graph configuration is
    consumed. I have implemented the compatible option and will change
    it on request.

  - Whether a sensor that is only reachable behind a vendor vision
    bridge belongs in drivers/media/i2c at all, given that the bridge
    driver it sits behind is out of tree and mainline's cvs driver
    cannot bind on this firmware. The sensor driver is standalone on
    its own terms, but the platform around it is not yet fully
    upstream, and where that line sits is a maintainer's call.

  - The IR illuminator. Firmware describes it as an INT3472 LED-class
    device, which the sensor driver cannot own. Nothing in this driver
    touches it. Whether the illuminator should be associated with this
    subdev, and by what mechanism, is an open design question I have
    deliberately left alone.

Review notes:

scripts/checkpatch.pl --strict reports 0 errors, 0 warnings and 0
checks on both patches.

Jake Steinman

Jake Steinman (2):
  media: i2c: add Himax HM1092 IR sensor driver
  media: ipu-bridge: add Himax HM1092 IR sensor

 MAINTAINERS                          |    7 +
 drivers/media/i2c/Kconfig            |   13 +
 drivers/media/i2c/Makefile           |    1 +
 drivers/media/i2c/hm1092.c           | 1135 ++++++++++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c |    2 +
 5 files changed, 1158 insertions(+)
 create mode 100644 drivers/media/i2c/hm1092.c


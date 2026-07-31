Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD408432303;
	Fri, 31 Jul 2026 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511718; cv=none; b=JBmCcGTxOAMPZ3U3V1yT0wSWvjX7Z92KOyTZanov5GwrH5i+J0/Xny0uct0Hv5kfOnrXRlV3RgSepzXmOm9WjK28gCP8q5oWmNziU4ZvTqirakWe7EnMGbe3X+2K2Uek+eYzzaGV5WpuMGYXTbj1qAZMbYQxdYK/+RvQeTBil14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511718; c=relaxed/simple;
	bh=1Q/J9x1zui0LUDSaar22GbzucU33Rv701Pcg1BGQ2Cs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IJlCxERctR+30x+tNbi3eKWL5bxuWJoqHOQrklYR1dPlzspnIjcXyBz9bOYxuWeQ/1oTQUFZ5f3LzHl0BEXGXqy9iuh5iKtXCLfDWdj2DwGvDQ4xaRWucmrMfZM9U0XJM/P78ibR1ml2+cGZCdqK7t+jz5knxuKo4s0eAF355Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qeyUolH+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qeyUolH+"
Received: from [192.168.125.177] (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1486DBE;
	Fri, 31 Jul 2026 17:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785511648;
	bh=1Q/J9x1zui0LUDSaar22GbzucU33Rv701Pcg1BGQ2Cs=;
	h=From:Subject:Date:To:Cc:From;
	b=qeyUolH+/9LjTdFPx3L79bNhyFM5YiHUQFhv8f3JmsTN4ne4EcSsQrUv34L5nZEPq
	 IA0bDNV8GxRm+61bEgXsIo+qE4tCCbEkjMI1kTnN1vWnoRiDxzcMfjaOwVvu982564
	 Y59Wnj/gMMVLm4r1yJKlDAFjFW4YEA4/Iqw1OAEw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v11 0/2] media: i2c: Add driver for Mira220
Date: Fri, 31 Jul 2026 17:28:18 +0200
Message-Id: <20260731-mira220-v11-0-1295fe17021d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABK/bGoC/3XRvU7EMAzA8Vc5ZSbI+Y6ZeA/EkCYul+EalKAKd
 Oq7k97SSpDRln//xXfWqGZq7OVyZ5XW3HJZ+iDE04XFa1g+iOfUF0yCtOCk4Ldcg5TAQYGDIJy
 aXWT9+rPSnL8fqbf3Pl9z+yr151Fezb7921gNB26UmiAkAdbQa04UWlmmEmp6juXG9tRqz1we3
 HYuQZGS0aBNI+4G3HWekplFIvQx6QH3Z64P7ncuPGKYrHaAA45n7g6OnZO3SI6iBA0DLmDgRf8
 B914ah5osoPknsG3bL1gXAizjAQAA
X-Change-ID: 20260721-mira220-03070a173f7c
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8982;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=1Q/J9x1zui0LUDSaar22GbzucU33Rv701Pcg1BGQ2Cs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqbL8hR3gkkSyP7DiV3jpP+DlhTXbR13J9CNFM3
 SiSnDy3ijOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCamy/IQAKCRByNAaPFqFW
 PEcRD/wJEDmGpB4Zkcy0+RnVsQZUmpeokqrKBASPCemvfm7CIPH0/aOGO31A4L8G31KxcZISme1
 00jtzdD4cfyeCNe3XgxcTg0MhQvM+fjZRoZe71xrVKQJzY/dmitWx3EeCGd+Wj/df/Sxh3qrp+A
 kCc79i0JW/aV1S+TtME4h1g0CH679g6byUvjZkYMz95wG8gixcPZPLu5iznnbA2oZCiVyjmzGdo
 ysZttExwHhgaSw92tEK+JL4HKO10pK1skAX4yLujPrAjGBCe8yQzX5a0kb2tiy0jGj91b2xvcd7
 BSRsIkRBB4xWJlmutMXlh3SVZGKkHsEPR6DqFHl+B6xptZZhvL1rqBstvCkp/O94vjn4LZ/ki+D
 FEaPy297e3mgvFDl1jMzs+qeofsn1rh3L8lN5b+RXAYj1bTHA2OghZepL/adPZ7bSYSsCGRCCE3
 DIkhi43ddSW9s46X06iTL6MktJzZRV3NqXbSI88D+osnjDmX0XIAvzqWY9ewNbMdgLic6s/VT17
 uzzwAdgAEz/FV5WWhRcBcvlK9tIYVyUl0n7Ti1BzpNqIkvEQeRzuP9TF51QpBx44//pLrHPxViW
 8PPj0Oab4KLh60x50mkHb5y7l7+2CCGqv6GgXhuF4vvzFFvQ3FKss6VgsSQ3fdU/4ELtGjdjLUU
 js0Z7edp5xgZnnw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Resume the work done by Philippe on Mira 220, available at
https://patchwork.linuxtv.org/project/linux-media/list/?series=18460

The detailed changelog is available on the single patches.

On the current set of supported features: mira220 doesn't support
binning/skipping but only cropping the full sensor array. It also
supports embedded data. It would be an ideal candidate for the new
RAW sensor model.

As the model is not available yet in mainline, this first version
doesn't support set_selection() and doesn't support embedded data.

These features will be implemented on top of the new RAW sensor model
once available.

Thanks
   j

Changes in v11:
- Address Sakari's comments:
  - Simplify endpoint parsing
  - Simplify controls initialization (and pre-allocate 12 controls)
  - Calculate row_length on request
  - Enable autosuspend before idle
  - Simplify enable_streams()
- Link to v10: https://lore.kernel.org/r/20260727-mira220-v10-0-8825794e6095@ideasonboard.com

Changes in v10:
- Remove 'fmt' leftover in driver structure
- Link to v9: https://lore.kernel.org/r/20260727-mira220-v9-0-e869e7ec2040@ideasonboard.com

Changes in v9:
- Make 'link-frequencies' mandatory in bindings
- Use v4l2_link_freq_to_bitmap()
- Link to v8: https://lore.kernel.org/r/20260724-mira220-v8-0-d1899ab64709@ideasonboard.com

Changes in v8:
- Address Jai's review comments; changelog is per-patch
- Link to v7: https://lore.kernel.org/r/20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com

Changes in v7:
- Address Sashiko review comments; changelog is per-patch
- Link to v6: https://lore.kernel.org/r/20260722-mira220-v6-0-203e32c596de@ideasonboard.com

Changes in v6:
- Address Sashiko review comments; changelog is per-patch
- Link to v5: https://lore.kernel.org/r/20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com

Just a note on hblank: prompted by sashiko review I reworked the hblank
calculation procedure to use the full line length (which will make it
easier to use the new Raw Sensor Model) and I've scaled the line lenght
according tot the number of data lanes, to match the row_length
settings, and I tested frame rate for 1 and 2 data lane operations.

I'll report the results here

1 data lane: hblank = 4480

    10fps -> vblank = 4915
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=4915
    2633.788743 (10.00 fps) cam0-stream0 seq: 000210 bytesused: 1920000
    2633.888732 (10.00 fps) cam0-stream0 seq: 000211 bytesused: 1920000
    2633.988712 (10.00 fps) cam0-stream0 seq: 000212 bytesused: 1920000
    2634.088696 (10.00 fps) cam0-stream0 seq: 000213 bytesused: 1920000

    15fps -> vblank = 2810
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=2810
    2690.081596 (15.00 fps) cam0-stream0 seq: 000833 bytesused: 1920000
    2690.148251 (15.00 fps) cam0-stream0 seq: 000834 bytesused: 1920000

    30fps -> blank = 705
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=705
    2732.142696 (29.98 fps) cam0-stream0 seq: 001736 bytesused: 1920000
    2732.176004 (30.02 fps) cam0-stream0 seq: 001737 bytesused: 1920000
    2732.209315 (30.02 fps) cam0-stream0 seq: 001738 bytesused: 1920000

    min_vblank = 14
    2823.028261 (46.07 fps) cam0-stream0 seq: 005180 bytesused: 1920000
    2823.051318 (43.37 fps) cam0-stream0 seq: 005181 bytesused: 1920000
    2823.073032 (46.05 fps) cam0-stream0 seq: 005182 bytesused: 1920000
    2823.096081 (43.39 fps) cam0-stream0 seq: 005183 bytesused: 1920000

2 data lanes: hblank = 1440

    10fps -> vblank = 11231
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=11231
    163.127449 (10.00 fps) cam0-stream0 seq: 000106 bytesused: 1920000
    163.227446 (10.00 fps) cam0-stream0 seq: 000107 bytesused: 1920000
    163.327425 (10.00 fps) cam0-stream0 seq: 000108 bytesused: 1920000

    15fps -> vblank = 7021
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=7021
    206.325595 (15.00 fps) cam0-stream0 seq: 000551 bytesused: 1920000
    206.392256 (15.00 fps) cam0-stream0 seq: 000552 bytesused: 1920000
    206.458943 (15.00 fps) cam0-stream0 seq: 000553 bytesused: 192000

    30fps -> vblank = 2810
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=2810
    244.891759 (30.00 fps) cam0-stream0 seq: 001153 bytesused: 1920000
    244.925094 (30.00 fps) cam0-stream0 seq: 001154 bytesused: 1920000
    244.958439 (29.99 fps) cam0-stream0 seq: 001155 bytesused: 1920000
    244.991746 (30.02 fps) cam0-stream0 seq: 001156 bytesused: 1920000

    60fps -> vblank = 733
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=733
    67.273857 (57.04 fps) cam0-stream0 seq: 007285 bytesused: 1920000
    367.290091 (61.60 fps) cam0-stream0 seq: 007286 bytesused: 1920000
    367.307637 (56.99 fps) cam0-stream0 seq: 007287 bytesused: 1920000
    367.323866 (61.62 fps) cam0-stream0 seq: 007288 bytesused: 1920000

    90 fps -> vblank = 22
    pi@raspberrypi:~$ v4l2-ctl -d /dev/v4l-subdev6 -c vertical_blanking=22
    326.909808 (83.83 fps) cam0-stream0 seq: 003739 bytesused: 1920000
    326.920403 (94.38 fps) cam0-stream0 seq: 003740 bytesused: 1920000
    326.931644 (88.96 fps) cam0-stream0 seq: 003741 bytesused: 1920000

-------------------------------------------------------------------------------
v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38

Compliance test for device /dev/v4l-subdev6:

Driver Info:
	Driver version   : 6.18.37
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev6 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 14 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev6: 46, Succeeded: 46, Failed: 0, Warnings: 0
-------------------------------------------------------------------------------

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Philippe Baetens (2):
      dt-bindings: media: i2c: Add mira220 image sensor
      media: i2c: Add driver for AMS-OSRAM Mira220

 .../devicetree/bindings/media/i2c/ams,mira220.yaml |  102 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mira220.c                        | 2052 ++++++++++++++++++++
 5 files changed, 2175 insertions(+)
---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260721-mira220-03070a173f7c

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


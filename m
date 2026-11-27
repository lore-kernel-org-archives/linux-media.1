Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821106;
	b=FBG3ZVPYf+zTACoI8h5fHyWuFOLy77Tk42ZUvaAviq0e1UCyudUmlMITfo+X7a2vI3qO
	 UMbRNYHa9rJ1Bh0eVHl6QdOYVc05kZTgSggyvfPsnBdgLX/tCSE0P0tEBUUDKbMJBz2GJ
	 2xPaoW6r9Gqwc3FphQ15Fy6/yQo8MsL3hFGvHjr6qx6Gw0dUXB9IvWZxpMUCs4XECGp6q
	 aBq0dPX70ShnytjZm8+NU+ulvBb7MlhUr8c1ImipAHaKaw85kT8+vCnCYyPz5ydtz75nN
	 zBJd+KhEiuj2y1V3Bux3vPSguSfi1FBhHGDW4GQ4TqPfbbkniGpbzU+TuGH5Ppm/OYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
	b=dFeuzpniXUr2swfr1Eb0oyuXkVOojb4WOrxyhJhFv5kYlqcMmtfmj5TCJFtXL8E0Z3By
	 f3MX/zESjSAhePszs3ihmLbUjuonOT+73X2TQMWAfSdd3KI+U1tdnOlL7BTG0H/iie3aS
	 l+VOMeGNpHUCPeXuJNKNWKMEyU3NxxV+fpAoX7CRySMfj08OZFAVCd9UtPfU/wlK+Xday
	 79SpAuuwJ6QKzS2O4XVlZjmK9MHp5/H5Ya26/fNyOjpwRadjQrQubesDrgGuPoqvRigcq
	 Okhr8WciqAwlLnoWMjTT+O7vl+sNjcGq3N9cOsLAOiHCRRO72QgF/o8eAN3XA/RoADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sb3keO/J";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055A606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A055A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb3keO/J
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so30351345e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 15:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821104; x=1796425904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
        b=Sb3keO/JbdqNwYdRbi30532geky1B2fRYpZSVNuqid6Tf/dRO5xAd2TMqkvUBAHZcp
         v2jrujqXaykvFVBhWkG1PncgfMtUYHwvYnF7FG+5NLtaprPQwMjaH+LSdunY2mKlY8zK
         MKpiy4k1MUq+ygmGfZcXeJmpG2H7kE7xeScWMZ6fCpOyBwyt2llMErL5J7/Zq1zutIRL
         zLDI4pwTNp7JJmI3YY+hAZACwDgtJ6iZw2REASrjrrPD4HKmFu7LXxVHdbMFhiCZag1c
         eDaqxHxEd5ya4Xkz7c9tjrXc7oaWp2QkPBmoRtiZ9G1BYpCBwpT1bWtUAHF/tSQalXQg
         C1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821104; x=1796425904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
        b=iLz/NF8ulAsASF1yhrB2dsnO1GoSaGSkGLbxIGim05E+gD2v69+KxrArV26mu2oGTN
         Qxj1cII0hAq9n+MzICTvhbAdOF2cu+f9tUzML5EqLY826qJWi2E1MF6/I0tQ2aAPb8BV
         OQR+AxncH+mT7fPNU8cmqQjUOvRrZmfb7SuhHj1SaJ2YCUWMKxYBrqKn0a6JjgWAj2oU
         o7r81BELLgZ/J409oJyjsl6qAgnI76Xm/dQo94mQDsx3eiZP5TtO9ETqINlFrPGK13eR
         XLYgDyjzIYTNJVQR3XAfvAafE+PDW0fpECAeXunjTj2pAJQNS+9u38d7YTeA02uSan4Y
         2acw==
X-Gm-Message-State: APuU4Z+awXwhY1aejCkFmwYDY5xSBuA/IV7pD6BMe+qVh7fRTVSNcWga
	k7w52jK2dA8TBJM3GNUDIdlXWROGA6eBcU2KOunzGvvLq4a5VAl4SbGW
X-Gm-Gg: AZFdTZcWT927sVpXzk3SSKv3pHoddKbaaF/1sUpccIlqnFk0vcaK0P82cAo2uGYzt5L
	Db966JkGnIYlbRR8ZTRSJVriVgI8RsMsxMK0uT8Si3TFiDaR2DHfOO53syVPLVpWIp6JQpNZfi3
	OUAL55MuNE9jgHr+hnhN+4odW0InaP0X+8CPclyW4FXFFM/LAdWozH59b4ZO66go1sFdFEsJRgo
	jY8oFZQo8FP3lmuG6F51qHy7za1TUs5fdjte32M23/nF539Z/FMcgh9rIu9yjr88G6/tP9akP9N
	+/4Gkx3Wk6M5M6+Tic33eAfI08yqhQm/cKDP4j/T2eTb1jEIq8/TwjmF5NDjXrmoTgV1jgF6foy
	hsbzNv0qIZTffk4ML4HKcCpLAhcj6YBPs1t/vpuWSpAjx3gGZwy4zOgeS0gaNN3IoWveeHneI30
	8HXjalLr8TYCDOmpWt7Qegcg7f45/SHbqofmraeVdLbeR1n5/eXy2h3j0pvNsx1g1FKPpF/F0ds
	YuFUZ/SVZqlRL8hnxyNX2eXINsA9nsVdReHkK7zVv/cDwspNQlEZCmPtDNRO71kv9PrN7OZMs7+
	aqcfTC1pDcMveXSlULvveM3CsXQcp4/9xqQ0J9Wrj1kyePB3nOAi3k7hLbDKcK5GKNz417JQSND
	BuhyuO7GK1jZxXtTS69kcKmPdFzrmrQwpW9qsm1Tg49nFr12B2xLaxz9kAAhWxtGEsQ==
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr538925635e9.6.1795821103802;
        Fri, 27 Nov 2026 15:11:43 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:43 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Subject: [PATCH v3 0/4] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
Date: Sat, 28 Nov 2026 00:11:32 +0100
Message-Id: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ7CIBAGX6XhLAYW+4Mn38N4oHRtMbYYqETT8
 O5CvTQmHif7zexCPDqDnhyLhTgMxhs7JRC7guhBTT1S0yUmwKDiDGpqQ1lJQa/mhZ42qEHWJTR
 SKJKUh8P1kIzz5cv+2d5Qz7mRF4Pxs3Xv9V/gefcnHThlVOhGtVwhZ4fu1I/K3PfajiSnA2xl+
 SNDkqGEqqtbLphgWznG+AHGJF859wAAAA==
X-Change-ID: 20261027-ov5693-fixes-8ec29752893a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=3879;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=aVSYBkfytGdzyKOu2AJotHb1wOyX7YG82KUEpvCRBJ8=;
 b=yctof9IckHJ9OiSYYzS8mN90dRNXcjVNIWnVbSqclLtF9tZBUsU5y4my5XByU9G8TY3UN4P93
 /neEPrdzQ/YCuNhHNce6N3FpI47D2x2rsfVIS9vwROogg6racm/kHgY
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

Fixes for the ov5693, found while getting the front camera of the
Microsoft Surface Pro 5 (IPU3) to work, and since tested on IPU6 and
IPU4P Surfaces as well.

Patch 1 drops the registers that the driver programs itself from the
global register list, as Sakari asked in the v2 review: the low byte of
the analogue gain and the FORMAT1/FORMAT2 registers. The driver now
writes the non-flip bits of FORMAT1/FORMAT2 in full.

Patch 2 writes format and crop changes to the sensor when it is powered,
on top of the write at power-on, so that a format change also reaches
a sensor that stays powered between streams (autosuspend delay, runtime
PM disabled). Changes on the active state are refused with -EBUSY while
streaming.

Patch 3 keeps the reported SBGGR10 order when a single flip is enabled
at full resolution: each flip moves the Bayer phase by one column, so
the output window is shifted by one column when hflip XOR vflip.

Patch 4 drops the usage count at stream stop with
pm_runtime_put_autosuspend(), so that the autosuspend delay counts from
stream stop rather than from the last resume.

The patches come from the linux-surface tree [1]. This version was
tested on a Surface Pro 5 (IPU3), with the media next driver plus this
series built for the running kernel: the full-resolution Bayer order is
stable with all four flip combinations, 16 changes between 2592x1944
and a 1920x1080 crop with the sensor kept powered all stream the new
format, a format set during the autosuspend delay reaches the sensor
at once (OUTPUT_SIZE_X read back over I2C), set_fmt() while streaming
returns -EBUSY, and the sensor suspends 1.16 s after stream stop with
the default 1 s delay.

I used an AI coding assistant to draft these patches and the changelogs;
I reviewed them and can answer for them.

[1] https://github.com/linux-surface/kernel/pull/181

Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
Changes in v3:
- New patch 1: keep the registers the driver programs out of the global
  register list (Sakari)
- Patch 2 (was 1): write the mode registers on power-on as before and
  from set_fmt()/set_selection() when the sensor is powered, instead of
  on every stream start; return -EBUSY for active format and crop
  changes while streaming (Sakari). Tested-by tags dropped, since the
  code changed
- Patch 3 (was 2): unchanged; the window offset vs
  V4L2_CTRL_FLAG_MODIFY_LAYOUT question from v1 is still open (Dan)
- Patch 4 (was 3): changelog updated for the new patch 2
- Link to v2: https://patch.msgid.link/20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com

Changes in v2:
- Patch 1: move ov5693_mode_configure() from ov5693_sensor_init() to
  ov5693_s_stream() rather than calling it in both, and shorten the
  commit message (Dan)
- Patch 1: Tested-by tags not carried over, since the code changed
- Patch 2: unchanged; whether to shift the window or to use
  V4L2_CTRL_FLAG_MODIFY_LAYOUT is still being discussed on v1, happy
  to switch if that is preferred (Dan)
- Patches 2 and 3: collected Reviewed-by and Tested-by tags
- Retested the series on the Surface Pro 5 (IPU3)
- Link to v1: https://patch.msgid.link/20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com

---
Marco Ziliani (4):
      media: i2c: ov5693: Keep driver-managed registers out of the global list
      media: i2c: ov5693: Write format and crop changes to a powered sensor
      media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
      media: i2c: ov5693: Use autosuspend when stopping the stream

 drivers/media/i2c/ov5693.c | 131 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 106 insertions(+), 25 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261027-ov5693-fixes-8ec29752893a

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>


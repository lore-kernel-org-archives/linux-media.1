Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266083;
	b=H/KUrbPwqMIizcLLag3gb1FTFTxbbt//oeotER66W6J3iCCztJXi0XNsWPWKAN7/OQFe
	 OWxONhKZGPtcAVYUQ60PycC6rWcF8iFhtLVyHh5adjA/txRWQIV8dHtBv9ctsYIZwQdw1
	 e8Dbf0PBYZRIOJfnhKTHKECu6vaHZTBiAAdLeK7srKXtFE790St95k3FgbNHEzvdV7AAe
	 MiVvS620zhQLW8Vhz3QF5YeK+8oP64Rsk0J+GszFJZb5yFZe8S0k0URKwRSGY9/NfOgp0
	 gMD1FE9yQRS2aaFCmIxWe9gI+vatWz7oPnmzj91JRaig1pHk1UQ8HKZ6n2eAU/8YLjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
	b=Sdbam21kPBU2BktnY21exUe1rL5v3fXlTqTPsXd4D7nc8LOa5eUYmyHFg9rhzl2ljcs7
	 D9PuLG8Ebo3FxL5Q9sibMFtplCYUYuFXwo7pWoJbnrmfeiChBQ00hpD5Q8arrwfRsz6fD
	 eY2IfXgiikpPEEZL59vwbOJY8XJ7TdeOtRW7E0UTQjG+mEdVs8kXivQ6um9FoioZqwJc/
	 kxN+3o6ByY7dpyA3VmdkTMOL0HbbCTGTRM9LNtWHRKDI3myBRLo3ijbD17jc/Em24NU30
	 ZNTVN04dzix2Zc4WIadYafsyG3/MJV+iITZgRn21wRknn7RchZCp+qP7E29wl2FLCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx0KOKVL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD012606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD012606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rx0KOKVL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22501785e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266081; x=1793870881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
        b=rx0KOKVLhXOLtgkh6gm5uFMNwfyeKaEo149+rYwz88BtAbZ8e3yPhQrXF1NTWVh0Op
         6TY6jVOclWcQrolsMh5kSjW9VNgK1PJ4MbQpX42ACCuI8kUL5W7gWpSHmitQy9i7dVe9
         uftGbXy+aQwN2hgmSkaZJb8fi6bxo37JMHp+4dwa5TmLIBUXiBcC11irG6AqbNv8hNJK
         BDhXTZXrLBlYa0ViSrm1sRInTYFIKrj27jaRbOS2e+cYF7biFWFO7qquAhFiLWGWRSpr
         G4e+H+hHQMZxz056vUVrvygzUOqlRtek7Eu8NmaMqVtOvbmLp+x/eGA9CXq+QvdMrEGu
         xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266081; x=1793870881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5zdr5q0MxiovcRnfzUe2SVTt891ZTRt93a2yHAzSjag=;
        b=1lNxR3+NDDXejMuA7XAWpFjABeIFeP9w/4Rcas5EjGafgQB6qyrMMX8hQsrlstNrxv
         UHfX4cGTEPFRNBEA4Aa0/KgTpLL3FEVr6NvBB9c9ZdaTk6r5JPBgYKBKFml4cbJFHi//
         7JWQvrPdUGzEbQv9HqWxnvqghqxmCMM3La2hJbk3Adq6E1ib5wqSQ7JzJXMQ+FTM0OxN
         sRacJFHbEZgEuzOjxpUtiSXNR1SbPFbitvmu1hEocMXpJD1eMz55e3dArwA6CC6Jl+MI
         XBw+txeMcklJ+ukT6bBuiG4dd88T5bhXdHTJAxSFtw+kbBpvgn1gvNcdHpF+cixReVc8
         +Jmg==
X-Gm-Message-State: AFq9FYIsmmvXzMCtnF7DMeVkehBKW/5FXR1WVZveYwNyK2QimZlwRCmQ
	2+uarW/kLyh9X1KJfWF4PxggE9GnztwntArrr5bGzY4ffMTvtfXpH1vR
X-Gm-Gg: AYBFou0Z/8AdgOQC/BdxKPs8UrseiRDaqNPDNN8ljyskNQt67dvz2JwvFAcuNDQhXi6
	qb2tcDfU2ZgVkZpCFhDinYRejvDsC7KG1ijNFtYR8KTdpeWe9k7+O9njafugg0OWgMWV1qHoV5K
	UGCt6wINQzMXUOwM7WEumlaw7Xw/kTdUEWM5VxdDDoJyy/N/LO4I+z9QZzKikgdCs6PSGeDanif
	0KKpiWIgh5aADcus2ZAXStq+h+bZs5XapyJwE0cSmCz5AXelOEqemy9n8iRiaEVEC2scUCu2jZo
	/DVWjkSgJdR/qNzPSPQ+W3gKaIGbnjazm2bIVLLiPbnBdX2hkIvc605nmhGM2wM2cPlhi6PR5qZ
	BjUtBHhx3fUt6aYCynuHAHrw28iEGYRP5ZLjrszZ8ITE0mI0iaB+d2GfGUgpC0PbEWElUg42bYi
	YX7t9iQoKjpu+u7NLq1joqcl2Tsc3/P1JGzb5/86g0Ezz7elD4q+dt2/gBKbC3HFj47F6yrBaft
	fA/BWCz0NJNIYIaiZ7uhIbM2uQgkDNUSE5/E/xV1nFOuBuWnHyn8xy3xQAabLJRK2wHlzcseR7T
	qE8TbNidpFPbxSl4RBMOoO9oW+p9WOvr4kFG5434+ykSGKu+/SYPQraHRNnHpDEotIEXB6ZsN0p
	8cxAYHmFOlDptQRSY49SWgRCwOx3sGRLGNe7SojLwB/fnY+uXuIsB0O9izv/Vx1fbZSJM
X-Received: by 2002:a05:600d:604d:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a966c3f65amr108419745e9.21.1793266080986;
        Thu, 29 Oct 2026 02:28:00 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:00 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Subject: [PATCH v2 0/3] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
Date: Thu, 29 Oct 2026 10:27:51 +0100
Message-Id: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBREf4XctTV9yMuV/2FYlHKFa4SaFhsN6
 b/b4trlycyZ2cCjI/RwLjZwGMiTXRLIQwFm0suIjIbEILmsBJc1s6GsWsVu9EbPGjSyrUvZtEp
 DUp4O9yAZ1+7H/tXf0ax5Izcm8qt1n/0viNz7Mx0E40yZRvdCo+Cn4TLOmh5HY2foYoxfC1YBg
 LoAAAA=
X-Change-ID: 20261027-ov5693-fixes-8ec29752893a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=2839;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=ZMe4p5t2dBD1+hxYPT90U/cvW5WSFutzIjG2Y7t8jxc=;
 b=ttIGzE4etY/Ud9k80UAK0aM7yjY2VE/UPFzCAVoLWFPTkRbm2HMK2Ad3n95MlggIP5h+1IX2e
 jP/jfMkDdIzDLgUG5d6ioLRCH6wKHKpodH6ifBe9zwHcN++3zAMhqaT
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

Three fixes for the ov5693, found while getting the front camera of the
Microsoft Surface Pro 5 (IPU3) to work, and since tested on IPU6 and
IPU4P Surfaces as well.

Patch 1 programs the mode registers on every stream start instead of
on runtime PM resume, so that a format change also reaches a sensor
that stays powered between streams. This is the ov5693 counterpart of
commit 4e1446ac169a ("media: i2c: ov8865: Program the sensor on stream
start").

Patch 2 keeps the reported SBGGR10 order when a single flip is enabled
at full resolution: each flip moves the Bayer phase by one column, so
the output window is shifted by one column when hflip XOR vflip.

Patch 3 drops the usage count at stream stop with
pm_runtime_put_autosuspend(), so that the autosuspend delay counts from
stream stop rather than from the last resume.

Patch 1 has been public and in testing in the linux-surface tree since
2026-10-23 [2]. Simon Kruse's active state conversion [1] made the same
change as part of a larger rework; he has since dropped it from his
patch and will rebase the conversion on top of this series.

Patches 1 and 2 were developed in the linux-surface tree and tested
there on a Surface Pro 5 (IPU3), a Surface Pro 7 (IPU4P) and a Surface
Pro 7+ and Pro 9 (IPU6); patch 3 follows a report by Dario Manresa in
the same thread [2]. The three patches as posted here have also been
run on a Surface Pro 7 (IPU4P) and a Surface Pro 9 (IPU6) there.

[1] https://lore.kernel.org/linux-media/20261027074933.21921-1-simon0x+git@proton.me/
[2] https://github.com/linux-surface/kernel/pull/181

Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
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
Marco Ziliani (3):
      media: i2c: ov5693: Program the mode registers on stream start
      media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
      media: i2c: ov5693: Use autosuspend when stopping the stream

 drivers/media/i2c/ov5693.c | 76 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 14 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261027-ov5693-fixes-8ec29752893a

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>


Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE839280A
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734550; cv=none; b=ExT7xCjicigTlSUioRN+KXgR17UoG+L+IGTgSaJLEOCvRDYulXBSvngtFml1ghbJd59h5DTN24/1Crd2DTyjesD2czRSJ+U3/G8fX4kdGqoa4+OSSqAJIt1YLo/W9f7toOo90kmXsmfSIj0VuKSG8jIodS9NN9HT2T48JFmn/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734550; c=relaxed/simple;
	bh=yEcp+Me78OHhlWQ5vW9tmGdDjUC7jxU3fU+l4qhE+IE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rjsgAlqZCwysX3PUiKuoc+Pgqs333UWfkypGfUbaUtK1Ztq5sJY5hFio5D6hBphSs1QcyImSfyRB7MK1AdiZcb0srFpIzFFxFZWnrIGOB+tPkXmvYmdMm1EKonPQQC8L5ANllhKSXtZVRKXkmXaI87OS6Z1+YfEWHqNEgDoDmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLGn7iOX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLGn7iOX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1054245a91.1
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787734548; x=1788339348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRNOe+tkDpyEAFO3nF0rYQvCgufKo2ppV32jtzFTGPk=;
        b=VLGn7iOXRYbxHQ28i73TLsWHuUi8WOpu/VoQmvEF8OkqbW3S1OvqViT5y8LkmCNW0d
         dO9qJdvBfNYp0OR8CklXdUOORD5q1PXrrdt0v9RlyKdm2NROw/OHbGfK8jawXI0NE2E7
         6hk9J2QMVzI727ms1D9CaU629M73vbej4hiBpvRNLyEBRxfwqNL6qmXqITwy5GBbTMH6
         3Ey2y0RPpHwBLET/j1RgFG8bWIyj854LIpWkgeiDEXQrLj/akA4bUA35BZuB213aw7Yr
         DGwgXvcoFFS9R2VYMp0HOU6CYbFE/4+MO7Y3szLchhE/CWlY6Ku5akjeRM4O4B5C+QQA
         G0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734548; x=1788339348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRNOe+tkDpyEAFO3nF0rYQvCgufKo2ppV32jtzFTGPk=;
        b=IZDOzJupN0s9SyAR+7EmAsWINqkSZFkHpGF/jD1NukaWDilvAcF+lXo5W1MmJhVLwT
         kYhg4gG2fh4zciBij1RzHlhDX/90yU4v8a4qeYh2BO9h/leegZsN4465SW2+NTp57nWX
         K2h2wupkIBupDj+jwLfzAB4hcHnzSRsyNuUHzbqP5aR8HU/vysyC04SV4pG7Ckly5300
         ItNf1EdmjPHg/KJB4c02+5jAZz6SGaRRiEel1mOitvdS0Ax7RxYv3RyUNdlMA020oIEt
         nYVBd2gmKakaZNbVhUMelKtnU4UO6iHdQ1T/X5xj2CXtjflUXQo/c+iHzodIlvwCPSKf
         zjXA==
X-Gm-Message-State: AFuF++myC3cW4x8YeahV+J3WJTdZfGVbT/092Pa4Ndm757WEGs0Y45N3
	lfo7auTKppSNnU19h2X2oIMx1qPtXbn51frYXQHB01wErGPRDnIw0u1q
X-Gm-Gg: AR+sD1117l0JJj3xX5zvAxWwAVN0OqlpvofP/oHHH0cM6mPIdRJE+i9famhDdYg8LNr
	1r+dk/Uj0seIsfrcmKJZxIRQVSuLNTJDTcrqqQNpSOE3HULKT+BI5T9uAL/EceH+LbBMnCV00/o
	GzmQrGIR/RgB/71dEAbOnL0W/ZOA/ew963cs6kYUM0ak8AL+DKLh1cCSJuZntxD5nQEbXrh5RrH
	Sk8+tHDxArOmduaaEyyvC8wslmqcDgQA2jyhMkeP5RuBiziLggNTEWxY0mJJY9qlWHTcRJBPMZC
	9mSfgC4PNDbtx7agDmmxWLSvFv+CDG3MpsWVLaKOTG4soVuKiwsnw/4XTLRPAhFT2Xeskxyy93V
	0yaeIcSjvCgv6PVybrEKUO+tIgZokrSNI4a/6qRslMSfcivcdUnl5knuVFTLjOxGaWvTe/6gh/A
	jo+wBJT/sYple50jo9EpppagXsss7jROa7o3oI+EPKC49FxscSFKfQZqNxpnHgP25lqMjyopXgn
	eE=
X-Received: by 2002:a17:90b:4b8b:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-3966d3d9581mr10830231a91.6.1787734547576;
        Wed, 26 Aug 2026 01:55:47 -0700 (PDT)
Received: from fa283618c643.. ([106.37.147.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d993d1sm6985362a91.15.2026.08.26.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:55:47 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: hverkuil+cisco@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	p.zabel@pengutronix.de,
	ezequiel@vanguardiasur.com.ar,
	mchehab+samsung@kernel.org,
	festevam@gmail.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after init sequence
Date: Wed, 26 Aug 2026 08:54:32 +0000
Message-Id: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RK3576 platform, after ov5645_global_init_setting completes and
before stream on, the CSI host reports a high rate of CRC errors:

  MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)

These errors occur exclusively in the window between init completion and
stream on. Once preview starts and the sensor outputs valid HS data, no
further CRC errors are observed.

Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
the power sequence to properly enter LP-11 during power-up. As part of
this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
0x02) from init through to s_stream. Reverting this commit resolves the
CRC errors, confirming it as the triggering change.

Restore the power-down state after init by appending { 0x3008, 0x42 } to
the end of ov5645_global_init_setting[]. This powers down the sensor core
after MIPI configuration is complete, while keeping the MIPI PHY active in
LP-11. The sensor is then woken up only at s_stream time.

This preserves all LP-11 compliance improvements from
commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
eliminating the CRC errors on RK3576.

Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
---
 drivers/media/i2c/ov5645.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index c772ef6e51d2..be85e0155b81 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3008, 0x02 },
 	{ OV5645_IO_MIPI_CTRL00, 0x40 },
 	{ OV5645_MIPI_CTRL00, 0x24 },
-	{ OV5645_PAD_OUTPUT00, 0x70 }
+	{ OV5645_PAD_OUTPUT00, 0x70 },
+	{ 0x3008, 0x42 }
 };
 
 static const struct reg_value ov5645_setting_sxga[] = {
-- 
2.34.1


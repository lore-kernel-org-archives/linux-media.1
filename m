Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19C43F4D5
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565520; cv=none; b=Y2gQy8+NoyrSQjTmQrH9JjHfik6du1wkBEl1pMmmnmL89grFVmFWjoaljjLcJ0aR37jaN66VDK9LCtGP9n27BeMQN8Q4u7RVFpK2/bYMzUT2vTelsxj9KEN9Eo+sQePtIqjGCXKSJj64j98BzCcZpDs8bEMW8jz2ffMr2OaEPbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565520; c=relaxed/simple;
	bh=8Fm3vEh+1dWQI8swqJhCYbgEM+cB8Zzx1PqOZJ4zxcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh+6h9xLJk+A9qgfqa91+B2EEWnZEtiMn//0+QNv0sL6AXICDpzmNJtsPJU9EDlgdgJjAUocFeDZc4Np/S2xOHLxPNNan3jgM1h/VdYhZuxZ3Ok6nfcXZITnIr8HtMi/mv5Y6cANhX2opHCE8uPgXjxV+HvVgzeBdd0IERUgEPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awUgsM9T; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awUgsM9T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so19164265e9.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565515; x=1785170315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpd1FFeABygMAE3RBVlHC8AOP8gSRlvHTu7ypo6aoKs=;
        b=awUgsM9Tp68B3xdqujmAURZzTARdEm+kuEFSDAQOy71H/UEgbuLSv5yTe665iRZv7H
         He7LO/wcdcAXI/HUktgban8tynshHkN4O7d/BBaVpUuq5lQebW/Y8skV7PSQVdGKo4hn
         G0QFpdIBV2+sQpjHQ/s6MxPigrsBFG/Z0uxBunUetS16E27LuzYVtjWkdpJhc8JIigBM
         OFUYMtPtONjB7VKgXhISu7tUyMBdZ76XT3dVZjfgYyyxUhZS8UkJgvQRD9kQW4TwFqPS
         3xegh16q2SWazK8PnKU61R9T6FUTDzHZyxnK2eDHmOaM2HXodO3WCfRwmC/SGFchIrk9
         6AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565515; x=1785170315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpd1FFeABygMAE3RBVlHC8AOP8gSRlvHTu7ypo6aoKs=;
        b=g7R4QNeFQErRuPnAz9xF/4lHYxgtGDbh4MTKSnOWlnvnMAw52MiUTwt/tlQ75aJkPV
         vS+8p4fNAE95IZKNeY79MmZI1+Kojd+am8X6BzemIiy3jLiI8/8H/Ty/ADB993O1tklA
         z0Qy2zuZwhfcSGLeeUPjR7ivDTo1pVjTxB4G+RWkRJeibiIA+k6xTR4khdWVljUwFPVQ
         jcbqzGmPEh/6pe110xi6onm3ZyOo3nBJEI5eBdOBp3lgtFNZaVjeyspqM0urath9rdP7
         SnoQjAygaozaS8aHtBUac51tl9wsb1UqBiqv3B5sHIXARFXUb160QKfGMkVfhg0AeA+0
         3zkw==
X-Forwarded-Encrypted: i=1; AHgh+RrDIC+9LPjSgRXbKmU2AY6UWmttS0YcWTsr82roZizBuTD4eqSRByvFASS5CkhEpbOrP14JyE0LzAyK0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkjC3Rwa0p0dR3zPZTU7KAkyftN3PKxNIBxrImHBvqmSLzqAv
	aa72fgKjtO1wZSN6b63D3dTnv6P9+i95KIGRr1YOg5LGhiS4fzdVd38e
X-Gm-Gg: AfdE7cmek/rq5ehd1+w9WHk+f6qJbmyAsq8FOVcXaN+I3kwizF+LJ8duDZ1H3pKXUrU
	2q8sRMZKbbvdl3vfr5ZDmDdXvMEDzMbaUHH3FFJYT84oKQbAQh4K6ONbNGC5JgMmq9deDrHx1Ps
	Y4oi8C428ZlWFqpHGudsa8zzRRPdonJcCTu89WMehXFQpPGQjklvIpBuKGrDY1aABPlKC5DtICN
	4w/jqazmDOKwkzNSybB1HkwHLOcxBZU5hKUVSy2fXggLroK4l3xnoIJzkAOC+kYtR4IylBW1vNL
	WzHW51RX6SWYzkbQq/3KrFxGpLkR/ziIGqlcpC5hTTfCAGI5UNDx36GIUtIcoTC6avY51tC0lDK
	5qt5sjIhQnhAwm9IrGdHl/u6+Hsb1lqHQiYzL4S8EZNOh4toYdXuHjFz5nLNFR+sVGXjN4HduQJ
	XjHHzz6gF9ZX0s+R9S5plnn683FiQ=
X-Received: by 2002:a05:600c:e558:20b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-4955cda5441mr50515775e9.16.1784565515124;
        Mon, 20 Jul 2026 09:38:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373608sm2105325e9.6.2026.07.20.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:38:34 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v3 3/4] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Mon, 20 Jul 2026 18:38:18 +0200
Message-ID: <20260720163819.104130-4-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163819.104130-1-fernandorimoli11@gmail.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
power-on default (free-running MIPI clock). The IPU3 CSI-2 receiver
tolerates this, but the IPU6 receiver (e.g. on Microsoft Surface Pro 8/9
and Surface Go 4) fails to lock onto the link, so the sensor streams but
capture times out with "stream stop time out" and no frames arrive.

Parse the "clock-noncontinuous" endpoint property (which sets the
V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
the clock lane while idle (bit 5) and keep the bus in LP11 (bit 2) at
stream on, matching the approach ov5647 already uses for the same
register. When the flag is absent the register is left at its reset
default, so IPU3 and other users are unaffected.

Gating the clock lane was determined to be necessary and sufficient by
sweeping the register at runtime on a Surface Pro 9 (IPU6): every value
with bit 5 set streams (300/300 frames, steady 28 fps), every value with
bit 5 clear fails with the CSI-2 timeout; register read-back confirmed
the power-on default is 0x00. Bit 2 (bus idle in LP11) is set as well,
matching ov5640's value. Note that unlike ov5647 the line-sync bit
(bit 4) is deliberately not set: adding it collapses the IPU6 stream to
a couple of frames, so this value differs from ov5647's - the IPU6 D-PHY
behaves differently, consistent with these settings being PHY-specific.

The "clock-noncontinuous" property is supplied by the ipu-bridge for the
affected IPU6 variants in a subsequent patch.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm>
---
 drivers/media/i2c/ov5693.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 02236f3db..5468e89d6 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -35,6 +35,14 @@
 #define OV5693_STOP_STREAMING			0x00
 #define OV5693_SW_RESET				0x01
 
+/* MIPI transmitter control */
+#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
+/* bit 5: gate the clock lane when idle; bit 2: keep the bus in LP11 when idle */
+#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
+#define OV5693_MIPI_CTRL00_BUS_IDLE		BIT(2)
+#define OV5693_MIPI_CTRL00_NCONT_CLOCK		(OV5693_MIPI_CTRL00_CLOCK_LANE_GATE | \
+						 OV5693_MIPI_CTRL00_BUS_IDLE)
+
 #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
@@ -144,6 +152,9 @@ struct ov5693_device {
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
 	struct clk *xvclk;
 
+	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
+	bool clock_ncont;
+
 	struct ov5693_mode {
 		struct v4l2_rect crop;
 		struct v4l2_mbus_framefmt format;
@@ -611,6 +622,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
+	/*
+	 * When the CSI-2 link is configured for a non-continuous clock, gate
+	 * the MIPI clock lane while idle (bit 5) and keep the bus in LP11
+	 * (bit 2). The power-on default of MIPI_CTRL00 is 0x00 (free-running
+	 * clock): the IPU3 CSI-2 receiver tolerates that, but the IPU6 one
+	 * fails to lock onto the link and capture times out. Only touch the
+	 * register when the endpoint requests a non-continuous clock, leaving
+	 * the reset default in place otherwise.
+	 */
+	if (enable && ov5693->clock_ncont)
+		cci_write(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
+			  OV5693_MIPI_CTRL00_NCONT_CLOCK, &ret);
+
 	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
 		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
 		  &ret);
@@ -1259,6 +1283,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 		goto out_free_bus_cfg;
 	}
 
+	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
+			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
-- 
2.43.0


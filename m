Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16484A207A
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200359; cv=none; b=fOsUmbzB3EZUj2J2zPyTmhtvya/6NDiYUD/Dy6w9KNCX9kCbnYeQUJvgD5GHKgOXwy2D1RewVVuAKyy8uz30HDD970SQLVE6JM6Yy9qkj4iyw5lr3RZgmh/hUP0BEuNg4m+y+kYaNREKMZwzhk3LevBdYUXw2nqP/r7kVbm9waA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200359; c=relaxed/simple;
	bh=F/P/lDzBUQgAHm9DWr74x+YLUzXYIEkJzXHwbOSy83k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZSGj55EPzEtALLE66/AU6aB8Ud5y34QiWFZIlcBoYWrchR/M64AVIuSGIVbkyxOHmIsSRxH2RuR9cvywSrx5kjaum1BAz0PWhdP7NQgtHi/vXTPxhv8Aak/uLF1hgPsq62bSTiIOI3MB+FRxvIEQG6KJ6Je3e1kO4NQ+xCjIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwV6j+1i; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwV6j+1i"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso3374705e9.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200356; x=1788805156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tRCYYXXIwDhhRFCoMY7bivZyfHuyPHIYVD2obasJQk=;
        b=JwV6j+1i8zrLtPLTQzzp/oUcR57UYNmNIMdLlIkAlraAShJnaGzgewRGnI2C1sts3E
         H7W2ffFjIrkYj9WEfusK0rpfs00ZnSnZ3w+kOWCau3T3pdpE6aeJaABbQjaTD3MkPmil
         WvA6QvtfCoxTI7KOkC4m4c3fV63cPGwSxT5gZ2qyvu59YfYlMXEC5FDeACzzJQSmFUWs
         PMZrboG86KLd+Ugj5pxEwM5AqlQGbq+IPGhQhYfVK7dqzvisMrY2fG4gx9xVmvPhws+M
         odoM8nz6Gyh93ROJgK7FrJPRf+IrbiN3VwQ/golCOjGO+FbdAjxXbNn4lc11y79ubo+v
         YcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200356; x=1788805156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8tRCYYXXIwDhhRFCoMY7bivZyfHuyPHIYVD2obasJQk=;
        b=kJIXV2DXM0wZ6ouRh+yYy6ijkV4vZ8UPPAt3Uzb0oXXVghDwF9b1lFVnJOi9FqZNmJ
         LQz1qMcG+aAEbwm3laIzgzaUCAXwAHEY+7J7wRkt2MGA6+eZIT8B3zEuVJvhUje+BS1/
         OcmUranjvr95w4Y1kd7FAbqRU4FJd7eR5EAriRDKMkSj8/VTCn3aFJmheEPDLFwHf3la
         7g0CQeZocxHtfRbtHbxEsekz/tFaW8+KcIwUN98KEBYEXkqHmcr+ef67y9PYVz6jyPug
         TATM9ceWMYlY9GedfxV5EPl47usT+iuw+s3meqyX7wIam9hWTmNWnk7Hu1I6NvmZqkjK
         DN0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpWphcgKQ7lctj+oTADDMHtUll6O7kLUyuC0PIBw+Fy5qemjqf0TlBGmYaEV6l2amE0ZHtv29TusrXL2g==@vger.kernel.org
X-Gm-Message-State: AFuF++ntHiyoEMkmILgz8MVhhZmr3hj8AmJbkdnByEOGHID3Yxs1tj7W
	r9vp8pwDO7NOVBbz7nFzdlkzEkkIcYERCZHmnuvv+PPh9WGRclid+DLP
X-Gm-Gg: AR+sD12QlzGQi3bKTYOOjZmotCIpqhqBfphM5mdS/S7Fuz4UOwo0Z7I3vb6hEwzUYJk
	WAHxufNAc2f02ezY2OMjGzMYaYmHjrgiidYF62edI0/SVHObELmZvSiOzYKXYIYcaJIyKtsKOJf
	1qMWWXtUAOpm/rjgh1ePQsmB/a2frDPHlBEckiqYpuFp1MLM9oeyBqTajSFqYqJ6uGj2VQyC6Ks
	vTwHQm4XpnZNRL19uF89H2We7xMcF718jU8HqfvVL2U6zZeNoOoN1j7mXRAXiXiI+zQgaNxTPiM
	z2rUlZP7iwDYPr2fCSs1TJpdWq1av5rHkemne3WZP08HHQFN+gAVwuSfOyfORvUEV3cx15vX4eO
	vgVvIEIebwOBaRz5NmAuHAmLYT6Dno0ZQWMlg94El2NpRgE6JO5BB/Cc8r0Dsub13iRO+ka338V
	og1hhaO84M9CKU+BbxSx0/VODctRfrfx5fzJI7w6ctuRQrdf4c/5WzgIC7qM312jmszifUOBEDJ
	kqNQPxoQv4k
X-Received: by 2002:a05:600c:1d89:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49cdc43fc55mr45086345e9.7.1788200355447;
        Mon, 31 Aug 2026 11:19:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:15 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Mon, 31 Aug 2026 20:18:55 +0200
Message-ID: <20260831181858.325109-4-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
power-on default, which lets the MIPI clock run freely. The IPU3 CSI-2
receiver tolerates this, but the IPU6 receiver (e.g. on Microsoft
Surface Pro 8/9 and Surface Go 4) fails to lock onto the link, so the
sensor streams but capture times out with "stream stop time out" and no
frames arrive.

Parse the "clock-noncontinuous" endpoint property (which sets the
V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
the clock lane while idle at stream on. Bit 5 of MIPI_CTRL00 has the
same meaning here as in ov5647, which sets it for the same purpose.

Unlike ov5647, which owns the register across its own stream on and off,
this is a read-modify-write of the single gate bit: the ov5693 otherwise
never touches MIPI_CTRL00, so preserving the rest of it keeps every
platform that does not ask for a non-continuous clock bit-for-bit as it
was. No counterpart is needed at stream off, as the link is down by then
and the register returns to its default when the sensor is powered off.

The "clock-noncontinuous" property is supplied by the ipu-bridge for the
affected IPU6 variants in a subsequent patch.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/ov5693.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 02236f3db..cedc6ea03 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -35,6 +35,11 @@
 #define OV5693_STOP_STREAMING			0x00
 #define OV5693_SW_RESET				0x01
 
+/* MIPI transmitter control */
+#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
+/* Gate the clock lane when there is no packet to transmit */
+#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
+
 #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
@@ -144,6 +149,9 @@ struct ov5693_device {
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
 	struct clk *xvclk;
 
+	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
+	bool clock_ncont;
+
 	struct ov5693_mode {
 		struct v4l2_rect crop;
 		struct v4l2_mbus_framefmt format;
@@ -611,6 +619,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
+	/*
+	 * Gate the MIPI clock lane while idle if the CSI-2 link is configured
+	 * for a non-continuous clock. Only that bit is touched, and only in
+	 * that case, so the register keeps whatever the platform left in it
+	 * and the clock stays free-running as before everywhere else. It
+	 * needs no counterpart at stream off: the link is down by then, and
+	 * the register returns to its default when the sensor is powered off.
+	 */
+	if (enable && ov5693->clock_ncont)
+		cci_update_bits(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
+				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE,
+				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE, &ret);
+
 	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
 		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
 		  &ret);
@@ -1259,6 +1280,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 		goto out_free_bus_cfg;
 	}
 
+	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
+			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
-- 
2.43.0


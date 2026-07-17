Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F93FF1AC
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294449; cv=none; b=IDrj0NFq/yjRfaZHf9BROqOsQULhDMFW1k51jpBTfnSd8M2duUEMRCln/iI5X1w6qgFFYQdq2Ga+eydDVEf60l4SbaEIQqjvlSwjSYJkISjhXQ8HlAyK2sJ0OyW3rInNdVx4nEVWfmUK8cMT056W36NHjhCZJA2LhlbBVH3ax+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294449; c=relaxed/simple;
	bh=U+qahY3AlkhcURhCW/NVr4dCxakuA5lbXPbMigEdPqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqdaeU+u3a5MBfAa1j6djVODa9fCM+ZObMpa3fbAwc/NYzLKHYzmVsjpOGHYk3pTRG5JEE/EkaguR3z48az77xuDiCChma6fNXBJN2R3rV1nlXuaonG5mDpjtOknbGaE3RvwTZVt1Xw9suysw2Vu7FqlUpwaG4xhPB2AjNjA/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsvA9VuA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsvA9VuA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so55617615e9.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294445; x=1784899245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw3BtK6eUNlRAJfF8TSj15TJyapjmC9Be4lLIZ0NN9A=;
        b=GsvA9VuAmVk5merMoL9cBEpF4iZ29kwXxjEhzkVyeKneLOLLRXQDkGuYw/WRdN45A0
         KbfaThfPZ3IqenTj+M+o4HVMK3/a/jPJtdPbpE5DaY3ZB+GPd7MSso2AIdmpxYKxrfzA
         yvEG36uoTjE/VYMJsIX5dKqCuuuPrKEAkHpQwiGm+iUl9EssmY7jIJdHc5YuKBQc8L5v
         L+hOouI7WE6woc+vkSbTmjcMn0iJgf0tv1PO3shN2ODdpXzbNIGKlVKOOe6Jr3dBlIbc
         EGDexxxSt6pXyOrVsyRPJA8wh9UCvJPEaonawEcgH9QCDAUWfMGCXiGStZFm9jVFMQWK
         kECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294445; x=1784899245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yw3BtK6eUNlRAJfF8TSj15TJyapjmC9Be4lLIZ0NN9A=;
        b=tHWMs0JA+/zbidHXEAyFLULEdmTekm4xQXJ2Br4FyurarxjthIiuaaDsx+/2t2QdK+
         6zyalaIB/AFtBDJNRwwtFEyfSsUaSVHEF+zUiUohpr0mfO2V60yPWdwJui7ZoSM0zdRo
         6AQzeuXaRVF2//x1BK7DuCbWpkBUWrbVkJOdz49EIzCFCJCGel0AACdOO2Ww2bHB0e0Y
         WYpVW9hnd0+AOsormSkgBe7wF+NpEAFwaw3FooTM60ySFLE9fkdCsNNtzaUM2iR8KwRS
         Ira+8f7t4INryT2+HurIopf2882cOQGtMDpI81BvsePehOS4fZwdu4ctm/eQ2gcZyjO6
         d9mQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqpByX7hJoNwi6bSFI7haMYQvvrerlxlbfIJEX6zY9SQqLcVlaoD0aG/OzSq1CrEMg4z+AN44vt10Z/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXAIkpefzLTQInNETbgE8L6kSxQMgefQEZcAG1xWFo4oM2yrLX
	rpgWOzIDcEYBCbQXBQimyq0Vo7EptSRsy97D3fk7OGaviZ9fTB0gpA5n
X-Gm-Gg: AfdE7cmV5slgyzAtO57iCDGdn/SA6SFxkYTWbnCz7H+pJnZS1WXGqaH6NyuESj9U5T+
	Jel5hOeABjgo9qgtmIT3TxdfasoUSOudhmiKTPHiDquV+wIzBGnELsYst3Taz/njnqGv97Xj/Q0
	EuofPjWvdgPa3IeFdA3xkASuS6u7jDiKFxFbKzxnCKpvksS5mFUg65F356/0ZDz1HmVL89UlUdU
	lrhEgU0CZ2nj5cDKjCRdMmsR1bDGzGcHQIXFd4P6mgL/huXitGCVKyyxYkw27wgGwQjJZLZNIC1
	gDH3sbHLbqxRPJb6Vs36EtVG2kuQPkBSBnyGx2nO5MVOAPaAjrQHBQAIwaL1Pg+9LVa6A4SKF5R
	gA1FkdP0R7mB9a3ZYUgxdBlvkGrx5tPoZt8RTkU/prmiPgFXHHhuIwkCkBR5YVpIKp/31fprmBZ
	GT4nJIagT49zUiliqUDXjwyejuSSc=
X-Received: by 2002:a05:600c:3553:b0:495:3f28:3f19 with SMTP id 5b1f17b1804b1-4954a508a24mr30327395e9.37.1784294444602;
        Fri, 17 Jul 2026 06:20:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:f8eb:f0df:1ea8:edb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2eddb8sm98841705e9.14.2026.07.17.06.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:44 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v2 3/3] media: i2c: ov5693: Gate the MIPI clock lane for IPU6
Date: Fri, 17 Jul 2026 15:20:21 +0200
Message-ID: <20260717132021.18034-4-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717132021.18034-1-fernandorimoli11@gmail.com>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
 <20260717132021.18034-1-fernandorimoli11@gmail.com>
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

Gating the clock lane when idle (MIPI_CTRL00 bit 5) makes the IPU6
receiver lock. This was determined by sweeping the register on a Surface
Pro 9 (IPU6): every value with bit 5 set streams (300/300 frames, steady
28 fps), every value with bit 5 clear fails with the CSI-2 timeout;
register read-back confirmed the power-on default is 0x00. Bit 5 is the
conventional OmniVision clock-lane-gate setting (ov5640, ov5647 and
ov5648 all set it on every platform), so it is not an IPU6-specific hack.
Bit 2 (bus idle in LP11) is set as well, matching ov5640's value; this
was tested only on IPU6.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/ov5693.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 02236f3db..d1b38348e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -35,6 +35,12 @@
 #define OV5693_STOP_STREAMING			0x00
 #define OV5693_SW_RESET				0x01
 
+/* MIPI transmitter control */
+#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
+/* bit 5: gate the clock lane when idle; bit 2: keep the bus in LP11 when idle */
+#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
+#define OV5693_MIPI_CTRL00_BUS_IDLE		BIT(2)
+
 #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
@@ -611,6 +617,20 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
+	/*
+	 * Gate the MIPI clock lane when idle. The power-on default of
+	 * MIPI_CTRL00 is 0x00 (free-running clock), which the IPU3 CSI-2
+	 * receiver tolerates but the IPU6 one does not: it fails to lock onto
+	 * the link and capture times out. Gating the clock lane (bit 5) is
+	 * required for IPU6 and is the conventional setting for OmniVision
+	 * sensors (cf. ov5640, ov5647, ov5648); also keep the bus in LP11 when
+	 * idle (bit 2). Harmless on IPU3.
+	 */
+	if (enable)
+		cci_write(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
+			  OV5693_MIPI_CTRL00_CLOCK_LANE_GATE |
+			  OV5693_MIPI_CTRL00_BUS_IDLE, &ret);
+
 	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
 		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
 		  &ret);
-- 
2.43.0


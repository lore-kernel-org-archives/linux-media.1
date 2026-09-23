Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB4D53E2FE
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175174; cv=none; b=uFFUg/kalw4r0yaY5xXKwWoPvLhiURpQPKXEHcL+w1Hk6PR5q2+9Hkp26UnZOUGWTksWnkYGsv6MB7s0k/X986fmqlkT3IjSbe5QBvzKKUf5u7O+q4208FqAVTQsVJimLpdzLO3YvmFayWmH2uPBcfuKQwFm7HhylXHrX7BH6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175174; c=relaxed/simple;
	bh=GCJCQzce5DiM5qYStXL0Q3uMZ491Exb+QH/XNbI6OUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0pyK6N3+J5y050A17EbEWI4mm3vv8YDmulH4tNSzVp40pO3T2n5LMpdmNqWMUCosjBsUC/uV5qAumX6CcZ8yd3P+jjs5C26naEVWvTxT3GHAf3NUm1scTv/12yzbAWspCzitd/FN2VDFkxNn4Nc+TQwOGF/amSnHT8ikBoA3ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfpPCwOC; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfpPCwOC"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so15619597b3.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175168; x=1790779968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQxUkaSVOKcYNkgbiO5qE5fns00cj/jkq6VJz32ZsPk=;
        b=AfpPCwOCK069mzi1Hi8LCSjEFDHyCQkV1o39dsghzNRde/X/gmNePbTuXe0uBd5wG8
         3ZtqtKnAVcJ8Ffl7F3hHLoa1F/XQkHxgKUTNNqTWBqlXZW8jG+i0z0KAUPh7EsaGyrDC
         /JmlEPpH0y+97Rx3P/VrjOu8oMaZ1H3tdHyTuAIFOLecU5x2FZQTGEZojPOHbZpCop89
         JYcLQWxYx8vjV8UKWVNHPfUCXAm4MSCIwXDO7wbi6gVzKIeRirwuee43wRRIRyi5GbEw
         NOO1y51lIMNEkiio1uGDXAZW8vEmG2e/carhLh/uEd28EoN7yxtDVY8JglPrDbBGo7tu
         wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175168; x=1790779968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQxUkaSVOKcYNkgbiO5qE5fns00cj/jkq6VJz32ZsPk=;
        b=RE6969v/hXZ/DhK1f3/Joy5HDGRNmGUUnhgHU/W+tCfFF/XtoWosZhHzkKG2vccHIi
         H467Q+e9B4fDHaCGOr+6JFCElXM0eFThFebQHxTExCP/FseQTvlyKd+FfMYyWgSDE7co
         8Lc2cI7VGieOXocAqVqC/vArJYf7qhdoffDH5epzUeKCNLB+UFnCOkQOBkz2W1+pqeZ9
         iUfNBrDsSvzJDBNz9OGQjmQRmO7vOPmKeuFOtTX7iVvLFl4d/6gGOEx+AwVeZ0Y0QRYh
         FGMixoRFDPb12StP/Z8aDRnUQCT+yHJ19tGNysON6i1BnlP4xBJgIDZzuVL3pqouL3M3
         j3TQ==
X-Gm-Message-State: AFuF++n5fw3FgJ5BDvd9WI/kJzdvfyjsmP6AlEG8S8WWzuaRpDng01rF
	Ug2G4wVURZULgE8jOUjpGGQ57wpDBtUhwVhAKovDySjrA4ble3lbS7/6y1ZLz3wE
X-Gm-Gg: AYBFou2ZFUwEy524TXVCAoyur4pEOADO+7Wp+qB+5osna1N2KywICqXgvqtLdHqnZzq
	IJ/5PVFC6rPAgjYr9jkB1R+4NVITdtgErpI7lf5+wH0DLSh/VSNv4zRaXUlNCQjQ9L0zzOKvhja
	T7j+XuePw2zyK0iK72kVuOHlftwQhXchaVirSwt50n4L1Fp7/Hv+D5uyPkmC5Naqmm70krxWtJo
	y/QFoH/FJTkXtvcqs64KLNayp5p5R9+9ikoKcLRs9QJLB49QPDeAPOSsCdsCqFEJDwwHa9l+TB3
	f61njn/DmZuGp2SRZ1EgCdVNS8DZbJm5AEqWZQiQdDFXaXYgy+mmXssChi+AkQtcOVdzBxLxGei
	DTK26iAHZDPzAL9M8Xy3kjhW7FhXQ2ivLqIyBP//elmkfcTG7G3CP7mDHEO1uKWM0EAkeK53Ccj
	FY1be00CjJrE4jI7ALfqEvwv2Ur8zRbRmkxjTsJ0oaO37E0xlsfqnQ9nEqpnGhxYuFvWumf+A=
X-Received: by 2002:a05:690c:e3cd:b0:81f:238a:1709 with SMTP id 00721157ae682-8a45afa5cfcmr14471707b3.34.1790175167674;
        Wed, 23 Sep 2026 07:52:47 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466bc4ce0sm10314207b3.45.2026.09.23.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:52:47 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galaxy Book3 Pro
Date: Wed, 23 Sep 2026 11:52:19 -0300
Message-ID: <20260923145219.177368-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy Book3 Pro (960XFG) has the same problem as the
Galaxy Book3 Ultra (960XFH): its OV02C10 sensor is mounted upside-down,
but neither the SSDB nor the _PLD reports the 180 degree rotation, so
ipu_bridge_parse_rotation() assigns a "rotation" property of 0 to the
sensor fwnode and the image is rendered upside-down in userspace.

Add a DMI quirk entry for this laptop so that the sensor fwnode gets a
"rotation" property of 180 and userspace (e.g. libcamera) can
compensate.

The DMI strings (sys_vendor "SAMSUNG ELECTRONICS CO., LTD.",
product_name "960XFG") and the upside-down image come from a report
against the ov02c10 26 MHz clock series.

Reported-by: Mars-Wave <tmorolias@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260922063507.690-1-tmorolias@gmail.com/
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 77257311d..8fab2f9d3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -241,6 +241,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		/* Samsung Galaxy Book3 Pro */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960XFG"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 

base-commit: 0c795849fd70d6bdb99aea5dd08d9b43128612f6
-- 
2.55.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE834A090E
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289507; cv=none; b=Gf87mYVzERn4/eG2pxNJKEEIABJIjNvmSb4V5s5o1ViEXK77erteKP++dTDNi8aXmUa6YRge4RfTeUceETcIyu5c8vrVUOpOZfi/8yYglUxKD/ad1yfSPUnzyON0zw0LODtjdICTbbVHmwHugN7KlSi12jbIMw03uCmtClvy+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289507; c=relaxed/simple;
	bh=nDjXt+isRGGooTXCaWuWnqb5pe5EC5+ZCK79Vbzm3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk2uvk4pvBQLoHP0BGgv8swtX4Etm/vaF4dCH/RexqI0Qt8MriiPSfZNVVDCKTUp57w/qHOdu3WItAMfuPcNsMmuKHLNa4xvXmq3ZhLn5Nwah41hSvdqBl35PjZ7X+8eIJq5w6iIGHwEX2rv5RLsfCBl8yjo6/UGJCPhu/74t1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAPAKvoO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAPAKvoO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11339245e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289501; x=1788894301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=VAPAKvoO/35OJ6n8acq4ug0stbVi6OU9nMKmG7D6AhbTApYIVnn+BscTgcnRFXl+Bp
         lsOLHSe5ZGxYAyM1EQ+q5fHQOcA4v/jDkiwDosqiPysfuarteUUxlk8i2sHvPg+FlISe
         c2MrEydCC3zoKcQ7kGQVjA2CxgmVF4TmOekYi//rM9PTSNtdGAAUiPTVSieaoTO0BRlQ
         qj1wlJwAMgIZkyGI+wd198Q6MPEHoSdGcD16EtmdldbkbBgYWHvR3t1WJzSxH59NWDjQ
         svdGy1t3pPfO8S9ny1NcLV/SYGEgdeFrGbtiK1ukmuQ0N7QarwjsrepyFNIdqu6rtR0u
         TsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289501; x=1788894301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=OUdVlyooKkhsETGaBObWKDxDibyZNy161NCg1PVoi6AiDhKe7SjZ8oKV/SFLndSSXF
         pPHHS4vC3Kfq6iFXA352VanEwHGAQunBO59BqvmZU/H8QTfBKFhT4L9dkdo+SD8E6yGX
         CP8xdPFWjMIOX1Q/y0Epr8fJw1DPxclLDxP28zzWhXotdrE5c6rb5hE6ZVbjfSdIL4z+
         aZ8++gVPJmShQapbX5nADuU0+CFDu5epotcAby6AtgBrEX5o208JHRQQaH2uVIPaidSX
         YtNtAzmPbS7TN+qYA5CTFzqXSnHbYq1iWzWec6OzHctjoh9JDxXYNZ0yS20jMnkUjoOg
         sedg==
X-Forwarded-Encrypted: i=1; AHgh+RqIavZUQrbSbFqPuM+ypFb4D51VFhCfEgGu+rJJcbBVKfAl2hjE0AhOAAnWr4RMCUiIj0cwP7Um0DhVjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nSTwD7YQu3webJj5UWMHeGniKaC6etwD3I9sdnZEwhFEwYB1XJ
	reiilVKLOeC0uEdpx8K+vpdwy/cWNe7KcwKb8jVOP/ZT/5UniNt5Y3xf
X-Gm-Gg: AR+sD13jtpbZGnRkfwxSvNXkTYzrX4KfFfZCpQKe3vSdn+uz5YVQzzQs3CfOiDrp2Pt
	ie0kWtjLSxCW94GSevXKBUQghJAat2cqy0eMJJuTmewmxU8Fd25AAdI9FWsuWUm1Fl6OiIvLM5K
	miPGmGxC0EDjEN51o5eq3gpGuR/izHvaNDVz7bbcenbizbmuEzMi+LsL72LO4unkEeqQC8s4q5e
	973NDfxYc8dUEZRdMft5ofIv0rHD4MwJbRYthUIdaG0zLeyrC/WY3Kaxf+L28AuDt1Gze9HLal0
	nG1/Z9ypk+bh4LAogrmOTVuQbovoF5bN3cRq3RrgBol7UmM/VJby6HDv3n7LILEOrJthaUKcPPB
	PDQN9voM0TxX0XUtktJZwKPL8Jeow3SGV7xgKBa4DhvlZ15F1Boh5Pon6lgh5j63N4QR3JNsH40
	9mAJWalq8aau4Cswr05GTX+L5kVVr3rKPZLdhZWZPtGnMV4EF2g8+ik9iJlPwB5qzMTnuAcDVPH
	z6nuJB+33iHb/Ud+Dj2nMH+qBuRVNdWP6MPKEwdq9qUZN4zfMNX
X-Received: by 2002:a05:600c:468d:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cdd418c7cmr99313195e9.5.1788289500861;
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Tue,  1 Sep 2026 21:04:32 +0200
Message-ID: <11cf61a4fbbed4307800cf8a89632b2efff88ce8.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..5cd285fab742 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -209,7 +210,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -288,18 +289,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -310,6 +311,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-- 
2.53.0


Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A283A37E5DF
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199289; cv=none; b=WzEw3vEwu94sfL4cxpfyDi8isqymikm3YvUy3q7yhfmHt2Ab7P0nPYdRWH+SdbQ8ugbfsUn3V+nsy6IMWboMU3e2VDA3FtTOK95i6KAm3VMpDGmAAXciLnE057GiPuRb+SlanUZq+IRaKedw9m+3yq57bSrkxffU72porQL73Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199289; c=relaxed/simple;
	bh=h2djYmdDBd/cXc4zcDpBPE6FucNuXDVdHsk049Ec1gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5jqwUx0LNa0fDAZSAG0OdHcpmklOONrPHBuqYQrl2PdZOAFVyFPulhXyDfDVseWcYOnfF2ZtKk+PzqOipO4+mn1QyPMAcBokuBpFb4JEs6c4uSSZ59EVAnUXPpHpje26q/MhpH68QBrjNWLadvuDNINy8bM3WYbtSjhlKE8TAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVArQX7a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVArQX7a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so140764f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199286; x=1788804086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=RVArQX7ailTpKk1SGTv5m4RxaeBf5S3SDA76x+ZvC4Z7OL8skR+390zrm41anJUl6A
         c1gTfiuoHXBDdg1K0vDCw9/EQGj1WJx7OJdHcScyeRpLMJMPFl5BwGs/1BBYHgFMDlQd
         KE5qXvpjM+2Mr2wY4rK4ntt0UGDvGRMGJk4SHSm9vZMV0t2oMTZQ+dYinn+GxEsj+fIn
         7oxpf+NT54ztgo7IcErCHba82ogrotESgFHt53OHRJSUjmC40pIZmMDhmWMYY+sOi1G9
         mbHNZHYeTiBYZyB7I8U0OnCv2zSvcqtv4StzRIKih2otLyco0rb9VF32RpGnTcYz5CTe
         LTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199286; x=1788804086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knnQOguAzItYyCz3/I9QK04AlsKpIBVpLAZp0UuJLCg=;
        b=AjJMH6Xsw5049rrSd8N5Ns3PM3IxSf6+QJh7QaKrWaT7ZSdkBQwEVKZLZR8EvIsKX9
         JpEyS5Vr/A6yG0NI81sqdBkGQMEb3lKnAorYtQn4/jqvL+5nApQp5Hw4j6cQWGqJEp7s
         bX6AD9qiQ2LgrFk1cVuNWmZEq9w5Z94mGdZUYqL2plcjinxMk2KP02ClVHDZ6NGoLp1z
         g6n5+5Z0ayUzQKJUKMDI2aDgMtjjbvePuRnybTs2BZ2jEtIEpJHAF9eNng9MyrKZqEiI
         u4cvzwWmi6o3wSjGuLD8yUn1eu9S2yjMYRMJX0Dt2cP6bpIfYmONhib8vAjXruUhc0YH
         GTHw==
X-Gm-Message-State: AFuF++nKqc2HA2U8+HJNQxBiU6uKA7WIWLwdVWt0vu0qGtURO/noyNfh
	Etpi9n3zGoSNUWQLvyl6BGkBMtSrGCBn3ulQQ9IBGlpH0KLDUvDq/ezsJNTu6BAaS+o=
X-Gm-Gg: AYBFou0hWIjmRgiQN+7Y1EYTMLLxtj/nz2eqt/OPE2r89ePaWKzdKhjahDod/JeJy7P
	P5YqMcfmajDqsI2/bVgwU66DlHh5G7adQ0HyqveR5W04i5mBmapSXo0QNYiKIm7dMmdgi4bhBeG
	/PxQPPkLtuqWZlH9MT+PCzgpyPu3xy+YngeHTnmU/VnnHBMfAtlUxIDphpQBQZOPYME+sQPBIVa
	VpWt7nx/kj9t6bf1Ns4o6qXM92rlpgNl8RX2OdwbQuyHSljlco7pzgAQg/xTeQWzcotZWamTf9V
	/CjZmo7CydDUDzF+pglUdDdD8ERpSFWixU52HGtu1WGt61YLKxYs7Fp93WUyvguAafnn+f9LtXR
	uUW6ofL7ln5rpwdpCgFMwvFJVC+aa/RxI95FxMRPG8Uhaasuk4ZzeTjZjgxvyyY/F1cRo5iSqju
	RfCxZyG2/NG2XkXYz4NMeX12tppZERyl2+stg4OXEPo3oh8aj8psc9tj4PzWLC+whIEHseKz8lf
	C5r3GBTQTswPVEvLJGOVFzzt3XXdnKWKiUV48aNp78=
X-Received: by 2002:a05:6000:4812:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-48441fc0e81mr141904f8f.3.1788199285576;
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:25 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Mon, 31 Aug 2026 20:00:55 +0200
Message-ID: <20260831180101.3109854-11-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano


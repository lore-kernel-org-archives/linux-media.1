Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267987;
	b=mQP8X83rcJj98XxhimaIlL2QGLN5fb76Qjl6yQ6LhcLUXNIXHHGRIYa9MDbYilPyRvcd
	 EhZfVNbeaNUMSwgpI2KiGVxi7Amw/s5e9QYWkFc8XNk5enSRohJhh4ur6NdlMx9rJ7osj
	 zFNOwL3+nfimcvc4IodsXDYtUDWdYLsgQAyFfC3cp6Jri7OD4EWX2lQ65oIKUWOGwPGgs
	 Rxp+PKZXSF1UbdpIfWlaQFmZgKg8e/Clfe3fIr55kdCuKMJVYOcXBEQ8L+jBd2BwGyHLU
	 PKqGH4lfQTN05hE2chX14pPM7pFPOeknHGFmQv1fLTyKyhkBjCGzh1T2KxfIbYqy7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
	b=rB4m04Xn3awAFd+fpYDXTgy6DQN7UsNG/Jn6vS187h2Ol+4X1femdR+9fS5NVU/GVFlc
	 XtmPzeLEHycm6L/N0ciqof8H0GkPz1YFX9SFC1XqKRnsPR8GKAMyVTKChgZgTgTrNXC+a
	 UwCJFpAA0YlsMwJ6vGNXHXupD36ln4b7dAcO2lzD66ET7B9IWVOAYtIIgXTF7IFC20gui
	 msFEoIFtUpQfOe+AOzFjb4qeo/FroKDE/nWRUt3rQNElfidCW9fhEhmZNsh03/vUMiV/r
	 1nZgrqSkCH9Ros08SyOvLBwAjNU6Cu9/83JgM0xoiyfgO/POYdLQxoLWaaPPyhKXmIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGH1ZH0Z;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ABB606A68A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91ABB606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aGH1ZH0Z
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12687035e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267986; x=1795872786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=aGH1ZH0ZzOPWBWXFuyT4Ylfm+aYDNtA/NAOWD2F/qpWxWUeR3rLEFmcGT/QJ2Aul0N
         LUn8ur9LUGfOCiYCGaDJjmIW7TZdMVTWgPdqlahyjVnvtuaxgqA/UmNjBoankaeimi+X
         8oh+DLfW9Ezl/AagslQYytZyKefI9Qxr6mDuJSCZJJhexJPRmrt1a9h8tErGsbg/EuMh
         WR7TtjojMpwFsm94et36UMUExfjP+0L9a4gRRaFuWYeuOkLrExAG7DIWR2tLaxC+vmSJ
         1qNtiVOEywN8w882T9DNio6NCYVrzwF4HPXhh8hBk87CTXb0rJHStalSe6/O1XOr4R5Z
         ffOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267986; x=1795872786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COKVH5wZADoiDSOnu/wHJ1WRXeKgTfEOkipgkyGWzIU=;
        b=CYlmluKRTBG9h/zas5owjUQodfHYhe56IXO/+4xgXM3O156+IMlybyWSnmOKwceOIJ
         VoD5+ux2kDca505lg+nNU6Gaes1qhcptNv86AGlG/1SFF43yYcPUGqYDv3rKhSJTNKY/
         iGlddWrQS2IH5YEI9PrzXAwG8fKBORzocNJllpenGJJbfg7C8M5nCG1gJ1jg5iPwL1IK
         07n8DZ+ZjSKkWArfQV6r9NKkgirbbEkozcKftUjKQMdYnV/+NSUDHkQc+DQwKHeM5duI
         EzzK0pgVGj413tbgJJIPikBBuq9mSthZ+TBLovTYQmf/qJpMyx81s+m+Z5J4VVe1wpa/
         lZQQ==
X-Gm-Message-State: APuU4Z83eQDpxvbWXGiHlz329qWiLJstSLqwrFPEsUGIKTyttLxatFsc
	+wUHcwuw2y6Esvk3H40G6u4xC1VXf7WGBHJSiZts0dmSP0N/E+PdOO/vWt3i9A==
X-Gm-Gg: AZFdTZeQQB3RujJSn7ps5oLlVkHa8oFF0wp0X6vdml/fXm0q0/p1aZXwA6GxR6sNDv2
	DJw+3U3uYhqgjL+Ejooj1a7pkIaYi0x1806/sHoMUWEOW4qV7QH8ocDhd7lmq/HjRnKSSlYB22g
	rtjmX5Lcdyr/RdfPrMYNtsGdbUse4C6jsi4gVPqpfmSsZtv5h1uxZJyFcCTHHSIOfpYWBwK1Lnx
	Zxdkkpysd8b+CWbxGMtjNpPm1UKlBZx1jHpQ/zX9Y3Jg/HGCAyH5OGEu4IQ2v+nlD604v7bIEue
	NA9N6OdVvgWTvaWVJTRx+939uu+P4lfimNac/lgONEqq+5Vs6N/7Jf1HTB7UUy7aRx5UD4HXzHN
	3zAGJni4qPKTaWH0ScNniEHYOmqXNg3IO+sxNma4D26DoM2UwiwiZxLG8gqz5pZQGvvjH4xSKav
	gcoHQDgBLHp+AMsTEG6wiQMKlpxPIpFyUeUhFHj2f7BrrapKau7EiOxa6cZUcssLYv85kw9a+yF
	LwtSdgJ7oCD3dBJrkD6yNcx9JDOP4VsF7aVghdTHH6uO+h7KMpOGp0v5Fni5I4PS1APeKibvChA
	28YUGCGRAc+1JqgPy9uDO395vjvZ1ZiO060iHMudHQhG/JxnOzA3ZLiMZrB9b9++7HXYlGsLac9
	cNRHs2OzYrZlw
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr148396385e9.26.1795267985838;
        Sat, 21 Nov 2026 05:33:05 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:04 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 09/14] media: atomisp: Derive CSI-2 timing from the sensor link frequency
Date: Sat, 21 Nov 2026 14:31:39 +0100
Message-ID: <2070d23e030ce5ddb27402caa3672490e058b84d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 to avoid an arbitrary S32_MAX limit. Use
div64_s64() so 32-bit builds use the kernel division helper. Fall
back to the default timings when the frequency query or divisor is
invalid.

Sashiko identified the 32-bit division issue. Codex reproduced it
and drafted the division helper change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/X3S2EI4364O5ARJK5JLDHTTXCW6TPSLE/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 71df4ef62..f72fd0c3c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,9 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <linux/math64.h>
+
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -210,7 +213,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -220,7 +223,7 @@ atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
 		return def;
 
 	r = accinv * coeffs[1] * (500000000 >> LIMIT_SHIFT);
-	r /= mipi_freq >> LIMIT_SHIFT;
+	r = div64_s64(r, mipi_freq >> LIMIT_SHIFT);
 	r += accinv * coeffs[0];
 
 	return r;
@@ -289,18 +292,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
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
@@ -311,6 +314,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
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



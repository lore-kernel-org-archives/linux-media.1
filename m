Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650982;
	b=40i7mX8nQ6a1/ZxyThB/VoOAXj/w8Jqcf80t8KxIXyUHFnOb/NRY+xtTWIJcs96BznjR
	 mEKB9HjFn3rGjS28l/6tEHUmiXflX67OO5CF4/X5cw87WCSr7tapTHzQ4YeXDY+Lwy9Nw
	 HZIUhi52up3XybyfgGwSgv86OiqxFMxE5cocUgKDNvI8hCxiQFFBaY7h4P5s5KFL48GUu
	 uXq4vFTp3oldipSrtHakR5m64WQjwDIBU2MsbI0v/sBfJwxeAxBWL9eo3i1d/4Ymi06Fx
	 hURaJ/k5pICF4tBLX4u7heiFfNFpAVFdg0eqrOWD2a8CJD28zpzxe9SRe3bAf/c9khw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=Gx4a5PtxLdTskMqbqHdRE6WcTaLjJR+RWT06hGvA3x4=;
	b=xuC9B1sUEv0ebxtRFPtOL7yuxKxP/SknEIYhrSEVGYZXZa2pyW89YapGGUbgHmE7RGkM
	 hTxFpB46KBeWLO+2wZf4k/k0k/G84J/QY4glEdBiwWV6Y2c74iXfOEEXuTARA4RtFT75l
	 2C2G43hih4opE75e2o7oRXrO5y0S3QPy4lOwrBlM+/lL/lxThnF3bSC3QQJN4Ezy7LmZv
	 1bIIG239YQGSGIBWmMf0l848MbksQXCzkbftCjcU3VCLlYwJCJTvS0eFuQkh3cMXKTyHt
	 2ysJ2QoMjDG+e3vcmcNVCMNzPBWB2CmjV2SF4+94/h6lp+YkmuI2Rdi2oZeniEIcoNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=l1IxLRPC;
	arc=none smtp.remote-ip=84.16.66.170
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF05606A334
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 20:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF05606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=l1IxLRPC
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRx0r5wz1YT;
	Mon,  2 Nov 2026 21:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650972;
	bh=Gx4a5PtxLdTskMqbqHdRE6WcTaLjJR+RWT06hGvA3x4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l1IxLRPC1tRvaf0Tmzj/t236kJyMBy8xSGm66UigBSImAQXRDIbyliNNfwCHvlXQe
	 h0h2RA5b7L8sAaEteNbe1MeUMP5Id64lJUzDiSCVz/z7A3tz7uoj7dDq70Osf3FgVO
	 gMLBzx/BH4EaLQsFbjz40gKtxlQjS3pfr11yqdbO6BjuqYHzaRBemC6DH8y7C8AOKR
	 Od9k+WpA2H44+yjgTHWMGAHMjAvSeluFEVFfciENimowbLZO7ZLPsFI6v+vg/zek6H
	 MH0kkS+iYVNqtyLuHA4RFXYE9k/UHBcYU/wW6JdG4Itf1S18KHlagHi3rEigW1asAA
	 HoecJfIkQb5sQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRw0t20zqRZ;
	Mon,  2 Nov 2026 21:22:52 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:22:43 +0100
Subject: [PATCH v2 2/3] media: rockchip: rkcif: add support for GREY and
 Y10 formats
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
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-2-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
VICAP didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 53e62d0597648..4e172366f258c 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -95,6 +95,26 @@ static const struct rkcif_output_fmt mipi_out_fmts[] = {
 			.type = RKCIF_MIPI_TYPE_RAW8,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
 	/* RGB formats */
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
@@ -341,6 +361,12 @@ static const struct rkcif_input_fmt mipi_in_fmts[] = {
 	{
 		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
 	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+	},
 	/* RGB formats */
 	{
 		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0


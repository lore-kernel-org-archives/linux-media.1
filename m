Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE6945041B;
	Wed, 19 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138121; cv=none; b=g3Fi24uWD8WFjiWbijQwLXidLx4715eIuvwXMbQ0ZI9HDblQGURHVa4GldXisHdjSYEK+oRvwoGtyLZetPp6jT6QQJU9Bi7yQ89CyvkzZS0Dct+iCUbxJjARvLelBFwdPXlsIh3kNY1zzaOtwhF3tfJ4PqNisFX+kZSmsvMwHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138121; c=relaxed/simple;
	bh=xc0cf13jFyBfsIO79ejm33A3wvYaoGdkvUOpl+oIVs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5IoDxt3zZxuTWrONa25V90vHsyvZImvvaGppi262ONATGTbTicbMcax9tK9aPEmaq/6Oba3McnLiCAbWmyc4FX3NrNzB0iT0ILjbeJso35k8b+sc/B8v9YWuWs1oZIX2PQd7OMT6bGEsRQTdxZmI1n47WCv7U5niti0F78ygpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 115AE20240D;
	Wed, 19 Aug 2026 13:05:18 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRc-2m;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2l4X;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:35 +0200
Subject: [PATCH 6/7] media: verisilicon: Enforce a minimum sizeimage for
 the JPEG decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rk3588-jpegdec-v1-6-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=3156;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=M4825LiLv/KbiKqUXpMLG6Q5hDE5v3ila/71BoMl6bA=;
 b=7IE47SAdua7MiX5F+haXrSfXYWiLdoIjMFNXtNEwjOskmBtoCeMc4mymC/V1B2ypfl1hDHdZa
 07GEXwdJJ+pA+u33NLBvTV0GK8J+NiowhmrcWrwo2mBdkmRFAqPf99M
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Lucas Sinn <lucas.sinn@wolfvision.net>

The VPU720 JPEG decoder is driven like a stateful decoder: userspace
hands it a whole frame per source buffer and never looks inside the
bitstream, so it has no way of knowing how large a frame can get.
GStreamer picks a source buffer size of its own, which is large enough at
low resolutions and too small once the resolution grows.

A frame that does not fit is lost.  There is no way to report a partially
consumed buffer, so the driver can only refuse it;
rockchip_vpu720_jpeg_dec_run() notices by finding no EOI marker at the end
of the payload and returns -EINVAL.  Every frame then fails, which is a
poor way to tell an application that its buffers are too small.

For coded formats hantro_try_fmt() computes the worst case frame size and
uses it only when the application asks for zero.  Use it as a lower bound
for the JPEG decoder instead, so an application that asks for less gets
buffers that can hold any frame of the negotiated resolution.  The other
codecs are stateless, userspace parses the bitstream itself and knows the
frame sizes, so they keep the existing behaviour.

This is not free.  max_depth is 2 for V4L2_PIX_FMT_JPEG, so a 1080p source
buffer cannot be smaller than 4 MiB and a 4K one not smaller than 16 MiB,
while a typical JPEG frame is an order of magnitude below that.  The
alternative is to let userspace keep its own size and take the decode
failures, which is worse in practice.

Signed-off-by: Lucas Sinn <lucas.sinn@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index b9b1848e43b30..156d0c5453e5a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,26 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_av1_mv_size(pix_mp->width,
 						   pix_mp->height);
-	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+	} else {
+		u32 sizeimage = fmt->header_size +
+				pix_mp->width * pix_mp->height * fmt->max_depth;
+
 		/*
 		 * For coded formats the application can specify
 		 * sizeimage. If the application passes a zero sizeimage,
 		 * let's default to the maximum frame size.
+		 *
+		 * The JPEG decoder is the exception. Applications drive it
+		 * without parsing the bitstream, so they cannot know how large
+		 * a frame gets and pick a size that works at low resolutions
+		 * and silently truncates frames further up. Treat the maximum
+		 * as a minimum there.
 		 */
-		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
-			pix_mp->width * pix_mp->height * fmt->max_depth;
+		if (fmt->codec_mode == HANTRO_MODE_JPEG_DEC)
+			pix_mp->plane_fmt[0].sizeimage =
+				max(pix_mp->plane_fmt[0].sizeimage, sizeimage);
+		else if (!pix_mp->plane_fmt[0].sizeimage)
+			pix_mp->plane_fmt[0].sizeimage = sizeimage;
 	}
 
 	return 0;

-- 
2.47.3


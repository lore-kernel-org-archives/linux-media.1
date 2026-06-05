Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D03D3CF4
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697308; cv=none; b=FVDBnDv7AS5dbZrAOBPfXSDmu9alhMJS9Pl52ePToIo35EsoUXJU52U30BOP+Yin1XiBPvGEnq+m1Ve7J35CwK340uIoLxrzZIzYPXRU/Mmiy29d43rubAtYeF/8wlQtGQhhTTMv091Wda2PrOfCDczMKstP1gnKkpUNHD9goNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697308; c=relaxed/simple;
	bh=gltwkq3brxXYPHfKtonHoQuzbxzFYrFy3iDCOXdvKfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4G2fEnYIvGxpdyIDa5b8ZVswRZ3cCmMDpTZhj+TLNsdRvWC4BsLxWdmQkL8tyRdH1CXVs8ewjuG31NItSTGKZLPgLWvw2T+2Llu09WPsMdno9LqpOKZWQx58gtUpkQZF9oYA3gqt8sN01iLZ8bXvBgOnlJ1uB+idtQIpPbYj5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci2-0000LW-0f; Sat, 06 Jun 2026 00:08:10 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:49 +0200
Subject: [PATCH 03/17] media: rockchip: rga: move early return into if
 condition in vidioc_enum_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-3-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Instead of a doing an early return when we don't have a capture device,
merge the condition with the following if condition. This improves
readability, as the condition now explicitly contains a check for a
capture device instead of returning when we don't have a capture device.

Also use the V4L2_TYPE_IS_CAPTURE helper and improve the comment.

The early return if was copied from the vivid drivers
vivid_enum_fmt_vid function.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index efe5541078214..8c03422d669cf 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -372,12 +372,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	if (ret != 0)
 		return ret;
 
-	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
-	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
-		return 0;
-
-	/* allow changing the quantization and xfer func for YUV formats */
-	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
+	/*
+	 * Allow changing the quantization and ycbcr_enc func for YUV formats
+	 * on the capture side for RGB -> YUV conversions.
+	 *
+	 * These flags are only relevant for capture devices.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
+	    v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
 		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
 			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
 

-- 
2.54.0


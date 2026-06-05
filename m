Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC43D3CFD
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697308; cv=none; b=mVp38r/CiPcyXPHQFFMSvvCEgdp22LuU18qcXO7AbAhLZOJLXPEA+RTCYlDT9SLKaesXmfL1t1hCBxrFJKlvejdGvuKGDbrfsD1Yl2QawiQFGqnGtofZkJdeVduuMMYNWzG7/XK8rtI3wv0fa+ZBV0OUjZNK3ZMi7tikR0q/FG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697308; c=relaxed/simple;
	bh=bXQht49bvYf9xLyh22jOVZ8etw4Eivx0tPanO1hKY24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB3oEYFbT3+6ZhoqgnfcUrCdyth8WDo8ptTNouaWQxP/Gf2Fs4vMX+lCaS+z/KFXuSr/G8v4We7Cu4Ok+AusUsK7ck7lwCpe5ZUYYmN5g8+K41ePJg4iSPExhA31CxBuJpwpisU6E0ByVNhDGZ2PUVyWFABZ82LvRJb+pi4FWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci0-0000LW-Uk; Sat, 06 Jun 2026 00:08:09 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:48 +0200
Subject: [PATCH 02/17] media: rockchip: rga: add comment about pixel
 alignment for YUV formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-2-3ec2b15675f7@pengutronix.de>
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

Add a comment to clarify the use of fixed step_height values for all YUV
formats. While the commit introducing the change already explains the
reasoning, add an explicit comment to improve the visibility of the
reasoning.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index bd0afd33affe4..efe5541078214 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -414,6 +414,16 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		.step_height = 1,
 	};
 
+	/*
+	 * Technically 4:2:2 YUV formats don't need a step_height of 2.
+	 * But for the RGA3 this is explicitly documented in  section 5.6.3
+	 * of the RK3588 TRM Part 2.
+	 * And the RGA2 vendor driver also checks that the height (and width)
+	 * is aligned to 2 when a YUV format is used.
+	 *
+	 * Therefore be safe and always align width and height to 2
+	 * when a YUV format is used.
+	 */
 	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
 		frmsize.step_width = 2;
 		frmsize.step_height = 2;

-- 
2.54.0


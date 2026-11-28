Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878924;
	b=md8rnzms/pCeWh5bVAVlHWc3qHTh1O2CqJdEjIdd1ta+hCHYrT/KL0eE2Ue9Hm5gCKZs
	 u3ehnf0FJ1N8tMFfzOHG6RAFdH62l5ym1g0gYuNe22UJMo5eltPSGQN9yX6NSjcpQFJjI
	 zVD2GA0MQ1Bm6gLYLNeP+qDXkVZivvCMzxOUdJPEA136gRN+g7iZ+paTmUxRReycX7PZV
	 ADvwx2lESQyGrqZayV6znz9JriPOwGMjbeZGPCIGIIcujxYP+ij4rjM8Atu9GT84aagqm
	 sMzRwkZu9tH1PzKLkbN2xs6nPx2iP1jiyAPBDj190bD7Hlz6bGIaazX24CzIBxIoJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878924;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=RMwrcgS+wttATcFdx3zdl218asDjD1J1a7yELE9y27Y=;
	b=PNFP2mZaFI9NkwlfJ8B1SGmq52rmdC4373YOi4ZFURS1IuoytRHXbkb/0jAchOb/vUvJ
	 8Ie/VV/XPagW8mveGgskv4TtvItWIKx/q2ivhvTwNmh2RM6Tt9wYNSDF278jJY6gDvnHC
	 ymwuAFHDgc1zfQUvqylU0Pv8X9NOV5uYXtEaD6uevvC/PCw7wc/ndAjCeMtVxJ+G54MCn
	 6GlZr2hzyBjdSjfFCLZ98jhqlK10S2XRZRyM9ymPSBz46psHwfdVqb8DFBIWAn5tvSaHW
	 xzEBHsYNdCOARr/MFf3DaEwCmiPKHdD/HtkZ3MK0JcpLdabozIQWA/b7ZTdCnmVMKWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="fThXE/kT";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CD606A31C;
	Sat, 28 Nov 2026 15:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fThXE/kT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=RMwrcgS+wttATcFdx3zdl218asDjD1J1a7yELE9y27Y=;
	b=fThXE/kTU1xGc2NNHoU4LAl1QiHMuxSJ2TCflVDqhOOC7zGFTi5GfI9CQcjsk3
	jFTLrApWgkGpSySqEC9LPW6Vtsmd+I1qVwUBEOdfAizFuJRxb6OFg7ahW2V5x5+c
	URJH+trDW21RetSdcobATd7HcvBjiF2Qg9jiLGKtWq/Yw=
Received: from linux-media-submit.eml (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXf6Dm7wprCW4xLA--.17027S2;
	Sat, 28 Nov 2026 23:14:46 +0800 (CST)
From: Sun Xiaoyi <sunxiaoyinjust@163.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
    Gerald Loacker <gerald.loacker@wolfvision.net>,
    Sakari Ailus <sakari.ailus@linux.intel.com>,
    Mauro Carvalho Chehab <mchehab@kernel.org>,
    stable@vger.kernel.org
Subject: [PATCH] media: i2c: imx415: Report the supported frame size in set_fmt
Date: Sat, 28 Nov 2026 23:13:01 +0800
Message-ID: <20261128151301.e2e2826046a249b1-1-sunxiaoyinjust@163.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDXf6Dm7wprCW4xLA--.17027S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1kCFyUGFWxKFyxWw48WFg_yoW8ZrWfpa
	yfArn0kr95XF48XF1DA3yjyas5Gwn5ArZFgrW3Aw18u3y5CFyjyr1UK34DZF4qkryrXr1Y
	gFW5Jr97ZFWq9rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYdgAUUUUU=
X-CM-SenderInfo: xvxq5xpdr1x0hmxv3qqrwthudrp/xtbC7waS1GsK7+bVbwAA39

The IMX415 driver enumerates a single frame size of 3864x2192 on its
source pad. However, imx415_set_format() copies the requested width and
height into the pad state. A request for 641x481 therefore succeeds,
and a subsequent G_FMT reports 641x481 for either TRY or ACTIVE.

Use the same pixel array dimensions as imx415_enum_frame_size() when
setting the pad format. This keeps the negotiated size consistent with
the only size the driver advertises.

For the test on my RK3568 board, I chose to compare the same eight
requests on the IMX415 source pad before and after the fix. The sensor
wiring and power configuration stayed the same.

Before the fix, TRY and ACTIVE both returned the requested dimensions
for all six requests with non-native sizes. With the fix, all eight
requests returned 3864x2192 with MEDIA_BUS_FMT_SGBRG10_1X10 in both
states.
G_FMT on two independently opened file handles confirmed the result.
Testing covered format negotiation only. No frames were captured.

Fixes: 14cd15e7a1e2 ("media: i2c: add imx415 cmos image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sun Xiaoyi <sunxiaoyinjust@163.com>
---
 drivers/media/i2c/imx415.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 7bb27bdf1446..31527794f846 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1029,8 +1029,8 @@ static int imx415_set_format(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
-	format->width = fmt->format.width;
-	format->height = fmt->format.height;
+	format->width = IMX415_PIXEL_ARRAY_WIDTH;
+	format->height = IMX415_PIXEL_ARRAY_HEIGHT;
 	format->code = MEDIA_BUS_FMT_SGBRG10_1X10;
 	format->field = V4L2_FIELD_NONE;
 	format->colorspace = V4L2_COLORSPACE_RAW;

base-commit: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046


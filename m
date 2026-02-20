Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC0C145;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575309; cv=none; b=JljVP66/GRbQawYh/6a2xwWXWgmdiX3CtHdsg3k5tOIwipw5um4dhUr8QTycjiyAudH4z8j2zbfUk9lZ6U+9uVVs7o6gKBxT1/RbJuRUqB6+92AowcR63KWwJNKT7cyp/k+uGnt7M7iL3yhk1UwTcVJOLnsFPIOlJJL30fEC4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575309; c=relaxed/simple;
	bh=jtkgWkJjHoviWzC1L3qi3r1Sfz0YtO2chH+woXl6s5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpBlJ8bKtoHNym2NHwgzjSfpr0Orsx1hMt7OJqeqICtxOqoPfgVYvScda1qBeSRfP7+3No+4j8/uoInzs1o8Pc4nl7SWG0JMBX9fwf7YlbZEJcgzeDdBWxFuiMq49t/Vuet6VEfQGIaCO2ituJ9H85CHZhLYQkAi9HcMLyv+2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPkTRKBI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPkTRKBI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A797C116D0;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771575309;
	bh=jtkgWkJjHoviWzC1L3qi3r1Sfz0YtO2chH+woXl6s5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jPkTRKBIdV8vbcuEUJHyULqSjI8oaWmDKLMP/Ibfi37LtwN9ix5QkJGbSiSHiOLxc
	 o0xj8L19NMDC5J3fRMHAwbwRsGstSCqWOoJClb/wgzmwq+tm3GvnpfBKdNZPVw7gWq
	 XYduAEtQQXNi48HMACHIqiGncGjGGXzFsjQnN/Y2j00maerUQ6ES49iSTlX/d8w+xc
	 uAr3lvJaUp05PJip7hNFCOdd1Q7Oh+G2Q584Wxm49i690pRRAysmumcrA0a4n8qklc
	 t5uvb4omELk9evaUCk7slGWm9LyGMKn/9AyChweLkOP+NZJzxGkDNzRPo6jhYxdY9W
	 mQ58Lb/w6fCSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCB8C55162;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 20 Feb 2026 09:15:08 +0100
Subject: [PATCH v2 2/2] media: rockchip: rkcif: comply with minimum number
 of buffers requirement
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-rkcif-fixes-v2-2-ee40931fe0ff@collabora.com>
References: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771575308; l=2843;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QlnSURdd8Dclxdp8UA+BrdFUZIn2tw+OGzLWQP2V3Uw=;
 b=aUmJLnmSesafA20KayfGrJ/nBjA/G1S1v3FbSvXyYUCwd5vve4+NrwlAD+vjZ2DpAv+UGoK7N
 yAS0hKGcYuJDspP8YEFpbSn/FGQKkYY5q0FtMoVclqlMwAbF0CmqgM/
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
However, it failed with only one buffer provided.

Comply with the minimum number of buffers requirement and accept
exactly one buffer.

Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
Cc: stable@kernel.org
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index e00010a91e8b..f15bee4f7cd7 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -106,42 +106,42 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
 {
 	struct v4l2_pix_format_mplane *pix = &stream->pix;
 
-	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
-	if (!stream->buffers[0])
-		goto err_buff_0;
-
-	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
-	if (!stream->buffers[1])
-		goto err_buff_1;
-
-	if (stream->queue_buffer) {
-		stream->queue_buffer(stream, 0);
-		stream->queue_buffer(stream, 1);
-	}
-
 	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
 	stream->dummy.vaddr =
 		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
 				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
 				DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!stream->dummy.vaddr)
-		goto err_dummy;
+		return -ENOMEM;
 
 	for (unsigned int i = 1; i < pix->num_planes; i++)
 		stream->dummy.buffer.buff_addr[i] =
 			stream->dummy.buffer.buff_addr[i - 1] +
 			pix->plane_fmt[i - 1].bytesperline * pix->height;
 
-	return 0;
+	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
+	if (!stream->buffers[0])
+		goto err_dummy_free;
+
+	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
+	if (!stream->buffers[1]) {
+		stream->buffers[1] = &stream->dummy.buffer;
+		stream->buffers[1]->is_dummy = true;
+	}
 
-err_dummy:
-	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
-	stream->buffers[1] = NULL;
+	if (stream->queue_buffer) {
+		stream->queue_buffer(stream, 0);
+		stream->queue_buffer(stream, 1);
+	}
+
+	return 0;
 
-err_buff_1:
-	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
-	stream->buffers[0] = NULL;
-err_buff_0:
+err_dummy_free:
+	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
+		       stream->dummy.vaddr,
+		       stream->dummy.buffer.buff_addr[0],
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	stream->dummy.vaddr = NULL;
 	return -EINVAL;
 }
 

-- 
2.39.5



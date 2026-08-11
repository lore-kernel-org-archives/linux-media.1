Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2E28488F;
	Tue, 11 Aug 2026 01:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786413445; cv=none; b=W73dYJMQYq/TMGyhIehKD4mPVIkFgOCAa3fzbuONXnU23CzX+vDZv//ATNvUl/Ob5nk+/PPytpxSWu/y6IIVmkh8XK+wF5jflsUmEwdBaQXAmRwwFxCUfx+TgJhwOlY4wEa/x/0yYgzZi71UQyx3NNQkJW8vKc2efLZHoifOkqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786413445; c=relaxed/simple;
	bh=e1gqOZxEDv1kDj/6cj2ccj2uSN4ZY4HZ7E76W7ZMh2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEz+ci5qnlaxh6acX0CEzDwCZcDkv8auqFqD9DjCQ2nZZXKX+dscOl4hNFnsdPN/NdRiVBovN+N7c26uLdr6QqmiEfemsxPCQaniRO5qAqrnGha2eC+rig3M+kdsPeMiVI1jGQYzpV9k8n9zUylaHt4sCr3UXNY68X8YRG6mxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BpMzMtdK; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BpMzMtdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786413407;
	bh=KXc1/qLa28tfbtPy8EDMIsswqOngERVeaBjC8Qpywyk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BpMzMtdKIiPvZfUfUTgl56Xzjn63zhZnXThuoMFRAMjMWzazEeHgQMQ+zSXcpf1D2
	 0azNj1IqMCC3ND13E1U0WJT1DWT1lMzhP9B+JZy7VTRg1su8pbZPpLLV5gTLGnzGeA
	 McY7c8JM2zVPXa7Rm/pTEWCFXuXQICc11DL8s/yo=
X-QQ-mid: esmtpsz10t1786413390t9ca42b5e
X-QQ-Originating-IP: XPXm+OilYtbG7Qd8jrnI7ThGFpdpndmqxGyKl8erAT0=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 09:56:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7480406507912225365
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	kees@kernel.org,
	raoxu@uniontech.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: m2m-deinterlace: fix default capture field
Date: Tue, 11 Aug 2026 09:52:22 +0800
Message-ID: <2F5126811A6B9396+20260811015222.3467910-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NrJHW3hvBPkCqRXkG1WFzJwP5gYMs4+g3YWkJUW07InEda8VUWK2j0Zh
	Sw7IybapjZ+jPVku88qtAAfucjW8w0xTVIylVErXf5EyS0vmFJwBUXGb0tO1GQimdPtH5R6
	pHfHMC+rEJrspmAEDa0oAzRhQWHQNyuuY3pUKjATzCPWE+4Jm0zAj9umdG7f7hVNzC9cYyt
	V/LmKEChzbckdTspDxLeE9qyIM+fz87KpaMVaSaU8flt4JXF7LZt8zHt+pLuxuWr0kTDWM7
	U9ezUczd1/CKSCMuPUw3OqT3Dp8G6STqEZcbYFuopwL0vYLEITGW3Usf9IJj/2q8rTlHkVF
	CcztTgkGiNa+taWM7DNzN4HLOcalbiOcGLJ8rycbXvQWVUV+WpjEoRQZlooo7yDQ86Kz4KX
	bcXFTJq4ZMJ4A0MllPQlwEKvX1mPE2YftGt/FhtwCBTvwh5z+Hl7j0rwl7w5kL5hg8upZaB
	cQJkEInMr9CYZMCdtriQ5HSravZ+nsqdjMP3r4AIk5IyQU/Xs+qC5kdtPgLchwxjjKm/R17
	+E/If2doDLIiplXydy9IKQxnztk9JCPo0vN1WxCSnGIMZ0cAGmh3QPz6GVagTN89487VD69
	Il2XA/TIpjmNvJgxWpRERMB8tDmKB9jCABL0g65t6Dsr4rp36A4+vK85yMHJvVl4pTiRWHc
	Comawlc9CpL5qgN75sWWGaOBKe/2SJxujsVF9rr6ZwIDSj+xeiUR6h7aPLTDKNicuSCYTIv
	qHLywq2tVsgqClH4xmMkHP36fcPcwnP0UQUkr5dc1MThARIwtbSzmachy+wwABGPP2YeUsI
	UMXA4uetDAzCcXILrvDb4bHwe2/dtmzAafarzqThd5me2ajaArlKcHSAOitqmFyyhovqDM5
	uMbaPi1JeBFLRyeLcka37E4fRiy3JTLwNiq+4YBP8kIyiJuUJvMHIrF2wIGN2JtOaZVG+xB
	aygYH7bU3lXL15nJswgtIfMO0yKgaXP7DdiZqgTcgj5eSb86scZM0259RsFXB5njHxjhyh3
	5aTmj2NyNAPvs7OPeEGrTXPlnnOITm5JLsESt2jg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

queue_init() initializes default formats for both the source and capture
queues.  It first sets the source field to V4L2_FIELD_SEQ_TB, but then
stores the capture default, V4L2_FIELD_INTERLACED_TB, in the source queue
again while initializing the capture queue.

This overwrites the valid source default and leaves the capture field at
its zero-initialized value, V4L2_FIELD_ANY.  vidioc_streamon() accepts
only V4L2_FIELD_SEQ_TB or V4L2_FIELD_SEQ_BT on the source queue, and
requires the capture queue to use a compatible interlaced or NONE field.
Userspace that relies on the default formats can therefore get -EINVAL
when starting streaming.

Initialize the capture field instead.  The bug is usually hidden because
mem2mem applications commonly call S_FMT on both queues before streaming;
the TRY_FMT paths normalize the fields and S_FMT overwrites q_data[].field.

Fixes: 8f0755c06b90 ("[media] media: Add mem2mem deinterlacing driver")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/media/platform/m2m-deinterlace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 1d0e70eaea3d..9dcc4bd6cbdd 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -822,7 +822,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	q_data[V4L2_M2M_DST].width = 640;
 	q_data[V4L2_M2M_DST].height = 480;
 	q_data[V4L2_M2M_DST].sizeimage = (640 * 480 * 3) / 2;
-	q_data[V4L2_M2M_SRC].field = V4L2_FIELD_INTERLACED_TB;
+	q_data[V4L2_M2M_DST].field = V4L2_FIELD_INTERLACED_TB;

 	return vb2_queue_init(dst_vq);
 }
--
2.50.1


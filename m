Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204552;
	b=ByeK8Vizgxu5P0cREP7ulF/PhQNoH2JaRmrpyB3Dqx64wssK6kbda9Kl4QQ7FruDsEdF
	 WznZkAvJ8eq6o8Qa5m1PZf9Q+jCJesNUjgZuEjNx5njPSPj6oKvXNJIQLWgfG6XSOZfT4
	 5RHrT4n0l3f8f1Rmerhx/Gfr7jSfGAKzlxZu0SzckjeIXhZ6AKeMJXQiCW6WNuaIL/ArP
	 svKTYIDPoHnK7EgMXE7ysaxjdwFhbQetVTC35sDAkLqo6QsNhw6ALlTeZvR+GrbWmeyDT
	 iWQC7dVk84WJwgouzVqzw9hL9VM6h1g3kRucKng7qU94UtOCv7t3cKqxWX+NkKQ3Z+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
	b=csvvTZQR0Ai+JDBQz5SzD6BK0VmzIDn8sH8zuejpDhGaIDsGWyxBWj4dVMvHJw8dII8y
	 FZrnqrrBbcGBXlexF8VsDsEUeIhmWEDfRTIZeyI47YU2sOEkTOHsvlpbv25d6/2+zUcbP
	 aHwYYpUd4NxfMYAAwIXwvrtPhaNoQzGCjd0ySDkhX8N1W6n7Xjbsut9DqB9nhMg5RXJPk
	 uH5cOpISnHobkbESPmIv5pBI3v3HuOIT3yo1JMjBlDwHqfkiXHluQj6Ke4B6jFecJB0mv
	 ow+4LffObeMxnVjI0ef+laGPNCHVW5p9LZR2/dMOTvG7DLqXTJr+4peV2k7+l16X2HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtvFPruX;
	arc=none smtp.remote-ip=209.85.210.68
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95C606A6FD
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D95C606A6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtvFPruX
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-862df509d48so933486a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204550; x=1795809350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=AtvFPruXXuxMGYkwYLAt5Xua8UgA/nRg9cWhI2acqjpqgz8Jt2bt3MmFRCTEoPFRyQ
         kZyucYEThs9blI+DVD/yCxRUkGOSyR6PLYjLI27A4fSzWE3Oki+IzZioANaDuhvAkLbg
         8gGMzFuUjduVyeFFndSUm+NvGJMfeomyhyy0/PrVNYNqvyurdmyalU/wipkU4WZkiovh
         xtIgj/psnQ0vmTSMK34/4Y88jxeS2lsCJm974qxxtumgKGFs8x3PrHXtoF5h9UoOJV/d
         Y2SCmT+CnHKaAI/zSif+o/QRkfeIG96kKjeGUP2zVx21msU1JG7mvTjUc7lESNWaKRov
         tvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204550; x=1795809350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=OshMeoUOT12Zr+57t/aJugGJIiY98A5mO15r/jtgV2C/ej56qntzTrQMmseEcKD3Zj
         IkP+ue75dSlgMXFRx0iTAv8g8R41V1sp8HYWQ78y0/kxflpbYn/XVPzkMr6JQdJz0UaI
         jTuzK5H3YDbe2PS89FahyHPA+zyFsBmlS5CtXSVVUrRWhKjuj73hjzxeUCiJhPFaKMpQ
         6evFsWEn70Ke2lpIfQvxDyMXz41qrhR4miHtW3pzz2t0jMBvx6HdF+9Ju2EkgP+2kEDP
         Mu6C7XRzlQR4ii6SYiZXeYOIGe0AjAqSDF9tRl0GF/IetusPlVbbzJorTH4skp2eTRfD
         LHXQ==
X-Forwarded-Encrypted: i=1; AL+hErEJHj+ZxzW2u4DOoxlxpECgo494Cy5VVyO3UgrabA2hJiVoFopTKYIlQSlkim+dkyQbn7FvcSlmIkkZQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YbDrxFzIxKOWVPtabc/RmO3XOpE3o19ERuAMGA4wi/RSaDpH7
	curJfWMZlhycHfa4AbamkYskXs7vVZx44/da+W8qQjt3EOcnfwFP8VBu
X-Gm-Gg: AYBFou3qVmD1X9y7W1s+W5or0wWOKlzFZzuF16bgc/HW3Cq8F5AP46cXH5xPmwPfEnu
	9XFGrfaHoFVd7hXrItSnrwEq3cK/YJ9YaIri0voMcWyzLmGm2PyJ2GXFIMAD5ELqCTFVZVZUfGv
	R38K3u27JXZlC8YcjfXDL/TtkFQEs0e58IBgAWKYsXfiY0i7aFuIanRYDMdOydD8lCk+OXG8eo1
	0VlI/eG5IOx7IJ+FIFAZ8+bvQzhDwWz1KTepm/ERwBA8dxYr3YWkJSfkambrPlcoKwTia7U1yuZ
	SMtfTG2tRrJP9JcP56AcUp+0XhhbrzMlBnOBcQxsTm2N+azxNbWDWV17ngw/TWUVN9v3kMweUp3
	fI6Gp7ww3tGXlKZ/IjFZw5PSDN2A8IKbqOIQlEGOgNoeqvzxhN3/9+S9N2liubTyGbfS3pASnzQ
	enYof2fmxUm43JwqUV91XVFpde8qSmAAhsrQJFOH67Wdt7aDxUF5cM/zmJfC8U22/r/ojaWNLtG
	O4eHVcKPMv08iyT2GmJTp87hQrO+n5ujEOFw+QRxB3XaePQryv4oNuOXIPmVPG9m4A8/mSM20P/
	iiB1jb/nyj/Jddih5/styXJv84IJ38SDUMOZZ2nigwQh5psJewL9+DrwxteIZpBbAvHRZehGu8k
	oGoEimBc5/KeuRaq3I9RCmN2guZ5lc5O/e/lmJUK/
X-Received: by 2002:a05:6830:2543:b0:847:b333:229f with SMTP id 46e09a7af769-86309211342mr4517824a34.19.1795204550100;
        Fri, 20 Nov 2026 11:55:50 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:48 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:40 -0600
Subject: [PATCH 6/8] media: mtk-mdp: Check buffer plane sizes against the
 format
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-6-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1915;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IrqYTU3e5VqOahizLwVLW6h+Y6jhsQAYsNliTerO8J0=;
 b=qQWo0793DmfQdxc0mRZsUo2XgpH9ekHbX/QzCsnhkM4TZTvhzCPSNce9IlDNfTxS2wUYX/mtP
 oK4WhQpcAJBAc49I2moR4k4xzsWXEfrHUNZkSfjcbjG589F3v1ZY2cE
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

queue_setup() ignores the number of planes and their sizes that come with
VIDIOC_CREATE_BUFS and always answers with the current format, so a
client can allocate buffers too small for it, which v4l2-compliance
reports:

  fail: v4l2-test-buffers.cpp(872): q.create_bufs(node, 1, &fmt) != EINVAL

Refuse a request with a different number of planes or a plane smaller
than the format needs, as vb2 expects of queue_setup(), and check each
buffer's planes in buf_prepare() as well.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index a40bcf61b7ca..e0627127430b 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -546,6 +546,15 @@ static int mtk_mdp_m2m_queue_setup(struct vb2_queue *vq,
 	int i;
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vq->type);
+	if (*num_planes) {
+		if (*num_planes != frame->fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < frame->fmt->num_planes; i++)
+			if (sizes[i] < frame->payload[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = frame->fmt->num_planes;
 	for (i = 0; i < frame->fmt->num_planes; i++)
 		sizes[i] = frame->payload[i];
@@ -563,6 +572,10 @@ static int mtk_mdp_m2m_buf_prepare(struct vb2_buffer *vb)
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vb->vb2_queue->type);
 
+	for (i = 0; i < frame->fmt->num_planes; i++)
+		if (vb2_plane_size(vb, i) < frame->payload[i])
+			return -EINVAL;
+
 	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);

-- 
2.56.0


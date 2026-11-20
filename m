Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204547;
	b=CYnH+kfZ8A6CTQjli17r2J9fH9HgYK3VdTX5yjm0+ftTS+0Ne1FXoX2XbtRm6maIQjKv
	 dMltWaWPe08vrFissBDiQ/eXlX3D5vd89GtXwepNYdR8i1wjwPQ0bGh2k6Y1mT0RJ/Hgy
	 lVD3IH+vRmlD+hctQdd2o/hRT53jZtmyfPA30i+sArnjF4E4bJA+1N/gHZ6sJFZ8cj5ds
	 VZrfeS4kDC02f3sgiWujaVC47xSFPv5F5AN0LmkAYYlqEVTJ5R1Yqk0DeRycDCJN0ec7m
	 fAsEGvNyTZkHp57zva5R2IhcnTD6y0ZsG4KKPh/3qFvskLSBZj0cQiy9Buo9/xJHp8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
	b=KbgtZZ13wZB8UVTFnQRKZh8bBA+gMpOy7h4NIXHIj5f7YxzjvTrch2AYsXZziXNgpTE7
	 8O/Gj7MmbCgT03NOQlefJy7gvumQXBlniiygYQP7qQq4/Vl27dfxMCYE/yRgVQy6Ai1Z4
	 dzFmKD1ywSXjjU1g24jSvqs3/TyPjcaL88+XehaR+dlNQ8FityxKRaRDEI/f4Ot2uXyyi
	 bJRjPVhSdhT4Qk2p8hzisglQPWxwOvFD/Ruf54yAe8pEY3ST1PxOe9NJ2SKZQs7w7yydC
	 zwRD5Y0IveYZsSQ7qLxDC9PuKX5xZfNZ5n4KyEsHrEkAorwJBuHWX5WN0It2DgAINaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jk2vHwSg;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E46606A6D5
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E46606A6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jk2vHwSg
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a1dbb516so245120a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204543; x=1795809343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=jk2vHwSg8mDnRIKspvKkSi8BqQSrrAkPmGYU1Va0V9rJqpt7BrkBYSZAIysNBY2arh
         QW6WmtqAc0Mv3KZcnjN/zRkrksk0C21Nul/4fXUEyQkueUirbZFsL/vmmpZqCiQbA4jQ
         nyOYq9HPrfCoAXebuGmh9+bBLIOFc3Fb2JUJwU00LmEpULD4sNSZo4Z2Zc6QkE7ZBxvv
         2WM2KQeFQ4xZRY8JaQ4APIguku+qXRTlS5K8ZnlLTR6189Nw5wcHhZnEVKosPR75owt8
         VI25MF3ZHWBYmolusq5eLK4V4MkHokHeSE4+DKjEMtiuBWfzDpxAe/xqH80sbBTWy7a0
         /hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204543; x=1795809343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=XBdh/fizSMzQeRDvslE7s98k8p1jW6lBXyRhf+IzGWzrAxoiRNY3ShHXqbSRneZUui
         ziryqPYDwqC4bLf2X14h7idWRVAYiIjkNOBgUR2ajFq5mVJ4j/aD0JqV+yjEAqJ4KRSi
         IQxvCAcYel5UzeANfaCAxCPnVCy9CqoEloavaDUKx6/JQXXEMXW4ggAwN5/3H0r8HS2i
         LVp2Ey3mE9DWKRN4Ddc0tye5QQWnxhuvqckJTY2pgZibvyysAq3H1USS4f6WBkDMoV5T
         9nhQsSxaIt2MISE2OpOZ0PtXDdgyEkpI6uA+FDSc05r8kXzUcPKEtXlRYbItxFuz6pMs
         q5hA==
X-Forwarded-Encrypted: i=1; AL+hErFPpTzWuvg6KqUBYl2h4R8G6GEKcI+lCPQv1TqtQ9blI0BjTRedJ7z+1z2zak86UurzPogx5mvoZMpkdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8UTSqxQXYgIzMgcf8QKMho0ETHlzElRh4ooDv57dlDkPFw+f0B
	ETepHyb+JDr2khQfQbPRcSLdaLjRKPOLIkVkU1lvn6BzrosivsXkrDpv
X-Gm-Gg: AYBFou2SRiLeXrGqyOWt01q6Zpz68FuB1t3RqJeUcvvMmG00uwDUtL4hZG7CcyYWcjH
	z0Wcqk/6uTXhjMGCFeQpBlrrrGNQizo+ofQTOVRfchBIE7MknXSwlIOVdSUQrePM10w/8xIQB4F
	DIRF43XzCd+/q/OLtxrnaju4GAQ9xN714i6vIT9o/Evq/JrjF32abtf9X8kWS5ea/5Xmg9ChKCQ
	sOI5xobhaTKN2oaeGf/ZOuGyjodFL8x+SciEX9F2imcrm357rLTc+FOVhFRheG0P4pj0tClE+pp
	X3kzx/smKErsIGrBH+6T85VBKbZoAdhSjb4mxXhtr2CqPcAoVCwijlZ2b5fnDr2Wkigy8xF9HSs
	enHx6DITSdjqmOSTCFgxhQAfP2SZvF0YSC1FSstgbnLNzkSfFOmcWo92yMZa4oYyUJfoK0gphx9
	UKwICSiSx6iLK6fLXIij+0rwidyV8csO527a6fdO5D7u6ASiSSh04hNjda7yALq8bkYwpFeRVus
	8Yq1ivRl3eZVIOEly6J1BE8+/q8inPv9XfVMsBiL2M0ocUWjWGUb8vcf7LrEEW8H7axfPwBCXab
	wf7DXi86TtbyHo0u3JiQIohGJuMLnk3tMLPelH+ZYS1HGS2PXOWedwXypRFlE/lwXywP7hQRPW+
	nYVqZ3Gbk+ZxgFO/XNZ8=
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr4983334a34.1.1795204543316;
        Fri, 20 Nov 2026 11:55:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:37 -0600
Subject: [PATCH 3/8] media: mediatek: vcodec: Report the visible rectangle
 as default compose
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-3-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=3432;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=oiFySgVqt+7XnX7ycDBKE4VLYw9gJVvkD5dQiMAZTM8=;
 b=cTogffUF7xjKiziZK+BVcGyBnc5RI5Ib23pwR0Td1xK+sjGiQJPiF7n90B2SdcuSuAOUv+O5w
 XiJvJBspeomC0HkqHIxlGpJFymYsi665HAx2H9LY0sG8CnDiMCyfytT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The default compose rectangle of a decoder's CAPTURE queue is the
visible rectangle (dev-decoder.rst: equal to V4L2_SEL_TGT_CROP), but the
driver reported the picture size the firmware gives, which for H.264 is
a whole number of macroblocks: 1088 lines for a 1080-line stream, which
GStreamer then shows with eight lines of garbage. Report the crop
rectangle, as V4L2_SEL_TGT_COMPOSE already does for most codecs, and
return the same rectangle for V4L2_SEL_TGT_COMPOSE and from
VIDIOC_S_SELECTION, which only allows the default.

Fall back to the picture size when the codec leaves the crop rectangle
unset (the stateless VP8 and VP9 ones, for which V4L2_SEL_TGT_COMPOSE
returned the caller's rectangle) or reports it empty. Only MT8173 was
tested.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       | 38 +++++++++++++---------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 9339f53431aa..1223738ece4e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -390,6 +390,26 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 
+/*
+ * The visible rectangle (dev-decoder.rst), which for H.264 is the stream's
+ * cropping rectangle and not the picture size the firmware reports, which
+ * is a whole number of macroblocks. Not every codec fills it in.
+ */
+static void mtk_vdec_visible_rect(struct mtk_vcodec_dec_ctx *ctx,
+				  struct v4l2_rect *r)
+{
+	struct v4l2_rect crop = {};
+
+	r->left = 0;
+	r->top = 0;
+	r->width = ctx->picinfo.pic_w;
+	r->height = ctx->picinfo.pic_h;
+
+	if (!vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &crop) &&
+	    crop.width && crop.height)
+		*r = crop;
+}
+
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
 			struct v4l2_selection *s)
 {
@@ -403,10 +423,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		s->r.left = 0;
@@ -415,13 +432,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 		s->r.height = ctx->picinfo.buf_h;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		if (vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &(s->r))) {
-			/* set to default value if header info not ready yet*/
-			s->r.left = 0;
-			s->r.top = 0;
-			s->r.width = q_data->visible_width;
-			s->r.height = q_data->visible_height;
-		}
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;
@@ -449,10 +460,7 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;

-- 
2.56.0


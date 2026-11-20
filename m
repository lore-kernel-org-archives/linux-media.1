Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204549;
	b=1jmS8foCaqRr3LgPdzdzYGH+ix9fabK4vSZaIweq4pWj/RccfEfEBEde1TwDmOkdwLGt
	 jB3EKeGLv8U10C2/dIvUNpz23UL7jhh4napok/sw+nDNUfzB41tSu8oMeZeAPs0mvMurc
	 +SEw3lanwaHsPoLHqscTUDxWRDuhVJoR1KjNHzjWtW6iHm1iE3eZulk8laS25DpxeO6zx
	 QSHNoiaii2wRySt5jtHEinYZ3zBqIBjVCnaAA81vCmtJGsn11fjAoFXPCasro0/G/3KkT
	 8X35Rdkxif4Iz7pTPQLv87/USDLDMHoICB6icJKvmQyIEtQisludNhPt35cF5PqBDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=;
	b=xnQQau1vyivG0oa3xBh62A2xxEylVtGP/5KYZaHsPM7wzgTvFarVv/dV1aololF1DHPz
	 Pasc3xG7txMp0ckQa9w6KXC3k9sl0SFx1sJ5bKg5pZFmToKAsNNhbLRm/MXZYbAhgVi9G
	 QbtPh9duLieO/mMPlhEoRlYgQiQpD58j5lp+Nu2p38sXDXqpgYIWO5W6K0jZaP49kp41X
	 0ldssSK46nnqMVsBy0VWBSttwJQYY50rK0eMy8q9/ysF2NhB/g/ifCvaMYk9/FGrucMZ+
	 64nQzcuHckaGXxTiUJfCJYi1DT+LN06IYePoQTbJDEOtzYoA4cON4BOh4YwawpvEYVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f1NvPsq/";
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10D60A2613
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F10D60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1NvPsq/
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-861ab2b429bso490031a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204547; x=1795809347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=;
        b=f1NvPsq/JSPWErTWjUzgEwFBzBHXVTcH8ec1u7ZKeBAuyxhFLvj4adQKogTE9nuo7g
         nP1envXLVTKUvbMH/IRqaLcMZvsnJorbc+31gluBpchPd/lgc5/aKQ81NhaVzqHbnobD
         cxVm9pOftxfZ+MaHWeuSMTY8KU+9M+gO0/BcOU00PVYnfzerw/TNJSb2oT14gtnz/bJR
         T9JEM1fw1H/7WKN9lP9wsGQnzTR4S3+d28mhQiOJ9aJ5UC2LY51590fUZQsol6/uVr4v
         UvNB1wLyTd/VUvb/EgGebtJ8iOiKyvDY5m9uHCLcifCINt8ImvIEnWl3Bf8oHQDL+qkK
         6Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204547; x=1795809347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=;
        b=iHwhplhE3ONfWAsf6DNm4CdDr14CG96i2hHXpF49ZyFakxiZxExPqiW/R70/gEhsg2
         MGh0GClG+Ezj+CfHQylM1zF/WWNNRFHlMbWWDRnPraTfQMkjmXQc1v6zo+WIWk/wr7cv
         /mZJd687dY/A3OwnA5o96WQElZHllkkFceDDRm8Hw4FE2QXeD7OCLX2RMcBVufAWT3zn
         zjOO/9tfkGusf5f/HBG7x7P165KAkD5Enrh88/OXs0/t9/ZL5a7lutDkNdV9YsdCczDe
         dpCpYmKBig0EBPkg41g/kAxCLzbHIpuCZrKE+S8d3HtiD5eBphM/Tr+cVenTPYepGKyK
         wePA==
X-Forwarded-Encrypted: i=1; AL+hErFLfVPIj4nrchjX1jX5E0O7rV5W7lO0iqrnBVuJVwZLvBaPFq6CtUVvlQs35x7nGbnDtzcPQegwj57ajg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QctlzPBFnkpKrD1ETKc3KpZh1OmqjNRfqLo1qSsZ3+3VvwwET
	hmD1vw+3+gmfPsdYP7OWR3VDRykCgyLpKfO3H89qc9w9jTR9HaS0+2L8
X-Gm-Gg: AYBFou2S177foMd223GtAmf12xi2qfs/G1BR5Sn0Z+TUnbbZ1Pwhqn0PtfAdi+e2T78
	Wqzh4YvD63+OJJpRIBPiduCFOhUEihRE5UfLOV4Ov8S4kLCb15E2jB/cONRhNinkTrZ7qB+wNvB
	lq6MHXbbr2VxI22fbYtmGAzLSRnqviQBsjkL/TWelqmDnCoQCcP6G5Fztxdt6yrfGwAUDBUI+q0
	TavDB3KcQz3O5D97KzegymF5VX5QvRrbkPYxhCzYMu1xaxonTPK/d5XwIXnfpQaS/b3RKxFIRwf
	SIhOlpyAq3wAHSX4HIVgN4VjIr1+Cpi465OuaM70EmvzKlhc4Xt1oJNhz7Q/yRSzlE+38JUL0L0
	ofzY/ynm/NnaUriErzUw2gdPulLDy1+mt47V7zBfaETsxOD1pRfN1reM/Kw+aChGPo9RsydDz8v
	I3+rXpdPAeIOThazZVDUZWXu5uQSoTEKIGZn9smxvrynxFg1f50f/ggQQghFoGV7Yd2dvhpqZAD
	eIDdxbjfyQFzt8sgzfH5mBhvSXQHEXl19sAQ5bADE7V2XPyot/s149+drqSkQ/m6PZSfgKQ3Ug/
	RtngEWXHn4Uw0NB6XtJ8Lt2dLsm1scRJZPMZmpm4KKn/wjtWTCdXEB8IIuvHXykFS5DnZLKppge
	Yn2NgJdHnknCm0+imM/U=
X-Received: by 2002:a05:6830:907:b0:85f:49ec:c96b with SMTP id 46e09a7af769-863159a61bcmr6180062a34.16.1795204547018;
        Fri, 20 Nov 2026 11:55:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:39 -0600
Subject: [PATCH 5/8] media: mtk-mdp: Do not refuse a crop for the other
 side's size
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-5-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=6597;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=FLQ/x8yveejr3QHeM2KGc0SR3iRQfxTwCwBKw4jNsu8=;
 b=lWVETie9gi1H5rYLmKowqt5yFgn8puCkapDQ59j09ERYM5var+60bwKt6pJRKxZ5SVdRdmZaD
 JOi1ZFDZQDsCYyu6vV6zo+Ln+30tECm9li/Ma8UXA+ZNjOxytLiLJin
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Setting the source crop checks the scaling ratio against the destination
as it stands: the 32x32 default that open() sets, or whatever a client
set while probing. GStreamer sets the source format and crop first, and
a 1280x720 crop was refused with -EINVAL against that 32x32 destination.
The same holds for the compose rectangle and the source, and for the
rotation control.

Check the ratio once both queues are streaming, when both sizes are
settled: at VIDIOC_STREAMON, and for a crop, compose or rotation change
made while streaming. VIDIOC_STREAMON is the first point where both
sizes are known: before it a client may still set either side in any
order, and checking there leaves the queues untouched on refusal. Log a
refusal at debug level, since any client can trigger it.

Fixes: 0d1e342a17f5 ("media: mtk-mdp: Remove states for format checks")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 121 +++++++++++++---------
 1 file changed, 73 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 34d02de4453d..a40bcf61b7ca 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -727,10 +727,40 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
 
+static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
+				      int src_h, int dst_w, int dst_h, int rot)
+{
+	int tmp_w, tmp_h;
+
+	if (rot == 90 || rot == 270) {
+		tmp_w = dst_h;
+		tmp_h = dst_w;
+	} else {
+		tmp_w = dst_w;
+		tmp_h = dst_h;
+	}
+
+	if ((src_w / tmp_w) > var->h_scale_down_max ||
+	    (src_h / tmp_h) > var->v_scale_down_max ||
+	    (tmp_w / src_w) > var->h_scale_up_max ||
+	    (tmp_h / src_h) > var->v_scale_up_max)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Both sizes are settled once both queues are streaming */
+static bool mtk_mdp_ctx_streaming(struct mtk_mdp_ctx *ctx)
+{
+	return vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->m2m_ctx)) &&
+	       vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->m2m_ctx));
+}
+
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
+	struct vb2_queue *other;
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -744,6 +774,21 @@ static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 		mtk_mdp_ctx_state_lock_set(ctx, MTK_MDP_VPU_INIT);
 	}
 
+	/* the queue that starts second checks the ratio */
+	other = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_TYPE_IS_OUTPUT(type) ?
+				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (vb2_is_streaming(other) &&
+	    mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+				       ctx->s_frame.crop.width,
+				       ctx->s_frame.crop.height,
+				       ctx->d_frame.crop.width,
+				       ctx->d_frame.crop.height,
+				       ctx->ctrls.rotate->val)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "Out of scaler range\n");
+		return -EINVAL;
+	}
+
 	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
 }
 
@@ -810,35 +855,12 @@ static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
-				      int src_h, int dst_w, int dst_h, int rot)
-{
-	int tmp_w, tmp_h;
-
-	if (rot == 90 || rot == 270) {
-		tmp_w = dst_h;
-		tmp_h = dst_w;
-	} else {
-		tmp_w = dst_w;
-		tmp_h = dst_h;
-	}
-
-	if ((src_w / tmp_w) > var->h_scale_down_max ||
-	    (src_h / tmp_h) > var->v_scale_down_max ||
-	    (tmp_w / src_w) > var->h_scale_up_max ||
-	    (tmp_h / src_h) > var->v_scale_up_max)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_rect new_r;
-	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;
 	bool valid = false;
 
@@ -865,22 +887,27 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 	else
 		frame = &ctx->d_frame;
 
-	/* Check to see if scaling ratio is within supported range */
-	if (V4L2_TYPE_IS_OUTPUT(s->type))
-		ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
-			new_r.height, ctx->d_frame.crop.width,
-			ctx->d_frame.crop.height,
-			ctx->ctrls.rotate->val);
-	else
-		ret = mtk_mdp_check_scaler_ratio(variant,
-			ctx->s_frame.crop.width,
-			ctx->s_frame.crop.height, new_r.width,
-			new_r.height, ctx->ctrls.rotate->val);
-
-	if (ret) {
-		dev_info(&ctx->mdp_dev->pdev->dev,
-			"Out of scaler range");
-		return -EINVAL;
+	/*
+	 * Until both queues are streaming the other side's size may still
+	 * change, and VIDIOC_STREAMON checks the scaling ratio.
+	 */
+	if (mtk_mdp_ctx_streaming(ctx)) {
+		struct v4l2_rect *src = &ctx->s_frame.crop;
+		struct v4l2_rect *dst = &ctx->d_frame.crop;
+
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			src = &new_r;
+		else
+			dst = &new_r;
+
+		if (mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+					       src->width, src->height,
+					       dst->width, dst->height,
+					       ctx->ctrls.rotate->val)) {
+			dev_dbg(&ctx->mdp_dev->pdev->dev,
+				"Out of scaler range\n");
+			return -EINVAL;
+		}
 	}
 
 	s->r = new_r;
@@ -953,7 +980,6 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct mtk_mdp_ctx *ctx = ctrl_to_ctx(ctrl);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 	struct mtk_mdp_variant *variant = mdp->variant;
-	int ret = 0;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -966,14 +992,13 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->vflip = ctrl->val;
 		break;
 	case V4L2_CID_ROTATE:
-		ret = mtk_mdp_check_scaler_ratio(variant,
-				ctx->s_frame.crop.width,
-				ctx->s_frame.crop.height,
-				ctx->d_frame.crop.width,
-				ctx->d_frame.crop.height,
-				ctx->ctrls.rotate->val);
-
-		if (ret)
+		if (mtk_mdp_ctx_streaming(ctx) &&
+		    mtk_mdp_check_scaler_ratio(variant,
+					       ctx->s_frame.crop.width,
+					       ctx->s_frame.crop.height,
+					       ctx->d_frame.crop.width,
+					       ctx->d_frame.crop.height,
+					       ctx->ctrls.rotate->val))
 			return -EINVAL;
 
 		ctx->rotation = ctrl->val;

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204546;
	b=jxPRGxK81eNnm1onFbJf9j82XTvB+hG1MDpr6Gy0PKfnz+nwct4zu8Hbftdm/JTLZOkQ
	 5Pe7A4eHHLwjywMcQY8e+XRxbf1qy8iXXJ2GyuUddSGuqEmcXsHUxIXEd14RUsSwOvF2n
	 keoO4XMlDNtMk/VA40rYwO5i0UGR/ra+qV1uFzt/AuY4rrR2DcrhMbF2Q3GzJ4t3dWdzH
	 4Pn5hhiXSroxvy/TakACBV4lvChHwli0WAe7/edC8V/OpWfS8Fs9HCeQtKIjE6s39iGhO
	 z8XUZUw+30ki1eokxDUP8W8cmzMDKYpN+hagKD/NYmT0zH0xrirP9PYf436YyYlylPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
	b=OTlxGM1MWCfJ9FXNQfnSWkfzONz5+dqNSJstBHsp19FT0eBozeTu8LFoWZTEI+NS3V59
	 WuMZbso1L2c5Toa2KrcNUbPggfdbIu79K2IEyj5/dIdzdE4hqyXj2PX1bk4n03/4Z6aQu
	 o5jh0bUUenfFTO7Nf/MKfy7FIL7NfASWP652rvFHuAUcW4YQqihuMAYAmy+GAy3rls22k
	 tLvvg2rrL+rUpuRvsodya6R+ZhaV//rczo/KP+pfLe7sqMixqaumP+slaCfwWj5+r3jY/
	 yIE6jnL9x29Iubiio23g8vyhuxG2LKRk5lKBexPDWtWQBqC/ZA8BOssjAJVr6Oj22qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhd0ChaB;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D862560A2607
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D862560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhd0ChaB
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-71733a926edso165650eaf.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204542; x=1795809342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=dhd0ChaBIiiBhplfGfn3Z1KoOMh9XdY72u42YJUrClpxPo3obVNg2CmLKsuT/vJwZJ
         TODSLVi6tFEu1J/TJBYg03ecRM6/v/iFZKgtq5lfbCHIUA/4SjyKHAFGqUY3AVHQ8Odw
         D87Km7jEVy+Z5L1Ad82DGQeUPVaSdWXYGzaAgaZzMyym5m2vMZyCJv82iL/6Q59FUip4
         9sywXRDccSfIVP55ZBesyDetPKJ1Ltd0tPqCW8m1RGykWsCePO7GGlPt8RvWWvXYi7NL
         iExzNmQeLOdUYg6fLGYCE0A5TifpstEh9go5GsytIMrJs7PuX32yfnj1AIWJ+6Za4K99
         qmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204542; x=1795809342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wnQ204GptI3uHstIXrv4s0GxSxXuj5ZG+acWZmXsgk=;
        b=wBO0nSh9nj4cpPr7ZDUNMtSo+DHpF5xfRu6VvzAFbbXNU/TK8z6Mv0ynDS5Ikq/THn
         YrDHPkh+it0/qhJB1vLe+7YeCqsDB1FZqpiCKmRjbzBo8rm3YsEEEJlgjqxNXyZmIc6h
         ibKaxxWHpyLrJET4iEcjE3pUgl3bx9SY28yqY4E2iBYJLEiN+19dUkUZp/tWClB0S17u
         MfBUSx2/fAhysmqNdFq9+TMEf3IPY+wrTQPA/KVEIYRSqmQYeY2B+UKh3Y4T8lHjLqE5
         BiR1twozw61jEn9OvWsqMWL9LnD1M9pPMh1vpkOUsr1c+Bpu7vGrWzaJ5HZuBJbdLYd+
         seaw==
X-Forwarded-Encrypted: i=1; AL+hErGxiRuTE2XA0OW7IcXD/H5XoIQs+PiooYAxXAkAGfb4rsijoATvusa+E+kklRmP/wJRWreZLRl+ccFrng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8vm4g5S9aQDj9SwDnUaHCW381R0q3XZ6sCjalEjQIPzdM0Cok
	uN3+Gg/vT6zj0LCOYddmuKS6PtaZADPB8fERuAuq+aYh/lqYSQu4ThlB
X-Gm-Gg: AYBFou3YIbS04AlfNAxaexZm3RpstxF2Iqy3xOKRCxIBcHH7fCRX98F/DKkWc0jg3XY
	7vW/Uojo2Y8EnAIOJ/7gpT//Zz0uT4E2QBRea2Uo9g7rtzjdqRR/4liuoaddF9HbbqA5Zt16G0F
	nv3atv5CNA55Plsymgp4Xr/exEMFKmLUI4+3mydWmt3XjimTi82PQmG4zjGZhcFocT8P1YYbJPL
	aeit8liZpl7IRUlgeMFJSy3DuqWoGpV4W+sqh3/+luuJHqGiJOM23gJVxXTyVTw0DBxmhX0Nab9
	u7UolOiCuz3HrryB++vUaUv4amx24ThXpXUFCfNxdQm8gC7GtCS5URpCsWm4p/jfKHA1nK9sLYQ
	mPlVp7n5piUYDtCPHD3VjVX70/jHsZwfS28wnUxDq9+BboEs0hU1LQu0Z3gVuMVw1ffeyn9tJ26
	fwBcMjduWJII/8PdJR+Q/X2blu2rlwAhoDW6w0Gk/0eftkxtHy6zZX48m+ngDgxM11b5BcQbFEL
	agHX5m0IvAH3pew2ckLP/ya547LKrnscYbEf8W+TEbzE3ZWfl0AoJBt55n4Ubag/wDSkmzmvKAP
	xt3TjlV/wjJPMJ8EfOJmqpfGN2kUeevq8sh60gBQg4NoIAPbc0xCPrcYbKL60AVEpz/LBUytirB
	pRDTH52LafI21sAP7qM0=
X-Received: by 2002:a05:6820:2ac2:b0:71a:df0d:e9fa with SMTP id 006d021491bc7-71b39591da5mr2512697eaf.80.1795204541857;
        Fri, 20 Nov 2026 11:55:41 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:40 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:36 -0600
Subject: [PATCH 2/8] media: mediatek: vcodec: Pick an OUTPUT buffer size
 when given zero
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-2-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=2640;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MdHaPFnIJfi7B9svaRku2VvRxyRKfqWOKsblgQ6Pmac=;
 b=RGnd5wD8UWEUd4ugoBRg/wBGw/yk6CJlzgxUEwHK4g+3osGkf6SAUebULJ59+LFIABjMwSBZY
 1O8x0cg4QqMBy/NSDP3xvBC/ASWTTTsiQwVZKrktw4UHLMREL2t+Wm8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

A client may leave the size of the bitstream (OUTPUT) buffers to the
decoder (dev-decoder.rst: sizeimage is the desired size, which the
decoder may adjust), and GStreamer probes with zero. VIDIOC_TRY_FMT
refused that with -EINVAL, while VIDIOC_S_FMT, which does not go through
that check, stored a zero buffer size. Choose 1 MiB, or three bytes per
four pixels of the given size, whichever is larger, in the format check
that both share, after the size is clamped.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..9339f53431aa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -5,6 +5,7 @@
  *         Tiffany Lin <tiffany.lin@mediatek.com>
  */
 
+#include <linux/sizes.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -306,6 +307,11 @@ static int vidioc_try_fmt(struct mtk_vcodec_dec_ctx *ctx, struct v4l2_format *f,
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
+		/* The client may leave the bitstream buffer size to us */
+		if (!pix_fmt_mp->plane_fmt[0].sizeimage)
+			pix_fmt_mp->plane_fmt[0].sizeimage =
+				max_t(u32, SZ_1M, pix_fmt_mp->width *
+						  pix_fmt_mp->height * 3 / 4);
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
@@ -370,7 +376,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
@@ -382,11 +387,6 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
-	if (pix_fmt_mp->plane_fmt[0].sizeimage == 0) {
-		mtk_v4l2_vdec_err(ctx, "sizeimage of output format must be given");
-		return -EINVAL;
-	}
-
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 

-- 
2.56.0


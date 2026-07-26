Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA603C768B
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097732; cv=none; b=e+MAHWsWkw0sVzobICJWzy3Qy4/QE1k2/VDsnITifzeA91R/8e/mBloWrJW39U8GkLpXehb7h8WZ52PdF3Jn/POuzvej5rQoL36e/jG+RFuiMOmlH8RV7QyTTON6J7esl7TIdRx58HzjH2Raw0qQ/gfdMBPgRawpBGyxaZ1ALlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097732; c=relaxed/simple;
	bh=nxdMVggyoEMeFBLD1Ge5YXkdWoPCKeJT/NnEFu/19YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JV3FCyCf6lmZ6/UIA+oAuQ1gOdwzjZnIonVv5pn6wojDwXfAinSsmrBspTYNXxfxKpX1xwwJlXCq7P551rkVgTWcR3eNaj9BercrmC0/ng5b+m2Ff99lQAtfJVzAMV1mGrFzVHUw+OepMW1SqknA323gLxV+LNAKM/PALlt739M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSY5g121; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSY5g121"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so2027429a91.1
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097728; x=1785702528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbhNNzs08fTZ2K27yGEfF/2tuOjSgn/k+EN2qVB/Pe4=;
        b=TSY5g121bAhDJexAGehyc5rMTv4aBRTJOfOxcABLrmnBsWr2GeiCa5/ij9MSZy/9Ld
         q8LgVkEGE72crOER1Mn2wPfMolgH9lVOSuSqa/f/cMF+RCZbcGKM0BCbYxkyxFGTE5I2
         Ct4ImBQ2HpTqDJKYA9/W/cIX5v538HRir5rDCkxxREpeD8NvUrscNAhAV/Xsv+ZfbYdS
         TBl38odzmmvR1afSwEjlVsYFKStQ5YDwzLMlRVqd/jCrnAfXu+H0/bctaJaYhXn9SMhg
         naDy0w64f5rdNqT9z7qjtc22i/ix1OTNgpx5oEbznTzaWbUYecbSp1gQeQYopbIgo80W
         Ke2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097728; x=1785702528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbhNNzs08fTZ2K27yGEfF/2tuOjSgn/k+EN2qVB/Pe4=;
        b=R2WK97C9E8O7jG3FP7WL1RzZe5Ac584hFeMP++r79XtWbls+GT189rCRpeC5Wanb3l
         O1KgjXd8/FZ43LrZnrGbBdSzaTo1JOVqE3ckSqUVO1mouEK7pCVRANYTAUt/9p/5YpUk
         I8eilFgQ8pwteHvV6YPZj8FlyEPEbQRZdtUmYrfIJ5WVZjg8xn5DLJ9kAjE9VO8bkm1y
         5kOLm+f1OdFDEgKAELzbr7/zlFVDKIRjPrrOyymKCiwQtVSSQzvArzUFW5n7sOAq8fkx
         RSYzNn7hCIjzgnOxbcuoEDHtPEftnRcA17q3wc9nQC47Ye6Wy0e8U1rB78vAKsgfBrUa
         tB8Q==
X-Gm-Message-State: AOJu0Ywor59z3hjr+2Ir+/mUVjgnbBGESnkH7WCoIgO6IEkw6ypk0uCs
	osu1y5VbgZG2HS1mgdSpcYZF5nQZgColByVi4uWIHnKxrvbh0+4Nr+32Yi3PV2WxN6cdvA==
X-Gm-Gg: AR+sD10I7EOfFv+NpFEyPDbsvMilUblJlWgbuz4MyZ2r137FJMiafMO5wDfrheZnbcY
	uFNG44di/3p8kJ/yCe5lqmE+jVYfpACtnC7iVz+1bvuSJ/zEDvexikN2fL8cvZIcEhWh4cX6Gxf
	JdLMitAuD+o0LbUOgBj+DqufVwYQsFxqCl/FoGa83PzMYwdHRS1RoFnHW1TwILbkX0s0dvVQzWc
	RAb53ShX8jzCdRQXq4zRtQV7jBXSYh/VfzwosPB25V8V6uOe9iTsgr712X20VLPWRuMO7aQfR7w
	mLErypacLamTPaznonopordXcs8+bwwUyEqg7x8DcsKRTSs9w9lZv07ii6MK5HZKTncSDHkSugx
	B+aBrQx709AFtg7pX+QmwyudmVBe7CDuhimZ36vbHXjhjbuvKAR8iFsSq5fgfJxMLYqcY59enrV
	mzIJPoOwry9VI8mhO5URr0WMsddq78AsnAhUygduvW0iEPScOD
X-Received: by 2002:a05:6a21:618e:b0:3c2:dcdd:a861 with SMTP id adf61e73a8af0-3c67df10b92mr5823010637.43.1785097728339;
        Sun, 26 Jul 2026 13:28:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:47 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Date: Sun, 26 Jul 2026 15:25:37 -0500
Subject: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in
 rkvdec_fill_decoded_pixfmt()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
X-Mailer: b4 0.15.2

From: Igor Paunovic <royalnet026@gmail.com>

Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 436bb460f04e..6ab6530b1cc9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 				       struct v4l2_pix_format_mplane *pix_mp)
 {
 	const struct rkvdec_variant *variant = ctx->dev->variant;
+	struct v4l2_plane_pix_format *plane = &pix_mp->plane_fmt[0];
+	u32 aligned_bpl;
 
 	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width, pix_mp->height);
 
-	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
+	/* ensure bpl is 64 byte aligned and scale sizeimage accordingly. */
+	aligned_bpl = ALIGN(plane->bytesperline, 64);
+	if (aligned_bpl != plane->bytesperline) {
+		plane->sizeimage = plane->sizeimage / plane->bytesperline * aligned_bpl;
+		plane->bytesperline = aligned_bpl;
+	}
 
-	pix_mp->plane_fmt[0].sizeimage += variant->ops->colmv_size(pix_mp->width, pix_mp->height);
+	ctx->colmv_offset = plane->sizeimage;
+	plane->sizeimage += variant->ops->colmv_size(pix_mp->width, pix_mp->height);
 }
 
 static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,

-- 
2.43.0


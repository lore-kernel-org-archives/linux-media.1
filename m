Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204555;
	b=dogywV0NbuEc36PnbEQ04gv0GphY9ETiNrmfBuDDj0TmO5ggOthWbizvypw8SqhLuAh3
	 V3g/7TTlpNNQjjyAM+XYBqexhTJPeVACzgCDls8aKwDryHx4wmiF5BPb0qUbBIQ20ywTV
	 94IkdKACRW4aNnTkRi4WIQfp77q+EcSnrbEkpfSYP2p48Wrzr7S0ARtOGRCY+ExQl7hqi
	 xJHVGxsFTu7B+1Ehjkgu4/iJVG7S9pWH10E7nqD+ZfkTk4E6Mkxr6uKMSnrA6rAj3SOaG
	 K4lelEmgM2IqZ9w+ktVAQjo7PFyEGhCU80H3h6SO6+n+6ehKVNGUqU+e9sMyeOMXicw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
	b=ang8l+EHNf/GJ+oz+9q1iR0KuEJuBj46F4VTQ48XhsX6oxy28arJntiip5RJq+CG1Shb
	 pQTfjYub/nNxbDhdrmhwghYElrm/NRtnbva/zK/ls29EP1x6r1LCaFjrt0vfQ51WPVGE5
	 WLn3ulOBcH1CLpdeheG0GeZnPO2Dfab8glM2BZaVnM2k9eO5WZSsaBlx62szboF/E9C2h
	 ngkJa4Myt2hpO2iH4GN0a+bZiLDUDgYaUuKro04muq6M/4Am/FcqVj8aRuOIQNhH1HOB1
	 8E7PlVT1YLOHf/LxkT9QcGgPR3m4XmCz9fTH/L0+h8JjLmK96Lsd01iEotL40Any1GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tIcjAjUx;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827C606A6ED
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7827C606A6ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tIcjAjUx
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a1dbb516so245146a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204552; x=1795809352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=tIcjAjUxrxhmL+ebmvhi+qZn0exkiyeViJ2yXq5Lb+lzSXU1Gl52t1vytvgYqv8TZI
         tf+L8ISi+c2VT+ehdGzxhlLAwHtKhxHx/rckftvB4zySWbdideqFI3Qjcf8FS9zuM9UB
         juhIY8Ux/znoq4/xQvvRdpk/EpoJkEV/nEIw23PGk27hw19Mx5/nI0cFba3BKDsoLZPj
         klNZl22k2e6h1UwJJzc+aF0G2sGnXhoTLV8Cqv2c3EiN6KfutE5wvpirtXS6RwTyJCaK
         OmJpH1sK8TI7p1exyJsN1ebLOrNCBu0FVNU+cv3EpYRhT4+xC10m1+VUT6RKoxJ80+q/
         L6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204552; x=1795809352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=npFX69b7MSOYW8b+cg8njjKFmbrXJaFBQRQBrqK3dYOiEexr22aMs38nZSbNr5MzMz
         KimbEDU1tKU7mqvfTMzBJR0fD1IqjHVrbA1BR37x4YzvgBZ8Qg/O0rYp/5EjNp3ZfjfK
         tFBmN06zXGr0CFO2zXZn6qxLO1gPLl3hJMo/wkIII3KQR2c9VDYZbVcg9rjt3YraCc5M
         a9O870zkCUu/abvcIxEV2rfhxmxS6dV8M2aS1MQ9tHQiEoqhAlrlfj6SiXrGfMmZa30Z
         1XnosVPfhW7PzkY9OHNk3hQqu8hg3p7IkLwz2cWrdH6aaIToLigibWGWvxZRfBsyXelv
         0YPg==
X-Forwarded-Encrypted: i=1; AL+hErEkEih692YxgL8JZ/OpidiMsJH1vueQZPiX8RbOucKhIXOxfB4qZRnpL1Vf+fGCd+VYDQnVJOnhFQ6GDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bmkgT6ZlWZvoBt+qZZoeYxENkwhnxhFTyLe+lC6mVtPAVD/aX
	/euNUKb9c+LwOuozb380vNGKrKiA4KhivpjJsIcjr974hXviWS49VSNY
X-Gm-Gg: AYBFou0V9d1gPwF+E6bF413r1aCQqb7GEZa4BDZ3+Sj/sbpdP9zd9+AtEfUoSblHhrG
	Ikf7EbzGNwvYSbDmKeO/Zo7aarSbFulaAL/BXlH2IoY7aAesTVs4mOCz1314liVVVmY/5PZDycV
	RDLTybrCYwOui4GCAhZNQl3TMrzC4kvzvGzRvSY9aiGtraHqplM/8HDF40xA4dNitIqfZjCyV8f
	Yh+n1qz8xyhjx5gsKGDKDRHdrtn1l+y3ch+QV/eenVWBrqFMUudQPdLohD5XubyXoBXyGidlxrz
	k/V34ojlkTcZaLs68vABqA+KAUuz5VhLHMoRrQO7fgnsrxP2pNsS8vri1stR2z3XIFz8VGxRjft
	k53iILrYSs48Qrkdhpknt9plzteot3ENsgCUACO3E5Z5zl8sjgVlDtY3RmltHgOCIWuS/dtjQsJ
	k7Tz3w89zRe+oFS7r1IYZkGZTJZpXBsyKNAyf9exf9tIUNhswN9JO0yPwvq/NtNCdpm5jlGi8m9
	ls6/KSyRCMyAcJLKRu0iJ2CVX72GiGCbjZ/y9Ds87rSSMThc8zVjQIICPrqbKIHj3Re5fv4Y0xM
	e9egSPfgesTH0YwXgYg2dol765TOf11IL3oIt9E/GsHZXYAa8s8tPJQG0DOHozGz90zhpci5CHG
	j/xzoQsHelIU4VYinDHE=
X-Received: by 2002:a05:6830:2303:b0:862:a48e:24d7 with SMTP id 46e09a7af769-8631595152bmr4939139a34.23.1795204552390;
        Fri, 20 Nov 2026 11:55:52 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:41 -0600
Subject: [PATCH 7/8] media: mtk-mdp: Refuse a format change once buffers
 are allocated
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-7-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1946;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kJaFb9TDiCBW9wH5WEhVxXJkX3lfruWKRoGStsnFGKg=;
 b=PCPt45813EoOYNHjxRgmlOVKVszumvKZjt/ednF2qJK8wPlqgWFtSes8GV7N82tDxXhjIVjXf
 8Y/vKnhc0YNCkSxZuIIevgZmBuoRH+twcsRDuNmFFFjAm9j2qLjIYA0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.0


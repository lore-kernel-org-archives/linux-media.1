Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637786;
	b=vtyzsiyPrdp2RWDoSD8SiVRBoA0nXYFX3C9DlgtpKs0WXsoiHf0U9TFz7d7UfIZBCNEL
	 QlVHFCr4aKNWQFx2C2WdDtGcBGxz5IpECP6zeTqukNzW8eg3i4Ona8EoADKnhsIX1D+db
	 WFwXHaX44xmgaTWcCf2I19vt5eWdJF0IZe1aIyYMlf4ZLHHGdGPupe4jWAFrUgqj0VNrs
	 v3zXqIMpTDWi9SdHwBzWCV8AEV+TI5a76OG7YJcgWBgQGVuphqJQWPkrA+KmRA4h/I5MR
	 viBgCznOYgEwhQOkcOew5A283q06iTN3o3Fj0lh9Hf0PdlSqnj4VZJCIuF+ZOWRztqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
	b=ODxhDdhhM6b575FSSWE1NO7fsljaxdCbVhpV+b6/kwPkIUEVMAwY/koBW0byHCl/5FHf
	 SEmjjSQp0C143RqqZf0gRTmepxlepbBMWGiS04AI+hreYEB0ipLVkSkCjcAmFISsStJBZ
	 7n6nnd9qfHLsgzjgV7fi8ZAHx93MawuSyjjG9i/ynQ6Zs3+2mE0T7HvQxKZugjgT+Syog
	 vvmDyEyHHcMv3+7XTSoeGOLZnZh23/ESUx6usiB81DS3SjeGsWXjXKyZOzjY+AsiPjz8J
	 LsNMIlQ1Yq9Vfrm0CVnAwtzLJHsDsMYYeeJms7u36Zl1J5ZBv8nFgkHr9+dGUm8pbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4k3tAT5;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F07D60A2609
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F07D60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4k3tAT5
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-71abadc4460so1916258eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637784; x=1796242584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=j4k3tAT5dAXjGSz03eKpD38liuL+zlc7E0yRO2ftyKb37sTKoTpgmylqgz0too95Mx
         FXWIDtx67QHOR9ZMGnAk5URfhxPUgt1sC9Q7cG9dAKAJDmym8qM08b7eYsUyaOAIHKwx
         Z5TWdU6lqmS0L/GZzDMZBLF7i4h6kuq5E2leywsthFSs1oSKaVt6JKv7n0WSO/PhnbQm
         lI6RRlkI/j2QW8ZtdcZzKRp3YFMpCgNRsoNtfdmxqS8O9JEcWhg82BPbZxbTHe1hH5b4
         QqcWMEV/U7Fw2efUZ03YOhxZqdpNDht/YRhzSBlMwV8iuWIJ0KJgVY+H3C5x2UJZ77em
         NSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637784; x=1796242584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=sLHYPSR8ePMyROkW/WxE0SLzSd+kX/GlglzuittSEHlvTLQ8BVGyKHwImR9VcLv0wx
         8QrqrdbDjEhiLbDx/Rar0lQaAYXXQ4h9nt5pUHr1uE+spjGvFz0WnkIxgXA+VEnhX8Hn
         bPXQqTQQyQFaxOxFIzT8rkqShQ82U3QspDQ2vKAyqxVI4xlsK0AwLBmLgapgxgmyPqXp
         Mv27oifiX6iMq/3Vn7ftfXHq3zyi9vUhvyx2CGTNtZTZefNp5QvLMQOAsSyxZqf0FIsb
         cIXWuweZsXQ1lSmrfGesfktS0wVagdSHx7SOlFx7v1jGs+ofObSmOY03KG/G51+MsPBV
         KRlw==
X-Forwarded-Encrypted: i=1; AL+hErHr5KGMOqCPQhTBK3BvDqXIahGJ9cjSv4biqJ+Ci+jXIoIpg8pBEwfAjT1NBbFVwiswgcvjLu3fbsVT8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FhKBnqhE4yRWuJlgaRBw/UISgG7XkS84w2sSd1bWISy/VJ5+b
	noorrvjRWNezCFs70yPryv2yhJ2Mvy5OObbLc5cGZPD23/nvKRWlfr2s
X-Gm-Gg: AZFdTZcunXizpCayJ7IWV10hFu2Zcy/VmaEnMY2Qy/okoifbMB4Z2NBfH4oC/CNRrhC
	dHFbA0IM1nPdIdTwRDGTmEayAnTnVjtiOly6vec+87i11isbDnXwi+xkmTJA2XIHem4jM7v+ILP
	/aCWBkUDkk7XH6rAyrF22EHH5LzPeTWE9WZ2p4m6fNp/Mhcocv/cwriDyziazYKOQJFnU8/oioY
	MjpRGOhcnB6o0L9T1AwIvkZwAIea/r0VMwTDxeZ0FDjugvwp6xhxz437+ksGPDnjQOq/uXIgCvp
	/V/fQfGPuEdpM7YuRSJC/QX5lyDPnAaMX5Rbv7Scc5ESInUtKa2Kxdk96SvPVJyT4YraZSPtloC
	3nL40lUSl8b45n6vP/MolyIGiEU4WQdoKMpoCufSx2Jjs+d+rdGqLCxIQhSDr6jfBKRY5Y3s0e3
	r6nLGsWsKa40X7QWNMu87QDt7houbMtR5GenFVq6DOOxr36qov0gM2Bx1ZBwPIOYDVUUmJ624Wt
	RKglObC699uJY78ZOf6ZxWI9cKBl2LbQnLqsdfNcadC8C1ISU3ww7k+qUgXEODq1eV/YHACyfju
	1gBEZ8bOEm5y//0hPVNsqyKUXj5ierm8uWQ=
X-Received: by 2002:a05:6820:1387:b0:716:df3b:e940 with SMTP id 006d021491bc7-71b3944022emr18067391eaf.16.1795637784658;
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:11 -0600
Subject: [PATCH v2 8/9] media: mediatek: vcodec: Refuse a format change
 once buffers are allocated
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-8-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1978;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=z9CNO4bCWGYjNQTDYVvQNuOaV1YRFSzVKYh+7SCdusA=;
 b=GzF6pMC0GCPOHve0CXuogF6oQG8hAnVLXT0K2N9Woit8cMr6jKke65a0sorZ6u3wiUe6HkT/F
 jNzOTZp9VN8A/BhNIpxCSQBMnSCT8Z7NjqdpvTXjWKfxIN/UV3Apuw0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

VIDIOC_S_FMT on a queue whose buffers are allocated sets the result to
-EBUSY, then goes on to store the new format and returns 0, so the
client is told the change worked, and buffers allocated for the old
format are used with the new one.

Return -EBUSY there, as the checks intended, and log it at debug level,
since any client can trigger it. The CAPTURE check applies to the
stateless decoders too, which now also refuse S_FMT on a busy CAPTURE
queue, as vidioc-g-fmt.rst asks.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1223738ece4e..71db692ed848 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -493,8 +493,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (!dec_pdata->uses_stateless_api &&
 	    f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "out_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "out_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	/*
@@ -503,8 +503,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "cap_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "cap_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);

-- 
2.56.1


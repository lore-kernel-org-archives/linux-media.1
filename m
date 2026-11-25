Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637785;
	b=5eKbGUq6Q5M2De9F/g+bWaRbPHyh7SnLn9zp/46AWHcOvjPZLcWKE3ctjB0XcoPLDGsz
	 9HzRxfsC8EM0kOzdp3sR1hdRedQUY556jx2jrvqJjEu5m27N2xXHx4liXardE8BFd7wJ9
	 zNn2+mY+WXgwEIRCoOOdVZdL9nr+c8IfsWHbatmlzrL9z1zL8lP53GyfHdo3B2a6r2hy2
	 IH9YTlyssRGNp/YIyf4aNqfzzB/zO7prJbtBI5M5IKFB0lAcF9e5bl3UyKKeiVevgjG40
	 37/FFXlH5SFhNeHYpCQVVrnPSErdJMqj6B7tGWRX/DAnS6VD7++cfwUDMQvpOvxKMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
	b=oLEwZPk7++edijH1oa+ZqUlcDLbP7S1jjbwF9jb+Q66i6q9hshJ5+JSifBJXMdwmVrzE
	 mNs9Ib63Lq027Ip7RV6gEoTOR7sPv96AElWS5xTxTg18S9M5xJrBtlAFYyyNPhDxqOm2y
	 zBwZDlZ/8xtCU5wBS5+RnSgXGzkh1Mr/NuBsyk7UGty6wBu8j0J4bV9ahEnAPJAutArl4
	 dH82VdplVtagT5nQpHHMJOTCO0u+YJC/Ye7BJRHaqU5WTWvKSHln+akPWx/pUdANeRDUf
	 3Dejjj4yYAj1VoChkn1F1MZsSrIPDc1phKGBoARxS8Gsc0SXQMI2SCUCBKz35aUpHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qi04bJaQ;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409F606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2409F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qi04bJaQ
Received: by mail-oo2-f5.google.com with SMTP id 006d021491bc7-7033e26cb19so1878160eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637783; x=1796242583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=Qi04bJaQ4HhiSJ//koZXkew6zDX/nHhlJInUxqfzQYe7eKa/6O8j71LniMHfnIzz6p
         M/UGrlWpRLDobK2L+3YOCH3Xxx7w36xy1nTSjgB/cWPAmYaXB1ntuZU7JH6oPEKWaYxv
         MrvH2+bnW0VfLTGfohB3OjgBEoL/sF0IfRcUrDpkCMILCwdkWUvmPu6TX9UDk2l9J2xm
         GKpWoHkF3U2r/5+iBIcbtcbbpO0NflYhrzN/KBrRypqfW15C3MmSF2R5eu3F5tehHTf4
         9C4y9RwBpu70nqwd03wpoT9Y+N+ZJJYlUNuiSjKHD4p9nbS0o1Cif4Cpe3kTcErFgR7z
         u0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637783; x=1796242583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=tOuS5Vhy3XQNGL5BkSadwUFVROiRcqiS1GENbn4yctcy4b+I9SE5ajUQwnm1PcGluB
         iktBZBRUucbtqygCzhtJkkB3fpiKCTn4htVW3z0AVpDCzedjL9odIIIHatXb0Bj2x7A3
         c4bFgBMJ4HnBllZ/vyRv1CM9MRzXGj6uHgmSbkNUvN7QsTgyGhYyKqH/TWXcheBwAk7c
         f7Lr91jrFhSab7Iam44BPwQmgXxwNis/H3nUgyUar51ga2dMaB/u96Ghs14igZLOqM5O
         o6OADV8sNJW4BcdQvMtPRiWZaL0q1PjSKP0N/MF46f6jRRoBlAl2O8LWTSK68FR3JpUQ
         rffQ==
X-Forwarded-Encrypted: i=1; AL+hErHNMNq5NCK5VoZ9zHPLgfXbLHI87v5h4nLz/8bh3AlcwUgVWSlvMwVxIoFGrCPTV3DJHQvFD8EMn+c/Vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zbgt9Um3/RMBC5GYv6UTHFhfW1u6l3HzlqndwzcPS/pWVt3+Q
	xy7EudncqWsqo2GviHYYNVVOI8VejCzZEdUqfy+vjo7cujoSNkeoMWJZ
X-Gm-Gg: AZFdTZeZ7bP3xfNhtHQNQBiuSK94425EHHH/DGcXZU2W9ISDSATQEWRnPz43qe6eFuK
	icabk1/tBiyv0MbzqJZO55pvBiItwZPtdpDB30Rf0JnbYMIlb8qj5JF6q+4NjOWu2IbQqrLy1m0
	nuHuFOOjwGkiU4/oAYJSlHYYMRtLsOUV9PVPqBZB0oXNhyugMlXf13jlcLf60zToVflf+zdpLtt
	nw3ExaT2Xg4KZmMvfSwkccr3SYK0ZLAhyIRbrVdkSA+T+1SxnNBQ2uITzFLIjwBFDe2dlpev41A
	jWHahZxo1QirJXb5us5JjilYGsG8oc7mykRGZS3LJcNoEw/dkUTEZRidsmHCMyffNO0Pbe75VEZ
	oL9HnN7o9hIad4T/GR8FWqgutweCbVJRg/PemO1dPjBGIfdg7rA6THKev/0LZ+D04zVC9fiowAN
	HWKgwmdcVep2VW54SX1KCSXfOARtlbzuaUPP6jonv/L2yGRJEZsas2IyEH30h2WUGzI7B+q7Ap5
	6lUuQsS8ShHzyv+Qx0M7X+AawpcwScLfIZymN5ezDgONRbrQSiU8OGZvCPhw2k81ZCPMeGmjrp9
	YK2kdk4u6GCcDkYTn5jO44M3A3qYSOnZSBrdZ54zj+ftShSdMcavT2Iz
X-Received: by 2002:a05:6820:1c92:b0:71b:7929:cb54 with SMTP id 006d021491bc7-71b7929d44fmr3615961eaf.38.1795637783065;
        Wed, 25 Nov 2026 12:16:23 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:22 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:10 -0600
Subject: [PATCH v2 7/9] media: mtk-mdp: Refuse a format change once buffers
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-7-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1974;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ToIzGemh2HZYfPM+0fU+WVM5fBqJcWgALuaETYVwNso=;
 b=YyKMx+idzrYsHi5C/jJHDCr8A4+FV3/lteY93PlNVBFkvn2Yc532M5WpbprdE0h37qx239ObY
 NbKcfOxO94bBh6twJeOGkYBw44Fa9nxQDmOu8P83mq+1flUeTlwmTUz
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
Cc: stable@vger.kernel.org
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
2.56.1


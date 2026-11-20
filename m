Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204563;
	b=xwOeg40yCt6V64VKKOJ+rXOchKI3w1Zlss2v9uxNz4F97HJl30Sq01XO6xaNSflUshIB
	 t6mysDpnd4sLckk/GbHk3nG2jl0xyeAITnZmgSOFBVD638z9be2UAW8aIsHKgQZLUuCWc
	 CyGYhwxsk45tR0SmWyDCW6F4xkvkhwLN3gNKVidBcoPPHEUFNSjmtaMdYINhjvGLgurA4
	 TlP8yKgYsLYx8vPedfMlQYEO3P1F1/3b581B9d1bfV0pDn6CNxDS55BPyxbTSUElPT5ys
	 DWQr39Y+R50LPG9Fa/ZmPzvCZPd1/ezUlf2u2SErk82oU3eCZaZEljuzjLr5jtRhDrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
	b=PeyY30aktcd7d5CzuyhjwOOeiBKugo5MfTli88VW6jAMXJkqQO+njj2h0/1eVechIH+c
	 e1KwnQSPO2eYiZ4cb8hid9y3U2z1T+7j7lDGJHt+XtXtQuq5gWxAdIcnQstPZ8QqQLTbn
	 vyp98JgdC7Hi2upi7GfBVPvWZsJG0UaWP3xai0wk8uyiPsl7bySlZRSXla4ZGHKaSZjaw
	 HCdQTRKotU4VKniw8PshvOw/Tzn9sGP1qS+AKBiCmmEqMtKBAL4Ob2Vc5aTE3WBvsLNtl
	 Et4B27Y0rD/mrh1y6VFslDwgyPvHTP8MECoB6AxpQnJsodZmYjXBNcvorJvaZd8edpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzYP8RSr;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30EA60A2618
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30EA60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzYP8RSr
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-861b66a5ac3so114897a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204555; x=1795809355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=JzYP8RSr0RUVPIvBwjnLkqXT9trk1vW54gJTZQq/ltQXnUz562+0tZ2TAk1ZnbZMMj
         3UWLnWJtIco6+XBG8BR4Sf3WGHI4nsJfznMphFjkYnJE2ZCsOiMSByXhgS0rNwAoA8AL
         6ZEyKaS5M3c3ruiTAaE7Q5MQ+nIkBqYort/eV4dSKJ+D/hFhdw0tRt4GE9iey0E2uU9k
         +wrhSn8YPiHrt9JvnhlhKTctUlxYcVswQM4u6z52cx45Q4KyKkmgyDwDFRwzuoVjF7Hn
         ZAzRtBOIxCGdGb9ThVqsTqKjsV5j0fC0qpEGCmMO6EH0coT3Ei5i3mHAtDFx9btwOohg
         jLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204555; x=1795809355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=2BZ7tzj7vxw8TqA2XliezViIIUzBpqKOpvmJuFGFwF3cTl6Iv+j8r7WZFIDk5OigCy
         otoK8KVSBB255N/FtS8rN3NzDXeZcLT2p8MbTpmKmOsGrbykZq4YDHt5khPSVCv/dR8L
         Lnp4Kl8KerCpiEXZiYquHaJ+ehOwOThtQdhXMbQrU40VKDUuTpb5nnEyepv394er3U3B
         CcN3EgbQj8BuMGb2HlLiOlUmzuG4nBUPmzeHI5EZBFi0/2ap5bORtUkGhZTXyhe8/QiW
         dtUWvppI0dH2eVhVW9fwXB025Z0ulhw4jCRPEiA5iGcJ0HEhJMtTgPZzencsMG8368oh
         Lbxg==
X-Forwarded-Encrypted: i=1; AL+hErEg9u8IW7BMCBbfeR2p7c7XesQ4an9WtsfphFMpnWiXeObc8BgX1RRV51DwmE2B9YDioBT80efP3b2njg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xsnu+DUBP20AXyl9fnePuMi6d6AxQRJnXq/8v7AMgnFOr6Kak
	37mta245k1nw9jUS2Uhj4wwU50SF+fPJB1F+uRseSszChsQW0aOBYGwx
X-Gm-Gg: AYBFou1yBfHepEUj3O6YLT2v/vZdShVKsh3RskOP+LwArlVYK+hy1Z60GR4LMYU2gEv
	yQR8sMZUrTeyQivZppRaoQAD/dJMlvyCTejEuxnZ1BqBK26Sb/udzaqPlPkLKmqdoNXAiXIGH+3
	Cn1gLYah9ZtS+ioingzA4ujzHjjSyLacKHNrpE+20/vO6T601A3Vc7wVXZx6mM94WiEhYTueh9r
	UdhBJZZf3djhdcUKlxp1WMViMg4xa9Lm6tXztAnbmY0ImTSk9gZkndl3dPoaYohvaduzWjEYaK8
	dGhHnB9k19QrvNxv08RxRZS3hQwc8M8jyzrElnFJuiI4fg48LHwEbpFy3cU0njRzBFdq7pg0ry7
	qmhwWnmUDR7HQAcDYe0I+QIdcZenIbISf58cpf+VKolxRgsNiXISr8f7/Sm6ccuSNQ9IUsGzeg9
	Kj9EYRMNrGPJgrqUYk4FTRCaDUJ7mY0gTeI1XIvKLEJMPfP05iK9THidIhYvzqtospJ4ACnPPo+
	n/IYyD6/kP2BQ7x1b4Ohz0ONM5ZpvTQnPNqucpJd0C+zJxBLAu85M57LJJtmR1vYHADQNOLE3Ua
	F24kdeLMWkty1gEwNSsJaKCIZ++X5RuRiB6zKYNKxwqGbScbpDpNR92s2Nn3ny5YOWcziQow4qR
	IbbnlthGZpYmPZ61xqRE=
X-Received: by 2002:a05:6830:2705:b0:863:588:fd47 with SMTP id 46e09a7af769-8631565526cmr4713565a34.16.1795204554951;
        Fri, 20 Nov 2026 11:55:54 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:53 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:42 -0600
Subject: [PATCH 8/8] media: mediatek: vcodec: Refuse a format change once
 buffers are allocated
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-8-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1950;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=uxN8uWXPPsDNnitOTveJHbSyY9I0K+Jb1iUDHWdG5+A=;
 b=EgoxeLDbz0VfDWewlqSPzl6zYQWyndby+MOiqVsid5yzHe2cY8RvYuopyUvIg4MUWXFHgC1EY
 tUWmrjd4dQXCfC327gZfBpckWNpOajpETTR0BjM851h3zRyGb+5/mms
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
2.56.0


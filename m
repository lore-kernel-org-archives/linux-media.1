Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2A379982
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097726; cv=none; b=NOsIxkBqzvomR4/G/Td74W1FhikfS8DtW4Iv2OFPD2X6/ZXOhFzFPBYaUj4UpOysw25RSlVVdtg8zB7MSwlBFgOJrZMEHC6oZyBSY1mc7m713Gal635ai4hy8oQsjfz4HrD5c4C9omNKIMZkxOrt9p8vecB1+NBftsQ0sfuExHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097726; c=relaxed/simple;
	bh=xrJYApi44R5M36YnVIY4FrAMyGAWfJOvOoTQw5LWppg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hb5PgjRRefaBXphOvX647M2sOTxZP4k5My/iZ/0zTxZXasMp5qyeC/E6LfAEL9CdOV+KkdevyW8E6ikXrsFmZv+puB+LTt78PJR2b19prZcnsi02MTHalgws7cHDPHjiZzV6hMYlmWlyv51uxrLZr+yUOOQmAQfRCdwjeXnFQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WowJsNEU; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WowJsNEU"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381072761d4so1424693a91.0
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097725; x=1785702525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e73x8QdchDSqnuT6U4OkhZ4rgK0OXUwrGO2cGkRXz7o=;
        b=WowJsNEUPdHyBpwdLK5hVYDwFfZovdCCBTq7eGg6vo9500YTMfbI8yt5oNRaque8BQ
         6TMiYhLAsKLYFvtL6cHvcwuXJUJqI+YpSmd8/rd05K1ZL+uQH8A6MqRLri8vuB0yyIHo
         ZDVUhynRs3cgAWL8p8tlKcOrWS03mYx4pAlBWD/NZbJaBO+egiq2U/Q+dFnrip+u2mxt
         Nun0Om5i0dv16J18bTnq0nwMng42QHApLV5Dh00zBIp4YXkGNVAKSuauz1+Tb0ur28om
         osSdV/ZkoM7nS010Dh0ikPQdQHz1ULMYKaTGgabntlrjXa0j+NhnNqUjWBc/VlFDDZGv
         Dnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097725; x=1785702525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e73x8QdchDSqnuT6U4OkhZ4rgK0OXUwrGO2cGkRXz7o=;
        b=WE8S+vzLRh6SLAm/otmTJ2aIYwlCXy+FRS2ANLVKv/SKa/HQeapKVUAImKze2ENAYL
         2zUebDVdk3BWnPQgpB/OVhvEbu5ZL4TG7Rzd4DFy0LNPV/1Ur36xFAA+zIyF203mbe1Y
         rBTKVnnr+lQj/ecrDIBDU2kb9ewIuheqzZH06zcmJm0Xg/eSaiJMzdDKgbej0jWZEp3h
         jVBSG+cp5rCuaNcqVV8c5eYAfgKkw7BcUx5zsFpJ14kksy1A6bKDoqU3JFKfFNyAWk2W
         WsqJJXiNNFq9HmmXAb/bz0z5Bet7KVah5j7KpXJ9l9aKXO86AA23bh22av5RjmEigJF7
         a/tw==
X-Gm-Message-State: AOJu0YyzTVwhU39On+9fsVOcnxjGoQaEUatBWugTHLF8PJXYqJ+Agyne
	bbPuiSolE29tDaaFTKip5sq00yS+NQ9MB7XXSkLAYcXjjNKuYo3e3MiC
X-Gm-Gg: AR+sD125wt7YZkjwvgXc2SwfK00AY1w1EE3mMp51Dn8UjhpV84pzvVm6W6OGkXVyW29
	MsrC/55SEX9ZbjnblFK3CeKuSHrNPo1iLb6VErw0ZO8uRW9bU8SiE6qzfGUJnTtQZOzVyC+brbG
	M64gLaPx3/5nVU4jFihqCtgBjrCn/LKhmIk5S1AEOMj8doUWoO0JT2o5StKCV3f2NkwBMOWuWpN
	94q+b04k9VEQQRFbGtouHpBOi/hZBYpwk+FmAYosfkh1eLEXYz7u8EpM0ueaCW2mBXJGO5B+CR2
	OQ8YVnj0IN+Re7cHWzJFyHojQrL9Efm7yz4JRVr+4YS0WlJVpZZa22SOBjFPdNYp7vNWOLm/0xO
	ukGkZJH9vB0kZrl+AU1EdbLH9J47IZ4m55XWc+eZCInCAcEo8p72qLjQz8C2CmfzWEB03FhfACj
	RW3BZWSel4/dH62cxnt4H1VPBT3qWiHNRKA407NDWpUyvMYorq
X-Received: by 2002:a17:90a:ec85:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38f293d3c03mr5635996a91.2.1785097724483;
        Sun, 26 Jul 2026 13:28:44 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:44 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Date: Sun, 26 Jul 2026 15:25:34 -0500
Subject: [PATCH 1/4] media: rkvdec: vp9: Changing get_ref_buf function name
 to get_ref_buf_vp9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-1-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
X-Mailer: b4 0.15.2

This change is in preparation for the upcoming commits and to denote
that this function is not to be confused with the similar function
found in rkvdec's hevc.

Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..d4243ce230c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -349,7 +349,7 @@ static void init_probs(struct rkvdec_ctx *ctx,
 }
 
 static struct rkvdec_decoded_buffer *
-get_ref_buf(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
+get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
@@ -489,12 +489,12 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	dec_params = run->decode_params;
 	dst = vb2_to_rkvdec_decoded_buf(&run->base.bufs.dst->vb2_buf);
-	ref_bufs[0] = get_ref_buf(ctx, &dst->base.vb, dec_params->last_frame_ts);
-	ref_bufs[1] = get_ref_buf(ctx, &dst->base.vb, dec_params->golden_frame_ts);
-	ref_bufs[2] = get_ref_buf(ctx, &dst->base.vb, dec_params->alt_frame_ts);
+	ref_bufs[0] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->last_frame_ts);
+	ref_bufs[1] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->golden_frame_ts);
+	ref_bufs[2] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->alt_frame_ts);
 
 	if (vp9_ctx->last.valid)
-		last = get_ref_buf(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
+		last = get_ref_buf_vp9(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
 	else
 		last = dst;
 

-- 
2.43.0


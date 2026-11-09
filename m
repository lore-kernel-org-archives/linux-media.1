Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246673;
	b=2H+p+2IVmp/fnVfTPN6R8G31D8eVvw8BfNzk8EeFqcV7d5I8b1wVYCNQlthNd+fd0RUM
	 XR2oRhf+cLnpSRVA43QY5VJghvkzBb5L8aPH67UX42XJUki5j9AXDnnKUaovz55hOaZaV
	 17OowqcbszMdDbtBV39+hev62FewfgtenZPZI7HIbjRrgxvAw7JtqYXLBbyqjwwOoB7yi
	 LVC4Rd4eXOtwIXxTyMAftqAwFSbgBy3IDgBGD0gFXZLaEu1Ry8yZCf27iVlyzQ9QoyiMq
	 82MuNvXVpMgtzjRXySCIco18E1WsqlFMQNBKzc9pJ+ZK1BstmH/Z1T25EmnOfg0DwpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
	b=3+OdcbrsTOiruawTjGg7I+NuQ6YDYE2ZxjaBhs5JUKuyZQsY3vGhUpFlj9pxmtASXCns
	 AB1MhnY3pz+kcOHGbsimLWX3KCaOB0vHEFTFtdV9vkYsj19xHK+8kDFcIYFkubDZHTpA1
	 Cj3iM4mnvkjJJhoGx3m41RMF3sKTFuntNVAEZRjpmAngmPxvPvZ/WyOLo19qkX62zboTM
	 D61SfsYt1ZdnEUmKxH1pmgQ4tPabbErM1/qYF7RHhykyJNzn7H+SRRMoykk0VoQ57PqiD
	 SjCd94bQE+u/ghAFQry+72uQ7Q4KXqWqJK+Y7P+zBIkYm0b2TXz1uZBn1acybgqIWUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFoT3MIm;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8860606A338
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8860606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFoT3MIm
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so803411f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246671; x=1794851471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=HFoT3MImIc+l1SW4Qf8O4relKIrSxk1oxC+wvPSODNKAcXcBPkCeNNf1FaPOVno7TI
         BNLRoJxHqu8t/iDvyHeGPNd840xq/Zjz5e6QjaDbSNp99nv33ephDn/p/0GEoeuvSg9h
         OhKeKbcyCflkbhfZOygjtIwR9oQN5zxROVIUJ9FkP5ysgw0wHvcrlpS0zbgoU0NJGyDo
         OFcoTsZx61aoSX6GHwwfeV9wvKDW2MN5sylApc+6SOkfYJ/7u58FfuOyoyOYTqTDNWCF
         8+5gPdmRuTrPQfJqziaAsxOUop/fPJuQNDBY360FfASj/masiHkKuu6LsqV8/GWCclOX
         mcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246671; x=1794851471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=ZUkm7jvkfnSxk9Ol/L9vcOsUfVFlNVrn7SeLhVK3CdLXiUXCaHKJrfGNACuRWXOlDZ
         mrHmtMsgex7e4D52fJhWjET0Q8yjeupuUU+u7kdNbD7fRYZVoQUieO1uLRFv/jt6aY2D
         s97OB+VyQhWL0uDC/TQ+ndZEg20wnpnKdQSpqWdncjx4oz4TN/+qn4+QS+voqKvHRedD
         PW0HS0O4wBv8RS6VIx7zQWp1cLABpBIH07qxHIpd1KQpp8BGuNNVSWiZX7y/Oo0XPkFA
         0YWpIrNxEZkd/2EE+ZmX6JFSMwWi2PhnNmahIAhuNTqF//gTez0WNaALqKNXWGwtFyDd
         CJ7A==
X-Forwarded-Encrypted: i=1; AL+hErHOU+0TOfBc0G3F/6M/2TLGISrmntdLadqz0fgd4a4doAo5EeP/iRJMJbny/J59mmt18MasjaG7f0/X1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YUUR7Qp2b1Rjm74n24svC8DV6IG8wgQACR8UEvC2cIK8yWIRf
	wh9068QcHRCFDaoeZnYsJF4cB3GCO6k6rkH3+8CyJPFN2BuKAygGZaiT+tbHCQ==
X-Gm-Gg: AYBFou3sMDpsRdLTPoniCmnnmKrSVEyf/yGfaTYyfhkqqSOkNmRccReKf8QE0Uqi3Yp
	gC+JXZVr/64ezlS4BAQl1mKW5pUcMvqHo8/yJbcx0Gygh4EUES3acTyYpe/Go7kyh6U48J/Eb70
	AQE3EFFcmQT1voLKAJZxZsLRFg6aU8y+nJAE34ON/xVkjuv7GFUIAEhR79J24wf3HLfXbaUv8Rv
	RBJS9aZxmKjtTnoz880eTNOSZ7VWmGd4lrn8QRyiJ63F33mGtwMED0elVyo6CVWiUKdu2e/LfGx
	NcliK73puCKuHzg6BLV85Kgg4U2NoEypdCgU0nFfc58lDgo1IOuCRn/YiBNiTdU7QVbpLsw2t3G
	Wbz6Dd2kCIdCGNOViMJnMrFM5rXpUJor2C7sl7h7U4b9lOVuOEpQR2JH8CAyNTUQHYA4QRPsMW6
	5F0sokwVpZ5sh2T06a48PaTSOkGeY7ZikTYi00l6Z+m6Dis6WnzHhXx6rQ1nHXnl2yXXUaJuVBY
	CZQHHRv2lIJoc3lVnkW0m/S0IckP/d3BZMP1dJxmwvpgupkKI4fAD3qioI2CGZbgPKw+TaYDP/4
	/mphsc4XgNW+hh5N/RNneSnRrWW9FO06TArbzjvrOQnJ/JnZUAH7ZtLc0KZiqrlzaqx5CsjAvFu
	BR4OesyPh4YeZgNML2i+ROXBvSGjxDJmSh5Nn+dDLJot1ENwka+EPlPdVLnprmCMc/j0y31gect
	+Iy0c3rDWcj+ApgVCN/bpircNQ+RJzQw/zZz8YGx8oR4g6VaCnlzW8VKHz8sLXdrwwxclCRfZaq
	mC3VPA5Zg25Uv42om6bSl67Oq5RdJARGe09joqsDTxiXt8BeR8=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4982ecf64f9mr225642f8f.17.1794246670969;
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  9 Nov 2026 18:50:09 +0100
Message-ID: <20261109175016.42061-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does. Like the vendor library, halve the boundary height after
aligning it to whole macroblocks, so that the boundary of a 1080 line
picture covers all 544 decoded lines of a field.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..8252a47994aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height, the
+	 * latter aligned to whole macroblocks.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
+			ALIGN(ctx->src_fmt.height, 16) / 2 :
+			ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0


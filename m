Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639004;
	b=TeKP/ezGBySMS9e7DCSIOaNzNNJmcCLaG+WyxhnscNjEW00i1sLdR8BTv9e2bERtP3KU
	 eC/6POuP5FxYxpoq4vuYBryRwFaYHj2n08+Wfdlo3SlRF0BQnhi1XI13bR2zpSiWpyWZx
	 kTeyDmkkrMM9wOPBv1Y7zLX7JSlWpUS69ujDxqCJxexw4FUzYFkHJBK3Y5ApWMTKCZl2Q
	 HZ3+ufNTI2V64p6IVuyWrI+SvpSuzKpOc37adQL/EBOexrip5rZIM4BS3QeqV5ja2xT5R
	 VNELrMCjhD3DS7WDiaRn/A7sYhAqZZerTMWJb5DPAl6CZMWZ2UsyOKBFVgjOvS/WLkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
	b=4zocMLzdmg3rCcvT9SDvTN3/hz0Rod2dd+V9MGjlI2DO/6ErrBKbllufPD1GOedziHkP
	 KVvK4SoNiJouX9K/V/EdcADoYOKpGQguzgY890auRgBmHu4/1U3xdAIVrYmyLcA0fEjzn
	 ahbTptGVwiYqPWEDGpEefuOfC4O50kZ8ocj0JeWDxfgB+VTay4yMDsGxc2mf2EmI7bbSH
	 kJSgFwt60qVsyRJ/t2j8z4MVK5JAc16F6QWzp5/05PW+s9mgWXuhIYpOiql9jQMhgh2+t
	 dT7259Dsdt7QbF3mX83d+VKgTGbypujuu8SmFbVQPa9BRan9t2ikOvuqy0VZG3NGOgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXnOaR9o;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3B606C56A
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA3B606C56A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXnOaR9o
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1917706f8f.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639002; x=1794243802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=uXnOaR9otSvJ3PSwNxNxelHyqqYoHbOVSwZPsrIc01AGLza2N6pHQTf/NUGBlsM6Ew
         ijflrTWnlHkb2JIoyOTdM3Jgrxw/mExt0ZDQqBOB3kCHX3aTdufNf2gjl7c7ZLSEdiGh
         yiylvt77GjBJ9Q/BqxIqGSSXTXzNcuLlCGn4qbPoAU5g7lPhL6eKObqH1gfLi5lZGU/Z
         c5SclH9Rk2scYbN4eUrdh1P0vqp3ukF0IaVv8DkqSBW0Nk9A8ADdDmNCSc5oepwRU59Z
         CyfCnFp1ihNsmNUtpy6OugnJ2k76k9JhB2E7rL8lwesByEz+AoKYEDgvW2OYhJ7SSySx
         BQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639002; x=1794243802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=tfOM95VBSLS7kf4MIktLoNn2NnLmL3Ksm9y7MH77nyS/NYiZi2MuXlvmzEmsrLxiyb
         IyiyAJD2YqdY87VtjVSizWPugpVA7J2cUlVrWEfirJiKF2U7EUGuE7J/86qOFcgYWXck
         u818Raz0vSftxQ1msCeqdup/sDY+fVNVRmHTZSeYeZQL2dsqBt8KN2aW5wdCsEnCsSA4
         8+rn+YqRDu5c9sc8nkeZCnBL/FP44MaiGmbpVIitZnPHCPatOXtGtjvHL9fmLzr4Va1U
         zsFhpAPSCNgtza7i5E/Jkfy+FH4t24zNTMjZ9qH5jjdTkXxR3RA7G2GzcDt684Z2ufts
         SMTA==
X-Forwarded-Encrypted: i=1; AKwUvBxT0LpxzHifNYPKC2OCHPWDuRJcgJvxA1P1PAZ1nlk3O9XnLgW2brSjhufeIOlWAIjTcqGv6OuNuJVc+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/P+fA1kmDdZGCeKCB3HT4mWTPJtsU/GnU72YmhJRLlwOhXQrdT
	MTHyLShOdw+boInPXc7CWTIo+rWfQCWaGenT1tLvb2l8mdvACiNLGujZ
X-Gm-Gg: AYBFou15gNVXFlBeYTgoInSbd+lteAScYwU+Mn95JhGQmFDaqtRsrbJht4UsORwtSnq
	FNL2SXb1+BL7r96KthR4XrKCD4gvw9JYqusVzzv+9p3ZglSJwmnqjYBYBgI8qzYrxaKuwEDV9Hk
	kv481EuEjE2CTuKvA7UXUHT9MPJxs0qrEFQg+VkzAbODotM/4GIYaNqNT/prjxISEmT/uL3EM2l
	ajFu+H3z26I+vB5GXlrX/NvjxoU/n/HHCVZLk1WekoDxMm065tkKHLXFo2etToBBQBgdAh/1udK
	mz76MA7RlYKWVNlzAuIBy9l4xbesIPAl/RCpdQ23FpCNOhQV49KgiCDWHa9tTcziwGCXyCrcwUv
	EJ8Dm+HQQD+Mv+I6gqnxMxE/nkPqEbTVAPrdobmVBgFO6cwXOftkHGltfkf3u4dhZzuEcTMBiTr
	u9VpRMDuPXIjPKdOf3S8fiCDUiU1IctIheKDka2aIdDu5sbLHDlUkaYEwVslp6bA9TTxiNt1z1l
	qkmC3obPPG01HCIj3cowBVHwKjnoONqXOOoN/Pxwl8kpcY1lk+UncizeJX6SPOKet+8rbBnRHIv
	w6A46MKhA4OTVqIWVjGx/rDvv425XHtjGtW6OH1JfOJvaPxr9DWnoRoLiE4xSyELvHoWSa5kSQo
	siQGOXsSvxlDO6+MzFLkU8PpGTPGhODNw1TWkFcSkooQg7HhDToelIagsP5HYOPiO4wZt0tE17s
	nc3cYp2jjhqZ2/xq0OuOYcnJOQVAPnPrUO+7CLlc4kT38hhdQJuhQ8Q5LD2A88ebVbaHHi7hgJz
	5Ub/rd30uYIvwD2TN8yEChfx5RvY4jeomKHU52+UFTj4dGdunSLok3BZ8UASc4sMW1s7q0=
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr22985553f8f.41.1793639001832;
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
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
Subject: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  2 Nov 2026 18:02:56 +0100
Message-ID: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..a716955655f7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				bool long_term,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info, ref_type;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	ref_type = long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
+			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
 				    &pic_list[position]);
 	}
 
@@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    false,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0


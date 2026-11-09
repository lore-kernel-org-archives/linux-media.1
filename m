Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246671;
	b=FS4x/cybyHU7YtGJ+sEz+kST5Yt+D/pyZazIp/c1RkLL7ka2+T49s7a9OMy0Cai1JPBG
	 84v6M8qxqCP3HwJ77M0lxu28cKvWb6lohDHp2doT+jvzdlToIcVpWCkQPaXPEizM2JrI4
	 oNaknHPF7i/xREE5UMr/avsAgUFmHoYaMJ5agtfXLdFVavrLLG/iNaIE+MCzyNk8iq+q1
	 s+uPbaf314r2NlUaRBIieJ8tgMmz/SO49YY+rJDzB/QOkK0sf/kaHHsOIW+/JAVmWqNaK
	 MvghNw6zlf8s9/j85DLMdwo98tzdERFiHlUWcoOc5DQoEMZBj8VpGyywdxb6P3e7qvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
	b=FYSxv8eWQ1lvhgajopM5R3szmA7SYn5rLYVwBarDfSWHwMqKfV88jNFE2PI0de2tp0V9
	 7ooyiiTz10ABrsnd1EVV9/skSFjqugi33zZ3hBaW0AfFetska8AzZihhead894YGt8eec
	 M2kEHEW7l1tkYfzFHhJoH0yCmZyDactdQPdsaUVjujFNLnoePuL559NGUO9jr/qfUL+X6
	 t6tk2cf4A8c3gxmADl6K4ojCnU42Tbe91tD3VAnMhDlAOy1hCGELARhXaG2aItaNKAbsv
	 7e+7Ur2e1ejMy1aH2PDQ2CDNYM4R/YK182dflYIM20VW2m3kC4wYerv0C5u/CxtKs2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vkYq3KB;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D360A2617
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5D360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vkYq3KB
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4910b863b84so754265f8f.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246670; x=1794851470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=0vkYq3KBgJnH92WkNlV75oKqOta2YnOms6B5exYl8Nnlir+glHt7Is9QMKBbcY7zEr
         gl5FPuqIVjAVUV2tba1ddyLVe+iYE8IA8iutq53EMZ6NhaBM7rWx6CXYCBXujJjCOVZa
         xBEQs0Jtzhg4PflluRlFiy/9PYM3cfn2CviaF+K0iUjOUEf90jVCDjwbb5eoI51oJvQg
         Bd/k3cYHbab5S59HjaY84D8ZEeyHheSG8nc8m4hrZD21EV3yIwTB9pwHKVVXON07iKjj
         P+RHbsxtyu4gZs449lsCR8xSdTGagVMDMibvi4bdWdJSM1PukzQQa8ZqpsQv6Xr3Z9qW
         fjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246670; x=1794851470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=XrXWkLNb6LgrFCb9RUL9U5AI3S7qkOq0wxN8Hq8Ah6hPRVwP4s42ihVM6PFAHAX9ms
         R1qYWS2PpP2UqcTsUqI6JAnxMj6sqEyVQ6OFLFezyDNfrylPCdv+EHJ3gdWi4sgi9Fgc
         XVQOKpSA9gl96PuBjIzz751uQ2bMa08XrZtcWQx+VK/H81qwP0QHs48JG/0UfR2VN3M2
         fffU9QsKn0LDPG7Bu2b13AWY10i55A/1G3uV9Up29mCZ9gwdoDYvtfD/7MCTeC68GNhQ
         yT4hI+TmKm37yJIIFY06I7JvjDjZ8u7liAMA2EfFMsMLzMVucaGTfEOunnwbnpLxbrE2
         ZrVA==
X-Forwarded-Encrypted: i=1; AL+hErGSh41bsBjUDivIZZYVYyImqX3G89jJaFjYJDmhXOY4Z/M3KRLV4Wn5ERAIIylRI9+0wuGouPdKG0TxXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zGo14lzux7saLEUFAc3Jzs+Bp+3jLjYtkavMM9nzLhVTTWDN2
	cZAaqjSr/ZjLVZXJ7rU7BfWCv6ZdEbSvX6BFsv4E6vgf2lV8crMnYSSaeJEmIA==
X-Gm-Gg: AYBFou3vO32apVm43HXv/a/a8VN0i3O27VI1kGqfeOQ/51eg2a0Y4cUg+23N1Ur2Mi3
	hm2RSzdHiBIFe0Q+8/0SoLYaoMd2yju6UpluU6uxw1x3P7cBn82OLQ1TQLHIqkKHa5ElnsQFqHD
	syPqEdkQezWF5oJJCrC1jnkbG6HKvNH22H4NVr0BXGGkb77CpQe4KYEw3TnljWJ0IClqO0vzGYL
	StzmUiUSnyRjZEmm2hxwpXQ/t0wYWTknsAQ6sUQRjm0evhhgvEUQjIBkrXfNhiYI762S053f2zl
	9lDbY9EYO/Sv7OzX/DFUwxkIubUQq6FEIhKbaCDD/ZEdhiLzy1nFnXGnvzB7Y3b+h5fbsGnHwkN
	3Ul0YyExvjbgSwOhxCt3XG4IEdVUT6C+EL77agkx0GyjZxruFTiWJoi0p6mW/pOBqiQp9IjzrcC
	Nqo/JG5jwD030DTMWqS6ZubVmv7PyTOtjYJYac8bNJtg40OZ+mBFIDbuBE9bvHqUeYcc8SzDDRu
	cHpnRoiwqHUQnOLVm/i2/0hZ8spRG6HE9CG8OSsQmmB+XlIEvcFRKR7WEe6mnOmUG56catDQoF0
	jkoAULLzPhOewfvniwRzPikojzMFwAi3BygUcRfx4YgzaCJ7bwOXozXk/3+wlp0nZ7cCXxpqIUg
	hhhwBtlHPkgCRV4Fsn/+y01kKWJgXm55rgV+FpuoIQlsY5719HgKztJow1lamaAYTbRZ1rwy9LW
	KZ761SPlKxDnBl5q7b4i0aIC2K/DsVe/FHez0D2uYLOvEr5kAsYZ+ld+nDzBNcmtXWZaJlsP0fw
	FdMlxYO3MuE2k1v+DmGFyhL/MtTALJWYV+WiM5SfgVK1l/ywN8=
X-Received: by 2002:adf:e184:0:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4982e920d55mr359034f8f.0.1794246669666;
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
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
Subject: [PATCH v2 03/11] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  9 Nov 2026 18:50:08 +0100
Message-ID: <20261109175016.42061-4-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

Set it from the DPB entry of each reference. When the second field of a
pair is decoded into the buffer of the first one, the entry of the
output buffer keeps the reference type of the first field.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 24 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index e8229c60d3f5..97958ceee8d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,19 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				u32 ref_type,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -83,12 +89,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
 }
 
+static u32 cedrus_h264_ref_type(const struct v4l2_h264_dpb_entry *dpb)
+{
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM;
+
+	return VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+}
+
 static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run)
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
+	u32 output_ref_type = VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev = ctx->dev;
@@ -117,8 +132,13 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		/*
+		 * The second field of a pair is decoded into the buffer of the
+		 * first one, which keeps its reference type.
+		 */
 		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
 			output = position;
+			output_ref_type = cedrus_h264_ref_type(dpb);
 			continue;
 		}
 
@@ -128,6 +148,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    cedrus_h264_ref_type(dpb),
 				    &pic_list[position]);
 	}
 
@@ -174,6 +195,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    output_ref_type,
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


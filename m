Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610190;
	b=m0QILjKd/mUeid4P1Hs5QOnTCwhc6h2aTSRRW8/fdIy5706m/AE0AiZpcgM+1/jCVPoT
	 nDo2cgFg1Z0+YDOCMvnb1CDpJ785K7tSGKX1JDI+mRGLr4wYzMCEPQLfKUubj3PGcJXOA
	 yjaPKOpwcTadJoUSo1MFeimViFpelb0Jwazkwp65lIA8UKTHGe5IQBBZhYsNOrmROdnHl
	 kDD6epOsvEPxFpVLu97HrEl7W+L8hFX+8qIoYwoe/sj3jl/QRRm/6y2HYP3t+WKqVE/pP
	 0F1pIpjGhDGEMlYYJKUv8nXkI1e2WgwYIkfJyGv9VRtZMFuNokK6KUwT5BI+8mzZSxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610190;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RkYdT4Xc5mLlkg+RGqJomDeu5fL/8uIl8C3R1U3ZzHs=;
	b=NnKsrLSziACUdioJ/DZrKwZsGdUn4umdI2Fo98WaKJbguVMKTcAu6kD4ogWLt+K5y80J
	 c6OoThv8uXm5fz9yo6PcAgp3Dt32x6Heyn5XfEMzbA6dMMrJ/NbMYAU2bDZnmUGuGkAhW
	 aCP/ykLlKZcAmnKIiMuZgk7wsEGox+23Exft/g7FOSoyWUbSUCv9VWZUywdVM6LehPRTI
	 zrcX9aUCbhZyolqKjGjRdx39HNqJH7J0r3KRkjNDOc/O26jM3yZDmrwo43i4ONEGoVVIE
	 aez375Sdrx1nQ/alLVQak81lLhJ8JCxflzNmrEIH1VlfW300PJvBacYL1TWV9HQe6Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=RFcAe5us;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QAZxfmxv;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D3606A320
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=RFcAe5us;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QAZxfmxv
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E89914000CA
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 21 Oct 2026 15:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610189;
	 x=1792696589; bh=RkYdT4Xc5mLlkg+RGqJomDeu5fL/8uIl8C3R1U3ZzHs=; b=
	RFcAe5usCFiv4U43LC3cC6vpo4G7SMf79FP+gbcL2/ZK2DPAcmlIUBt443eCv5g+
	/p2LPoW7G3N1ZtbCTIQI+ULJxi8aqRC3kIUyV2KkXzLIkDia5b374c2qmIsftwJx
	mKM6NpAQdI9nEY6H7Z8Hn2UARI97qfMxPEcySPZ9gzqHYfzp7f01tsGw0bcJR6Bq
	RekITzwlKjtBStQJ+i2+7E+dYoZMuyHn8Y87bZGlA2+K3cJ96DiTP1lSQezwhA6t
	15Fkcitvh2ajbQ/2DQ8lDYYsFwHjUujAUfqhUvoXoYcWHoItaYp7wOFv651Envlh
	QBjXx3TPFbVN2JhDK1caQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610189; x=
	1792696589; bh=RkYdT4Xc5mLlkg+RGqJomDeu5fL/8uIl8C3R1U3ZzHs=; b=Q
	AZxfmxvhMbMaqAnfCFF0nfCuSC7DlTNpGIiaVItbj16X4GdXLmG9awUshGKwzPWJ
	+v8p9f7Z+SyJXqccXIMeUXPfQTgJIXfrV60gxoxj5ieOZSfzP0qUQwDolD0MATDn
	3NnMdckABG8WsmpemD326P++h5OxmrXExI1cic5KotRiaxy2VZRUEk1QpjW7UdOt
	2scbiHd6LfsFa9CX1KhOc2w9H3vZjStHflP0Mq7iC+baUB7FPMo3d+OSw3f1o12v
	XeEKOUg5IdjBVU6tQsZ/6oB1BKZBmUv7ePIsZ4I1vF3XrA3UEUC6AjPlawl4K7Wt
	cOBy80WmLP7z7t7J1zYNg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610189; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:N20UXTGn2RfKchANbKRT9bbcG9nZ5OxAdoRa39oHAFjgCGY
	QQFyMmSu3Zy4dO5bA7mYpAdcLoQyx4d8SRNjY7y8rKDHHA/b1zr4we+dsV1G8C6g
	jDbQC84YrLcEk3f1Mh0f5JsCKjEMSV2XmIAfAT5JxeNhHoX2cmz98CTv4/e4CcCR
	SbTcmZRUUnh0pzn8WolnPkrVyf9ot8GJULihJdiTUCZim5Dd1/mNovV/RjbizR26
	r8CImI6yfB49arv4IsK/UOGowWDffdhQYxAQgl89WByShnVp3RRoXi6x69lMoyCF
	H/gD77/JiylUcUsFuGIaLS068rV1R21ZrOmE3xA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7D9pBAO9vEPSbgV5yEZDg/YbPNAru/L8YB2BZM4oEvU=:Y69Qx5AAEk6cKXCiupMmTSqJ85qIyk/HmbCTt5OugNk=;
X-ME-Sender: <xms:jQ_Zanrs4eZAXPNCmTaONui56RXrBB7yq6IwTOe1I_Y5YsdMAsL48A>
    <xme:jQ_ZavdZP-5ln8s_l2iRAGu7lFZVTcV_WHDfSzFPfzz44YcV6Blha5zZdNvm53KKS
    p0ydAmYvrbmStC0cvijSpSFN4kU-C1liQXsJvq99Lz71KLNEdXPxygt>
X-ME-Received: <xmr:jQ_Zauptwiq9z9PNxpB1lB6iQoSNgay8Fr0gzkwyI4IIjp5Qs04fSYNXEFPDnEWKyIylBrZPfRU5wWwIb8KX4FrJ7XkVTa0>
X-ME-Proxy-Cause: dmFkZTGnRf3QuZZU0thrcgX8lHYTDkWlSG29PVP/D1OQ/4qQuIv10Jc+fTUPbLmClEtg0J
    jfmvodXwkA0UN6fblifi9k0yWe7QWcAu52CbWVy+nhDgOo/VKHFknnYglC41BTgEcN4PBg
    3MHgfPJP8GV0Da5F3UfmKgNPsv5izejiTCU9E8qq7b4jwxlQFANKtwjk4qQxoIMUKfSX5Z
    z3NDKOLKtfppzmvEzVISpzvXX6yU9TjQ4n9o2nIcu6/qzm9irIn36i0demGhX+RGXMb9O0
    ySyW3HqcMxrKymxEZf2VjMiHn9smqJaRNKCZ3h2mcKN5s3aMS/DTZPArx/AJD56n0GebG9
    L+FraWjzDhblbcX4OBdlfE4fnK3PGXid1TUhlqJgiRgB/nWfyk8db4ag4b/ywUgzADg2tt
    eviUwpOTcBICi2T5c9yY0sgMvgSDH1lDmTPoj6jrHLYZ9L12ygiD9RaZd4IdFx/+t5LMaV
    hQXSvAkyNPld9KyEPFBUUDftUL9ryH9jhe9ukMG5NEyIrjwzmNmvMv4N+Ddb65Est1LNT0
    sAiGSaPCcfbyGY2/1KQRyTQCOd7dshdZE61dx1DgBWok4jfJLTu7nCXoDsY6FyIRyCeCVF
    JSDrpp2WK9ojQuFgb6WHjiABvOFMGdKs8EKx0HJfA4LPTqCOA5t5VGMppKNA
X-ME-Proxy: <xmx:jQ_ZaoFW13Edw_bjx_eV53fB10JlrWRxQwOHpsqZpUqv_IaYFxizgA>
    <xmx:jQ_ZamvOPhWhCU5StEn_yTILB0T3Gd238RnQj1N7YIHY-tV62h949g>
    <xmx:jQ_ZaiXsAqk-19bq80fILYkIHpDwI-8RlXKw4QF5BzGqm4taugHygg>
    <xmx:jQ_ZaqFclgET7M75eKNt-denWxrSLMzXJ7aNxex0mJS9XCssrhwZNQ>
    <xmx:jQ_Zalp8JWuWNnD6AwQcWj6yjmpxqMkChoI1Joks_9nBVmgBAoyHEXqn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 7/8] Allow for format specific readers
Date: Wed, 21 Oct 2026 21:15:50 +0200
Message-ID: <20261021191551.2975000-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021191551.2975000-1-niklas.soderlund+renesas@ragnatech.se>
References: <20261021191551.2975000-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a function pointer to struct format_info to specify which file
reader shall be used to parse an input file. This is useful for formats
where it's hard or messy to encode with values in the struct and checks
in the bits per pixel format reader.

The first user will be specific readers for NV12 and NV16. In this patch
there is no functional change and NV12 and NV16 is still broken.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 126 ++++++++++++++++++++++++++-------------------------
 1 file changed, 64 insertions(+), 62 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 0df3c2581449..c04e89a2068e 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -59,6 +59,8 @@ struct format_info {
 	unsigned int y_pos;
 	unsigned int cb_pos;
 	unsigned int cr_pos;
+	unsigned char *(*read_data)(FILE *f, unsigned int *width, unsigned int *height,
+				    unsigned int line_length, const struct format_info *info);
 	__u32 compat_fmt;
 };
 
@@ -173,67 +175,67 @@ static unsigned char *read_bpp_data(FILE *f, unsigned int *width,
 }
 
 static const struct format_info v4l2_pix_fmt_str[] = {
-	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_BGRX32,	32, 8,  "BGRX32 (32 XBGR-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGBX32,	32, 8,  "RGBX32 (32 RGBX-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_XBGR32,	32, 8,  "XBGR32 (32 BGRX-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_XRGB32,	32, 8,  "XRGB32 (32 XRGB-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2 },
-	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0 },
-	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3 },
-	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1 },
-	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0 },
-	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0 },
-	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2 },
-	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2 },
-	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, V4L2_PIX_FMT_SBGGR10 },
-	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, V4L2_PIX_FMT_SGBRG10 },
-	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, V4L2_PIX_FMT_SGRBG10 },
-	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, V4L2_PIX_FMT_SRGGB10 },
-	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0,  &read_bpp_data },
+	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_BGRX32,	32, 8,  "BGRX32 (32 XBGR-8-8-8-8)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_RGBX32,	32, 8,  "RGBX32 (32 RGBX-8-8-8-8)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_XBGR32,	32, 8,  "XBGR32 (32 BGRX-8-8-8-8)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_XRGB32,	32, 8,  "XRGB32 (32 XRGB-8-8-8-8)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2, &read_bpp_data },
+	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3, &read_bpp_data },
+	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3, &read_bpp_data },
+	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3, &read_bpp_data },
+	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3, &read_bpp_data },
+	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1, &read_bpp_data },
+	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data, V4L2_PIX_FMT_SBGGR10 },
+	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data, V4L2_PIX_FMT_SGBRG10 },
+	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data, V4L2_PIX_FMT_SGRBG10 },
+	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data, V4L2_PIX_FMT_SRGGB10 },
+	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0, &read_bpp_data },
 };
 
 static const struct format_info *get_format_info(__u32 f)
@@ -1038,7 +1040,7 @@ int main(int argc, char *argv[])
 	/* Read, convert, and save image */
 	f = fopen(file_in, "rb");
 	if (!f) error("fopen failed");
-	src = read_bpp_data(f, &width, &height, stride, info);
+	src = info->read_data(f, &width, &height, stride, info);
 	fclose(f);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
 	       width, height, info->bpp, info->name);
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610192;
	b=CRt1Hyf3AdPdvh2CEn44eNVljp095usXOtXTUk8MSqe8EDRI5ZtGapcB5RkM8HdKypa9
	 V9fXDansuzQ/T2c0/JLji0G9gtLalC0/eHjln0V8Y5DvjDzHbghsb/xq7zK+JNHCG9Jb3
	 K2TAyqOdaPmVVV+qYGevOlfEdQ0oy28EZJzNJ6Dik/ja/JASJc8IySCJyL3F1ZSjWW6N6
	 AczhytqDxuxjqXwlxhIndRKk7hTn9pG93d0cC+oCRzBuxu7ThFibz5ZHaTqB0Ea8a8WtZ
	 ZTBtJRuxzgBcjY5IS7jlDmVyXn1URGryENDyeBHMnQOnEa2GQk5ILzR7fEXKpKyqkvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610192;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hbn1U1IQaTRWshO0BvjGZRYVn9sDnIXC9/fcLOW2DbY=;
	b=LQ8zPXmwLsJAOMqYPkpvvFXoTIfnkkwo+H8JwkawccHr0T5Ul7RxUu+0wV4L9le56Est
	 17KqOmWaLpVfa86ZXKNw3/fyRsiufi8qblvC9fGg8QFgXc6v+RQFLyeZhi6reVi0FM67V
	 Zi1KqOhk5yId4vIHPp6SHV4bmijehVOtq0qXAeilD3Yra66abfOv4z/q+aJpPJmX8D5j8
	 VF2zPhSUm6GbqGrxtRQ0dxYSe+sEqz6VzxYK1GTfZOeRk11Ggnb5Hnk6E1jvYnjz6dytp
	 7ICOodQ2x23LG3i5A1tLmji5PJoZeIUB2g+y8Np4EcNK9j5caFwBWBzYHb28LeZ3Jew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=BFJcBDNZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XrptUNCQ;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD0606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=BFJcBDNZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XrptUNCQ
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 727C814000C2
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 21 Oct 2026 15:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610191;
	 x=1792696591; bh=hbn1U1IQaTRWshO0BvjGZRYVn9sDnIXC9/fcLOW2DbY=; b=
	BFJcBDNZimwcTmNO59BI7KDQkVefEK3YI2cgjs+muAsRDTUnf1M1CxJ51shCgHPA
	5ZyAF1Y2ZFJBPmJapyHCdWNmCrZG3dvTecXV6ttu4ZTe+otpQsuhWihFt+gDNa88
	3a79OSFmKLG00ppufvgBVLqJLnDjFPyHAnxNtBez8r2Q1GHYYjpJEvSsGUA6uNR0
	iL2s8y2PKxC7UioIyMNJtoxgWfpwqlknRF/gDDEBXgitfITClZhvKQ2oEsCcjRb2
	ISJ9EPZDIDBh38CLU4P+nDPWMnDw0HkyNSGdOevtauIY9BO1S9uz/tTawA5LdBrS
	pBxZKPZ0lwaC5JqyC5XboA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610191; x=
	1792696591; bh=hbn1U1IQaTRWshO0BvjGZRYVn9sDnIXC9/fcLOW2DbY=; b=X
	rptUNCQYq+Nemv1VdjeeZOsvbj0QohpyoC9t3de3OXNuYFhHtCQHVGWzf7IEQeKR
	apa7zwaEiRMKvmDUcoqG/iadjjcmoMPpcwJyShbaVGk4AtnUaOTvyq9wdanHazvo
	UK+9H5UINy3QFVsk68zP2Xztx2gA8ZS3v/FTuYq2h/taFtxrhe40drUEjuHy3bME
	IdEKKoaOKH7rfJ1VP9izxH6Cwcc89OtFvqUTKkjFaHRv6X4Z/gwEXmnIYSfmUG7S
	z9Xsd3d6TmH3hXHnnQ08WZ+TLMNzvlMgX/HsIpth1+0WdrpIqQinrX+LQHkPYORw
	015tZqOGDJK1ecyvJyu7Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610191; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:jhzI0qaMKnrvdKr44h+bhfBnf505SLn/fbH07rQlU41nXm7
	2e/KXQelVleBadgVkQ/MkhjL1CSka5Rujl899PMhbZyDgIBvFUBzm8fZZvOsetBz
	dEG+mpqpxIYHZve5oT797NLwcWxq3ugcqAuDSkImo5D64lZUwp53Hdt8FiiBDOHZ
	+LwH2+qLF0CINtTjnr4wLW5g/Tm2xplq4bC0GSRi2B24Y9FUKSRLqOe3oZv+sAGu
	woWXIFDngeJvrrjxZP319ku+ho1N7NxLCHV8ji4/7SBJsz9t/eXkB+SvyqYAWffa
	RO9itC5y7t/t1GjPe2tJfDbA9nCdPAkjLg/LECw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:A3dAyxZWqq3btmgFi3Yv1qlnRmO21wk5uE5Q12wc494=:y/pAE/LF9Lr71V481x94lJ6gLZK13SzmFYSklZ3Xc7s=;
X-ME-Sender: <xms:jw_ZalKe8tLbPy0fBuizWl8nvr--zAVrmA3FdpYlDnATEDObNwGKJQ>
    <xme:jw_Zau8iQ7TJwe2ZjAVI-EEarcaSNzrK2H_35ObXu48gs8EGZ7-nGV_dQxuXLdyfb
    xAYYD9JPirXdzDRKdMRPoOWOd05aCmw4CJFCeX-m4YsGnEYCL7acsvh>
X-ME-Received: <xmr:jw_ZaoLPjTWgCqGzDdl-E0MkxtKKJywv1jPHWVM2yaKSGXc9TDqPBkSvUUgKzi2HVsdGwZ1v4VknzKX70EcjksX4_wgOC_o>
X-ME-Proxy-Cause: dmFkZTGUeFx3fYHGjZLwQBZyYV/2uZTaSMlb/6I3IwXEen2TlzDz/jjUQ120gYkVGqKbtT
    iF2dwhMu8ID/s3L1kvSq/tI75Qj5VAJKT0oWQmN5Gup0OmDKtY9Q3lfsbHoDfa+zOQRhtZ
    6tqb815WwAIyK/nbwavO82jh35RPR3BrGulIt4b6H8COXuomiY+NNVlr/0i07S7YKH32hb
    qBj7a9xb1Yd/H5JIoX2S0tjkLV0GkfDHtiWK+wKkzvA2XTx2pAQc3UBdZfeEta0cg0uYhL
    Ip/nQ2QQJucokpxIaE19zuQQzdEzxgOyfcENr35+1QaxR5/+d7hqY8q4nIIsEFmhErO8jF
    DegBoHFl3tY1NybsrAUTKwuXKkiyySy18Eu7erIPmSOyWQ92xeS24DpHX2854QN6b5qqHg
    FyfEUwhr5S0j4ZON7S4cqNrk/jlLQP/JioV7gFwereT/hrG+3TzGTqTIfKj+OaVUjWK+NV
    M2qdfogFyEj++I8HhSuY3gw9cbkwuI1Qjy4Mb4xj9rXd6NG8/3q3dWOMrAA1l8kWywfTBS
    EFHdqglg8+/u4WYus98QtfdlxugSe9L1Y/SGP0BOMGwdmVSmbumcUWSlNp5LrgPapo4nSn
    BKt+cE8GincS2RNau4xXO+IHJlNNxyDhcr+L1mB81YSKKI3taeqeohyqEf2w
X-ME-Proxy: <xmx:jw_Zajl0PozbbhnUgp-FpyyPplkiDQoYZ5bQmSQj4FBTZsUoSSXniA>
    <xmx:jw_ZasPFee0Ev3EYyh_79jAcyNhH5I1yo--NwJzZX9613XCztszxdw>
    <xmx:jw_Zap1MdwlgkM20RFJ9v1sFCe1U_08AsfAWXa-LXZPQSUw1BXUMlw>
    <xmx:jw_Zark_b6AhTeKacOI8B56WqrlLsrKuo3FcHCXEyWsXhfh5_JZPhA>
    <xmx:jw_ZanKWByVYI-4xz-mfEg0R76lnF8QH9eyS1Vt0WJCFIB_jcq-ndGyM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 8/8] Add specific input file readers for NV12 and NV16
Date: Wed, 21 Oct 2026 21:15:51 +0200
Message-ID: <20261021191551.2975000-9-niklas.soderlund+renesas@ragnatech.se>
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

Restore NV12 and N16 support with automatic padding calculation by
adding format specific input file readers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index c04e89a2068e..d90d4b5ccc91 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -174,6 +174,70 @@ static unsigned char *read_bpp_data(FILE *f, unsigned int *width,
 	return read_pixel_data(f, line_length, *height);
 }
 
+static unsigned char *read_nv12_data(FILE *f,
+				     unsigned int *width, unsigned int *height,
+				     unsigned int line_length,
+				     const struct format_info *info)
+{
+	unsigned int file_size;
+	int bpc = info->bpc;
+	unsigned int nlines;
+
+	file_size = get_file_size(f);
+
+	if (line_length) {
+		if (!*height) {
+			/* Calculate width and height assuming no padding. */
+			*height = ((file_size / line_length) * 3) / 2;
+			*width = line_length * 8 / bpc;
+			printf("Calculated %u width and %u height from stride %u\n",
+			       *width, *height, line_length);
+		}
+	} else {
+		line_length = (*width * bpc + 7) / 8;
+	}
+
+	nlines = (*height * 3) / 2;
+
+	check_pixel_dimensions(*width, nlines, line_length, bpc);
+
+	printf("Read NV12 %ux%u with %u lines\n", *width, *height, nlines);
+
+	return read_pixel_data(f, line_length, nlines);
+}
+
+static unsigned char *read_nv16_data(FILE *f,
+				     unsigned int *width, unsigned int *height,
+				     unsigned int line_length,
+				     const struct format_info *info)
+{
+	unsigned int file_size;
+	int bpc = info->bpc;
+	unsigned int nlines;
+
+	file_size = get_file_size(f);
+
+	if (line_length) {
+		if (!*height) {
+			/* Calculate width and height assuming no padding. */
+			*height = (file_size / line_length) / 2;
+			*width = line_length * 8 / bpc;
+			printf("Calculated %u width and %u height from stride %u\n",
+			       *width, *height, line_length);
+		}
+	} else {
+		line_length = (*width * bpc + 7) / 8;
+	}
+
+	nlines = *height * 2;
+
+	check_pixel_dimensions(*width, nlines, line_length, bpc);
+
+	printf("Read NV16 %ux%u with %u lines\n", *width, *height, nlines);
+
+	return read_pixel_data(f, line_length, nlines);
+}
+
 static const struct format_info v4l2_pix_fmt_str[] = {
 	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0,  &read_bpp_data },
 	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0,  &read_bpp_data },
@@ -208,10 +272,10 @@ static const struct format_info v4l2_pix_fmt_str[] = {
 	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0, &read_bpp_data },
 	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1, &read_bpp_data },
 	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0, &read_bpp_data },
-	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1, &read_bpp_data },
-	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0, &read_bpp_data },
-	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1, &read_bpp_data },
-	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0, &read_bpp_data },
+	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1, &read_nv12_data },
+	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0, &read_nv12_data },
+	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1, &read_nv16_data },
+	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0, &read_nv16_data },
 	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0, &read_bpp_data },
 	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0, &read_bpp_data },
 	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0, &read_bpp_data },
-- 
2.55.0


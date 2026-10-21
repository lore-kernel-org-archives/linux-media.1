Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610179;
	b=wBIh97ZjYcMSFs5eKmete3a/5srMYmoWAi0rTgNFnbnEoPsXZ4syJ9ArLyjP/K+PByHP
	 ffQXJifbZX5aeaHfOfGDHIpZl2rcKiCs3y+2p/pan5z2mJy6HSF/zjnPfSCAWn2vlqnY2
	 wD/Prtz7zohRnmtfSThdAk2+pxjDIr8+1zwX0RNNB9wCHw27ib8uhNGP6fVJ22PBnI0TH
	 lmEJ6VEdpSs8nk6kd916uk/PTEZNyQlZBDeCg41mlK4rvZaBOLFPQ10djgfBmDt04bSA4
	 OzDlGBj8UnQT8ZTt2oS5we8bbIoCSh2bPM6JVLOTocHRXSe7tywKd3MFc1LyZ9pxXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610179;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JDmJOJaQBWlkYl2JW92bfMindV0KA0WFB7Y3bQ1cGHY=;
	b=WaP7CqQWo9FsNeLViSSW/dlnOmdXvzT7u03C28irev9oC+MvuoCNrLych0Jz60vKDBIm
	 nurGsPsjmLLQTfkF5TzorcTVOPKVzKqDJTFf3Vjm36eVo3PFIoad8OmdJqp0wu0SKdrZH
	 cnG6YVoNEPZDzEBI60+wHJcfiITf97AZiP7Ycs/leVPFF0qXT1Gsl20k+52hqqQR/M6wB
	 1l+uybbgC30KoLLroncPzHCVL5myIIaja8kkTOvqUgaPjOivQgR2if5PfoXBfdC+/f5t0
	 Co9QmDi5jItfHoUXxWh9P1KB8kzYbZlo4TzHBl9vyATaQitYBPYMN6yP163xt3TXnMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=hEWUbq25;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A+zdsaDb;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F9606A320
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=hEWUbq25;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A+zdsaDb
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AED8E14000CC
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 21 Oct 2026 15:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610177;
	 x=1792696577; bh=JDmJOJaQBWlkYl2JW92bfMindV0KA0WFB7Y3bQ1cGHY=; b=
	hEWUbq25BDPqF0BtRXFFZX44Bh3R0r3y73oGEr6W8P+dQStbHXBhX1JRLVw7zjBR
	fklozb6b7Jo15maRvM8aMcNhDmFEsbw6G012ORJ5Q+agaZUzGzwn5tzztZHzmr05
	SMCuBE1sAcm3WlBlrJI/gUfpb5aiYU6k59zoWguyEDWZirOmiv+3CpyV0pCgIAso
	RWlld0YnFJwZqN0e0jy3Rei4yuCcWk97GHCrhCqWTl8H7Xc5o8EFb1A3N8f+EOi5
	v8H+IwDRrOxmeqt3lQCVTo5UirMkjdIsg+5WeRw7SGNrmoJLnHdlEX/tM86lw1i2
	E7iP1ajJfxqhpxO+guqo0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610177; x=
	1792696577; bh=JDmJOJaQBWlkYl2JW92bfMindV0KA0WFB7Y3bQ1cGHY=; b=A
	+zdsaDb01l8eRmNGu7cIO3glBmoSimENXHlDhAhX9rBwXQmNQ5DDtwAr8B0Xw4Qa
	wcLCuttI6ZHkxoMxbWo2mmLO8wEvJW7SllBuAQi+zAVd0ABsL6fgXcbmBRQ08Qhl
	uhjmurh7Ma7vOq5/wqD6zsLyAG7dJSiN8dFGlnlJXdQeLys03fTIF04hz0QARKYC
	SNsl6CzlWmUMxYqPRIWkZK6tRUwbDR66EqpJcEOXNv1B/wn2numeOhorFXKwyRZt
	/RfInPKbwVv5Mk8q8PMjmBxGFYvxWixa9x8HTfC07W+7a+Ik0I1x50K/YUdGfKqv
	67wJ9CLCXHWWt1apCqbmg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610177; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:MowL7Oyi7m45NWemCIgbN/WWtuv6zujkgfkZF18lxkVU6Jx
	hbm9FCvv5ikOIxtwJyuqvMS7AFkNKq0yBGdD81n9PPjLDIV6cUw0PCxRmJ2qDKJa
	vb+z2JGlFkG7srDN4ljB9aFWqEU32Z6bmi21KmY+zDbEP2c3EjBbpko5wKdp8aCA
	E2lhbJJrUGJ/soxcvEl354C7B/A37aF498P3pUkYuCEsSdPXoORHLkMDgGcpd0Xn
	SknHkLQNlX6XA5pfbrbTea/sme+tDJWIrniVccsmdzwprJk/1Und62CozFgfPdkI
	Prw9t3sSKInkgjEYIVhIl8folbtWeeaiuW4bd1w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DO4SyHZ0zmsiR2CMhlr62jW8pPDJPhKEbKM9RbOGRVE=:2H86n6G/a6klSjstL+8M1odKCyBCI5UYYEYbQZO3D98=;
X-ME-Sender: <xms:gQ_ZauwVlm6LaP5B_w9ZThIB-jLWINO-Rawj-0vybpIkq5JKLWH2aQ>
    <xme:gQ_ZaoFrSaTarcZyWq1Vf-Tl0NFIfr1XnFRODHe240EWbgSo4AKvWZtnOYjaCMHVm
    j5nDI9zVfGbWsvpSfQn5yjaCwSuM5I9yjyHSkW4y1nE5sz9dywdJS5w>
X-ME-Received: <xmr:gQ_ZaqzhBZAfGLGn4Rvr57e_tBNuy8kWlyzaF0IQZ6UVz9h0d2aVyq0MtX9aWFWUB_fc5QZ4xrJMo8E_0yhLsV8Rxif6g-s>
X-ME-Proxy-Cause: dmFkZTGY9wDDG53GH6vHIbrmNLtBm5dleI8NF8Il3SzYZ4lCC/E+Vg5flZ6k/A2U2ZwNjc
    qg7RwCB65g5EGCTcFMmr8wbGqdMhLn3DN7iPHE2Jp41F3l6zbBzGAUdPxBTDECuHiOGWCD
    FIkjECli+ieYIiugO+hyyzlmajv8O1zUlS6wsj7q3r32z4LZcM4dEBynzFThhy4Ye2Wshw
    Oe/44eW4hOoZZS3v88xqJ3mZPnim2pObiVKsZ1vVVxacwZ5BZLcuf5TqYUFcif/HXzlLuX
    G3iRDsuycnOjONUPLl1yH1fC38UCdpz7GKj0W5VhI2o2F4NjCs1RqGqvQBRc9UFz7F20cA
    HATP4DwezrpL52Bf7thFvBnQebU2C0sBabNzT43aVmLiUi+0MQQi4R8uxUXN+7yF1obrut
    4Bj3gG3VGFgNIPCO9yECj1VlyocDSGiVUDeLaOz0QjqeXkHodFVO+0DWzyyeV9hoJYYEa5
    jTN2jikD9AwrRG52AbVq+8hyADx8JZYL9BtOApvkAzr/P3yeGs+LitVYD6j2zP+aZMPohd
    YGlThbicuXnDaEvEZwpSQujtK18rV7ynHuOaYO5AP9Wn3EgY94T4Cz4om/eYDZQcPSg6AN
    NXYwnSA9KENa6jdrbjiZLzPqY/QJcQylPE+3vJpoeVHn+AmQosVM0rD3iMMA
X-ME-Proxy: <xmx:gQ_ZahvsZxzw2HrB4jCXrJoRkbuPhEe8DHZ7RyZiKEfcDeXcdqauxg>
    <xmx:gQ_Zav3cLhGEfK4o-ayxvDXrdbW6X-N3pYYbl38ZDkKHClXyvF1l-w>
    <xmx:gQ_Zak9M6KUFmDKFs_LcHOSPUdszra3IllNxWEt-m1v3aiSZKQIaCA>
    <xmx:gQ_ZaoMKXtZAqFN0Qknsgu6_gBunAf3txkibRL9Eopaem-1uEhaEUg>
    <xmx:gQ_Zanz9DLTDc7-M9a2kgbNMBd7NatU9awOU1e-wvbGwuDBC4rZezAKM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:17 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 1/8] Remove planes information
Date: Wed, 21 Oct 2026 21:15:44 +0200
Message-ID: <20261021191551.2975000-2-niklas.soderlund+renesas@ragnatech.se>
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

The planes information was added primarily to support NV16 with padding
at the end of lines. Later work in [1] have however broken NV16 support
as it did not adjust the height back before returning to the caller.

In addition to that the NV12 support was always broken with padding even
with the planes information as the CrCb plane is only half the size of
the Y plane.

Before fixing NV12 and NV16 conversion remove planes information as it
will not be used in a more complete solution.

1. commit cbe7a308e17d ("Add --stride (-S) option for setting stride")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 128 ++++++++++++++++++++++++---------------------------
 1 file changed, 61 insertions(+), 67 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 0c71be321746..1bc50dd5b8e5 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -59,70 +59,69 @@ static const struct format_info {
 	unsigned int y_pos;
 	unsigned int cb_pos;
 	unsigned int cr_pos;
-	unsigned int planes;
 	__u32 compat_fmt;
 } v4l2_pix_fmt_str[] = {
-	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_BGRX32,	32, 8,  "BGRX32 (32 XBGR-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_RGBX32,	32, 8,  "RGBX32 (32 RGBX-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_XBGR32,	32, 8,  "XBGR32 (32 BGRX-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_XRGB32,	32, 8,  "XRGB32 (32 XRGB-8-8-8-8)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2, 1 },
-	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0, 1 },
-	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3, 1 },
-	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1, 1 },
-	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3, 1 },
-	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3, 1 },
-	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3, 1 },
-	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0, 1 },
-	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0, 1 },
-	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2, 1 },
-	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2, 1 },
-	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1, 1 },
-	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1, 1 },
-	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0, 1 },
-	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1, 1 },
-	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0, 1 },
-	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1, 1 },
-	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0, 1 },
-	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1, 2 },
-	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0, 2 },
-	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1, 2 },
-	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0, 2 },
-	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, 1, V4L2_PIX_FMT_SBGGR10 },
-	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGBRG10 },
-	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, 1, V4L2_PIX_FMT_SGRBG10 },
-	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, 1, V4L2_PIX_FMT_SRGGB10 },
-	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0, 1 },
-	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_BGRX32,	32, 8,  "BGRX32 (32 XBGR-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGBX32,	32, 8,  "RGBX32 (32 RGBX-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_XBGR32,	32, 8,  "XBGR32 (32 BGRX-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_XRGB32,	32, 8,  "XRGB32 (32 XRGB-8-8-8-8)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2 },
+	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0 },
+	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3 },
+	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1 },
+	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3 },
+	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3 },
+	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3 },
+	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0 },
+	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0 },
+	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2 },
+	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2 },
+	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0 },
+	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0 },
+	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0 },
+	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0 },
+	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1 },
+	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0 },
+	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, "SBGGR10P (10 BGBG.. GRGR..)", 0, 0, 0, V4L2_PIX_FMT_SBGGR10 },
+	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, "SGBRG10P (10 GBGB.. RGRG..)", 0, 0, 0, V4L2_PIX_FMT_SGBRG10 },
+	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, "SGRBG10P (10 GRGR.. BGBG..)", 0, 0, 0, V4L2_PIX_FMT_SGRBG10 },
+	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, "SRGGB10P (10 RGRG.. GBGB..)", 0, 0, 0, V4L2_PIX_FMT_SRGGB10 },
+	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0 },
 };
 
 static void *xalloc(int size)
@@ -164,11 +163,6 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	r = fseek(f, 0, SEEK_SET);
 	if (r!=0) error("fseek");
 
-	if (info->planes > 1) {
-		bpp = info->bpc;
-		*height *= info->planes;
-	}
-
 	if (!*height && line_length) {
 		if (UINT_MAX / bpp < file_size)
 			error("line length too large");
-- 
2.55.0


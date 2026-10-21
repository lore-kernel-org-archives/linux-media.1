Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610184;
	b=pgV4kb3iR5qRIDYXzySfas9dGCguh9lZJDna46kjXV322+1XFn4g12aMV2ZNzygTGm2p
	 cwg8RnVLSVTc2r9t2bk3j4gbPTm/e2uVCCOWZwc42x+Xsp9pfovrZ5/To+rUGg25oZrSe
	 DitjQVbnDGvNyGaUQIrhAj/0/7UKXDL4XDgvoD1+J6neXIA/7Lq96UW+GI/lagNXPKy7l
	 eUbwyJaf7XSqNCXtDUBywruPCTfwihNaylgM042vXj11Fh9mu2W4UloAoblKsxWTOXV2o
	 aJZ4WEkYjvIDyPGroR5FP1iIG3KSCYS7Yn9DMYxjl41jMOf/E6kkGF0TuTxbZpzHKJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610184;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OtcKsxMbMFCTUcA83wkmUDf9r1ukWgKpOfL6XQlBjQo=;
	b=0/RF6BEZGSZOTSWLZxiCj8dvtVsjqixIanynU96n3qAj7ir0dvb6KkIoVhe6VmbbeVne
	 iJQeXQSvkdUUX7eTIdzy2CH05BaXknrepBy6G04EINxxGcBc3O/PJ43FR5E9ULkyl2tPF
	 o9dOKzHA30D35yvh79Au1Z9ZSXLQSz0z6zOIIyKkoA+ThoJ+lKNPyyOxsE6HYIEiwU0nl
	 ruqZWXSltbblHV+tRM4xP6vGV0bFakjXgU8EZHecVIkD6kIyr4zdzC5B2aX1NXzWaliSH
	 42e/6vGVkcUbcf3fmwetmjgNLv03aB5yXxGQQ1zfLO5itdG8qPvkYzPEycZ3ZcDvGQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=SnUa3Fio;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mY3YWJwP;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74872606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74872606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=SnUa3Fio;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mY3YWJwP
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B2353EC0180
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 21 Oct 2026 15:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610183;
	 x=1792696583; bh=OtcKsxMbMFCTUcA83wkmUDf9r1ukWgKpOfL6XQlBjQo=; b=
	SnUa3FioCDHnsXofEpmV5YXTh9YY/gk7KG/IT0z3WrOc40fDEnxiedXvnW/wBQ4D
	9rdGigCnxZrjVNvlmX2mYw3tdrP6UMvxKt/uwCQ61RrGAowrmpxqsr3AIfy8P26o
	H3UuyBpQlLot4Vdz9fHwPkJuEKf2c/NEqx7NJG/MLSIQNJWK77RfCeY7woloCcW5
	Zs40Jv2XMC9RAx6xsqGcaXhv229pkHZUkjpVvp/C2m2O45PCLmNtPWI1QWGTMDvZ
	IwEyKWx+pEJ1J8d6v9alt+p/EvD1bzOifiApy565+VEpo2vosX+QZgH7b1HaBN0E
	oX2w5Wi0aYS7FnRF+ogZZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610183; x=
	1792696583; bh=OtcKsxMbMFCTUcA83wkmUDf9r1ukWgKpOfL6XQlBjQo=; b=m
	Y3YWJwPEpakamGPPghZ5KT+qaJ7MnmS12jSaPhp7iYoGAodWprX+e+99Rds4MG3k
	JWQiDJE47ThViDRFFikuV8FAqO8uYlADPjFiUcwl+/EUjEhdS5CM4XJTtSg2fqhF
	rJfRrWX61LWr4yoImUBCnoe3u0NAMtlgoPQBdi12HaDcq+hww4RQU7yAFreGSZkK
	gqmF2aJcRbfFNVAG2Yzrs8RaeJ25/AQSJIt2E0t5D6EupEHOdo7hUErjIqIe1YLt
	7V2rsCH3uk/uxVypGn4pQhi6WKYeci6Abuh4bnZ9cJkVBQ1x+W3HPPVVhM8N85XM
	VELlyoTC/NpKNiJFLbxxw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610183; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:i+X/1kNXvpdOZNl930hLkSiJF96a1F6GRUh3/Inp3wE9mgh
	bDoDXIpyzjUOOrcr5ZOZPRzYfVKg1EDB/okRCQLrwiHfBlguEfjuuG/usR45dHRo
	v8dc7SpthJLncGWa/nly4AVtS2zI7UYZhlPeSDQY7EBXRAJs6P4jo+nXEow/Y7Ys
	DXbLbYFtYTsSuMrrIr/2lz8V9v9w8qerqtfHu1KC/l0AK7szFRH9T9YvcjEC+tJM
	b95wnLS4ea++g/lreVtbH8eGEKV76bJ6XjHBw4ODS9Trw3XLLyF+SBVzCY+LzARY
	s7rLEPtAvpmu1nbZC+H4AYz3adhmu1kohzKkmXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GQ9txy+ty6AysxpVXqbghLnSEJk/8RCsALaH3PqbLfA=:vhYgEM51g2T7+Fs9tXoIpqzmhp1MocV6xJ/b6ats5UM=;
X-ME-Sender: <xms:hw_ZasFYEwo1y06BnhVV1omgycfA_H0tUHrcPGy8Yo-2GoJGrWu7Hg>
    <xme:hw_ZajI-BrVUwaJH69NBfdl3wqyUUOJpyN5XW3UynF-iIBCjkT50qzrrVE6okC7DM
    phgVRLjoyW-5O6VwMaAXenjJwCmejz0P2Yr26bIMYaeD2fqILZy-WLm>
X-ME-Received: <xmr:hw_Zagmd4g5i6Q_Y2oRQ-_p03s5rVS49oxXAlDO-2fuNncxgaPx7E5e8KprErEggpOgz8JinSVLp-O-atOBS_qKvOfYKzyU>
X-ME-Proxy-Cause: dmFkZTGY9wDDG53GH6vHIbrmNLtBm5dleI8NF8Il3SzYZ4lCC/E+Vg5flZ6k/A2U2ZwNjc
    qg7RwCB65g5EGCTcFMmr8wbGqdMhLn3DN7iPHE2Jp41F3l6zbBzGAUdPxBTDECuHiOGWCD
    FIkjECli+ieYIiugO+hyyzlmajv8O1zUlS6wsj7q3r32z4LZcM4dEBynzFThhy4Ye2Wshw
    Oe/44eW4hOoZZS3v88xqJ3mZPnim2pObiVKsZ1vVVxacwZ5BZLcuf5TqYUFcif/HXzlLuX
    G3iRDsuycnOjONUPLl1yH1fC38UCdpz7GKj0W5VhI2o2F4NjCs1RqGqvQBRc9UFz7F20ij
    0hpXlhVn9pqGkKDpXjxV6hviVcvzE5SL1f3NTaNt9fSO+jMqJRxGlYHWumMJny7xzwvyjD
    AQbhxElVD4op9w3kz/kqf7CEpFd2ZHJcdHPkZdkJIbEKSQ4Pbr+lKkEyDmSZdAYcEfKfsz
    kDcai7u+wISG9p0krkDZEy3fmnz7jVDP4kHifosJHcYoUYfeAYTOMKWyRrD8fpCHKPLo6T
    RpW3q+xlH9X8/PPLMkwD/EY8viXocGpMn0sFulZOTH1356tKbAonGczTNYVV72Tkbo/ivS
    EwZXWgJNMs+HvpDnsxPcBMdweSbhX8jpy3z4KUyzSgkU9fRUCniuwvf61ylA
X-ME-Proxy: <xmx:hw_ZarRAddDA73jhttxIqII11lc7YRTqisHhtho5DtddxIe6sCuwEg>
    <xmx:hw_ZaiJY6V8r7QO1tq5gEZPobrW0E0c1zmxIa50bhUYaHHM9aIxlhw>
    <xmx:hw_ZahD5DVLNkYCbg6xUmiuqXAGe9CnK4xjHSSVOrkyHy3BVziS77Q>
    <xmx:hw_ZarD-iZuXE5Arq64BiuYx--kqYYtm7A-dXasm8CVInO1szXLCkw>
    <xmx:hw_ZasnU3xJLCK1kJRUOTuOcTojIelhd2tHVtu4CH55o6BFPR8qGgApW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 4/8] Create helper to read pixel data
Date: Wed, 21 Oct 2026 21:15:47 +0200
Message-ID: <20261021191551.2975000-5-niklas.soderlund+renesas@ragnatech.se>
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

The task to read an input file and trim away the padding is generic to
all formats. Create a helper function which can be used by multiple
input file readers. This will be used both by the existing bit per pixel
reader and the soon to be added NV12 and NV16 input readers.

Add the new function, and move xalloc(), before the v4l2_pix_fmt_str
table to prepare for recording pixel specific readers in it later.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 90 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 38 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 33fa7750caa9..0458925a97b2 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -71,6 +71,57 @@ static unsigned int get_file_size(FILE *f)
 	return file_size;
 }
 
+static void *xalloc(int size)
+{
+	void *b = calloc(1, size);
+	if (!b) error("memory allocation failed");
+	return b;
+}
+
+/**
+ * Read a file and extract the useful pixel data.
+ *
+ * @f: File to read
+ * @line_length: Length in bytes data in one line, excluding padding
+ * @nlines: Number of lines to read
+ */
+static unsigned char *read_pixel_data(FILE *f, unsigned int line_length, unsigned int nlines)
+{
+	unsigned int file_size = get_file_size(f);
+	unsigned char *buf = NULL;
+	unsigned int padding = 0;
+
+	if (file_size < line_length * nlines)
+		error("out of input data %u < %u * %u", file_size, line_length, nlines);
+
+	if (file_size > line_length * nlines)
+		printf("warning: too large image file\n");
+
+	if (file_size % nlines == 0) {
+		padding = file_size / nlines - line_length;
+		printf("%u padding bytes detected at end of line\n", padding);
+	} else if (file_size % (line_length * nlines) != 0) {
+		printf("warning: input size not multiple of frame size\n");
+	}
+
+	/* Read data */
+	buf = xalloc(line_length * nlines);
+	if (padding == 0) {
+		if (fread(buf, line_length * nlines, 1, f) != 1)
+			error("fread");
+	} else {
+		for (unsigned int i = 0; i < nlines; ++i) {
+			if (fread(buf + i * line_length, line_length, 1, f) != 1)
+				error("fread");
+
+			if (fseek(f, padding, SEEK_CUR))
+				error("fseek");
+		}
+	}
+
+	return buf;
+}
+
 static const struct format_info {
 	__u32 fmt;
 	unsigned int bpp;	/* 0=variable */
@@ -144,13 +195,6 @@ static const struct format_info {
 	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0 },
 };
 
-static void *xalloc(int size)
-{
-	void *b = calloc(1, size);
-	if (!b) error("memory allocation failed");
-	return b;
-}
-
 static const struct format_info *get_format_info(__u32 f)
 {
 	unsigned int i;
@@ -168,12 +212,8 @@ static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 				    unsigned int *height, unsigned int line_length,
 				    const struct format_info *info)
 {
-	unsigned int padding = 0;
-	unsigned char *b = NULL;
 	unsigned int file_size;
-	unsigned int i;
 	int bpp = info->bpp;
-	int r;
 
 	file_size = get_file_size(f);
 
@@ -190,34 +230,8 @@ static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 	if (!line_length || UINT_MAX / line_length < *height ||
 	    line_length < *width * bpp / 8)
 		error("stride %u is bad", line_length);
-	if (file_size < line_length * *height)
-		error("out of input data");
-	if (file_size > line_length * *height)
-		printf("warning: too large image file\n");
-	if (file_size % *height == 0) {
-		padding = file_size / *height - line_length;
-		printf("%u padding bytes detected at end of line\n", padding);
-	} else if (file_size % (line_length * *height) != 0) {
-		printf("warning: input size not multiple of frame size\n");
-	}
 
-	/* Read data */
-	b = xalloc(line_length * *height);
-	if (padding == 0) {
-		r = fread(b, line_length * *height, 1, f);
-		if (r != 1)
-			error("fread");
-	} else {
-		for (i = 0; i < (unsigned int)*height; ++i) {
-			r = fread(b + i * line_length, line_length, 1, f);
-			if (r != 1)
-				error("fread");
-			r = fseek(f, padding, SEEK_CUR);
-			if (r != 0)
-				error("fseek");
-		}
-	}
-	return b;
+	return read_pixel_data(f, line_length, *height);
 }
 
 static inline uint16_t raw_get(uint8_t bpp, unsigned char *ptr,
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610188;
	b=KirQJdmDueUM9fDWbj42mFGuMoIMTRVJt8F6+HrBJaielm6KaWDYQZJ+O8ywdh8ygWQi
	 dNlbgUnWAGuiS99itWSblywqO89jJGXQePA1opnDdbRO6yK/TOMu7FQz5jRI32GDhpNdi
	 /1YS70hZZOJ8zE3Pfj1jQ62d2ziVjVnBKuJ+JPdVgMHBXA1Qy91GHCFGDb8Jy9o73W4NP
	 q/klhMLyjLEs0x57DnMf/eW5fN13CE4Qhzli4s2rpEuEvhAdNctehYBkyIkexDhbnlIQQ
	 pl4pRq/tcBVJQ+NClxyL0H5XKfRXrftoOJmXWEaoIIo/Ce5KkUoFmxis+p75ootm1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610188;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sWj9qDusrLxBHU/C2qd4deBzYIWKKvYqRVAbFcFy+HM=;
	b=Ea7a4JizcELc4HVz3uDQSKkL0QjHFi5UZn1P1GAyz8O8xTaHnMqoRUAKO0Hq4MZ1URCT
	 7gffSqE61hZy3KOMD7QPUNkcI94ldD/xtD1j+eKkjzfgb62iVwf3GwZd1QYpTiJt8ITEh
	 LfHJ++2muGP3JEUtzImMUcdqnar3t/rGPmWoZZAAWfOpi8fQ1pVG4sSEMqWyouAWPr1OR
	 kjVEmig4fqcBOfCfj0lLXwXJJN8dj7uqTRMOIOljJIcShxOai27w2iKdp0T0rmH8A84fs
	 K+nqv0VOKkKv1VPDumAP9WUcadJJ9ERHTcWFw6RGxhTnO1DWa8PddQWcElroMK7KNkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ePI62p1y;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MGcHfShB;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5BD606A32E
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5BD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ePI62p1y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MGcHfShB
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B4D3614000CF
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 15:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610187;
	 x=1792696587; bh=sWj9qDusrLxBHU/C2qd4deBzYIWKKvYqRVAbFcFy+HM=; b=
	ePI62p1yfbSVffyz4+tp1nAvEOMGu7wHVuYDQETYNWIujWwmpDsjEPtqLG5BiTYt
	DdnVD7LofhY1V3qUqoZEnSFzIrJMpJQuZEc9dzLgcIZ0FzAkr1aSlGAKhbXiy6F5
	ZsIGGQn/vdgS/lDmJh7F6G5zVuaLtthTOHGNm0QD/amlvqkuWV7EmhRm5Jkeaj0M
	22UuFeY9/Q+zdX4HHcujFRHVAPaPdsSTDlg08+iomcqdnNqVaEHBNVMBXGODpzsM
	fCOk8T11MVzZ6cHbdt7iHNsU61hZpothCC19VLJClfyoI60XN6TqfTXzIA0hXMN3
	etwJmK/LvU1SvAIXVV/7QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610187; x=
	1792696587; bh=sWj9qDusrLxBHU/C2qd4deBzYIWKKvYqRVAbFcFy+HM=; b=M
	GcHfShBAbShPk7fRMOenUoxy7iAEYM8LRfPeJyKmxVo1MstONOVn4B4WMt+8ybtu
	PX68AV4tBa7tibH0RvF3eG0Bh1MxhoHZrx+/VKHyGUVLHl1mz2Pxej/1gnnR2TS0
	5x6qlBvojBnfNjbBIw3kbHc7EcIRnt2xdMOyARadGc/nB15yeacDhU+C16UA+E9+
	NekbfphL56ShFJV1WDYbGZpI4zT5dlpCUOu7nuBdNCTxQJeMfmDgDns/VqVxj79Z
	FsTpuGhZYo+w+KkOw2qe6zhuYd8I+wFX0ZvHDgdBNv+JF4GLE1l0o13zflRnrmTE
	mdYY3ZcMbq1Cm7eJrr8Sw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610187; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:aEU4bu9zuSiLa/m6Z+wBQr0sMWgoPoItgfS5YcSYBxP2EZZ
	Vm3F+3FKjLfssgP0rj82GfAccx/Gef1gjDXm7tZGQkHRms45ARrLe0t9CwS/jp0W
	QE5XE12zoAO2QeRcbGaHQHLqgBN3XMSn1Ifnz1lkn3W5OIcJkoyXrya4DEfP0D6V
	LAyy0FaAcmf3TZ3QUTIfhxlUidWvKketfLD2XOiTbSGJqQgDuoy4lPFrXD+uOvQs
	jR5002Y0O//14ECMkgI8p1L+rz3gqDp58RWtmqHs990f4BVJMT6yM2TIKgUJXxdU
	YcbowbhBWkDi+jUolV9f2x1DbO/Op3OUHNfTpIA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bo+Cwp1e/lxlyVU3F+mKRHs08OJs2B5kRrJ5slAFV9E=:NtUNctEagT8BSw4hM6G376wnAcESmRv/UMP7oewICkg=;
X-ME-Sender: <xms:iw_ZavqBN8-dPbameYvVPZuV3DvrfrIC_wy6BmuefQ2HWhvp0n4XLA>
    <xme:iw_ZancBAZEW0emgi5Tr5vV8rH5bz9L_9YD-asptO2wlUXAApjg2ockP332eS82Gb
    SUnP4TCda34vZL6HPQcaQ1SxCra1CDxhJ5kclTFAL3oCstA-uBajvvm>
X-ME-Received: <xmr:iw_Zamq_s90UDtFRJEVPY71T5v391mMCufS6VomN1rNhhZryBYArfor9xuO5Yd8b2MSf9QC00ptFV2Kky4z4ichtcqfBBQw>
X-ME-Proxy-Cause: dmFkZTGnRf3QuZZU0thrcgX8lHYTDkWlSG29PVP/D1OQ/4qQuIv10Jc+fTUPbLmClEtg0J
    jfmvodXwkA0UN6fblifi9k0yWe7QWcAu52CbWVy+nhDgOo/VKHFknnYglC41BTgEcN4PBg
    3MHgfPJP8GV0Da5F3UfmKgNPsv5izejiTCU9E8qq7b4jwxlQFANKtwjk4qQxoIMUKfSX5Z
    z3NDKOLKtfppzmvEzVISpzvXX6yU9TjQ4n9o2nIcu6/qzm9irIn36i0demGhX+RGXMb9O0
    ySyW3HqcMxrKymxEZf2VjMiHn9smqJaRNKCZ3h2mcKN5s3aMS/DTZPArx/AJD56n0Gebk4
    G7ANZUIea5ck2ed2DosXfvjj5m01Gjks4i//6+7QQ9hKDJL3mDr31vdxJvhGtVKFZFxSIK
    3n6wune58a+PMOigZ01eC3SrJ4bEE4GQFZ3j6i9htWI4MCYxLMBXwtm0CZzyz1DiWFE0r/
    CasBrouBesZn87SuGXFLh+3xEZL+kOdOyhd8QF5N2x8CDEvjjqs+k/q+65oKijdviuRnO9
    8NhZ3JFROlXlxzaJfVWPQXM/auP38G6dXWV6hr5d9vHmNqyX8rgbdfHoUV1DOJ5SyrFfvZ
    25pStz+G1i6IzflCOcO4Yw9TACYUSeYPIDEl9OJaHctWGRlWTAhyja7CxBpg
X-ME-Proxy: <xmx:iw_ZagEK0JPvavUOWH9Z8Has5xWoZLB3uNwfgWKPC5cvKANqh2mOjQ>
    <xmx:iw_Zaus7aHeh7-bszzNypB0JNE8g3N5pPlx_Y0-KabHYbe-5gTnEsw>
    <xmx:iw_ZaqWLB58etgv3tPsRiSft49tSEfPWiKw__FPcGgYhFRsjssJu9w>
    <xmx:iw_ZaiFG2_LzQ8w6cx0caA94TrvwY4eQZJDbZM4E_dG6MhJc8JhPaQ>
    <xmx:iw_ZatrVWA3Rjhnlv-DiwNH5C-1Ae9COtYk3oyE0H2tvZgo7rhZ_39ay>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 6/8] Move bits per pixel reader
Date: Wed, 21 Oct 2026 21:15:49 +0200
Message-ID: <20261021191551.2975000-7-niklas.soderlund+renesas@ragnatech.se>
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

Move and rename the bits per pixel reader before the v4l2_pix_fmt_str
table. Also split the struct format_info definition from the table
itself.

This is done in preparation of extending the table with function
pointers to pixel specific readers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 76 +++++++++++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index f3b34b7b110c..0df3c2581449 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -51,6 +51,17 @@ static int swaprb = 0;
 static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */
 static int brightness = 256;			/* 24.8 fixed point */
 
+struct format_info {
+	__u32 fmt;
+	unsigned int bpp;	/* 0=variable */
+	unsigned int bpc;	/* 0=variable */
+	char *name;
+	unsigned int y_pos;
+	unsigned int cb_pos;
+	unsigned int cr_pos;
+	__u32 compat_fmt;
+};
+
 static unsigned int get_file_size(FILE *f)
 {
 	long file_size;
@@ -135,16 +146,33 @@ static unsigned char *read_pixel_data(FILE *f, unsigned int line_length, unsigne
 	return buf;
 }
 
-static const struct format_info {
-	__u32 fmt;
-	unsigned int bpp;	/* 0=variable */
-	unsigned int bpc;	/* 0=variable */
-	char *name;
-	unsigned int y_pos;
-	unsigned int cb_pos;
-	unsigned int cr_pos;
-	__u32 compat_fmt;
-} v4l2_pix_fmt_str[] = {
+/* Read and return image data at given width, height and format information. */
+static unsigned char *read_bpp_data(FILE *f, unsigned int *width,
+				    unsigned int *height, unsigned int line_length,
+				    const struct format_info *info)
+{
+	unsigned int file_size;
+	int bpp = info->bpp;
+
+	file_size = get_file_size(f);
+
+	if (line_length) {
+		if (!*height) {
+			if (UINT_MAX / bpp < file_size)
+				error("line length too large");
+			*height = file_size / line_length;
+			*width = line_length * 8 / bpp;
+		}
+	} else {
+		line_length = (*width * bpp + 7) / 8;
+	}
+
+	check_pixel_dimensions(*width, *height, line_length, bpp);
+
+	return read_pixel_data(f, line_length, *height);
+}
+
+static const struct format_info v4l2_pix_fmt_str[] = {
 	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0 },
 	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0 },
 	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0 },
@@ -220,32 +248,6 @@ static const struct format_info *get_format_info(__u32 f)
 	return NULL;
 }
 
-/* Read and return image data at given width, height and format information. */
-static unsigned char *read_raw_data(FILE *f, unsigned int *width,
-				    unsigned int *height, unsigned int line_length,
-				    const struct format_info *info)
-{
-	unsigned int file_size;
-	int bpp = info->bpp;
-
-	file_size = get_file_size(f);
-
-	if (line_length) {
-		if (!*height) {
-			if (UINT_MAX / bpp < file_size)
-				error("line length too large");
-			*height = file_size / line_length;
-			*width = line_length * 8 / bpp;
-		}
-	} else {
-		line_length = (*width * bpp + 7) / 8;
-	}
-
-	check_pixel_dimensions(*width, *height, line_length, bpp);
-
-	return read_pixel_data(f, line_length, *height);
-}
-
 static inline uint16_t raw_get(uint8_t bpp, unsigned char *ptr,
 			       unsigned int stride, unsigned int x,
 			       unsigned int y)
@@ -1036,7 +1038,7 @@ int main(int argc, char *argv[])
 	/* Read, convert, and save image */
 	f = fopen(file_in, "rb");
 	if (!f) error("fopen failed");
-	src = read_raw_data(f, &width, &height, stride, info);
+	src = read_bpp_data(f, &width, &height, stride, info);
 	fclose(f);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
 	       width, height, info->bpp, info->name);
-- 
2.55.0


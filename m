Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610181;
	b=Pn57hgecVUKLaLAvko8rr/AFMClfcdxjx7XOw2befD3aI+MWSwlY7saz8raSEdYH1IoJ
	 MTCnpQMyFftg5/TKFZ4bZ1V/DkXxETE6cL8rGOzCllfQE6kapcrOeT0PCj42ADR0FhD9f
	 uBN4u6+sQDQzsqKKLD9iQgHrhhA6KLAVHJZeYez6E+brHV61+w2TJ8qcSp2HcYXtuhCsF
	 2bNDq8AASB19zOR6O3KBE2uJU5oaEy990QMhyQY48vK4OYko/KZGQn/mjisMBaucWnIMF
	 XG9sfoAY2qffsQwad+602/x3seSOEf6jg3w55rX7N8SDrwNRinSUDGRc1dp14LvcEWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610181;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=POvSG54p29BQgLpTVyhzT0AnpwvrTgzEbWDmeBpeDbU=;
	b=mFYQoWvRnjSzSVXHaxZoSUi1NLxTeHP26Y7m1YO0EqeSbhhEPj2ohhyhwOcmkYQt2H/5
	 rH4IxA4HgrWGtxtofkhY70Gb1ecoAdjANQ3jX1k/sGuRNMjv7J7zCiibgG2hRrlkiJSqn
	 V2tw2hZxIZ+KZzE65meOEklHzT1q1scc+B9agjMu6wxN6V50WIrxNEVU+vPnTReOQHawk
	 wx/A9jRsNR42pT8HW1ptTDZ2nj7Cg1YvOUcckbUZcmHfG2IoNFDmjx9zxcUrUhyK4kNht
	 fEWSlni9B+zFeYVs3lmbKKzCT1BSZRSWDfGitRyr4ls5EjpChQcOOvRERNd5TKXXlxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=KRL2nvQ+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YaNQ4vfp;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92D606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF92D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=KRL2nvQ+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YaNQ4vfp
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id E6C99EC017E
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 15:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610179;
	 x=1792696579; bh=POvSG54p29BQgLpTVyhzT0AnpwvrTgzEbWDmeBpeDbU=; b=
	KRL2nvQ+d6QxjE8bxVOb4zUBiujHq+MMFsBjOPQFLtZER50J0o8pnUOwxM3ugAiZ
	tfKtVyaLItvCsRNFlmuywGmYE7TyYNkZY4XSBogRcbpWW1SbNgsralBpuUM2wZiA
	Nyxd7GFUDR4L2W27QPyFQ/Cg3eS3fi6GfHwh5hCjPwSOcHNYyYBYjuVjg4WbSKuR
	9rR0xESleC76jLlHm3R6uCBVU247jamoNWoCZJiO2SYX0eOXVNYyqHAxmkqKKQ1O
	Wd/9ooNY/QIuSSqobrXvVLTf1iaURgL/SGBe7eaUMkZ38IzUtGHq3NEaRc/H9Won
	QMyHe/LUBxHDhWhinwW5YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610179; x=
	1792696579; bh=POvSG54p29BQgLpTVyhzT0AnpwvrTgzEbWDmeBpeDbU=; b=Y
	aNQ4vfp+PBPXmTnTegHRD/15GdaQNdU+sYrQzP15B8AdIoAIxzyv+AeixzG1+frK
	QYSniamdrU6wCQb4jgKAkm1LiKlY97EzAUpW5pYj9SAVZFDMzRi1/v7ErYWU1yWB
	g/g/CjJY5yoLNs83algGiftbW/6zfdG/JMyHbhvI2RcLvwCdkaVKiOoPCxfWu7eT
	D3ynBcmkNtJMy1F0arNUcd1boeW+DdOLOzWtxcHmU0wfWfjIOi30R8W2st1XaeaG
	efrDQbsoFTcIEcQBjG3m/kyZ6pDbqcZfsWWk29gjVrLRloKL+IxlUEz8cOjTk3Aj
	aVR0eRoN77SyyP0N0fkjw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610179; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Hk0XXOVhamLojcbRy6J0cBXX1Bs8Nr6G+CoXp//e2f1dY5C
	sdiKZ5Wp1JTEM5V5sYatVWqIds7xNAlCCDAm49GAQiLuZyueh3hgOJ5qXGQX8Drs
	Ksux/QKVeoJhGpgeoUKqAPXQzSpHggB6EyzZZiSKEqyHw/NgU+qgzGtsJlftWE+T
	5O4ENAUrPC3UqEdeDo88dqG6/g3J27dQ5CuJOwE75hP5wqzMJM/qOkdSsm393QPv
	+Zq3lf3GLL06iAFjOaMR8J/Ot37Np49eWI407qqZ8bHM3Pc10YxczxqtqKmuGi4J
	2UBr31HW72Fgguucnoxn6tOkKHj1nyYixLBN+og==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MueOba/YnYSYOGVMDn9XzGFGtWMZ74ew60pls2R2a6Y=:64/L1jAeKMGsENY1zdARu0dmGOdFdZ7azXpuRc+Zgg8=;
X-ME-Sender: <xms:gw_Zaq5q247OTaPO1s-3_WiVWVWYPXyZhb30mXFbtuugtRvHiLL0TQ>
    <xme:gw_ZahvOzArF9y3H8zXJsAbIjBVuEWyfjZu_00k5LdtuozOM6nQ4FQfGu88zex-Io
    E-xlCbiJ2RnvIVbeN14ZjxjYQ5vCjEYI_QvgmJ25jr9pKUjjSvJEdGi>
X-ME-Received: <xmr:gw_Zaj45hbJ2U_9wSXQi30-Y3PNGky63CAs_CzE_m8h-xjRhAkg6DoK4g_2uqyctHD_-9BsQT3dRdLE5owCdkGNYruuP8B0>
X-ME-Proxy-Cause: dmFkZTGnRf3QuZZU0thrcgX8lHYTDkWlSG29PVP/D1OQ/4qQuIv10Jc+fTUPbLmClEtg0J
    jfmvodXwkA0UN6fblifi9k0yWe7QWcAu52CbWVy+nhDgOo/VKHFknnYglC41BTgEcN4PBg
    3MHgfPJP8GV0Da5F3UfmKgNPsv5izejiTCU9E8qq7b4jwxlQFANKtwjk4qQxoIMUKfSX5Z
    z3NDKOLKtfppzmvEzVISpzvXX6yU9TjQ4n9o2nIcu6/qzm9irIn36i0demGhX+RGXMb9O0
    ySyW3HqcMxrKymxEZf2VjMiHn9smqJaRNKCZ3h2mcKN5s3aMS/DTZPArx/AJD56n0GebDu
    h3Br6ZG7A1mGNgsI0g+vOCbL2D41SHJwMe3wrv0MEkb4p84jlLtW1Iw832hNOXTu8q3w6V
    NkefHPk94a+WMLrRU9P9TfOng82S7AIboa4vgl44StxMEzFvsd/ry3eVPM0PZxp4PdwiJE
    bPgQdO9AwznFdBgl+dFRR8jIFgPYM/hgpusd6y6CPrOUwas3NfhlE1Q++tyhUJrko8Tqlk
    fmDFqkcIPpXlXpuOOvPNvekwTGPGAsivOQcA0DHk860sxCpuDOvN9OjWFyuZZex6/a/+00
    22sE6U98VZv7UIOxN2mCcXoMQxJn5+tX7HBMqSpZWFBFgMzHV4S9olI4Zc8w
X-ME-Proxy: <xmx:gw_ZakVh5YtKQi_3VVIl8Z09IlHV1Lh0VtpK329EFmKOdi9S9g6tlA>
    <xmx:gw_Zat97la_52QbWC-v3v1UpsncgURjeMOlypFe_79nIFdMjr-QamA>
    <xmx:gw_Zaon-sL6d7uzPNOLOyHmBf7413syoK3h7cXcUkIFOZrBBlLAccw>
    <xmx:gw_ZajUJak1qseHFiZOC-AeHvM4kP6dpemWoLK9pLFoK1z52RmvQIA>
    <xmx:gw_Zam7BeWbwpLK6cAI7tOsxhngRVwbFoDMbAFESkRPgRO_xqFZTs_HP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:19 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 2/8] Open the input file in main
Date: Wed, 21 Oct 2026 21:15:45 +0200
Message-ID: <20261021191551.2975000-3-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for refactoring the reading of pixel data by moving the fopen()
and fclose() calls to main, just as it's done for the output file.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 1bc50dd5b8e5..40bb65252efa 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -144,7 +144,7 @@ static const struct format_info *get_format_info(__u32 f)
 }
 
 /* Read and return image data at given width, height and format information. */
-static unsigned char *read_raw_data(char *filename, unsigned int *width,
+static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 				    unsigned int *height, unsigned int line_length,
 				    const struct format_info *info)
 {
@@ -154,8 +154,6 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	unsigned int i;
 	int bpp = info->bpp;
 
-	FILE *f = fopen(filename, "rb");
-	if (!f) error("fopen failed");
 	int r = fseek(f, 0, SEEK_END);
 	if (r!=0) error("fseek");
 	long file_size = ftell(f);
@@ -205,7 +203,6 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 				error("fseek");
 		}
 	}
-	fclose(f);
 	return b;
 }
 
@@ -997,7 +994,10 @@ int main(int argc, char *argv[])
 	}
 
 	/* Read, convert, and save image */
-	src = read_raw_data(file_in, &width, &height, stride, info);
+	f = fopen(file_in, "rb");
+	if (!f) error("fopen failed");
+	src = read_raw_data(f, &width, &height, stride, info);
+	fclose(f);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
 	       width, height, info->bpp, info->name);
 	dst = xalloc(width*height*3);
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610187;
	b=E4xTz9VZuVDzjNChjrjOogzkgsQJbEqs5QsMY6dSejA8Vuh8H9vMq+s8s0rFG7zv+Aee
	 TAx+ZNb3S0iG+c3F+JttG7/FWCNlRNNS1ccLp/gxrk5awrllgkNWqt1Gbrivlvfb4skFe
	 0kZd84CjavoSUP4HIIlA1Sg+ftK3wE2hOFpKtNtBAU4AYjq0VWNcarPDf50FlShI81ZXF
	 yutlufLtAUYVOJOHWZKqC2LFYaJewZ/ak8iNUN6H+/WEBO9NScvRxDnSR4R5BvYrhApxL
	 hSu066V8TuZ8bZOdPhnI+/1IOKJHSAFh/7xWwPegz0u11iMgmOJNQ7O5b/9avmn5Gew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610187;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tmKvNyEWnYe4lVdlTwdYiw5p2DZczJM3IRhVrTon+0M=;
	b=V5vQJWDaKfy2hADmnj0DL4EzXBu93EUlDTgUeZW+xQwMXx159AQTLcPYWdYFXBnKmjNe
	 YsBgKaCk1m8ZVwzJ2WdhGEL2kWUTS7Zy89nDTKMYP/mdLvSRIyySEEn+N1hk4fqDUVult
	 Wsnq6Lv1BvCSoNpual9ndhzKU1VbCAG0MbaSMLpyazUYa6BwxwAbLEuifRdIj44tyWDDb
	 R8cSZXGNW76mSsLRK3YupwhVve2cSH5W6c1pBq+E1+Vmb9OldxWo+G3R7A1hLTY7/pG3D
	 Ykq2PH1SiFTksNqVtPyCrcg8T+MRHvf3yYPoxtfCY5e/I+Y7PqL/W8/71XTGx4ZxUhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=J5LaJ5Il;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=B4yKBI9e;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A277606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A277606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=J5LaJ5Il;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=B4yKBI9e
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D8987EC0180
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 21 Oct 2026 15:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610185;
	 x=1792696585; bh=tmKvNyEWnYe4lVdlTwdYiw5p2DZczJM3IRhVrTon+0M=; b=
	J5LaJ5Il0hpOQNMcwB9nzfckLyuiYyD0aAptkNazFDbq+kMxalgMlFloHockJcnq
	pU+kFGdEzPuqyebYrLRXzLOg57wkyRAnStW7M88WjjBeRPpDZ1beStstLlg9jQAv
	BnDYgKYKujLIqkTZH0NgK5QXIZxUuerbRWykyDA1NQQoJFgkbPZ5YmdBq+WzrE/d
	mmv8rxHkESXAX2BUDT85Lo3pDKlLcuko1fJq2PVwfuWCKsGww9eVrr9AQdArOgKb
	3pexp5VauseT85GxEkIVLSZDh+B7OZcDZShXxIzvzkLPWgIdkCA02qx+FZPHe77d
	jpgf/j8V5+P8iBXTQlzYAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610185; x=
	1792696585; bh=tmKvNyEWnYe4lVdlTwdYiw5p2DZczJM3IRhVrTon+0M=; b=B
	4yKBI9eIuP0LUoik87b1o3e2h7nxDDQB4Dsc5IMhVADvgOn+qj6Tqdd+tR8csGkY
	O+VkUkf7Z/CPsecqNJptVkcJ86Frh9fN9IM2aucSeY4r/omTxJxbxOxFg4o7Omty
	pIWpvjcmgcCnnkEXONtkEYJus7qPm4pMlAtQeXkWwksIjvlpqNLKowqVZRskakIQ
	QGqHs35Pu/wIzR3FlIgzgRgbslmp2ZT8KlLbTfK4gL4lQrWcD0SVAYN9Q0MVrEq2
	jZ+UQgmO5GGGa+gB3G1YplrnlccJdEbnYyr8iatSmS5KPoyruO3lm3cK8Ygtamzq
	Svg5ktZ/YOu6AMzPuCGYw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610185; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:mBCeU1VYjetRa7MSRogzJztIJi+6LqF/93QR4pjs58EZ4/A
	WDmA529XNn/dM2uqss4llXoYMAUHxlPlJn7KRCP3/+rd32hJR1A+CH6ogx8l+zpC
	d0SdxR9YSG7LHsnEsYjF/YRyB1qv2XzQHRKsB/5lbOrCSVc5omZxKjcHehCY8OyW
	bSQbLm4SkVUIfTdRVxsNCFxztD0f1ZtTjQ8qPKkPQY//73sf4XpP6xGoXQ9Tap1R
	o2+Ycr3G2p1/EQG5YWvHtc+Efrh/HXia1bxKkmQUgEluKLpVSrMseYrLMZtVIsoR
	wSlS51hAzS5IJDbHUpLQMh4rFObnOcrytDuTwOQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tlaK1zxEq8yHquIwvoMD/ELHgFOUk5TA5IWn4T+BX7g=:yRPueq09GC1FQnLhRekrNcfFs/vl8RkwxTeXRuVedXo=;
X-ME-Sender: <xms:iQ_Zavuf7AvKUDLNXGNymMmgqWjSALSEiIwZUoz-9bVzRimFkeswPw>
    <xme:iQ_ZauSt_6kD40FDzlYlGzIxOoYmR5P1qWb6bnspnsdOi29kQXW9YdRWLLqYUotIV
    KIwb0r-1i56VhKci0raY6umDz3Lwv5ledTc8RHhv7Iv995O_oInw0-e>
X-ME-Received: <xmr:iQ_ZatMXicumXZhxaltTz-AZvgCLMvelVkgrQ1bqxeB8uODF1x2NsYbFXmKVYNOEzyqmCxZw6GupRFTU94yfCwQ_rneU67w>
X-ME-Proxy-Cause: dmFkZTGnRf3QuZZU0thrcgX8lHYTDkWlSG29PVP/D1OQ/4qQuIv10Jc+fTUPbLmClEtg0J
    jfmvodXwkA0UN6fblifi9k0yWe7QWcAu52CbWVy+nhDgOo/VKHFknnYglC41BTgEcN4PBg
    3MHgfPJP8GV0Da5F3UfmKgNPsv5izejiTCU9E8qq7b4jwxlQFANKtwjk4qQxoIMUKfSX5Z
    z3NDKOLKtfppzmvEzVISpzvXX6yU9TjQ4n9o2nIcu6/qzm9irIn36i0demGhX+RGXMb9O0
    ySyW3HqcMxrKymxEZf2VjMiHn9smqJaRNKCZ3h2mcKN5s3aMS/DTZPArx/AJD56n0GebU3
    1FBHrLQixeETBWqaWJwyJFCwb/pfvotjqYsGCYZAH3tcphUdQYRFtOhJ3DiNgf8zcrJqqx
    bq1QitKu3JTzwRoReqEiHVRoy9L0p+0MhOe0nLwJTnGkB3rvdzEgidr+ZzNSrRv2Ool1VI
    MT/Dzsb3j5aMy/AubDg3nXW7HE295rOYQyBQozpgyqlLMnI8yrpa2cbrJr5C7h5XXNMdzx
    2eGK0LWkDSeBlh5a8KxSsA7e+wHacQODc0eU4OAvprAXJqhW4mjgQRc9ciq5JPvubDmHew
    7lIzFo6LVN+IL2vw5NW6BBATH6VYWt42+ykKrX0YAaDbuAJ+8swZBpcMmOEw
X-ME-Proxy: <xmx:iQ_ZarYE4RNbwwPOA1ZhLMLZmCsqWc-N5oQVnwNap3EbGNLr4j3Z8w>
    <xmx:iQ_ZavyYvVTeacUiZrKsabkS2A_4MQvVBifNKeOp6XBG7ljWpG3gwQ>
    <xmx:iQ_ZauJxqRfbNKoV719EWFuzvJi9q-oJ8-XQcl0oKDLOBGbqTKsd6A>
    <xmx:iQ_Zahoc4erN7dRWjvzmuvW8mmq--avSNK9OheUJkpuKPeCL9mglFg>
    <xmx:iQ_ZanMScamNyVwodksJ4_owF-AwpRlkJ06d6uqdRQMB-0eAatE_GaGj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 5/8] Create helper to check data dimensions
Date: Wed, 21 Oct 2026 21:15:48 +0200
Message-ID: <20261021191551.2975000-6-niklas.soderlund+renesas@ragnatech.se>
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

Move generic sanity checks of pixel input files to a helper which can be
used by multiple input file readers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 0458925a97b2..f3b34b7b110c 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -78,6 +78,19 @@ static void *xalloc(int size)
 	return b;
 }
 
+static void check_pixel_dimensions(unsigned int width, unsigned int height,
+				  unsigned int line_length, unsigned int bpp)
+{
+	if (!width || !height || !line_length || !bpp)
+		error("Missing dimensions");
+
+	if (UINT_MAX / width / MAX(8, bpp) < height)
+		error("width or height is bad");
+
+	if (UINT_MAX / line_length < height || line_length < width * bpp / 8)
+		error("stride %u is bad", line_length);
+}
+
 /**
  * Read a file and extract the useful pixel data.
  *
@@ -217,19 +230,18 @@ static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 
 	file_size = get_file_size(f);
 
-	if (!*height && line_length) {
-		if (UINT_MAX / bpp < file_size)
-			error("line length too large");
-		*height = file_size / line_length;
-		*width = line_length * 8 / bpp;
+	if (line_length) {
+		if (!*height) {
+			if (UINT_MAX / bpp < file_size)
+				error("line length too large");
+			*height = file_size / line_length;
+			*width = line_length * 8 / bpp;
+		}
+	} else {
+		line_length = (*width * bpp + 7) / 8;
 	}
 
-	if (!*width || UINT_MAX / *width / MAX(8, bpp) < *height)
-		error("width or height is bad");
-	line_length = line_length ?: (*width * bpp + 7) / 8;
-	if (!line_length || UINT_MAX / line_length < *height ||
-	    line_length < *width * bpp / 8)
-		error("stride %u is bad", line_length);
+	check_pixel_dimensions(*width, *height, line_length, bpp);
 
 	return read_pixel_data(f, line_length, *height);
 }
-- 
2.55.0


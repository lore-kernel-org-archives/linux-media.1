Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762534;
	b=iwMUihnu3swsEc7MOjl2TJ9A4CaxFRmUVqIdrAzu7n6i1o+ZSg4AMQC2R6S4ZjC0yX0o
	 0iRr2cdkQ8vXFXC1Oyif0V8oxICPov+yJyJ4/s1o5BhaLBoopcgJc+/6DDtvJD5NNhuTN
	 VXpplbV4FiyrdWqQ2c+T0C8rI+q4qKanJSXVDSKnXhTkh6CyxqUjGHwLCTC78vTxjySz6
	 lQ+sGW/kAsbCbAymPi0UmzUCX4oth42LOlBVDBM94GuP1KjqXppE7Y+HQaYzEBKQdYRyW
	 GLPezcAXH4T7cete/0Fn6zOFLMLlYw7QnMQ4UgTtH6S0P2zVMNQSJ6YhCJ9m2KefXaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
	b=THtHuHG7uzI0ithRvFPpCh/UHF5jCpGSGnwsm8ekAMNRRi/OOctUXtZ4L1x9RjSpDs9h
	 C5TZlwn7kC67FnIaOMulDu0hRDdNNNS4ctiiBCftcYpl6ysg3+pGUS+8Y/qr346q6+bh4
	 tTr1mTP9b/Ka5K8wWGDyo8ZvT21AVArXuHIGgTDP3uuNw0zhE1ek29fZkvg4Jtyo7xcxA
	 Q0Th1OYtxYD+G+pzxTaynEfswgChtvD+g6kw5LHfF8ZxW5IUkbnTtNR4E+8yel/HX8Ubc
	 pP6z9sImOQo7kWAqzSFWPsQhDj86bRc5NN1QKRclcWo5NZqnyENbw8Xza9q3zphAhCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdqY3BSi;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750D606A339
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 06:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4750D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdqY3BSi
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso5657543f8f.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762533; x=1796367333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=LdqY3BSibT9kF8yeS43kQZ/FcJobH/xrre6CcpWd9sYdjaH+RVK/Nyvj7/c67jyFwI
         9sfScTqFN62NcDxC5j4WNPAj7qC5FMdks8XSPuD09KFtGu8yvt50sfnD7QxiSUmmpCxx
         AmPy47/aWVPE+iPaxEBok2F0wErj9/jCxml+TRtUgLZ0g1MJIhdgylrOkcWZj7odj2zO
         QUs908hefcrq8Bgn3d6s81+zgCOXP/a4QjXN78Fgykh5YJpq+aqfVXQ6ISg9GrMZd93A
         1rgU20yzIGRQhUKNporX/bOFKakp4k10Pr6IURHBYP//KouFgs1D539uk4ALtJjT/9aw
         BfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762533; x=1796367333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=HcUDjHv6oDsZbkzPZbNQOueLpQURqOoHbESDZTq9bdcSKCu9mqky93WCjthyqKIq9l
         nEWgeZrIvMGQ1jNFVO7vq4kgLAko5mwCrbvxLFOkq3Jtu9lT830OJpTe8G50UfhH0JZ4
         5PG6I+E58Gy+li/u6BBJSd/q2yaTnRvv4hPTHyaqWQOXM7ZIwg1zcfagcWr4ImI9IwCo
         +tDtlLbmqUePBfNNmfmE5mY4Zt1znkpM7TJoqy4g5aOzrPNcmfRyGyPPLNXf+gP1d11y
         7N3Wjey+/bOspVkLURhx/375GGzspUBwpDyo0exkjnYMqEOi+sDImwf324GLBcvLxk3T
         Ewlw==
X-Forwarded-Encrypted: i=1; AL+hErFEB9rl3/nxe07ghCzeoL4+RA70ws+rAPdKgK7VkkqXCFh5RV/UrJgUe9tPf5EsmuXo99ShQAQq8HLixA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GTxjMzUVTVEt0T/snDxPQlt/kAlzYzRVpmlvUj8IRCv1s1SsC
	6LYdwC6ID4E5LLsIg5l+BnaS2m+JKG851W56Qim60CaloTMqTZR97XJV
X-Gm-Gg: AZFdTZcJbJPfT+K5Q5HiFH9zZgD1TtKjwmpxmXFaXAKm6ydvkFyChu+t+Ltwj9KBkMo
	tcQHC/oL+asME8M2cIqZjeJXaFfYV4cwd4Qp2pmDHV2/CWBNPwB9nv8E85VANowAP7UmQDCsbh+
	oTP/WaNdC2rsTWHxGsA1ir5hwcMvasPCHDQa2rTCsehfbGd3O+GKDk8vGOzCgQwfiWouOYuSxeP
	ohYKNDIINtE39Lk4gGuPTW/B4lgMFVMq6+P5Uguna+kUC+rwqbHZGMCKOxSrdhLBMBUWEn7Cn3Q
	nbDnw/iOb+brQswMbNinLeU2W/E4zlnZbzIyNCedInhNHsW6XpFNbiWNighVvGChpXJO83haX42
	HCfw+CsXnB5OUiJtk38ayBUypmrpZ8eHmMUeO5zCbl4ofXWnk83K/Sk1snG3Qc7rNK7YoefzHTw
	dnxezk2Rgey/sBkephuYL2duiyH8HQo1CClHL1s2tH9ebLmWiXI8CileOacjB02WbAr4GBUU5LA
	VNAxQWzF7HuupgxGteb1IL5ymV0e/IiX1IJhfb+Lq8WFaLhdr11bmdAd8Elep4Z2o4XsGTaKAqv
	OPIGzPJ4T3APpOh+JG3pZN1AG+hf6yzeTip4Hv5IkyQl5ndqfAEIrzwTKbbXY2Jl4cdT76ihcKP
	Z7vNF8MgKcnYPFgfUO4hI8salmkeGPcXpjtcNThwBS8XHo26UrIELxS7GvbL1kdPrn0G8WMZjZV
	5PdYnizbdAKR/JfQEAlBYKtUe60wjraotYlyomx0Iy/yV0QExNHcCSvf9lSh4TPZ077mpNhQjXT
	mhFVhRUqWZLeB84oTJcU3Y7vob6BAhrOevLbe25sY4=
X-Received: by 2002:a5d:5f86:0:b0:4a5:ba8b:e00e with SMTP id ffacd0b85a97d-4abb4f5a324mr44654273f8f.45.1795762532450;
        Thu, 26 Nov 2026 22:55:32 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:31 -0800 (PST)
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
Subject: [PATCH 2/3] staging: media: cedrus: factor out the format check
Date: Fri, 27 Nov 2026 07:55:22 +0100
Message-ID: <20261127065523.3685726-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_find_format() and cedrus_enum_fmt() check the capabilities and
the direction of a format in the same way. Move the check into a
helper, so that the VP9 decoder, added later, can exclude formats in
one place.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 2521315abdb7..a46820a90d87 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -78,6 +78,17 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
+static bool cedrus_check_format(struct cedrus_ctx *ctx,
+				const struct cedrus_format *fmt,
+				u32 directions)
+{
+	if (!cedrus_is_capable(ctx, fmt->capabilities) ||
+	    !(fmt->directions & directions))
+		return false;
+
+	return true;
+}
+
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {
@@ -88,8 +99,7 @@ static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
-		    !(fmt->directions & directions))
+		if (!cedrus_check_format(ctx, fmt, directions))
 			continue;
 
 		if (fmt->pixelformat == pixelformat)
@@ -191,10 +201,7 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
-			continue;
-
-		if (!(cedrus_formats[i].directions & direction))
+		if (!cedrus_check_format(ctx, &cedrus_formats[i], direction))
 			continue;
 
 		if (index == f->index)
-- 
2.43.0


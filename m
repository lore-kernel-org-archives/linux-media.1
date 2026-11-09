Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246678;
	b=gr1yFrSeMm7qCw6jWJdLxqHnkcRTJEZb3GBYe6cLjzD8q+sZLYI+wvJAt0lwOTnMeknR
	 Eglji3Lg96p3OhyIl31coy1ECS9KgFnhFNdv8qht/e087X53sIwSxXCCVBSjta1BLW1VP
	 4fpegVpTWhwXxZTPhT5TZFIWuEtpnPGDwa1GJSKJce6SiUVruxeL79LXLtIgM8Wrejxg7
	 jb95SVs/YxpxTjW2GuGhXqGPmQ6Ch9umsxNtto33EyxG826KHPNb33gz3YsexTFZOHWoO
	 0d/0oBsmVP6OQ0KaKE4Zr0H8NjFp4su4pGmkCe8uralgfe1yPkQRt4Xb60qt0sWeL8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
	b=5X2pJbGonWc6hKss5SN0l3IcXLaYwq8g0/fhNhPtenSaww1TDG8NogqV/jKyNOTmJp/I
	 th+dAgbO4c7m3Wzx4ziNMg/jZI7RG10uHWQGAkAQAsZe6ZkOjHHk6LZ+nyZ1Y1UMYQaKB
	 SxlKzAtA6Vj31t1c79uT9Za7RIyqnmJow2rLb9e86gwiPnYCqNqYyl6vVA450dEI7cJQa
	 W7wi0R0GYPaMUJwpC0tYfs6hNdpntf9rpyCHrs8IuTqlwRYhEFkq/HvcUZ6yvwzc0XUt+
	 USQgUvtjvHOC23/1frrDsYpC2FWyw4+mxSOshcrt+DbI5UG9Zt832zG8U42ce+nbGyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhCW4MjD;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0EE60A5BFC
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0EE60A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhCW4MjD
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so783101f8f.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246676; x=1794851476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=UhCW4MjDrB2Jx44R2tgdeRC22xvRx3LIYCPL1fI900FRNGaM4YP4XcM1Qwt4JqeZ1M
         B/BAxGogYx/l546Sx67OBuhsR0xVeM1JLt4MXZQIhKnUqLNQUW2L0OpGZh7iasgt4rah
         V6gF8Bd3NfZiH4vybKbWuXgcUn5C+5tFoZ1uvXTMKwIq3U9+Wy0C1wnMCStFD7UOTd0h
         wu1yRsXxBAhKk6iXkf1mCUhDU5IGdKwJTHQ0kcpQxYup8vlhSmj5aiAHXHld9bWcJ7aa
         esuFhvbUjSV0fRbcBFnKd44KaHyjLrZJVjefpf4UylNJHeRJcRSpFnRIklUxqYiSzuZP
         tfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246676; x=1794851476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=oR8lIwjjogBhb9ytbNoTyzp6MQ5l/uP3uUycl9bLR+CUcAc7tfPMyS3LD+ISqoEH5G
         6lKQv8kMQCVzh/tOmu5GUpzyOK5PaVmHIcHNHEJ2NJrM7WWvnb4062bkVVlY4Yr9vjis
         WXK48OUAxhuW4QAFaQuwevJz3h+uqKYLhlEAsVj6ykPxEDiRSmYTW0Oh8YHggk7IISqg
         wIIsStGmE0uF6YyH4m+aJe8d7hQhGfF+rzx54cWVHwBk8HwNYPBZtnY7laD9AvogmZE0
         dC/qyY/YdTwi6LgC7wimXnHrxENX9CAB17qRxEX1MzfkKftZWv9uAGZL5NhxgbEEUBXj
         oMBA==
X-Forwarded-Encrypted: i=1; AL+hErHRACNWhnZ5SQucl4vp8ZHjNCtUd98svz4lgYQvLMCwMtXhPSrkbQibGno8XcF5OPLzUa02IW32m5YRPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+omrfTo+HPy8jm/Rko4y/OhBoay7XMZ/sM9xBergkIIQvMRdCG
	7slEVlLKQT21lRIt3uOW/WYmP2Fqbx32ttNCgwn9+Au7SVf/qSB2ShBR
X-Gm-Gg: AYBFou3nq1Qx7lqkvuHhRBRD8hq1FRE1SxfSk6rmrDretk7JW+hM/R0PIMV4egIefC+
	rWxpXEdPgjxuiZXo1iMPdCBpfVeblsFOa1p0RSlaNAMVlQPf9GCpdoIPPGh1Ht4Sikh8/UTdCzL
	5QClkdLzfQ9EQYagyw+6cQgZYXlDkcJjDEgku+bAAcddjuj/AzboakIS+3MnvQnoNael8b+p/3e
	JBc09DhIGDIEMhyWi4F7izLQkZel03E97yWPdO6z9zGltNVdcf66r2WW49c/s90OqtdP/Xg0WiE
	3eI/BklDBg/F/0YGC84xHbnTkxUEZrPATF3uOz3KPLtFfLibpn8modRi6xLSpaHUKAa1iUTzENb
	DQFc+H2UVlb288/cnpAqY3q0LX6geOolYdn+ssy2lLubRtBFc0Z0cgENahW1To6pA7CndyX/+HD
	MgOnU/Rz7qRIyDwWgETpiTAZH84nwNx08rF+1MKlHz8OFE/rlemC7gdhG2CUmgm7S81D5WDyCcw
	N8V+A0iBw6HW6++3bcfzVhn7HKwEBZukbzhvDcWVUjndz4M32xD8/ggkUOmkO0dRBhemDFRwGCA
	Ovrbm8uKj+LBpSNELMCCYL2CfAgxk8Ho/vU9UtF1CSEIQH/DpupAi590OdyGn3LKQ0Rh4HXMneF
	IHDlu/91b2adL4pUNnpW8EnAhNQeiPafLveZdWi1hwA8YMuf89mpERZWt3PubFQTg5KxQHsiB8z
	PkpQUdyAKgZuCoTdFQz4jI3O4wFJ9DsXM9SYZY3uzaF3P2KRWx7Ua3xbM1gtXk3V2LJlgRyqnu1
	r20hOi/S21Kn9Sk8DA4S4qsH/dWYsN5L8fs3VAWI1r9Vt6kV5Y=
X-Received: by 2002:a05:6000:29d9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4982fd3e550mr237732f8f.26.1794246675934;
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
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
Subject: [PATCH v2 08/11] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  9 Nov 2026 18:50:13 +0100
Message-ID: <20261109175016.42061-9-jernej.skrabec@gmail.com>
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

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index fecca343bd92..84bf18fd231d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0


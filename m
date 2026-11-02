Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639012;
	b=xsBDHH+ilnqme0XzXWXI9KikvV3vpg8caqKBmzaF7O4XtBG+bLqH+9SUZAtzfdxQLZyc
	 GCVJI6LUphVqOlCAshApqYNuxOkqe+kFtzOym/KhpJq3T43sZafXdHAQKeRgsgCCVUI5T
	 EvdhFyaK6lbezF2WD/lhmHGYozROdcNs/QM3/3rbHE35QCGxXBBzVwmFnfOyIl8M5QYW8
	 jHtIOpSCEUERNdFJQfiRzfjRp+gG20Ikhv2Tovf3FbOfHqkTQ+36kL0VzW27Htfj9+clz
	 xOUeEn2Ota4/YHn2H/dIMIpevHKf1UPUyohPpmud04UnnIOilBg0z5Qvgs+b0SBFK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
	b=4MnAE264xCfOFqf/AtdJqH70p1A2XAbnthl9JZuoCcuiuB1Uh9kj1S1/rdhzAuat+zOl
	 4rtos8gKNAvm+dbe/xgoWbgNEYAW1tjYbMnwvuQBIZkJPxlnAE6AcoEJYCjP2YevvX3Rg
	 d88rZhQv+vFRGBDtgNK9dWan3BUb0YHScV0fNO53dpIZeTNkwEfuRzQeekeGhj8oAeHki
	 +66KW/OvGp0AqKBMT4AeVW6UYHhOk8XFt4LYEkiuxOaC9NZmyP8Y4tD5/XlEw39C5B1eU
	 0/h9ZD4a2u2cJLv6j9aO/+M9Yj4CqR8tU14J0JnY4vgHrebSOUq8xY4GM3j7/Xye3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DbEWp/2Y";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D6607BDE8
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4D6607BDE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbEWp/2Y
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3347110f8f.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639010; x=1794243810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=DbEWp/2YUl23e2pSfhLpgKRsYyNC7+f4JUbIMUu/MXWYL2RJPUzDIdQpWVhZ2F2mWK
         ScLXkde2FGTstuEBHjhABpOGrvHoMm0YNGZtn5MzhJQEkUGH9Rzmffq6oIAPOXUS6UZF
         VWhhy+eSZzSfxVZDwBamFZYszH6Q1xCNbLtKnCstP1neyHafQhW1Z4VIv8eRWIxic56q
         B0ewcMTlpb038pfVV+MKR+in394dYIkKut+OA1hZOA7G4tm382X+2McJl86Y8Eqgn7P2
         71LMkcHymtQjDr7Zl+07ZTUfzv3kyyY9O0bdDjpdOu77oqUcZS+VRWhSsii6u4uIx1nU
         BQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639010; x=1794243810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=DkOn8+TPSLjFZbqdMJSW68HONQqRc1GBWyrWD60SUee/5wjcaZUVuQQxxJAG0clEEB
         DgvZ2IHO34NNupkLhRCjNDnLOv+rQB/y2ot+8hBwlH/jEwcAecDeZ1TQm2iMckiopPau
         FBe2w6OwfKvI7MLpIVRrVq2AhbK0QBTMqLX1nMaUmMKKIklT/30jRSHheVSKBfh41YRr
         XfqluX62nvPKdT0cWy9NkCwQMNBfhrGNjYMxzRDrviCfjphYhT10EzQxLyUWtbURvpcB
         rzJTTuqo/miuHd+JrpePLeJk2rnQTswre5FAn2e0D9VhLFHvJkyE5qGfwm8zCG0Bh4wm
         ccCg==
X-Forwarded-Encrypted: i=1; AKwUvByeFogw0rHmEeYufHjdyxvn2NEiFlhkguqeSBsVNEJFA7mqbRnhgvW6mI/bZOzFcBIRJWGKZGQdHAmM8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IxMcX8sEUaxmci/KhghmMjzgonMxSlBXPClwrOfjIDqMtqnPW
	iNk6wPi7+JJJLrVrN3x2RJqC/Nu05VNCUfPr0FbBhDCrkhWV8HCTf5F5
X-Gm-Gg: AYBFou0PdVCwha1XZWsJcDS89S301YnNn6fBbqAlL4YZ9T7TCC23kX6aGvUzblW6N/u
	N0hoxx64ORI5lYx7vpcFStR3erpjgWm16wiG0N3BtN9oXcsXy/RBO7lX0MIJZ1rmkyEIgbJreV3
	lm02DBAfxLW9mX0K/UEU/96IcWeO8V3e7Ppl9nTyQq3DbTqtVwvMgvkM6nwlgQ6jfqIJid2vgyT
	L+SoEAo6DyQ1TibCRt25MQo8eqxY2B82ajnnfHRMUYM4m0VtvX+jzrQt04UT1SBH+cU2LUAvo+2
	MJfYvp7vGhH3U0jM6zG3c5tk6QZ9HutHYCyZpSBKdYYnTioZm6VB6g3RgdPXV4C4o0AiQAU4u/+
	n+0dmSb07fagA5vHZ+FT+S9jUnl0on1fu7A4GFAbAHxa8mU21D5CdyR2758qHmZQPMkoTTUlZ+q
	/W/04V5HuR8skuA4qk5aKBLohiDYuJ4YNA4eIXam2c2HG+ICg86vBugJJydPrta+yatKbbwzPij
	ZFFT0XRxrf4PKA0y9BR/xdn0O/P4ETjq9M2HG5TjRdeEnf4Wp/pYWU84vgMshX8rC8sU4TpkpTx
	aHv+PQ2CdUNLr2AXDl4pteq0Zz9sMesn1iZ1QVoZXo3PsKQfRXp2RJ7LNFF+VIJX5mt7BMhrsN4
	getwdCZEQOOjz6ylwgkrJT2BQlxP1dj5fKibQ/WrxLIrNphYpOw9fJH+x+9bP7JLdeze82Me1DY
	U2Yw0vxK10TmVx2Jx5n3xUa45IfX3k9JOVHBhxvn5oBNHSfHeWETV2L0o3oT3ybCcui8QZyLl8F
	WDExUfSBtD4iPru4zymFbrrhvg7Vagyib6m/1mcGf7qkzwH0Q==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr18919618f8f.2.1793639009894;
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
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
Subject: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  2 Nov 2026 18:03:01 +0100
Message-ID: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..6b00efa77c22 100644
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


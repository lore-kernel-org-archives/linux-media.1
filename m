Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246680;
	b=VfwEjEgO9SovbGEaWh/9pLJwjRHH0NzPZOfPXGTW2l2CoNIVq0aUncPiVS+9ZXef4VRB
	 GoUQrbRufEnVH8WVrHjqKJCJvrO9ZeRlbRA9xIL7k2OzVCeCEpUBlElOt+zx4hdkjG4bH
	 YX8qILFhb7hh/VlVnd8JGYF8Gp7hYIOj39vTnISrQmML2v+zeLwb4AC/N8uBSzEhg/Hr1
	 M0tVhIcRiIw0vHpzM8ng4d7P1AenjkvJch0RE7g/EU4cHywCJYgZiO1vcacDbqW4917yx
	 l53TzGrH+E93PE2eT722nKPXSvf8fhk4P4I0qb5gqfhtFrlfxHNIw9JOkhsiovbdtTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
	b=wT40RfmQh+qLHYyxQvLQIDhu6Nc4wajQ7zWmnLNJesWSXg7zlrNElcxXpdQjTlXew/JG
	 p9kFF6Uqrs6qPfUcV3m+TMZSyFUq0n9vh4srzfwImHTt/wZOLFLiSv1/EO9Q48OFsdjpz
	 tQ8MbMqD89i98PXsWFN+Q7yJ3+fH1zDAZ7saGUNj1o3sdhwcx7rxxGmSE9KNXEa5UwVyB
	 7XqF8JMxc97qiDq+Wtx9Uqr23jFxgcdP3E9b3MLHCWLBhpREtSPU1nGMjKPkZNd2Shq6q
	 /z10hw9PDQoc80toztaTRYrvTQZEdGK7Q4sEXA/5RQmlk6Y7A0vJWbBNQicU08JapKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1UUbTkm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D99C60A6F6E
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D99C60A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1UUbTkm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9113515e9.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246679; x=1794851479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=X1UUbTkmgQFYb/YKVr7KR8KdJUsFzGTGYbxZo4Q3uYSgegcW9fZQDD8huGrc/OBpm6
         cGISmGI18m4OOuUqjS3ge3pB+JFiROxrlln5659cdERlwZrOAa8JtN0Fa+5qsV7vOvkO
         mZz0w/6wh9bA0qnwFzvd7fSKLvOA/GEhVJR2V3nDNcca5qdJTZj9yjzAOrLJ6ffuBblG
         LewrLRX9F7y6XHcVF3Od00Zid5Dr+Si7ZpSQng/6kabAU2TDxrhheLk3S6Xti9CiMlKQ
         CEOE1WYR3vlJBLpxY/E4FHYERYAUlcbwNkfckrF88YUwejZUUcqP72YEaKsPHB+F/lDE
         SXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246679; x=1794851479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=QXCxNYQ8DFX593wDkGHzXV1SJttiajTAiIDLkA2xwxBkZRDNlC8eDf45qPnDZ9sMJO
         ekxHpx4zPbkWN7EOrhnupq2Ur8z2qDf5vm7n/LjffshCaS+x+qJBFaPZWJM6j6+pwBQy
         WDe+mLUitqOW3DRGVDH6ZJ59YYmzkxtddfTlU8BVVAZFvZbvK98nInkGf3TOat8dlLkj
         RKy92M5tXe7ORnNyl1No12C/chrqWHiOiFf1VTwNXD4CT5cINfnNDOI0Dl1l235sw43+
         gJ8aqH1p6WuLB310bu2LgmWuBNJ8KtZrYE2I3RPjMFosoxaFLkExwVarCY8rBWr5aYc2
         XjGA==
X-Forwarded-Encrypted: i=1; AL+hErG5zbEps1faEFWPx0C96moORBE5a3aC6kmp4ahIi3cBxXjCL3R0r8ap2TWqQqErOIkK3zgpXaIFK+2r7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+spsYT9aDVhjJIKWLmZkI2Z6NMnWt8N28r8qYn42MuaNBTWPAs
	kCPEKwC6cZIJlaF3JrqINJjWD3bVbEtAwgKFAlNyvNfSUY73iGOY/8Yz
X-Gm-Gg: AYBFou2MO+Q5gh9MsY2HrZl7zlEiynNFxLN6u8uiYgE8lW0QVb5GULalM4f0JmTiob6
	XeU9jL6/r5zS6ehg9e3KSUxmiaNlOvdDifNIUpbDi8t37AHoTf0gNOhHUPvixgA1BTMsRVrOBoC
	7UnG5/yh1Rk6dKnzgKH93sTUh3DtpdGdAAxqdMr3RwPhYAu7KszKggc8Dz0oA74ruAUQCEQjJG6
	65yqadvguMU3mtg4j6VzwZSLzSBPwuLr1CFzWmjuLf5oVxcUd790GpMRk8p4VVCeTU5OSeIp/ms
	RnK0/sTyaIPTN3HpzKPeEKr1Itg5Qj4tOD/6Qv7ZBS4Ao16KtuXkyomwHCd99jZyRydav0qab1z
	d8KlmdCqv6eTsLoRT2VNachpecnfBcnsSS7T4jXB7v1WKgM/0A+UuOXdc4wq5M0F6VorrFGl4t1
	YiGf0nlsg8p1cL8Yfj0Us2ECt6RD92wZ8odnGTXMELZ/bP6S6qKHcIMvmHDE9r0L8pOd/F67OUl
	wPY9Cg0hjFJnTSssQyyi8UcXmeV8UYc0rCSTQK2wN4W/65UHYfF44XMEIPOt66pLxDjozojnA+4
	iYuAbLsW4CGc3oF7aexQpC9ONxihJlQ+MLIoR8ihJzvTD3jWOWVAGxnYF2HojXaee+KllMj/tPI
	qCBIfAbT/SW3xb0RwLGWsUJtfNZVHxjgLBHJpWPzZoeogSu113f0LIogL67Fx+TN78eNm28+h7I
	zq/Rty1D6acfZXGNdbV6XWEtB36Ris07mRj1AUJQpQDX7UU5Qcfj5ZeDwo4IulcwGMX+gF53PVy
	oMmBpiXoJyLHYZPtkDBtN9qma4UkSxuTNFMZjELsKhv/blx5eAHCG6QdB2PLT2BVg3gquDL
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0230cc8emr216685e9.2.1794246678645;
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
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
Subject: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM buffer sizes on start
Date: Mon,  9 Nov 2026 18:50:15 +0100
Message-ID: <20261109175016.42061-11-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the H.264 decoder puts its deblocking and intra
prediction buffers into DRAM, and stop() frees them when their sizes
are not zero. start() only sets the sizes for wide pictures and nothing
clears them, so a narrow stream after a wide one on the same file
handle frees the buffers of the wide one again. The codec data is also
shared with the other codecs, whose data can end up in the sizes.

Clear the sizes at the start of start().

Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 97958ceee8d1..e7a3bfbc3531 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int pic_info_size;
 	int ret;
 
+	/*
+	 * The sizes tell stop() whether the DRAM buffers below were
+	 * allocated. Clear them, as they are only set for wide pictures and
+	 * the codec data is shared with the other codecs.
+	 */
+	ctx->codec.h264.deblk_buf_size = 0;
+	ctx->codec.h264.intra_pred_buf_size = 0;
+
 	/*
 	 * NOTE: All buffers allocated here are only used by HW, so we
 	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860937;
	b=aNovS19V7Gac5H9F63dSKOnkoOkeoxol+hQmtjAZ5MtoAIr+lVaeEvJy/QM8IgzE/Ei+
	 8YhBhlMRnHPMh4FxMu0Wo27w3vAb9cBDkGItAoNa8jDEJegvQI5k7TAAb3E/LeLdxMGEo
	 MmYONQi8YuFDLT1HKVddTD2OBR/1a+wtjFvzjNRfVeo+32jFlYMxw0t1XeSft4Y6WcpS/
	 2+LBDGLPLAHC7elQKgS5IaAuhstu7pYtKJy/101kIJZmV167XJt1wih49KLYrYx15G5Qk
	 VGtNopT9pSkPB5QF3BzwuN+YyA0RqtNETtY/GotN9qSRXLaRK76s2Lv91M6NJchyWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
	b=YgVTa0TrHhyQ3yd2w7xscwOwJbXNd1NOX0kdT7hJZ5snaAek0D87xXbxaj+UIjc/iWRr
	 eSM/Lmh57IJ4AfyZVCsRwysZBqIBRwY98ltxHfIYrL41pxauqc9tvnPeQhk8WyjU0eS8C
	 b0+DHcpCPV0LRVC3H4+5Mmh7FwEsM2jBbE4cXYMqvQW5+EqpB0CaZGLXrMK1C+oBlhjtx
	 MlvNPdEhiujBY/XspL4UwxXtZGabj3EoUp+djM7FGwT9+L+axjQomgK6mJSGgQtnQv3zK
	 sI/P9WnpaLTU8SCfX4KDc+FuwyK9yhWm0dJUVc6ieP+v1M2WBuLs6FfCqCjuw0LOR1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNClCox;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF1606EE86
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 06:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DF1606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNClCox
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so9131795ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 22:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860936; x=1794465736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
        b=jRNClCoxaImNCjoLeYoOnoyUASdLr5EcLf+Y//aoJQcFBteCQ/i2qh1kTF5XI9u+ay
         2pM+UmEiLZQ2bFe2a2lN9NF++sCdNdfqhsKJmjOCAyxy94dH2WuW9+IahfUJlhrIjzR1
         q37CxLluU2yMfpADDXbxcyckP64EUKEBRXfpDRAvJGyiPj0dP4M2UNS+Z8s2L7B4LpL6
         eyjQFm8GWuNB+XqH+OD2UHSHqjuLTCq1ni7lLfdLmYopOKplk+jXpZquMCeAijKqpcHR
         KwpKAPrAsjp9/toymVQ5Buh7PuqxzMHjiZ66wQVrpOxE+xemmnOfZV/G1SIMxRxaIjq+
         gbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860936; x=1794465736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF/a/6Zlb6tJSOx28wRj5eIz+JGBGlSlzrB0EoHWe2o=;
        b=dTz291Yt0E0cbaWuZH+FbkZGwTD4ubUe5vY/kUv64MXqEfzGYxbiIRMCW5My5Y7vPe
         0yVOaFiTrulN18MplXg14H1TMt79Y9tDATo0bCHBLO1WHXVBiKMngkqdDEmStZ/wLMcD
         AN+mG2wuw0N3xmNCQDuprO7DZraQth9OLfwtRpqV1KQHVAamdGDFCqUDyvNxoYGA+hGV
         hFFmMTVguDhVmJUnxlwqWnK+AbuhwwEu0rSrhbceB8U+o59hhmb4U3pNI64+3smNWAF/
         YxhigZOWMmIfnv3vL3/K+7ABmu0U/S61DcJgj/cuqEFMTpmF9JeY3ZjU2r03jrHS8SyM
         ND4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzboAsVwPHpnR5jdQez/xXRKnt3oaBnyB0GUlG+DUI+olg8oYsacGRWpUpTOaosXnlQ2m0ALaV+qNxpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rzdyONSj1poF9eRsMvATIQ3/N5xq8wdGImpWGc8k+v7L3LfOJ
	DsLgfyzJ4GN1VXshHUcPU8zKl3XoXRJRCfdZ7lazDzjLnowExOBIS0An
X-Gm-Gg: AYBFou1iSdgJA6eJLCtjctMDFOW4vZf7n1xeeRsllLu+DuTOI2YDIzx5fa/tVb87lhb
	D22KpIldA8zq19fUvhCC46jFajQkjpYQmRUxLHeXPtgBfNyZno/38bBgeEZZgmWEfqX78+9AU9x
	7isQ0+Fy3kmeboJ6YgNYreC0bGC6MoF+Y57BvP2+RKRGwmwLmu+KQoL1sSy+NMagJ7h0M8EwQZT
	1HbKLh0+tqf99nXmCj8ItjH/Bh9oFn3Nkedjc5rhVkQN8Dw5faRVyVmvk1yRGyuAesLbx5LmivR
	mdw7hZgkDsUfudi6Cb28IWQIlCBXZ9fCjsx+oiOAPYUB1Kyf4UJRV5SxGGi3zzJ6ZuYjw/GQilj
	iq1qgF0QnnqkJOZYHCc9B7Sc6q3kbwzvc+dhCKUNDEMbWRss/r9vtXrZb2sa7NoVfpYmyAd37gv
	ypSWhikYv+KXV00qIaMho2riRL581TIg8GJcmBITaCTyMTjomN1OjIEENnfMjWr8iY3MycKBXOS
	7pAf6tjJ26jylbvxH7sMUQ/5mszZx77g2GX/VYgXEwaJRGduQIH8d3bMdLp8sQjiG6pxaQr2uk9
	rKn9VL1oEb0LwpFvxWCCT4ZRv8uCqfFPIG0GDY8XEUbs/2rP
X-Received: by 2002:a17:902:db0f:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2eb364ec8d2mr180212465ad.45.1793860936395;
        Wed, 04 Nov 2026 22:42:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm13702925ad.21.2026.11.04.22.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:42:16 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: coda: fix out-of-bounds read when parsing H.264 SPS profile
Date: Thu,  5 Nov 2026 15:41:55 +0900
Message-ID: <20261105064155.1342011-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

coda_sps_parse_profile() scans the compressed OUTPUT-plane buffer
supplied by userspace via VIDIOC_QBUF for an SPS NAL unit and then reads
the profile_idc (buf[0]) and level_idc (buf[2]) that follow the NAL unit
header byte. Neither the NAL scanning helper nor the final dereferences
are bounded against the end of the payload:

  - coda_find_nal_header() dereferences *buf++ before checking buf
    against end, so it reads one byte past the payload when it is
    entered with buf == end (e.g. a zero-length or start-code-terminated
    buffer).

  - after the SPS NAL unit header byte is consumed, buf may point at or
    near the end of the payload, yet buf[0] and buf[2] are read with no
    check that three bytes are actually available, reading up to three
    bytes past the end of the payload (and past the allocation when
    bytesused == plane size).

A local user with access to /dev/videoN can trigger this by queueing a
crafted H.264 bitstream buffer ending right after an SPS start code and
NAL header byte, resulting in an out-of-bounds read (KASAN splat /
possible crash).

Rewrite coda_find_nal_header() to bound-check before each read, reject a
header found with no following byte, and verify that profile_idc and
level_idc are inside the payload before dereferencing them.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-h264.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/drivers/media/platform/chips-media/coda/coda-h264.c
--- a/drivers/media/platform/chips-media/coda/coda-h264.c
+++ b/drivers/media/platform/chips-media/coda/coda-h264.c
@@ -19,13 +19,13 @@
 {
 	u32 val = 0xffffffff;

-	do {
+	while (buf < end) {
 		val = val << 8 | *buf++;
-		if (buf >= end)
-			return NULL;
-	} while (val != 0x00000001);
+		if (val == 0x00000001)
+			return buf;
+	}

-	return buf;
+	return NULL;
 }

 int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb)
@@ -36,10 +36,17 @@
 	/* Find SPS header */
 	do {
 		buf = coda_find_nal_header(buf, end);
-		if (!buf)
+		if (!buf || buf >= end)
 			return -EINVAL;
 	} while ((*buf++ & 0x1f) != 0x7);

+	/*
+	 * profile_idc (buf[0]) and level_idc (buf[2]) must lie within the
+	 * payload before they can be dereferenced.
+	 */
+	if (end - buf < 3)
+		return -EINVAL;
+
 	ctx->params.h264_profile_idc = buf[0];
 	ctx->params.h264_level_idc = buf[2];

--
2.43.0

Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E83F6C48
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944631; cv=none; b=JuILM0Xdb5T/koosf0kvCGi1z76KJQAvwO8TV3aH3Dl4BhVn5rtQfiiLrv1gcBX3gzjSK59vj8KuGUwFNvkggKULKt0nIK7o6Grpai1p8kzI3p5ExNvyG8D1klPLQZKyDSsXJ3gmjl0vWtJDZ1tpqPOxgkRAc1qNuEgujnWaar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944631; c=relaxed/simple;
	bh=0h03bQuoUWZdGVlD74sLbbLEbbwu1nwFtUhUFitPw/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9EO7q1oDabpYIKZ3/YvpZV1xwSyM47vwE7EOJdQtzbrv0lmxbizIZWzkonLmGNURZvzMwDjvFLVVQ/ujql5ig1H7Tcl8Cfn/+ETCkhRwiWoJgwUds+grJFlPQtjYvuMnuFvSduJm5xz6KjKnfGya4PSaMqMjMvy4tX7AE7KoIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJ1LasK/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJ1LasK/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso3049424b3a.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944629; x=1784549429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=RJ1LasK/DTuF1p/UF3urIJndOGbDEVv5ZPn4dlKLyvw71FHMTl4uB/L+U5DCN+dq1I
         TKja2d0O/hLpfBLD+3IgmLUDERmyHqADQe2G0kXpOlmAqyXm5VpZDznqNlO1jDDqFJ9a
         K58VtCmJ8LFQZMa1RBlPOhkAxcPnU8Fy8vv2qBXstO59JVWgH+3yBNqW8/vCnPAzYSIM
         4UeJKowln+jZlJTGbONVSVXJ7nR8Mpw/CRGiqAIeNJNiorQZxCiEVeb6I7T+Lq6v5/vL
         hnTfRqTYgQSnU7du/uPMeH0pbm7NanZY0F7Ioa2LLeZzwpceYWPb/3Qlbm3OUPcNH948
         XgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944629; x=1784549429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0g+WRe3x8NF1Lsmp6BpHJTM0uwdyJj9zKy0hm9x5WoY=;
        b=TgK7JIFCivG63Ad0jyWGLpXrRqxxdDE5UzM1dAyF2Me9EYXHOWlwM1vCZP4HbT3/gB
         DSZ5Aof1V0CvTHhF4jhpV6AfFT392U8HRyVxw50o+TyXs17tOWazQBLPpd/ZHbFOlyeU
         xeradnOqGnVelpdygOR4eLdkgeCmYIbiXaKurX0RGr1CZHXn+PvReHAN7yLnh0qB8QtT
         TUy6+uRu7GundKMaifP8ELpumIZmJp6lfQgotHYlKo48sWVvMLeM88iCPrUgMzKQzknE
         ivR4HlS4iqsvbTwGBKxwLa5l5m3l/L1lBeL2rEBJZys5FuHWRNyZCbJ7l/7o25SDcOkm
         Q3dA==
X-Forwarded-Encrypted: i=1; AHgh+RogWx7dCcdzIqQDsashbU4Ru763oK7UkpiphDE+Lm0wt/RJtPbfSVahRYIB/0q5TRdA3GkyUQISuoKOZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5F9avl8nXyLf/927v7mUmcDxbEaPOt1Va/NfpkIz9OOfUDCf
	hg3qPAavygGR6gyWNzypWDB6LiLq0vMybos4hbH7GremBz4Rb6VfUvo1LAGghw==
X-Gm-Gg: AfdE7clnGC8eI7WnUgTcPZwICM2vAAyxCQP472OGrTZ3KiHSoMDTOgK8O266hU6m2/J
	Y7q18cCivv2DSMKc1eEF2OJGjNVGyzw1hu9LiynPPQD6gMSYI61BzsZHLPExppzSDmYrS3pyn/A
	fwB51ELwuKC26RpKQPLtfIf8EL+fj6ZQNBNZbcBsTH2tS4qFKGiJMV/ggCjParQ6AmOi199v6PX
	aHvdbers7gEXOWkTk0XzqIVKUpRVcDXERz/a02t9CcZeS2vscUUcbBWoWQYUyFg19l1LArofGlb
	tFFEQDVtgrk2s/RpOe2ZfosNF/WLptFtfGv1qhrpaKW3YKSkFP/fs3+LYoVtlTXGJATeBwYJQbj
	hEBDGFoiRUeL4PmJr2s2bsGLNCu/BZZ8EyQajv4gi3Ibx+XkAJ07hFABtky2yFtWvalj0RUTcst
	/YCeVi87Rd1WHZ1aF/AhfB
X-Received: by 2002:a05:6a21:6088:b0:3bf:9fc0:f6c2 with SMTP id adf61e73a8af0-3c1109ec872mr8713076637.11.1783944629120;
        Mon, 13 Jul 2026 05:10:29 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:28 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 09/19] media: meson: vdec: Fix vp9 header update failure on invalid payloads
Date: Mon, 13 Jul 2026 17:37:04 +0530
Message-ID: <20260713120840.17427-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure vp9_update_header() returns an explicit error code on invalid or
malformed buffer payloads instead of silently returning zero.

When v4l2-compliance injects short, empty, or uninitialized test buffers,
the validation logic catches the out-of-bounds size anomalies, but
returning 0 tricks the calling esparser infrastructure into treating
it as a successful 0-byte header conversion. This causes the hardware
decoder engine to stall out, resulting in subsequent stream-on timeouts
and failure marks inside v4l2-test-buffers.cpp.

Fix this by returning -EINVAL across all validation and bounds check
failures to force immediate core framework buffer drops. Additionally,
tighten array pointer checks, secure the mag_ptr bounds loop, and
convert the superframe parsing indexer into an explicit if/else block
for readability.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 959673742e699..edbfc829e2da8 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -97,11 +97,15 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 	unsigned char *old_header = NULL;
 
 	dp = (uint8_t *)vb2_plane_vaddr(buf, 0);
+	if (!dp)
+		return -EINVAL;
+
 	dsize = vb2_get_plane_payload(buf, 0);
 
-	if (dsize == vb2_plane_size(buf, 0)) {
-		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+	if (dsize <= 0 || dsize > vb2_plane_size(buf, 0)) {
+		dev_warn(core->dev, "%s: invalid payload size %d\n",
+			 __func__, dsize);
+		return -EINVAL;
 	}
 
 	marker = dp[dsize - 1];
@@ -109,13 +113,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 		num_frames = (marker & 0x7) + 1;
 		mag = ((marker >> 3) & 0x3) + 1;
 		mag_ptr = dsize - mag * num_frames - 2;
-		if (dp[mag_ptr] != marker)
-			return 0;
+		if (mag_ptr < 0 || dp[mag_ptr] != marker)
+			return -EINVAL;
 
 		mag_ptr++;
 		for (cur_frame = 0; cur_frame < num_frames; cur_frame++) {
 			frame_size[cur_frame] = 0;
 			for (cur_mag = 0; cur_mag < mag; cur_mag++) {
+				if (mag_ptr >= dsize)
+					return -EINVAL;
+
 				frame_size[cur_frame] |=
 					(dp[mag_ptr] << (cur_mag * 8));
 				mag_ptr++;
@@ -140,7 +147,7 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
 
 	if (new_frame_size >= vb2_plane_size(buf, 0)) {
 		dev_warn(core->dev, "%s: unable to update header\n", __func__);
-		return 0;
+		return -ENOMEM;
 	}
 
 	for (cur_frame = num_frames - 1; cur_frame >= 0; cur_frame--) {
-- 
2.50.1


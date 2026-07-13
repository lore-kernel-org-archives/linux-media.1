Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A64071E0
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944600; cv=none; b=KMrMdX0rUF73VtBbmp4Zuwn8PJ5jm3SAm9turrqw/i5CZarvFaQpEsx22yhM70GlCpbIgulED8NV3UzLJU7sNvbaOnGeI2XCWS3CM8OgkD0p2ig1P3Sfb/ZMYBEHDv9Fd55mEEKriKN7sSpjzy8pH7VAt/ocvuOCz7ZaZTPJryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944600; c=relaxed/simple;
	bh=kWjWrkYR+dFbDvQ8L5AHa4OLzTj4rBUUdqyRkjtvM1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlAFf/IeLAcr+f7/bmhJVAwjaZRFVdd82aZ+F187FIc5KUL8DwGMWZPQIwdtG84YvWO3PpDr/dcgMlSlvy1Az+BQcudsS7FqNY7py/0ZyUy9mYpIOsV4pCZ6+aPiiL1wsysnFXDkr+D1BxapavCD9N8DykMv3E4QvHFq2lEY/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWKbG7TL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWKbG7TL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381216921aaso3397248a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944597; x=1784549397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=BWKbG7TLfQhde5neCAajbjpbN9iHaGDot8+s5eak4xHWDOQTmc9xPMCOSDd4YWiPe0
         TXn7+f6OOX1R/jqy5RVEwHq9+Q+kJhFbnFa/T3+XIPjjzpHD5Er60EY8iisKgS+R+v8f
         VZwU+p89UfvL/CPm19hS/BF7aJ90uiebr8EtxpcSMnEHWKk15rWTE4E8Sb0Ge79fHCxC
         /rGxbaNTormuaOgNE93sS3KoBUNe7ZMtNPQtyZzWLyHysq29RXblQGl44mDDe0VOJCjS
         sZNrkYG5oLRlTwmgmqU/InQPpoRYbA9+ACKuTqr8sjz4KknOGR+9ZteSA+ZLhRjjVI6X
         63ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944597; x=1784549397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=b1N0VO0lOXcWooHO0aW/hYGIMhequmOkHeFKxg+377mWrx13nxQ5quZPsZD0Uhij8q
         o2KBorX68eE/8OCk8mBhhXEig6VDDUwMLxPJh+jMXaou4sGsiEzTcr8nzMXS44X3eMKH
         /xFZ6x9wFqj2f6Bw1yILdpN2/7mIh3Od4cBjpz5FWWT0TBVqbKJGU9CsKByEqU6pz3R+
         CQCxUgHTqGQMGciuuLCE/prhGV0ASmMJ4yTfydtwMswW/92Nta4YkeOsV1MQ/SC4BejY
         H/0TXh7zHbRMQyqlQk4Wm9tP3MhXdQjzwfEdFJnvYD+FgmFMiKG/1YfUrvppVCDEFhlq
         2b/g==
X-Forwarded-Encrypted: i=1; AHgh+RompvxCsLlkSMN5aZ+bM5JZ0N64lq1dud+e2BBlIxcqz0Eop1OGjdgTE8qvfWw2rdZk9fw0F7XYlXFceA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mF7dDeht82SSR5OUVtdouwBjoaaVfX3JR6GVukNAzQjI5Ldd
	MzvLotusR0giipE/ZOn1vcqdfg5KbzZHw1IUDne2ogfI+FoBKOrTN1MJ
X-Gm-Gg: AfdE7cmAg4bC575CMGYF6+OLO3RHmJiY214oRtVr1yghw07FWb9tgNbU1l3RTA1Nk9e
	m2lrHs/Zd/xkaXghBi5Qf3BaWuTuObnXBnFOy6Nvv5di+J1RmDzHAiDIMtk6s4q5wAr7r4MYU10
	FQhqst5mJjH9b53/5j3amIthAmZtYPFR0oejyOtWxVHNiSUzk+/petn1A/2R+JTXnU747f+xr3U
	Ta6A5A5Y1e3GW8dRvWf8+HvyudOYVzZPaJuNfcju4UNPel+lebgak5BPtIHPxPLStViWu0geNd6
	LUcL+KB16AMjLg7aK0y+NTR7bqWwRXarbixdfdDVu6tRZPPaAsuievtPIM128d8REJgsm2N+xJM
	y8NDdgXaRnmYchb5R4sRS8LHqdvVZqe17kLTPcdCSmDr4vW8iMLdyEUhuPtlHmuaLwVSLVEpEJX
	OewoD3ECn1eQ==
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8263084a91.32.1783944596948;
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
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
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 06/19] media: meson: vdec: Fix race condition by canceling work sync
Date: Mon, 13 Jul 2026 17:37:01 +0530
Message-ID: <20260713120840.17427-7-linux.amoon@gmail.com>
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

Synchronize work-queue states cleanly during streaming teardown and
close operations to eliminate asynchronous pipeline race conditions.

The esparser ISR can schedule work onto 'esparser_queue_work'. While
synchronize_irq() ensures the ISR itself finishes executing, it does
not prevent any already scheduled work items from running concurrently
during driver teardown. This causes a race condition during stream
stopping or file closing.

Remove the scheduling of esparser queue work during destination buffer
completion, as freeing the vififo is handled elsewhere. Add synchronous
cancellation of any pending work in vdec_stop_streaming and vdec_close
before synchronizing interrupts to prevent use-after-free and race
conditions.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7689ffdb2e500..6fe9722577179 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,11 +484,15 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		mutex_unlock(&core->lock);
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
 		/* Ensure esparser ISR finishes executing */
 		synchronize_irq(core->esparser_irq);
 
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&core->lock);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -999,6 +1003,8 @@ static int vdec_close(struct file *file)
 	/* Ensure esparser ISR finishes executing */
 	synchronize_irq(core->esparser_irq);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
-- 
2.50.1


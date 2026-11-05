Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917451;
	b=dO2E4+bez5EnJ62vOfnShbxvUCwEVroSwPQuRuGWgSKB8qgn/WL/sOKiCsWvHt6ily0o
	 Y4/FVbjWmBWMsuEix2BjlK+OlpzBap/ogtU+LmLViPVssnGK70wNF7ZASTD8KG354yqes
	 gaXvQT+9W3g2u2IvW2rcRF9CMosgx57zTDM4bFxbnoUTCyYIYCfBtQGjlUPM8mE67XHdN
	 epov5lsbSuQteEEtmCb/e3fFWLQKTcRkB7NMx2uO0RdW5Tr3UgakjkgQFXAZJuxOytKgj
	 43MeF5uprU+OGzgavkvhDGjzc6z8eSnFUhkphLU2d9Q2f353CrO/tlslBwjwjv9iGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
	b=GGKBEUdIXkw1HjsA1/8T8771zwRoZSD5rlCf5ojt3fnQimzukwomMSZxkOg3P0yw7ve+
	 hdxs8vBw1Dt86atnxRE43NNPjBmntCcaj2L4OAuPTmWks5Lo8iTIso+/nb5KlpvP0Wc0J
	 dd4VpPnmWbvL2F43krojw3jdg5slbgQ/R3FmBOULFwu/VURGqFeMtpErndCHIE/jSgKT6
	 xdSS0E3okWfc3owXIxdB+HPaMqVQ/hJBe5P18iP0oOvkXEMGvg1uS4IWUb7KJbeqegZRs
	 +YPaq5XND3IGtER+OVZdvYyLKohNU12u4zdPur3r3ubP69DSa3HyK6qM4KlThbLBOqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF1liiZB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30F3606A328
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 22:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30F3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF1liiZB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso171485e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 14:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917448; x=1794522248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
        b=tF1liiZBOTcu/CwdREzojs+UHgrpf+bseo5Ggz41KbYGVUEY+3DFe+j/vfIoi4CJ6M
         NReoAYMO6vE7wom1/pj+31MYthiEPXuaHp6/IJw2Me7wQt7LBU80i6qEOf/NTwYNb8RD
         Ve3JE5CpQ/zhdLlITH0k38XtlOP77zvU0ty95g8pyKvDkZYzD8DrirS2CJ3EoczmD3wu
         M31nj0ybZx/Gb6aF2EBAfBitQbgsNqawtY/6ZbFfC7PuWDvfGrkjDdTWcd4ZbwVRUXuJ
         KrtUhnItb4U4Zz1+p597cylY1TK3RYgb9itabU1tmk1Zr+zNnSiG+xQnvsUkbfXDBQXD
         cJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917448; x=1794522248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
        b=nTfJVwquUs7uLidbn5u0FlFsBZmsVDuR11MHtVSR5MfJkY5nJeUGpxjS10QX3SbRJU
         U0DGxZ58fOKtnfql4fuwWnej3kqX1O7fAyK6z/aeetawia+ILTF/fOfi/Q1nvxFMZ8n4
         WZScKBY8hhyJOHU/yg0v232xCk3QkuDrEhXfoIUfVgjNTy0a/++5/tuIBd/9gLu9wHv3
         VIjS0oWjvIsmXc1bB06VMIkn0lWjtlJxm0q+ZDTpucCQanhb6KadZR5ETS16kXlut78i
         9MSHbNBFPUFT2L5oKK5GtgQwO4Yxbvb/5frXIsGAaV62N8HFqayNt8tHGuDCZ9YFpjf+
         t9zA==
X-Forwarded-Encrypted: i=1; AKwUvBwyxsz5Rug0zGo1SVgTcBsXTv9POGtXQ8TInCZYKOdanFPmtqk0J7bQF8uHlcLmXrfDvY3m6nLvr4adQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HNoKNcAaYUsEnuHgJkB0EXbspaCaYFjlwiNvpDLviBnkUrHiT
	VohD6PsQAo34UbVakGWpzDBeXNWI1oGgOENPF7zcA3BGbJ+BIWOptkQ3
X-Gm-Gg: AYBFou279zfPUcesUMk+4/sZmeUWRZLQd0INGKbl6NPwRHBYExIvQtoJUVv/PMemtlv
	B1cUDkqs/62OXBC4DOS1DzVALHhRbl0ufK6TT8rfnlDe4eKIkjEfb24mPwJOB7cPFdrCD2EFDOI
	JVj4wxJbC+28/+Cr2Zk3hu36ybUU3AbrR+g+aXY3FGPxGimpNeND+XzhHjMtHB7HHyQsSQ2hY42
	mSTAWEtKVdbmUV2xyg8oZVoUwOBolA//qEWX/aPBLtUl4s+M75LMVh4B+zoh/GsDmgzUkin/ImJ
	JL72slpdE0Sb44L17s3hcT1qBGEfQtBGERM04Z+n4MZ9EhTEMFdcyN1k5XQjkuoMIg/sWQWZ+ZX
	UTFpgDmRoZhcYo0YxTwz81RaoR+a/11gM7jCLPdNru4GKLPw8jFqc6SVf9ArMfsZuH/ibF4X3YN
	POCUGiVFNk+ddoSgg1/NIEedu0pXmybPfU0eF5QCrkn65BDWTLsKVw1Dh/gytTh2JdkDFbhnAxh
	C8icPdF4cQ6bFOgZofSH4ZgX8m6xjX6gFwZUEZKw2sql6uYnb63ZAtdCc4/htRiC4USM8Sx++zP
	WzLHthAMr17zlTINvAT8OSMwz2062B6FPVu2HI123QbK02AU9ERcVMTuwTCOusXJBB/nhjjh1A2
	o8q9u7OHNFH1kag==
X-Received: by 2002:a05:600c:608a:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4b6d82b2c9cmr8760265e9.0.1793917448067;
        Thu, 05 Nov 2026 14:24:08 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm27407f8f.20.2026.11.05.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:06 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	dan.scally@ideasonboard.com
Cc: nayden.kanchev@arm.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linusw@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Require an enabled link to start a video node
Date: Thu,  5 Nov 2026 22:23:31 +0000
Message-ID: <20261105222403.186948-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mali_c55_pipeline_ready() skips queues whose link is disabled, but such
a queue can still start streaming on its own, as the video node pads
lack MEDIA_PAD_FL_MUST_CONNECT. Stopping it later sees a ready pipeline
and disables the ISP under the connected queues still capturing.

Mark the video node pads MUST_CONNECT so that starting a disconnected
node fails with -ENOLINK.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
---
Build tested only (W=1, checkpatch --strict clean). Not tested on
hardware, and no reproducer was run; the STREAMON/STREAMOFF sequence
on a disconnected stats node is from code reading.
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-params.c  | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index ff01553026fb..2dbce550d089 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -855,7 +855,7 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
 		goto err_destroy_mutex;
 	}
 
-	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
+	cap_dev->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
 	if (ret)
 		goto err_destroy_mutex;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488e..0888dc4a340e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -1014,7 +1014,7 @@ int mali_c55_register_params(struct mali_c55 *mali_c55)
 	INIT_LIST_HEAD(&params->buffers.queue);
 	spin_lock_init(&params->buffers.lock);
 
-	params->pad.flags = MEDIA_PAD_FL_SOURCE;
+	params->pad.flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
 	if (ret)
 		goto err_destroy_mutex;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index a9c28b090b2a..a9172781925c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -275,7 +275,7 @@ int mali_c55_register_stats(struct mali_c55 *mali_c55)
 	INIT_LIST_HEAD(&stats->buffers.queue);
 	spin_lock_init(&stats->buffers.lock);
 
-	stats->pad.flags = MEDIA_PAD_FL_SINK;
+	stats->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
 	if (ret)
 		goto err_destroy_mutex;
-- 
2.55.0


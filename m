Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920591;
	b=jj2puTdh0ylxTDh9zeCAFTbe6Ax26J8xEENa3ipSAEzrLcfnpmPBEHaALjxPs2p2oxAD
	 hkPASDphTRo6OD5HvH4aJMKaq8e82AIIKhC8C7epjBSFLlZS+uXhFezA8o79UUoO+N3Uf
	 a6vxclz/Jpw17HJCeFnIEJMCDiY013SWKTGB/rrFUXaIJ/2JGy2TXM2APUvFgpKTugu1j
	 unHpFJo8peRwNDSP8FrJOuF2h/NhXZPj+dmLVEK/dH4v0WVCyyw1106bHj0OJpBSAACB0
	 Iqc1iDzmwUjxILWPPTz0supF8rhwTEA4nVD1VJee3IhdVCuPRgfjP6Fu9qNax9Om1ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
	b=VE7lfn6ASnJeZAb6QYFvgtEejM4MvE30t0jV7BZvP75WUkA7dBVfqx1tJQlcTW6kEVPy
	 P4fZl6oUG562NKnpP7ZrpMrUoidSxWi0uPDJYnQkreP1pRQMxWfIMHozW/AlAPHBrQ14I
	 nqWX+J2/17UTy82K+ysmwb9ZqLUJw3SH92oMPq7PEOOJ4ssCiKcpOWrPLxmJzBCJUeE2L
	 1gT8uck4mY66CbgOzPWSlvvHk7CRrqZaSO16roAe3TecyAaVT2CVUP6EdZsQnhcqpz+N6
	 ga2SBhEWmwYLMPZreNr/YK8UAnBNDdL07mGgGzPDPomCdv7uM3sGM+P8etlleFPzzeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4VJzlrs;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D7606A328
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8D7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4VJzlrs
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so551315e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793920590; x=1794525390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
        b=s4VJzlrsSrvhPA/OLDwHmfM65D8hpBx2G4WNsRKMxZ+ZY820YJI1Z32gaxweC6e8IU
         X68dtLL2dLclHFTTfap514rxVB6ftpIMGLLmCj9LuSGqL5fxpWOaVCFhWTzKeFdXT9fC
         j4jxggOlfBbuoaob57s9Qejz/kaEnDdGfSxb/ug2WKLfg9ttXMFQ3hhituCXeHT3k87Z
         hna3yQLk5H4A1fVEAbCyoJbh9nEdFc/m2pRbJtxi7b1C68u+Vk1dBlBzsDsb+shJDNJx
         vROOKbncRp1L+RMVcJDaje+aYufY/CXrbT5q4eotN0ZMteOcY/NV2qc1sLfN8IGXs/jG
         Tv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920590; x=1794525390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
        b=JsgGc/a+PwyRLR6z+xcwvLWx0oCM/4ql+fa7qkZxZ3KzfTrSFBVj5qnPT4WKvnG6pB
         CSINoAYRp3DCEEjyZFNcXurt/1mUXt2plb1SafygV2WM/9dMawOmmdAgDQKcHZaA6veY
         VUdnT476rworVw6SLT/9MuhuRJLnb7KofeWTcGi+kZ8bc3NiKrf6QexWyU275fNuPkgi
         xZadQkCnnLIL9Z/0Kx/F28aVgu9w4QS9iB9WhzPaR13ojUD4RIeWFBqTnsPyRxc6W/Ow
         YiGfGKhmLK5KprvftTBm03GB4G/Z4A6ilhCt9omvL7YYCMgMWBQFyBzaNhLoVyoCdjii
         scBA==
X-Forwarded-Encrypted: i=1; AKwUvBxVydzzaYI0nWBFYn0IO0VIQfuV0WL4mv3rmOxPpTR8S6JFiipkLSjtPWAifrjM0pZBbRO9d99+oP9bfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BO4kELz8aqIQVWpQkgmDV+e5/KdulXMtnJONeTX6cGKoKE+/u
	hX6omZfOqQvtOtXpHvrbcx52IGWq/HEdIgmt110udB6evGbBInouvFMO
X-Gm-Gg: AYBFou1e9CeVoSXnebl50WDajvdRBBF78YwNxkMMOscmXypZafEQL/TD7vbg0iVdzQV
	TZ1zAKrKJmsoFKsHRPyXg62UjglYLAhM2OTJWd1FT0PsPI9m7/olXIJhL68lnzt9YnP0tVXeqQg
	ny9Ga4NjV7SKyXoN0age76Sn5rv656S2QDdJ9yFvuuV2SgyHmJDrS6/77LyAZVud6fUllNiPSSF
	/MKPp5tbttsGudRpBgbTox/FmeDvBwhmkWOcw3kxH45hCaQmJ1g8RALtbNSpe3w/vDlDgwSmr3u
	QvJ5SVEopMCJG76nu+lJebHE7uNsDYh0kyGNM+LVpKtj04RZPkKbGSZcY3xz/jVPCyeEnosUL1y
	+SQ9wiogPF51Tu4ghiZ9LWvI0QEceIlZ7OnvS8TpHYgDnj/vvQUjkA2HSJrnvy0IoR6dukiOv/I
	D1UlMesQq+GikWoqTjzLPlOvv4b7ySyrcs9KwZyHEsaSjpkBqL5MLCE6Fxtehku8pcMT/2mmmPC
	ZqULhgxQ4eavp174LxiqmmKbbkVmAeynjDntQVgA0ejbjtIcUY/9WJ7nUgAEIRvGLKTvca9U970
	H1A+oCzI2zW+4Ya0aWNtMkyRldY7APf49FSE2mQDxnBJSLonuv6vqRhpufhZO1hnIPTSpPD/T9a
	jPqIvI1qvJbr2nLXlKetEnLwt7dua/cmul/I=
X-Received: by 2002:a05:600d:82f2:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4b6df3fd27dmr10978655e9.14.1793920589397;
        Thu, 05 Nov 2026 15:16:29 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e24012c3sm10754385e9.13.2026.11.05.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:16:28 -0800 (PST)
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
Subject: [PATCH v2] media: mali-c55: Require an enabled link to start a video node
Date: Thu,  5 Nov 2026 23:15:59 +0000
Message-ID: <20261105231626.7152-1-devnexen@gmail.com>
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
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- Add missing Signed-off-by.
- Cc stable, as d5f281f3dd29 is in the stable tree.

Build tested only (W=1, checkpatch --strict clean). Not tested on
hardware; the disconnected-node STREAMON/STREAMOFF sequence is from
code reading.
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


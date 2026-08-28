Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469EA3C2782
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894947; cv=none; b=PpV9DmN8ZpOmb0UjO1Nijrj+L0CixNpCaPEa7l5rFGfnnfeCBz8dlLaBuyYoaFM2ocJ8IBmttF7jJe7e6gcWDERYqllvQ4zfWV4kuMwx23njawIw/8Yp0nly3VNvz2449vqwuyZVHbqGhtwkQZEecH3yQoSDtH7rK2WyZNebOeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894947; c=relaxed/simple;
	bh=wKKtsaBghx9mUO9q+l+PL9vL/BhJSMvjpEJOAIYYSZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OwPqkKBt6Y40m1flbWif+zIsi2JJYrTJAm9oDBbWb3tV2P8pKJcdwvAd17KqP1IEH2DCPCHfwojQDaCR8YIyRUpGmSynJdnT15Ajgf8IPqTUfa3Ev1iSI4DI+/OcRIFMvYVf3rU6PBITTudVsaK+9RTJkWkp3XtVUHdWUwS/nZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvK4Nt6J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvK4Nt6J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d712281f8bso7329195ad.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894945; x=1788499745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vShHEoFxeJdHMF1BmMYjqhuL+4mZo5/13uAzSfeknUQ=;
        b=GvK4Nt6J1MXsURKTrH/4CvS2YEa51CZLkv66FPIrBXV0udvDK25c6KhVScTMebca7B
         oX2By5E914t345OCz55OVpTaJWrAg7G7lhHdIIp88OVSqMSBljnlaS8Y2s81LbrmYj42
         js3Pe5DFbR0XvAYT1Pu8ig7Jz7ordLJYD0vsJ/8vW8PqxmFSQ3j5kRg37lYLlF0wdh0x
         JASHoQipeg3ihcACM20RZ4qIZ9E9g+Ifi+tpjWcoFJm/W+iawhnnQz8UkGy7LOFWlm9B
         dXPNqfQwfW1Aw6duvrlfoFpHilEp925Jl+peaCDOr++R4BnH2CqLLNMp1f3Y5ynzt6JL
         pjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894945; x=1788499745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vShHEoFxeJdHMF1BmMYjqhuL+4mZo5/13uAzSfeknUQ=;
        b=hIzUra7enzqL3t1EW7AgYki0E2Tx4ug2CX6epn+Y74aOGIC1nEUrH+WY8+/Qm+qzLq
         CSq6ohZkSdxrBmaltvX8IYfChJYzxWPMuWwwtm4oFKLT0X7qAjWsNueKGY6v8UYQxKqB
         BPlP44r9qkChT2OJQgVjX/vB+WQCUjHEWpeCMlRAN76T7ICYIrFZz22y7psrdPbN6ktV
         hW7Eyuvl5g2TZXGlPUpoUVYPgFiDu6CM94abDpangP3W9I6D8OsEu5a3+xmHRKdlDCiL
         jlsEAH6woQMVtgYcdTlLRJ78CBIldt5a33GtEKFfOgo6vnI5XA1jpDcpRR6hfmdLOX8x
         fZYg==
X-Gm-Message-State: AFuF++kXnM6QwgIMIvFCbMyhqltcXsa6ETgwN6y2hCox7vlZXYq/cj2l
	x8K26uVYGUmDtybQuhzZ3xFJqHxGYnjc/mOy7y9G5pJBre3/Mqrctjd+
X-Gm-Gg: AR+sD11/Ss7KimTCQbbmHzgCkHYnFMM6j9diCTDizmkVk6vFai4LLl/5mbbS0Qn9aMd
	cJGx+FEhJWk5AWoQkHa90MGw9Gb8o6eh8yWMlnSDqUjbt8hkCWUBtjEE4ps4/BE/8TiW9Eds8BJ
	vb4cV2nJ5c/InPPLFL3ArPsvWQoLgxjK4YA0H4jJkmM9FVQxiVV/slex3nINZjz0btveJ6i+BmX
	8YYNS0RS8GV4Et5Xl6IapcsNBFWi+NeMGbZxwDfTrXXMIYx+kRri4Z+fXDfUpPfDMWCBs+2sdHA
	+nRzQYr11RCdtWST/nBL5BRcL5UrNaU2xI8ciAKQpI0Wr0V9pBFBRlSp8fi1sorvGo21lgOvI3z
	Ph3b+Xm0m9+cG63Jnq5tNfZtWSF3qKMzJcoAmp/DwmdppRDo90olPbjMbVYnYk5JzniWQmIOYZq
	N1KiFvqoh9QBPSe7+V9kyEw69JqYc+IDY0lm+QA4a0z5ibv/ejB1ShlD9wYl3+N38HNVBYzFHNF
	pIUG0mqqx6fczWISUDl9/oFNSKof0/M5PneQAl/a+DDmd+pawKP3Q==
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-396d0eab08bmr8717768a91.6.1787894945457;
        Thu, 27 Aug 2026 22:29:05 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm1058007a91.5.2026.08.27.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:29:05 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH] media: dvb-core: synchronize section timer on feed stop
Date: Fri, 28 Aug 2026 14:28:52 +0900
Message-ID: <20260828052852.1975097-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section filter timeout callback dereferences its dmxdev_filter and
parent dmxdev. dvb_dmxdev_feed_stop() currently uses timer_delete(),
which can return while the callback is already running.

The close path can then release filter-owned resources and allow device
teardown to vfree the filter array while the callback is still executing,
resulting in a use-after-free.

Use timer_delete_sync() at the common section-feed stop boundary. This
waits for an active callback before teardown continues while preserving
timer reuse across DMX_STOP and later filter restarts.

Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6a825d9bae43..0f5a35bf062d 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -486,7 +486,7 @@ static int dvb_dmxdev_feed_stop(struct dmxdev_filter *dmxdevfilter)
 
 	switch (dmxdevfilter->type) {
 	case DMXDEV_TYPE_SEC:
-		timer_delete(&dmxdevfilter->timer);
+		timer_delete_sync(&dmxdevfilter->timer);
 		dmxdevfilter->feed.sec->stop_filtering(dmxdevfilter->feed.sec);
 		break;
 	case DMXDEV_TYPE_PES:
-- 
2.53.0


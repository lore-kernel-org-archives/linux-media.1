Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEE1E2834
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786201733; cv=none; b=EcNNEBYOqUt5zRwWCA8FAWaHCAbgmFGR0f6RTWMomjqcMBqQMTc8fva6UEdQXzYcCniw+y8CEatcidmgtjm0akjMxTwdLKrDTfzeopK2tzMeK1EG4qkZOqTGwjD1dyNJ3LMypRDCdMG1TeJkZIjHQUFpFt7nj+NXvU52iWMAuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786201733; c=relaxed/simple;
	bh=B///jw+Sio/CEZUlXYcAgc4i5QJz1XbwZfwYvidho5M=;
	h=Message-ID:Date:To:Cc:MIME-Version:Content-Type:From:Subject; b=EbdGIp5ir+vVLKkuiBXryHq0gXk9iiq0D15OkCAesFsqWkC6MxweVHhPMzt09ydiaXWEuwr/d+RhzQZMJi918Y4NUE0Ly4qMJapbYFMeAE2UR9gpuSAdZIt+O2/jMn36Gb6FhgjS9W4gnGXr8eBlcwdzTf01XKQlTda0KJXypD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+JLkQGQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+JLkQGQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so7701765ad.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786201731; x=1786806531; darn=vger.kernel.org;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrJoFcJRcNN7a4wuSEk0P7pO/7NYaaMRF1MmKxQ8zlc=;
        b=P+JLkQGQr4uuxspxmF+T2aP6d9oHVIoZ1iHd3QAZLjCYgT3ZY/DvaZ4mJRpGZJTjtw
         Ai0DP6fXGcrQmS9ic0l4I7tkLmlPtSKZe+7s3AdAe1rH5OsIUeYi7N9AdRDUL2IbIhNr
         UnvE9jYmHlMLJSSEUos0WWk83DKdxxx2nPvFHmRO+wznb6ea3g0FhevO7eOBdy90xZdk
         wK41RqhbHL4SwgQWXr202uduuV5gIP/0wFXFnB4DKE90D7DhxJLjEOipKZDXyCGJmwKE
         D3ak1JBKzsjb84QJat/ipLVB/S9t2UBPAGkAgxjAvrUR87qXQqQ6lW0Q1V4JLqyGj9U3
         zBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786201731; x=1786806531;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrJoFcJRcNN7a4wuSEk0P7pO/7NYaaMRF1MmKxQ8zlc=;
        b=GuABf1bzv/UwSPGUq77a+9Dd+iwmngEVbO8oKTf2c6wyO/ndEGCEsc5aXE0csXQLLw
         S+4ryybpbA4DyFD7OvBmwgDpWYQBOBj9kZVi+KWcMC7fIEmhvBBi6bYRdZEbfayP8Y23
         P81M58htoBG26qICDCk/M+HclZQ/mttblD3n2pmez6S6zUnaTzCcG88nE7e2sbPan7kE
         zFhIPKFZkGiDv40h6QTm0Jncgm+F6jXMw/Avo8DR4ZnIF6el5N9SAGUaZa5gxynivDLk
         ZvT69jjCbN8pFws/x4rylkFyXTyVv+JfrRatr/ljgFZwu3jlLtou0OjE6h2K322fLIdo
         S81A==
X-Forwarded-Encrypted: i=1; AHgh+RplR6yqjf8tKC6qh92xzxMiyN8q9A6aIsGlq9bjs5HgWZ1e/Damx5Ppbumlg4I/DbRhO4KSrvBUUAzdJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIlwyCUnDE04Ki7ZcZHZ2nY2VwZKWYYAgXDixM0U98z2aNNvxE
	QIYj3s/mrxRP7wb4U7Eui67OdProFPgMHnYGgyxdUNBEyIxM1uplyhaB
X-Gm-Gg: AR+sD11i2ztg0J5HINzQMeq/6loJLKNc+g9iG16ubjg7Im6MoCzfgXEohAZZaoGjbjt
	s0pLzgUYOIYzehi3MSgjXCzOqoG5JSf96ZtJxwLXCpIRLH9tRjJWgoFp60TmXLSYByCD+QTg6hc
	/8Zp8+FSxvESKwG60F3wSzCB4AhbuGNYOOB3yv3pGsiN0RMCKnJ661dXU38Sz3rwUfQztl96jB+
	QLfuW4ymXOC5JisAb8yUW5SniJEDR5I/+zDwIXf33gbDtoLUZ1EAYCisBN01dopWQJk78r2o4xo
	x/lLP4SoHPHkcd1wYha8ZaIaKyWg7dJgOku8V15GDlBTZKjIs6FMlXUGM6ubuS8w+L8xNkhQCMU
	uKxn/ULHFPKiplQqQsX8Jgpwk3ibHs8YZpdOy1nGUgEJ2ILo9cUd/2QS1sHdsvr9uJG8lIsSWQH
	otSwCEh5AVf7wd3ZF9yyVZFWxQeismi6Xz4J855iBA8ykvgyE0RTQvR20SYV3eNqszfyJBFfRzJ
	q+usOxDkXFVUG9QTBVVveEICesKeos=
X-Received: by 2002:a17:903:f90:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d294c225a1mr145556715ad.11.1786201730777;
        Sat, 08 Aug 2026 08:08:50 -0700 (PDT)
Received: from hws_send.eml (114-47-78-137.dynamic-ip.hinet.net. [114.47.78.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaad6sm19213225ad.51.2026.08.08.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 08:08:50 -0700 (PDT)
Message-ID: <20260808230846.12232.alvinhuang0603@gmail.com>
Date: Sat, 08 Aug 2026 23:08:46 +0800
To: Ben Hoff <hoff.benjamin.k@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] media: hws: Wait for IRQ handler before returning buffers

hws_stop_streaming() disables capture and then collects the active and
queued buffers straight away. Clearing cap_active and setting
stop_requested only stops a VDONE handler that has not checked them
yet; one already running on another CPU has passed those checks and
cannot be recalled.

That handler snapshots v->active into a local pointer and drops
irq_lock before it touches the buffer, so stop_streaming can run in
between. Without a next_prepared buffer both paths complete the same
buffer, and the second vb2_buffer_done() hits the WARN_ON for a buffer
that is no longer active. With a next_prepared buffer the snapshot is
the only remaining reference to the old active buffer, so
stop_streaming returns without it and vb2 reports "stop_streaming
operation is leaving buffer %u in active state" before completing it
with an error.

Either way the driver breaks the vb2 rule that stop_streaming has to
give back every buffer it owns before it returns.

Wait for the handler once the hardware is disabled and before the
buffers are collected. The live mode change and the channel cleanup
paths already do this around the same collect helper.

Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
Found by code inspection; I do not have an HWS card, so this is not
reproduced on hardware. What convinced me is the asymmetry inside the
driver itself: the live mode change path calls synchronize_irq() before
the same hws_video_collect_done_locked() helper, and hws_stop_streaming()
does not.

 drivers/media/pci/hws/hws_video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 18e4bc6901d3..7f7e51040926 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -1292,6 +1292,8 @@ static void hws_stop_streaming(struct vb2_queue *q)
 	WRITE_ONCE(v->stop_requested, true);
 
 	hws_enable_video_capture(v->parent, v->channel_index, false);
+	if (hws->irq >= 0)
+		synchronize_irq(hws->irq);
 
 	/* 2) Collect in-flight + queued under the IRQ lock */
 	spin_lock_irqsave(&v->irq_lock, flags);
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868326;
	b=I7hfkOOCt74qfI1/McY6j3+//RC8COX9lMBN9LnLxBrjTLXm4xKKoGWH/jYQEEyiMnoO
	 76NTlmczh73nv30ZiaVU1NUVheSf9baR36WaX6W7lu8dO0/0OU18SF11Z7cmXcrMg1ThC
	 fR1M4Ax/Ua/uCMhVAVRRqKK+mUcDre03IgXvh2OupBjxlMhFN4JfehUAMP14gSBqwi/g6
	 2VSNKjpFg5We+bEyyZjJKRA8/RTDnCMkMFvhYCymrXvsEGjm93MPGqFrlJjqV5cbQE66k
	 sFdsjEUqcyMkb29o8BLzGjCZnvRrAJoE9eePczHSQGGVDFQQGa6hBTXNY2FzK8WUvrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
	b=C+VgpFBBxXpsofEwURKZ8FPZ394g1WE2d+zlosbEhyuAV/cp3qVEqF57rmAyI807mZtW
	 RnpQU51IjcIJE31+JAzeuYv0JVedH0JPRLB0eq+hf8mBYIAG4YWGSj7aWyqPfUurg5mdO
	 9L/7bmwY5NV5Hwtyb/QcUPGGIYCJjF28lfztdV6ZcsYht58/REoA7zAtN/M+MdKwYyonN
	 p88B0sDoErC3JCnfqD1yNbaLmeuiPnyX0uKk/zsGl+90jDBnjrob0zPjl8/coq5xljlU3
	 kb9Jv1POc40Sq0J8msz3kr6URkk2Zfe4Fvqx2xkXRpjJF85NZWoihB9ozMbW4+zERRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1RJiphd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF52606A32D
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 08:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF52606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1RJiphd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4371467eec.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868325; x=1794473125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
        b=M1RJiphdP5y2FZbyx2CNnpLv/K9/cAK8GR5d8bYeBrKMIDmoTfDJJeGZnzw+tVC5xQ
         1ZZGNtTPK/XFASEbop+aorrpFgFX4Q2qDaQ7t1Gyen02THreJFYumzcDDPlxx+nkkj89
         E30GXCGyLYhsf6xNp45WsQMe/7xUXKb2OMTfnjutGIRwrOtkKjF6st4haBTOrqENBXAx
         Ef6wqpr+NOjcfUXB+zVEtW/WRdOIe9uIiU0K7HfCrw26xxLMyzj3M/hSWYfzQmTsloyU
         gOw3WENlqj9wqK1JFswlbk+T8P9l1+ifdGWYSj9XQfIOAsnaXJIldEWmJ6cCT4lstkFV
         zbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868325; x=1794473125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDxvxLItiSCdu3fsI80x3ws6o0fFDQAmdzilH9mdUKE=;
        b=QY2cy6cFFmMMPQOw74K4eJgZbcFhsqUx8bx02TmhPUXxR2FfRN1uvqQDMPotjEGLzU
         y7HojNtCyEsaXDhpNkhhMnci/n0nFoTCXwSt/c1ghYGLSk4bzcmrG30yTu+oJUkQcMT9
         a9qsI6WYpxhfegATxenG6tbNtLoXyXMKJBzCIHJjTw0GFhmF0tmUEXN4YojPA3ZhB4xM
         UImWBAV00SV3peuRBr/R++zRpBYgK/97sB5czn3HKe9Wlwdc6jnxJ5W8yuU6OxcYUH+d
         /Kym6+zMGJiS5bUqV3JNi5lQOBCJw6caBtCHaGPQYRXZKWeYNMmUjtEjDhFGs4wDnLBd
         eeNg==
X-Forwarded-Encrypted: i=1; AKwUvBx6zhySShsMb/AABBtkujcWqEMrlHTbgmT6hB1OyRtBfV16k18DEJ0qSTYB25hru+gwsGaOCWkS3XyOwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/7nqM8yEfFFtbr5nKP29mIThXwiU3AbXmvYyFR6bnVNfL6wlc
	c9yhrHX4VAmQL975DZRp4EP/icGDdrisCDde8DaFiMwBTF3mi0CQnEeA
X-Gm-Gg: AYBFou35LM52M8qRoYqtKXlyExxD6r/iRQGHEapaUL5SFezgmcZScU5VitVHs6ZLw51
	haKyqFBy4EgOuolnLM8gTNXDNCtKSUXK8WaHwdx4aqa/PrAYEuK+ZpPVXyB8L4QCPWR5aSsX7VA
	1JL4Z9r6+e5vW5BEWQJoSoMgNw3/X6i/uSFSw2CsGICb96bnv6rkXbVa0N9hKH7R70mZwen36Pw
	2lMTJz+7kNLjbjWJZ52n7GffSmEhGIDg+9v0o2UO3FfHqrWyQaO93XXekBW+5H0sj03lhIwqa+p
	0wsA7wpwBohEkt+hYXM/ENSfdzIrU4uwUlffsFmGQDoF7hRR39loQggJljDre9Xw9iZ45sqUxwX
	9ObR2NtnQtqeQSSfoJ3yFvKy8zVLQM4smNL9k2vt/ygvLHqWfEOnazDcsYrHMNcKGHPhu7A4Acu
	QMTxMG8YqnvF9I9Zy3aeSgygQvFy1m296SH+ANTp1YiUtBwzdEZWc2+jgSqL5IEbzob1QoS93Q9
	y6zJpdTP4F85Xj08GJtYMMhzAncfgEwxU5k1prZYRG7aItUIO8WYqQhUIrk3EJ8ebquOtOiG9hR
	gW70LIyVfUztVVA9dYPI+5Vg8zpt5+oN07rAeb8Eb3KcvLF7pmsL66XE/A==
X-Received: by 2002:a05:693c:6393:20b0:369:f291:49da with SMTP id 5a478bee46e88-36a4243f71emr27802086eec.40.1793868324397;
        Thu, 05 Nov 2026 00:45:24 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:ea48:d21a:2ee:9ca2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm14468573eec.1.2026.11.05.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:45:23 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
Date: Thu,  5 Nov 2026 00:45:18 -0800
Message-ID: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API[1], replace
the strscpy() and strlcat() calls with seq_buf operations when
constructing Hantro video device names.

This preserves the resulting strings, including truncation
when the compatible string and suffix exceed the destination
buffer's capacity.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..2bfcd45cc55e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	const struct of_device_id *match;
 	struct hantro_func *func;
 	struct video_device *vfd;
+	struct seq_buf s;
 	int ret;
 
 	match = of_match_node(of_hantro_match, vpu->dev->of_node);
@@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &hantro_ioctl_ops;
-	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
-	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
-		"-enc" : "-dec", sizeof(vfd->name));
+
+	seq_buf_init(&s, vfd->name, sizeof(vfd->name));
+	seq_buf_puts(&s, match->compatible);
+	seq_buf_puts(&s, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
+			"-enc" : "-dec");
+	seq_buf_terminate(&s);
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		vpu->encoder = func;
-- 
2.43.0


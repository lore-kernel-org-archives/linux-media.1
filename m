Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818717A30A
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639776; cv=none; b=S/w5m3k2jvp8GwI6UdF28P2EGEj66KuKCURNftznYK6I+dLtfXk8Z3HHM9BcDgHLCnzZ0AwWRQxOdTN+gWrp2cYspeXHFYkvnYM1RiiC6xNsk804/+dXHS2O7SrvZ7k8IvYHaEn32BzZHzNPx59k3MiDa5qjz0YZjFZ3s2VTJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639776; c=relaxed/simple;
	bh=mhmLXscI6NQQEl70eju7+aXlhtGYE6nMOBb0I5fNLNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9FQS/XWn5t+MV0/3omu8DAF4AwviQ5QsMYctBR8NVfBhqGVUnC75UGjnOhgDJwwKw5FDLfdxi1sorUHgVa4h+g5RAmkg/3iIljQqpz/qTsiIsOExezZH8U+bc7qyJfgBVmPd29ZaoAZCpYLQ284F6hMFo8shDTCBh7tn3fMlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlOB/FPY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlOB/FPY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso11783195e9.1
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782639774; x=1783244574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqVt+RIteYYvNTCyf7JhD0K57WM4+XbG2izcVTYOpIA=;
        b=SlOB/FPYrV9b2whuUJSJc+ra4YuukppavegQRSdIaCA667GrgMn7BRmrnmcbbxCU1S
         Mwy0bWmhoQkB4t9Z9ZS5WNIdZxG2/sjMurfrk/tuMSeCF/NdfZdR7bVZ3FVckoGfwNAD
         SFWK1QfMVcf53nTThG2QH986ZlcXUnSSLRv3s8mbNxueI1/Boh/+qJOR+/x5CNCkrUpb
         u1uxm8P1Rq49ruEG1L9ZN2MsjVFFy21gHx2MV62B/vk/kAnycB5uRABnL/h+gCTr6VOP
         Mr3V/bfq5MPSwYwnbgYVEN1+AibVaFjRirO9Xs+NqjiFScSBO84kenigy4yykRWhs6RV
         99wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782639774; x=1783244574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqVt+RIteYYvNTCyf7JhD0K57WM4+XbG2izcVTYOpIA=;
        b=Unh8Dpc4vBNCwHvDhxO0HRmOVHE5FBf63n4iNEpFyAcK4//iX+hVH1SKI6iHYHPqe9
         fgdeERXBHOj7OtkABXM1aTM7Hl4a8+RA3Cs2CzDIDRt9mwwYaZ44bYHHTECtl+F1MUtT
         MhBF2wA5JobFcYgwGru7rLn+GsXhFkf6fABSX4fIRg/Hfja1V6+F+mP6h8rhK8NHkuBD
         8YC14zsCfRY+tIqk9o4uYj8Dh0intavADt4bZ82s8k9E8OhQuCPCt11IaKMc3y0a7RQy
         MMXAPsEZ9T0TPixarvPBys0JWCjwRV1wtvZiLTjpovtE7ZMbHbKR5FhFX0JpX7BYSQaa
         jzag==
X-Gm-Message-State: AOJu0YwqVdNkK4nLwe8mtX7OCVvi6mtNAOIAgqTO53PSMNQf4+jD7v/Y
	8Ijmqamvuzz7/6u1j5OsLMzLB/PMqOPquCuQOVKL0zPWf6CCGJeM9uPr
X-Gm-Gg: AfdE7ckJsTW59TmN4HCm5eWXsdXdeBO18hYSgGiXxbW1v3S/4j//4w3yiXjIzoT89zO
	aSppY+Nx4c+I+Mb81DUPooop3PmuYu8XOGfNeY7h/awHtWUh4fxh1/LU+2PlTY2w4Z0lZgIUBoP
	JenXFCaQotzSsrJ7+o8+oA6smw89pXec/ltrR170HgnIfiVcWDYvEwRohs/k9Hu13Q20AlAarcZ
	iFVWphAYxwTtzT4gxgU1NMzfRGB7GXFlhIYdYQc7eKVDQ8HWEOreiihd0Qaf0IdUPuxpR8HB7eO
	Gy2WdeoXya5gfK8fYVf3vGj+czwrDqvaaw7mXvNHStxoTq6RSP3BnU361TgAciq4r3w9Rfq3Bl4
	8lvjKYm7s0T1KCAOJAixFXAD9mTWzLBLkug1pmqLaIKBaAeZxGl0+IZCr1+F8qdRlP28JmI6/Zn
	HMFQXyDZNa4hziN3Q7SwuoORcrKQ==
X-Received: by 2002:a05:600c:4f83:b0:492:d8be:2c0f with SMTP id 5b1f17b1804b1-49398cd4600mr62591975e9.36.1782639773581;
        Sun, 28 Jun 2026 02:42:53 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c28c51asm121739045e9.2.2026.06.28.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:42:52 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-core: pin frontend device through release
Date: Sun, 28 Jun 2026 11:42:05 +0200
Message-ID: <20260628094205.44981-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_generic_release() drops the reference held by the open file. Device
unregistration may already have dropped the registration reference, in
which case the call frees dvbdev. dvb_frontend_release() nevertheless
continues to inspect its user count, wait queue, media entity and private
frontend after that call, causing a use-after-free.

Take a temporary device reference around the generic release and the
remaining frontend shutdown work.

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Reported-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 7aebaef18191..1276fe704675 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2912,6 +2912,7 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 		mb();
 	}
 
+	dvb_device_get(dvbdev);
 	ret = dvb_generic_release(inode, file);
 
 	if (dvbdev->users == -1) {
@@ -2933,6 +2934,7 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 	}
 
 	dvb_frontend_put(fe);
+	dvb_device_put(dvbdev);
 
 	return ret;
 }
-- 
2.54.0


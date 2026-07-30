Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8711517BEBF
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 00:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372628; cv=none; b=e3EsdmSMUkdpvb1joUoYcKSyFubsmiox8xN9pql3HyEGQIsgQkMYeeMOzXWm/k2dRJQSG4QZa1u4Niv04ILDuP067zw8gTwiiO/lFnEu7m6r5n+t5qZ4k3OxDQhzkTITR5gamknvrUSr1Wa/QG+FfSAB6/Gt+nj2Y8HoaM/6bXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372628; c=relaxed/simple;
	bh=lz/ENHeg7lc/pGSfCrb2mdLNbLhHT47k+38RQe4MdVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OI+OuQ879Ar8W+Eq5KjnZnt+e+HUeHhEXJGdSK3c06NPfW3S0FzygVUCeYzjEHgJdCw47SGIQ64vIMG4M9CAKdBvPk5PjHD91Logx0JaMv1n1ykc96Nx9VoC7vUZ323jkL5+vc936vPTpBWXs4WYPmBfDfyqH9AXGGtYNbYmriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYLg+bk7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYLg+bk7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso919254a12.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 17:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785372627; x=1785977427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTcejbfPpIi7RoF28k6VKpbyOUJ6ogQJG6qo6DRmZEc=;
        b=VYLg+bk78vD/1D3Zy39oHs5dYPkJupqkPoj++7nPJPCBRsLbJqCbubOriwJE1405fy
         FLBEJDfeXj1t4g+kNkIFAMQUr4DC8NT+2TDqHck3xNylSHLCyEou/oz7klqc0h4+H1HZ
         jw24HNM/EMy4UGiMQIbJ6RaXKkvqSAeTj/c0PLFp6C2bk3YcTL1N5WRaUquoJ5o+X7Ye
         Qd6ho4siaUwov18MusAz40GSrcs6KELQAijNqeM/3b7OUjldmUEigt7TeoptvQ29UwR2
         arH26R7Jh4Hd7joDCVL5ydSB7Z/cHfgsoAWji10ZQy4peu7RQfvNY1JQ9vofU05QAvrC
         yg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372627; x=1785977427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTcejbfPpIi7RoF28k6VKpbyOUJ6ogQJG6qo6DRmZEc=;
        b=O2AXBfaVcYmngLOrJNUFAadbyqwbNob+wjE+3c9u3oVC6PY6HQrLXqwP7YL0w1I+Sd
         m+dQmFtjC9c5UGIZQC8QNLP8ruy2ul6Ik2RTKE295KFi+GVs+M1tultZc6B/2poRI7so
         IaReWR0rKD46PUpbxUmlQC1ojPZ5HyCU02K2RfXwf/qeVWvOpltpKwCF8BDYLcQZf6+C
         wi+SUZbhChZWNl9nSyzWFNGKUMjz4fsuT+KBVEqeH9JAW+UOXKV0c8qc5gMZL89IGINH
         xS2+e6Bncm34staRDqHYFOP53LNU6FMiRInmBbdBDRKymjkRYX8PFX8U8j7o+zblMamk
         51Ww==
X-Gm-Message-State: AOJu0YxYaPKBCeqGSslmGZxVccbST0WJd3fDI6WtPAfouwJ7+q9mn1fW
	kkhWTLSEhyPzWgOXhQJFhVnQItPzx5pr0fIMPjSkuLBzCb5XT8oboinH
X-Gm-Gg: AR+sD11igBmKEcNP2dmofndjjVy1YbEf4Zv+zB2vlkE5GA/tfeUVd8rsa6kZlvrTgyZ
	Z0PbWG5GXPWnx2xy3JD4xNqd5+rr0E0TMhsW2IvIR+btrVeJHDJIgDArACeUyoRjcAuf+P5Cp2L
	jdnVfOcRcKxjhx00sh/HVXYt8dRleXHttEfF3ktZ/19g/ZFIktnY9RSuf8Sny1KpVZwADYCrybI
	mUOcblE7NAuoP/Qt3T6WQFgEirLeO6bHTwmlNJVrZhHZ0ZdhOE4w+AerbfwmZNbV+6KUM9bE422
	9upuI0VJY7ehNlv9h9eYTuWI40nEVnWllDnuHcGGTYmjWwxYaisoK9yeZXBdP3VGLWG1NVqEA0z
	PGQ1inm8tF86/ORaHoBvX+yxzcg1XHyh/BLszEGHq9IfLxjznRIWk2XaaeGUzGFKK9eZwbF8KB2
	I83tyt/aZTFzsnicHQtoeUkzsJ2nxveuM+I8DPfYsv/jmHVtySuNYk7Z4FPliZUTZKF+mHkj83b
	F6fXe4y8MBL19PCA8T3d4eGUuEGk/aMTiv5YzPPlACLUjuq0KZqEx0XteirWVqM7KbVOnqK2b4w
	SUzQho0M
X-Received: by 2002:a05:6a00:2e1e:b0:846:a26:8e0b with SMTP id d2e1a72fcca58-84ebc20ff60mr599833b3a.18.1785372626776;
        Wed, 29 Jul 2026 17:50:26 -0700 (PDT)
Received: from alanhc-ROG-Strix-G16-G614PR-G614PR.tailb22ec2.ts.net (1-161-137-250.dynamic-ip.hinet.net. [1.161.137.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe240acsm2088390b3a.7.2026.07.29.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:50:26 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Subject: [PATCH v2] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Thu, 30 Jul 2026 08:50:21 +0800
Message-ID: <20260730005021.4032907-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730003153.4030818-1-alan.tseng.cs@gmail.com>
References: <20260730003153.4030818-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e73c317efbf9 ("dma-buf: remove restriction of
IOCTL:DMA_BUF_SET_NAME") removed the dma_resv_lock() and the check on
dmabuf->attachments that returned -EBUSY. It updated the description above
the function accordingly, but left the return value description untouched.

dma_buf_set_name() now returns 0 on success, or the error from
strndup_user(); there is no -EBUSY path left. Update the description to
match the code.

kernel-doc does not validate prose, so scripts/kernel-doc does not report
this.

Fixes: e73c317efbf9 ("dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
v2: Add a Fixes: tag identifying the commit that left the return value
    description stale. No change to the diff.

 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636d..324f4f0c8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -413,8 +413,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * @buf:    [in]     A piece of userspace memory that contains the name of
  *                   the dma-buf.
  *
- * Returns 0 on success. If the dma-buf buffer is already attached to
- * devices, return -EBUSY.
+ * Returns 0 on success, or a negative error code from strndup_user() if the
+ * name cannot be copied in.
  *
  */
 static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
-- 
2.43.0


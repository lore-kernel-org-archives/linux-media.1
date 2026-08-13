Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97D48989D
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635089; cv=none; b=e4p7UL/0wlyta41E8qpO8Cz6kHjql5cSsDf2B2NJj+JhWon27v5YhQ9ykoOwSoMWPIWegjJuczi9pI7tyEROX1CeYorOEkHphn5LYX8hzgeo7LsFiEUNDUauMAqKyRFHRiYCm6zGiAni99R2UMUIy60AiYNHrwZvKKLWyJ6Rn/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635089; c=relaxed/simple;
	bh=l1E6rnlINesvNs5pIwmiElKf6NrZvdZNHozzdpc2ajE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4X8jGs2GmZpp38ummqbEVdIE2KqImGnJL3p85UCNiaZW1x+uiCvSiPHTjCrylTH1/nwLCoDIDsfqlEwSRRoagPWZrMJmCrNQHYX4zJ93xrzKC50A317JJt8xxa43tLEzzbimvD0uKQ0TwLJ+2sSFXcvoqdJWJO/kfynGoW1maY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/AsBdlZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/AsBdlZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2462904a12.3
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635087; x=1787239887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdLHSnVvI80rGVNmrMg/j2qwQ8mbgPyWz70ikZAsX34=;
        b=B/AsBdlZgFE5xYCC0M/67INARZy4i4f5SODGpaEmdIPDTBzj4tzLkDz0LdN8775/Lt
         zXI+cbw1mWkQfKdjGN5yFfbh/tLCOsJAetKipn4aZQSuCkP+zhprs7sJJBzyo36EnJ4j
         fKVataaTB7w8ACujDUUbAPLGLVHxMxy6kE0p1Gh+txz2v5jtFIeckWBfUNuo6/aBV2B3
         BQ8Lg3uwzhjf6ZrGcJ/hVBfYyKpvIpWtae70/YX+fEVg4c1Jr/jlM7WnlLk8C13hIPSF
         Jo4YZI8JgEirX5HLT3aKeGzQdwS3p5GalCiwYTed1i8O33dv1bFVDkI0wB5RAQcdkzmg
         tHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635087; x=1787239887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdLHSnVvI80rGVNmrMg/j2qwQ8mbgPyWz70ikZAsX34=;
        b=dRIR4TZKTSyhYgND2JExEJV1r1Upwxz4vgLoSSdunAp67MP6AEvmfWQYMpJUSs1FMN
         MaaDWhlR0C2EnL30gdPfBj0S4Wq7jxtowGcU+io1XHxUzljpvYbABAFdLytchMN+RM1S
         Y5boBb3vQUqSmWwUkSee/UFoS7G52C6CXwUykgJrI8y8E794sCwGvn8uSoH0huZSQypX
         U+dF7RbhOL5+sm6pzOvJr4AL6cLfvvLKOwr1W57A0EQFdevKHKCUI2gnFxboba/FpJ/8
         c8bkFUXsFas/bjQbj00NSE7Mxz7Gu2XSL62DwBOjrQQUGTx/TEDXdz4QIPGhWRS4f/7A
         xnGw==
X-Gm-Message-State: AOJu0Yw6wWjg3rqjS/adUFWuA1z+1lMrXDPFGJcJWC0YYLNwcUDMPrnQ
	dgub3juwxzFkIUYAYcCJKf3UlcfL4jO3VgicgYIq8daXGhRcCsFDq6GtGWPX+MQsNqo=
X-Gm-Gg: AR+sD12VrlWJyK2wMvAaSSrbHDpbR3wk88rRTn/eYfWSiX/9UqaXDc9e0CUEA3XG4QN
	NDdw7nLpgYqYljlExmY8tYgzlGEiakihJO6Rp6/FDug8ngTCO5W2vR4XwYorAoc69T9W5gQ71+c
	Uql8HuTuL+BLAPfpTiP9FPkjSxn09OPUwQZk4kQ8TyOy7sV+etj+Q7OF87k1KUdJYeq2f9clKbo
	etNDHBV72mPNZ2fqoxX1CfS03Xp/y2i1B1RCf8k4vc05Bnt0G4mG5t+uzbd2wHD31hCj57Uxnmt
	Py9qnZ8RU8pfn/dHmndfEqeiEIHQsPNM46A4mVvPlZg4eY/cPIgrXKBPvSBwCIkTNV8JxzWRmdZ
	IcHkCnDgekPoxjbQDPfUUQ2T9etMjf6osNT7yjAT4iJRT4Ce7acC8KmPWnBP0If6wrdtEU1zWap
	Cau4nYzhXfvGGoF4pFWqH3v7cp4Tebcx6JZSPN1EegNNbinF/3b2kMxKM+PdGxJNbRHiBBCCAJB
	nK5MLg=
X-Received: by 2002:a05:6a00:1c94:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-84fc6d3b2a9mr7212437b3a.8.1786635085431;
        Thu, 13 Aug 2026 08:31:25 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a1cdd3sm1100839b3a.33.2026.08.13.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:25 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: linux-media@vger.kernel.org
Cc: maintainers@bluecherrydvr.com,
	ismael@iodev.co.uk,
	mchehab@kernel.org,
	bcollins@bluecherry.net,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: solo6x10: Initialize I2C read data
Date: Thu, 13 Aug 2026 23:31:20 +0800
Message-ID: <20260813153120.3952770-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

solo_i2c_readbyte() ignores the number of messages completed by
i2c_transfer(). If the transfer stops before the read message completes,
the adapter returns a short count without storing anything in data. The
helper then returns an uninitialized stack byte, so chip detection and
user-visible control and status reads can consume unpredictable values.

The helper returns a byte and has no error channel. Preserve that API and
initialize data to zero as a deterministic fallback. Successful reads
still overwrite it, while failed or partial transfers no longer expose
indeterminate stack contents.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: faa4fd2a0951 ("Staging: solo6x10: New driver (staging) for Softlogic 6x10")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/pci/solo6x10/solo6x10-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-i2c.c b/drivers/media/pci/solo6x10/solo6x10-i2c.c
index 7db785e9c99791..1b37dccd137a05 100644
--- a/drivers/media/pci/solo6x10/solo6x10-i2c.c
+++ b/drivers/media/pci/solo6x10/solo6x10-i2c.c
@@ -25,7 +25,7 @@
 u8 solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off)
 {
 	struct i2c_msg msgs[2];
-	u8 data;
+	u8 data = 0;
 
 	msgs[0].flags = 0;
 	msgs[0].addr = addr;
-- 
2.51.0


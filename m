Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670521;
	b=B3B9rjHT2Z18yzNNPMfcjybyQgBQWr+obUg8eNggCedj8a9rpH4IiL0ECaPVBCcXORpv
	 fFpeM4Atz26qPvmKCbvbkKnZiWNi10HuV1tC1HITku24y2iwJI5k8CmvwwY3zqfNG/9zO
	 S/e8qso4kwCr6NPz8P/z89XPKKOl6P02yWEnXLZnx6A+twTTRYmQl2kUUACIlzF2nLtQR
	 RPcamhxY4im7VTyc/4jGmhR85+3xoAT1t96omQtGBpxRPAUQckt1/gxX2d0XC6DRagpCD
	 gWNExyjdLsCWA1V2r/+4Scc7lEi7Os45Ew3JsFFmMShejK/cKeLMf+u0nbov8g29MRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
	b=yx8t7FzUnYn4AoFMtebFiUEtdj2Ys1K4wvStAPT7KvM5IlWD+ewI6Y0THxYqqjEj1nj7
	 RGoYu9ZLFrlrBjSMzqennLUoRMseykT09CBcIBxqqb6ctJVwuGerXaxX3X4AhSmGEVbx6
	 p3IuUo656JMHcVLnlQDn6uhqZ0sT2SwbADe0hWnX+p6TaZWIPmS62uUeLOpXZn2h/OK1F
	 zrAiOp6cTkxPIuUL9zZizbFW6YPZjRTukx2aHURlMkDnOhRwppd3FlP8gYnDTUovPxqSr
	 0st92BKkJWYDfIOZYB/YS7VE5oJiYmyAa4Y4/ytGHepRWf17coWLt+PM/NPz1T4st9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f8PbKIi1;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BC606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f8PbKIi1
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso3167654a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670520; x=1796275320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
        b=f8PbKIi1CS5x5lIZiSjkTRACKg5FurJS/mPBBYSYZaIX8dTrczQ7LJ2qu+6LiGIh4p
         Xl/G/MeG05PpIydrx1aIFbqSuMO3ETiogNEdPKAbORlFhoV81bYdgdpjt4BVonHiBPNo
         WoavpEqaog7RTBG5jiqeCynsSXT0+HU7Yh/mWECo5NH88B+WvDpqnf+dHwVDLgUYaK9u
         BPQEz2GeMIS2CuM4jjRK8N6BxA26UbwU6kyO32ON8uhKbKQ7metU9ozuoyMBSzEmhhzU
         zFIfezvZnZW1Ek6PuUhwSY2CFoCE50Zz4XUNvqc3TX+QUYd6PKcV8TZi19oqrICNMLm4
         17lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670520; x=1796275320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onk+iKTNJvSLjSgmayiHFki7AAkKSNYYZ+ceWP4cnXQ=;
        b=Q6KVbo02NFnjnEHDil55d/Ebj6EwOaoA46rdrviU21f2g+9/kRVdGIYUsUKUKTPAnU
         KnjSI8+CGcrD7ki4Z1tcMNJudpIglZQdZIm00QaqMgPSkP0m0Le+t5ORjLCnslLSGJzr
         4MXQBw78UHduz4xKgtg8kLADxTDQI28IKJDH7JirpnswzE/vyjFrFm2CVLTfeljbFbgt
         BvfFq9671Eua+dj4Uxy0ZHCYN4eB8aB+9JEAM4tbzZqBvd+8XwVhvAswdrwGDyD7dRfv
         6IBAPtmN66daIlGvsj4k/6UeFct8mJjyVQmS3PqdI7uUViS/wA49hiCqBRr/qhpzBUk3
         k2Og==
X-Forwarded-Encrypted: i=1; AL+hErFdPCcvjEr8IEmCPIQmFwvl4jlMzYEm8hDMbiub2imulMZs+zYL6xbf9wXCw0o33jcw+OXbCf4MRm9W+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z87F4eVFDCJQAkrubQnRDeJc3OUCv/m1n6y8CtK8MERx26bLcyW
	HATIfuY+wJilRa4Ig9TzMgBDZAK4szsvYNEVZ/Ng8H928zAWE3dgXgk=
X-Gm-Gg: AZFdTZfpzglXlU1aNLPy93dQ8uZtppObGcBYBqKUOPfyE2k/bCJEjlxeIRj9GXcVsvm
	NOwWtBWSESDrDo0wrr0Tf0GZXc1qKWkJYatygnes8IYnbws+X7GmzhNVQpv7IX9CdUyDMrMnIbG
	PMCehrW3mCvRone5YrAAZ7UZOcPY4v7A7eRRnAiJVI1IWXTG5DbpciLMFbDEG2Ox+3KbDYTn9V0
	EuaoAKK/EaBQxhXnL2vcWYULETKotq7YUHPcPhvdn1Q3JwIXNGSmKXZlUFU1jHBR6IZL9utx/D+
	/1KG6ws0DOKuI5A7hQU9Dxz5HWuf94HOUW9A4ZfhJn4mQDd5kjIlmLOnwOQSI6bf2NNOiRZVfKQ
	BZFpw6RRb89PlN8VKJ/zylYzV0KJnhUIIo3ZFZgcdP6mVlKG0/UHvuf5GcJfCUp9tEnpWYuZ8av
	yfTEjAkrBEd7iyyzTvbzo75E51C+GNT6p5f3qjdNsOH8P30YaayDl+OUVtRtc0hrUdSxVNIqU7i
	wjo/gFp3GYwiMDsKbs+K8gbqP08PKnprtZfg62517Ze+kTDe+0ACafOhugPHLkej2vpU7vhhOhl
	i057SPbXWMW53snhw31vdGqWGtuIWib78GDDZWvM1urMCbV8h8POL515IEMgtCoq41MHOESBQA/
	ayveCIZw3641W
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b41c942d13mr19705625a91.49.1795670520219;
        Wed, 25 Nov 2026 21:22:00 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm33748176a91.15.2026.11.25.21.21.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:21:59 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: coda: Release firmware if code buffer allocation fails
Date: Thu, 26 Nov 2026 13:21:54 +0800
Message-ID: <rc-b1-20261126-vc-161-779570fc1703@gmail.com>
X-Mailer: git-send-email 2.50.1
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

coda_fw_callback() owns the firmware passed to it by
request_firmware_nowait(). It normally releases the firmware after copying
it into the BIT processor's code buffer. If allocating that buffer fails,
the callback jumps to put_pm and skips release_firmware(), leaking the
firmware and its associated resources.

Release the firmware before jumping to put_pm, which drops the runtime PM
reference taken in coda_probe().

An AI coding assistant helped identify the leak during review of static
analysis results and helped draft the fix and commit message.

Fixes: 186b250a0725 ("[media] media: coda: Add driver for Coda video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64 coda-common.o with GCC 14.2 and W=1,
CONFIG_COMPILE_TEST=y, CONFIG_ARCH_MXC=y and CONFIG_VIDEO_CODA=m.
The baseline and patched object builds both produced 0 warnings.
No hardware or runtime test was performed.
The path needs the coherent DMA allocation of the code buffer to fail in the async firmware callback (OOM or fault injection).

 drivers/media/platform/chips-media/coda/coda-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 3fe33c4..ca8f953 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3004,8 +3004,10 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	/* allocate auxiliary per-device code buffer for the BIT processor */
 	ret = coda_alloc_aux_buf(dev, &dev->codebuf, fw->size, "codebuf",
 				 dev->debugfs_root);
-	if (ret < 0)
+	if (ret < 0) {
+		release_firmware(fw);
 		goto put_pm;
+	}
 
 	coda_copy_firmware(dev, fw->data, fw->size);
 	release_firmware(fw);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

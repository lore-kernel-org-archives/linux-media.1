Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4535C6B9
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895175; cv=none; b=juIZVMQsBzoz0JTGuk9zkyTl83Q3kdKzIYV72B78STRL6ciSdd2IrSynKVcT0SSBANPLNU5OP0NLxQK1gj/UhZaSUd/qKIv/Smze5+2m/e3TeUMhSE8nK0HxWyy7G9TOXtZuwi7ASScbDMw+93A/cxAtab7ibx+6/1B7jgQQoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895175; c=relaxed/simple;
	bh=/GdYAOcGtW4ZEPQ+TChDIHhN3tLRFCYSsNmY5MWYC6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVxbZGoDi2nozU+/6h72XicY8vsX4cqCNRLA9XRtK/G927SB0ZNY42KkW7r36nfxvv1xNF8dlu3jVVXuqcQmjrGnLy6IEidGvgdTNO9GMb8llEURr4/hpuYsDW+c6YNKupjRIYzFOpGc2XbkfH6aNH3XLdpMrJJ9nA7q2tYZEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEzUTatD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEzUTatD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3968e063f84so574219a91.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895173; x=1788499973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bd4HWqdqCRRUfdjHaCwJvNT3mp6cdXyqAafiod8JiSo=;
        b=TEzUTatDcMqiz0XuCT8jdS0vRPw9jaYD5rCK2u4RKmaFx8M8VgIKdV7ZkXOHGEZe5w
         pYMHpGaFaJBcGVJH652bOpBmYBHdctoV+OOYmwN6IKzTl1tBXu5OV81UhY7q3hlQRC22
         tI2jjh5X69NXlAxDk+NiH/d3t552FxcjUnH3t6y79ZGc/xgxe61uKTA794CyHolSsaz/
         MjvXbDfnZh+lG94hkcHzr3ok0UBv8owj14AYI63Vc5RFJFH7MyhIfxQxfCo4vQzCQM/G
         Ov3I2ly80HrKrEu/riKz+x38Eo7piPFH5nRxUqaZrZEP1POcQfkjy1mV5U3FT+JmJQwj
         k5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895173; x=1788499973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bd4HWqdqCRRUfdjHaCwJvNT3mp6cdXyqAafiod8JiSo=;
        b=NbOgOL5Mt1ir9lTcxssCFbFdH4MpO/mKKAd6m1WheOigGa3zFfPCQWTISVX9z/yJ0G
         ygMLo5QOgIDVAD5dDhvi6mYKqm3hG+kZgq/v0cH9/GckBC0m6OJ3zYtD82SrDDt8yTXE
         sv2Jtgn56YNwbepOazRZ96EIvHBDWkLctDgYYtNPsao9dAFXyvk5bqaIw+ZYvvwOHJcR
         c/JEHNgFEYYL5ratPmomfzXMpZ1exVyt2//Rl5SX0IsNRmI6QbhZDipjQ9+VQO13D70/
         XGK2ehxZPqOryuWhjPNTF4koBIDlnuVoROuGqg7KzTffklCqPVk5dISyPQRatNr2Acej
         cUKw==
X-Gm-Message-State: AFuF++mQyiR6a9XWvy+I/5Pk7psaG+u4lyUSCxjDXmDARH4NyV4/rmMV
	ivzlrZJcG851Oqxwgl+58nK5UW1CYEO21oag4Mc4JABjU5RplCUgTAlU
X-Gm-Gg: AR+sD11DjYyeuZAygTItX9qNlx0GYJsMnV0qHYEJbWiT9WfVI3J+L0/0N30h33GX6w8
	zbMeb6KDUWjwvVhRnZmK474twp1qIoePYFwvOqqDkMvNA3TvHsko5wrjJ5gShRSSewgNY+FJ6Lz
	/z32QEfpAMQnzbyXs0VIhj4dpO4YG/JqqfAdGnpWmw5sLsxKBwjB/dJ3H+ONC69NDd/3UspwBZN
	nwRLccaZMu4BtaVleR8Kg/nBtDPJ8nFM5VCCTKsSHHF4AiUCghHNoUMZIshnwQUYk3xeuZCvyNJ
	xFWMPzWiEdMuFY5NlcB2w4j+zFmZXgk4XKqKzEjywnskx+hCvysL3CSHGyRFtaULtFu8oDAvMra
	WyC1KMKGvEKujlk2Q8bJCkwaLtuQftDH4fd0Z8yK0YmWMhNDVt2VZtSmtMd6nd5at4S/T8FFyhs
	HJscVtDAntC4MDC6rlGWSN92gFWMWlKQSNv+FThjhipPqfw2gNgKyl5hCFr6xIaRbeSRXCPYb2h
	pMo0en1B/DwkHyc7bNKQA+F9xMlgX9FWB+b3jkMxFQ=
X-Received: by 2002:a17:90b:3e43:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-396d0f67646mr9008068a91.12.1787895172935;
        Thu, 27 Aug 2026 22:32:52 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc07cbbsm1003093a91.10.2026.08.27.22.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:32:52 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-core: synchronize section timer on feed stop
Date: Fri, 28 Aug 2026 14:32:44 +0900
Message-ID: <20260828053244.2010009-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828052852.1975097-1-hnkz.64@gmail.com>
References: <20260828052852.1975097-1-hnkz.64@gmail.com>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes in v2:
- Add Fixes and stable Cc tags.
- Document the pre-rename timer API equivalent for stable backports.

For stable trees predating the timer API rename, the equivalent change is
del_timer_sync().

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

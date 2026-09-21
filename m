Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5145A35B63C
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978558; cv=none; b=K/0Ux9JtPs0CRpsFG6A2HwP0n3qfxn/uYfRmrB9gISqemdAQtT8beXjXhoWd+CARJhdN60A2+LhJZsU5w7swZBJubzCzwPGWqFVW/qLpEvsoJ9q5KWqY1orUBMoeGqEr744WxzzNU//YUiA8b8410mtaKMfb0/2pevg4+d44A1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978558; c=relaxed/simple;
	bh=Iu14+tGkXJ7W6qu9z1nJ7iDbzj9Mz09KrdKxjIeeMZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTZLOi01zHpBbqAj6uXWtkr6enqxbfx0HLS1r6vjxEV5ULGJ+MqCPoIhPMNN6JOCqkyqGLI+Q/DommAFG4vZyB8p72DAJiDF5/ilSZiDndIlzBVDcq1rk67x4V4r6QH5KGYrZrgCLOYjlM6mYzoujKK0GMfdMzVWcyYYglaz7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nulSChML; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nulSChML"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1601866a12.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978557; x=1790583357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVJagrft1n8Its2gcvGhHWhNvvTksci+ZknnJFdRNaA=;
        b=nulSChML5xCyH/Zv/zBIsW7fPVHURLRObTmXnBZ3SOFNj/4mwMF5j2EOdFdjOP2MQz
         1YcPG6M3KVoBIerh5Y6uuXxXdfsHsccbw3/J32j3cX/GYqP647XUd5KAvS6gs9Ic23yX
         w8rADnvERupb9dhqs3yu6fum27ByRiaGf2QZYn/dSPuPDIkhiMmL4Qn8PPp8btGo5uLE
         ZeGwETSeQNMNNxbKtiHqlG0t6r4VqZyj32nWiI/1bSIh0wMbZd3mgMibdd04LchMa1fW
         zwCJCXaRA8hTLCM+Vk3myuvLIphueqsHC6ZWx4ZmYV7z5UmvGjnNCUpDO4Fdk/amDuJb
         SO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978557; x=1790583357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVJagrft1n8Its2gcvGhHWhNvvTksci+ZknnJFdRNaA=;
        b=nd7D67JZ3Xx6+qEuRS6cY+RMqI+5Ma2NVrzYbjHvA9H3PHTRUEbmuqwSi0da/RL8kh
         3AUIbqGLaM+mhxoS5ad7iQ/uN183fPASQ5zOplbGsSZoRbiQQQD9t+XvXF1D/ehCxna4
         CN2lhuqyLBTzP+r1qTEKDPM4lxmEYBYJ/rNFbsZE+ndu/WSbZYLeDAf6AMuomxkC44Z/
         lXr6cqGE8GExRvYGDfBEqK3atddA24AECCGXXAw4UXee4o9pyLVKrrRqAtgPUtwRG5zY
         HALsIq2lQDZvC7e2/461InzicNJHGyBisWAKXyZDRg1UIlqsOMoWYTXjcmF8gCG6b+o3
         9lXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxIfqWSOM0r8MICUID4o8Wssrq6N6sBsXd8x0Cvd3fHlkFDCnqF8Z2MB/vrV/GYKAykabQV0kZR9II3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kkLM35HV0TkUj846ikpy9FMl3mhycguQMf6QK111VV+4o9jn/H
	8h0ADgPOMZReR+3Zm3r5cZ5qOiEZGJdAFh+vn22OS1JrArtXMZc5Aquu
X-Gm-Gg: AYBFou2gth/f2ZlIFpf953DmrVaMYulnH4+/cDKhyP6hJcFE0ehE5hqsf7+ztzpXMDg
	BKaIZHq3jUmTzLLqif8X1xPFGM9racXWNM5/eB4W+c7FP7Occ9fsWQoO0VUQSj6wFZaB2hpRGRs
	WfhvmGl8GIV+fik6NoyK7kO1XeEO49Aa85BJPpvChtOL4z665BL9GmMi83KyP9zbQ9RbtAVJe37
	K78052tHZaWi2zQpSHfEmu8SnwTZDEqwjFpGYLnyWdKgrsbTNcwpImEEhxrdhnfIo8gAErMww0z
	kdZsHaueRmBgRdiw1/V0xyh5yPNAkzwlFmB8qs0tVkhwETPcrayDVkt03vFMulnhnzI/eTUuX6o
	u0B0G5mYFWlK8YJmq6uRCaso025byRP+s3B8nDJ4XxMvNxW2jrWZRiAx6Z84JYVimTIYe4aUkvf
	qVdJ2yQafGBsvH0RrByjPaHeDEyxpjSXjS1Plfo5Sx5WRKVxw2+oYVoA==
X-Received: by 2002:a17:90a:e7c3:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e54eb2281mr15605736a91.23.1789978556544;
        Mon, 21 Sep 2026 01:15:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a04982be8dsm4160673a91.13.2026.09.21.01.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:15:56 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Antti Palosaari <crope@iki.fi>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: rtl28xxu: fix SDR platform device leak
Date: Mon, 21 Sep 2026 16:15:42 +0800
Message-ID: <20260921081542.210151-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl2832u_tuner_attach() registers an rtl2832_sdr platform device, but
if registration succeeds without a bound driver, it breaks out without
unregistering the device.

dev->platform_device_sdr is assigned only after a driver is bound, so
rtl28xxu_tuner_detach() cannot unregister the unbound device later.
This leaves the registered platform device and its associated resources
allocated.

Split the registration failure and driver binding checks. Unregister
the successfully registered platform device when no driver is bound
before leaving the switch.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: a2f7f220df5e ("[media] rtl28xxu: switch SDR module to platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 487c6ab784ab..3603d0cf638b 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1391,8 +1391,12 @@ static int rtl2832u_tuner_attach(struct dvb_usb_adapter *adap)
 						     "rtl2832_sdr",
 						     PLATFORM_DEVID_AUTO,
 						     &pdata, sizeof(pdata));
-		if (IS_ERR(pdev) || pdev->dev.driver == NULL)
+		if (IS_ERR(pdev))
 			break;
+		if (!pdev->dev.driver) {
+			platform_device_unregister(pdev);
+			break;
+		}
 		dev->platform_device_sdr = pdev;
 		break;
 	default:
-- 
2.43.0


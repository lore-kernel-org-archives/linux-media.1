Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D08F361950
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678680; cv=none; b=NHxiQoIjODSSqeWfE6dxvI5Yd4J1u/xOr+ruIm69EagPHnhpKHu77115UnZsvjuDZnKJym0l8ZKJYllismuxFeL+DBquwBIp3cObIwZNgc7j3uyk6V6SSXVHoF/rziy5jbnfiQabJeDZQpetnRG/20A7m9rbDA8cbLJI8jfts6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678680; c=relaxed/simple;
	bh=WV19nRgnlTczcJCJcJLqYj8F5k/1pRJmdKXrBvJGuXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXfo3o5Eyl965F2F3xIU5tG+WroV00Ad88nHPFMJ9WyVLuRZublh3ojZo9WO0DSp8IxuN9/uxMzm5ygXnFC7vyT9LmDe1ZCl5fNPdEMVpiEV8Dd1U4lBPiOrQ23jeaT9vj6ZxhIzzQIuXrvLhPJn1mXcj2tFbAE6D0MOjE3HL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCw6zJ0m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCw6zJ0m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4957eefd361so17824865e9.1
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788678677; x=1789283477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuI8ci+AOd5iWfmTxSoL7IT2ohrWp2ZssNC41x43tJA=;
        b=oCw6zJ0m8TkQCRg4vXWwu2aOly11JMcS6FPz9Yr46kffpfoBFKpQYHFPnZvy565qnm
         qhVvOM9y1mGNxb4JHaQsKm65noMKcdBVXp6W0vWflCkG3anjIFgFdGZ813wQ4VP6NDHh
         EpfT6zXgodrfiFoxhPGYwOhFMHZr6Kf4T07xbV44vvV8vNr6GpGqn1cHMrZrkxUMwxJW
         YQX08gYQEae17lj5Ub70uX6AR2yc7Jn1IJocv0vrY9rHU0bDNI8HSMhxCwv2FSHzfO8Z
         aGaDmc+vmdhuUkSE4vpOJZx5Oin3Pxsau0me6vWdw6ZEgWczOLZ98i7GWW3qW5ruexhi
         Nv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788678677; x=1789283477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuI8ci+AOd5iWfmTxSoL7IT2ohrWp2ZssNC41x43tJA=;
        b=rCamyr+c6+xcGHs0AJgmM1m397ZNQ5NOFWYkMLnwRDqhY1dLE/13coZKwaMRQRYRNZ
         8zYA5MySeYrUyZpEDyqB/MAwzJf7ZlJ7ht3jL7f7VPmISezcmQoq/wULZhb+KLbKJ64e
         Hkh91DNeE0xXoNp6iFJnOaGbF27Ow24xTvIoOvf795H9V82aQlXd9EdAG7w0P3uPFrcm
         G1ShLLqTAxz6pBAETN1aTCWZP+4+n24XFihS+Npv5w8KhSKeDsFV/Qf9V2u3uZ3eZMsg
         j9mwTji7JHmOse1YAM6DNAne2Gfe1WJB17eiGsFmKx7JyHwKUCJMi9KyehK1gSdbFQX+
         pGbg==
X-Gm-Message-State: AFuF++m+sXw1B/nqtzGy/RQidZWlThiAKQhLA4PuKNvaD+DyJauEASKO
	1UvWgfJs86WoPMSGwKXVncJhxfCWjnXi3E1Qol1rzli+ZHaQ4Sd2A33Xz467ig==
X-Gm-Gg: AYBFou39vN1fT4Kt2fCAmIOJF1EJ7IOn4D4tiNpl+NrzDZphSS5CuYw2PZ3hYpvwBol
	kldmHb+fMAHdvhJrXJRtVP4+Gh/t/0zJBzQpuZte36xkPYQNUCwnn3JKZe9IFW9SgSlWskAikQK
	CT1wGOYSdLaZyYcB/Oxj1ZNAqKrNgo8cEc/1RK6gxDWit1FQUMQffIcliPepSpUFY4W8L3okeE9
	M1b90Uw2u7cb7281WuJNW+zvpN3Fz6ZeYXWv0daHZrX+wlJ5bfQiQZDKF1rUS6AOD5L7uJc5pKG
	GaXNQy8IGecfEnYR00Twv1N/v2LxgqHmJbZCzW/lZMoJ4CL3Fu5AaDr6YoFUJj4Hr/CrCHSgOae
	Jyjl9KzbX1ntfG+g7iln3G1BsC3R/aFGmh//V+CUOt2sTg19amcUzZs9ZiUKgE0p4d08ldnsok+
	D7ZJp816Vo6t4KZnstfFMM05/jtTQzAsFigbu6VZN8F5QqiCk2THNGhpT3gSNVqN7K2BEePGe6x
	cxLafaQiAbyBIHKmwYdzB3j802YXjsowSjY09ml6O/yQ6er
X-Received: by 2002:a05:600c:1548:b0:49c:fc6e:a3d4 with SMTP id 5b1f17b1804b1-49cfc6ea70fmr132686535e9.19.1788678677246;
        Sun, 06 Sep 2026 00:11:17 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm169995245e9.3.2026.09.06.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:11:15 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Free the ISP control handler on unregister
Date: Sun,  6 Sep 2026 08:10:30 +0100
Message-ID: <20260906071112.48259-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_isp_init_controls() initialises isp->handler and adds the
capabilities control, but mali_c55_unregister_isp() never frees it.
Neither v4l2_device_unregister_subdev() nor v4l2_subdev_cleanup()
touches sd->ctrl_handler, so the handler and its control are leaked on
every unbind or module removal. The probe error path already frees it,
and the TPG subdevice does so in its own unregister function.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index e128adf6ee37..c45a3760e084 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -641,6 +641,7 @@ void mali_c55_unregister_isp(struct mali_c55 *mali_c55)
 
 	mutex_destroy(&isp->capture_lock);
 	v4l2_device_unregister_subdev(&isp->sd);
+	v4l2_ctrl_handler_free(&isp->handler);
 	v4l2_subdev_cleanup(&isp->sd);
 	media_entity_cleanup(&isp->sd.entity);
 }
-- 
2.55.0


Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE847F769
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470553; cv=none; b=BuZghefy25riaQDiD9LR16zVfoUjNwT4yBqzYdwCNnpWIZypxU9bXYxA5+Mr96At9StysNZy4LD8HHspXRjBSA1BRQahUoV4ey//IjQy9VSfE3tBvJLg/GgBsbhUwGb6ij9kL1FvpborvQCv8WjJjXcc5gtI2/AkS/IQbJXaXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470553; c=relaxed/simple;
	bh=f7bXHlhXsnOZ/6ZvQ+o+waq2nBAiEKG6Kg1glvRzHJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdV5BE/Ov9A0eMpmv3GugOvrAzaZNvu1bCs+UY9jVkF2irnYAdmwWUqJMmAbVb2xsOeIPM2IZ4M7JUCVA0lHOppEddgDNMbsjEmvWHNj/ou6SFsxZP4cGcj5OK7pk4LYxsjB1GmD+VEBnZSR229k+m210CUufJc+ozI7B05+ZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrkxJ37w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrkxJ37w"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso117456a91.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 04:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789470552; x=1790075352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh7rYkhxlrvXjsZrQxcY6UVDt2QLiuI71BjvESmUG5o=;
        b=OrkxJ37wMz9fIg1tz/0DBTIANhZHPZLHXpyST2kvx9sdNMfTOOAfFhp8+3OH+XIkvM
         FBnY0oh9l43RNSs9c/UGqgNHZQeE4uYh74yd5E04JeI7J/pq7jEqPtzf2dNSFUCzTu5Z
         ITOaaRcEJD9q4WILe/m881OGOv3McvUCV9wJM8LK7ikd0Pvr0dihvi8HOMlBI+YHYrSO
         2qkLGK8EJNDyygBYwqje8G6I2qaV8+fg9ifQ2k92Yai6I4II1Wf7hmP97wukDDJV+Hrk
         0qhlS3967PbQikLtidKtpDHhwXrlGZD5dJO+CqjIjagH/8f31R3rVmq2dGL9Z61+OWNi
         H1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470552; x=1790075352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh7rYkhxlrvXjsZrQxcY6UVDt2QLiuI71BjvESmUG5o=;
        b=YUO4twMCm+ZG2sKuDP7RsIxxthGx7rjBzBaEMayeP3z45H8ksldSavpPBkjVfYvCrF
         G9vPb/+MXKgw4jLzWBDiDpxnRmq7blXlAlCZ0HRoj8QdYZwPkJrfj3wFvEUPYGjiYgbV
         roEGj9J53TOeDI6P8fIfIvGjL87dZ7VoFoQJLk1zgSDI92QO00f7qB4PeHr2t9kLir/r
         Fv8LuAy+K/xeShXbFwwx07L7kN16FSyJS7jByoJrzm5x+o1oGlAddL5KZymMb5liGP8w
         h7iX5RcVO6PfLHOy2HXU0knVaxTYgs2eWS3QEFkpJLL/2OZpG/jLjU7rU0XdEw4vF2l8
         UbOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsx4x1aJEQZA0BJQkQfuXIn2LOWP0ZXgMZ/nzkdi6rd8lFv0S5zGQV40hGtIIS+H+AVRoferbTpDdAUg==@vger.kernel.org
X-Gm-Message-State: AFuF++miWAGJvwpCRbzWyF9/QGwrRpgX8Gp6k/wcImPuHdV0pOZhhDoc
	sRHPjmcr1PtLyzW+OZLG/h3BcFvolv8JAs1GIRPzjezQLh4rZhAnEP3Q
X-Gm-Gg: AYBFou1k0nTW7nV968Ky6TWYE0WR+6z47dqa/4QoorD2bRBuUVQGX/vl6/349HFnx3m
	KPJvuKJpGe3p1FUMcSY/4a7J1zuIdAzAeM5TjWYB8O6nJptZDMZ0THjWU0uIUc0Iz4p2D5D7BWB
	nIiAgJLBBtyhU3CcS3SuDtlMiKxIrRoNYLnoqol6Dqzf8m7p3lvdxIAHLBuXxX0Bvo90bOyLw10
	UFiNRTAMZao/9HiHGmQ6ox7vLJ3gO2CA8XTgNOLDiIiR8S+82oN25DoUPciuaPGqyH44X+fJqak
	4F8/ULLIaKUo+JRZWqWtyjxRxV9d1c84xzMUZZJ/Gij6P2gonITr+t/R1/FLZpJV1keFUGg49Cp
	h50gukIoI88nEjQIua5pJgNV+aYn3k9vGjE9JHrJG/kjOr47cSkUPo5rzAUBAWEsq1/a9w88Dam
	l/9ki1+N772rNX+ACFTSvWUukrSLwXGjjeYxAO0lPIlB33GqqzKmUzsA==
X-Received: by 2002:a17:90b:4b05:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-39e110f66f8mr651424a91.25.1789470551569;
        Tue, 15 Sep 2026 04:09:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda8bdf4sm4828687a91.12.2026.09.15.04.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:09:11 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: tw686x: fix V4L2 device lifetime on probe failure
Date: Tue, 15 Sep 2026 19:08:58 +0800
Message-ID: <20260915110858.2381610-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw686x_video_init() registers the V4L2 device, which initializes its
reference count. Successfully registered video devices take additional
references to the V4L2 device as well.

The probe failure paths currently tear down the PCI resources and then
free the channel arrays and the tw686x device directly. This bypasses
the V4L2 device reference count and the tw686x_dev_release() callback.

If a video device still holds a reference, its eventual release will
drop a reference to the already freed V4L2 device. Even when no extra
references remain, directly freeing the device bypasses the lifetime
management established by v4l2_device_register().

After cleaning up the PCI resources, check whether the V4L2 device was
registered. If so, mark the hardware unavailable and drop the driver's
V4L2 device reference, letting tw686x_dev_release() free the backing
objects when the final reference is released. Keep the existing direct
free path for failures that occur before V4L2 device registration.

This issue was found by manual code inspection.

Fixes: 704a84ccdbf1 ("[media] media: Support Intersil/Techwell TW686x-based video capture cards")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/tw686x/tw686x-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index 5a4ab329c06e..1e3079bb8bb4 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -241,6 +241,7 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 			const struct pci_device_id *pci_id)
 {
 	struct tw686x_dev *dev;
+	unsigned long flags;
 	int err;
 
 	dev = kzalloc_obj(*dev);
@@ -352,6 +353,15 @@ static int tw686x_probe(struct pci_dev *pci_dev,
 	pci_release_regions(pci_dev);
 disable_pci:
 	pci_disable_device(pci_dev);
+	if (dev->v4l2_dev.dev) {
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->pci_dev = NULL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+
+		v4l2_device_put(&dev->v4l2_dev);
+		return err;
+	}
+
 free_audio:
 	kfree(dev->audio_channels);
 free_video:
-- 
2.43.0


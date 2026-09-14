Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343C2D2487
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349837; cv=none; b=legF7tkWLJO2x1tdDo6Oa1UwF6hjC/sTcwFZCGt4SgLMU7NoeP72NoQS1U/zfwSHKlW5ClJNv4aUjZG2fz3oEJCP/J1eP+BKBb/AN55Gi+RpHAOJr86lHOJd5REYPqC66gB4GDdGXg0tKgh6ZPf6RSl8eA6d1dTjPAU/eKgVDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349837; c=relaxed/simple;
	bh=+v1rkjMl8Dk8F9b/8Yn4mlrfNxvrTeYq7/TR5qmLoyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ls2kjNuvXWfpxEUpbSGrsh/XWN7Fp5SF93UZULmTfUmsvXPgPS5LgKqVgMznOqCEQ+qIVChvaUgci8s4L4yv32vDOQzgs25RRC2aD/oRBSUXUgL+f11bjM+R3IntUMAk8Jl8f+54U4zl2pgLP4CNvbFUKwsL9McD4QtILfXpTqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J25VJS7N; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J25VJS7N"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91219376dd6so20591766d6.2
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789349834; x=1789954634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/toox/sEIAgy69QCwA7fzFRnXlkL+BXk7kS7eLbkjDw=;
        b=J25VJS7NdxxkZQhUY9ck+B22q6tp0P2K5wN+v8wgiLainKsx4S+hAB60bwELqtXy0g
         EdCb6D9niNI8XXNQPncz0ow6FOb3HR419fS0EnFaT8YMOeM4pkOgVGmywPbJXaDygP+8
         uR+mq2K3XGgG82hUxKn6vG0zw/DezL7tGkwKpeXtARjEsl/gKQgbdI2Wo5HBew7NpJC8
         oVz6GSpjvsVE9F6UVJBICBmTX1B4rnGzwSqlmy3DLlw4oVg6hxgIhqNjCNhmq9c6o5Z6
         w1/mS1z+3IFLqZ8YyxeF0AT/NIug25l/wb/6uefn8gxpTbGBThyC5SyhT6/uusmLpK12
         +nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349834; x=1789954634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/toox/sEIAgy69QCwA7fzFRnXlkL+BXk7kS7eLbkjDw=;
        b=A/irnkFCpull43Q6qYfIy7QLMlnXdbINuj+st8OdnIuE/WphAcmE9ViydBQtsgqyxT
         untGBjWzjwQNXeqSJncsbqrO3A7Pq3G8xSkffBVFBS8ltGnpg+i71lNNo21ku7+SoB+C
         7N0uXr9sH2nxXVPIW6Lw2yxj9upky02osngIyI5NMwXghx1xkvCgmTJMHBWnEsBF2mqT
         IyPhBF3RcpUtmLHB5P9OjV7zHFefcXYm/fngMnxRxkXYaR6q4oKm8gx9Ini5N5HEqB5Q
         GTmhbYYJV7RnkvzplxqDO7qaE7XRMcv/iRMNov9mQ1oldj9WB2AoabWaIo/+QkPll/Sg
         feEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlqq0ZyWk10Xw7WzxsM5Di30c0faK77Jz7Dm+cKf86zJ8UTeaB5vWHpW6ja1l5w3Du0x1qv/1P3nwteQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lQ/70YH+VMymy0KQMnsoycwgnWVm6HZ5xfUBTJVaHdDV41eF+x
	fqfppt4YSplmPdtKcohRtYQgyuulXacjXstPOlTpgl55z/yzUSoEJGM=
X-Gm-Gg: AYBFou0ZeqruyiFX8Ys4aTHpAVqpARFOH55XJR/jrB2YWkmmhDp5rl3/KyGjnDJUuua
	yacA4ViUdVQk5BndrTNeVkBFqi2GM7ip75tuVwKf2m3G0vcE7n+GWS9BMpLUwp2GIiSKQ7Bgg+b
	lthFiBjoaOydHeAPOhmkIgaE/VWlX9Via+G/Pz7rN5Xc6KJ45TLUMgp0JaA4/6uVQIWzWhZ8DoW
	X8ugRi3Fx7oUDrLLHNlE3lHot8mBz6ykYKAKs98IBqpfeIjicLFnExhjhE8QTwl8ZNnUpZ/Bw0A
	GcXyjbiUWGsHw2hJ+hq4J/CBiRxedJcs+Ib2rWGD5zlltb7mtfEp4LPhB0PgKhC/dptsC4p/nIf
	EX6mBTYh1Nvm3Dhp72f34sxY4KgKpoWQs1o2IAgWc2frj9hwpBA46w0rX9/Ky9N4YTbnCYhZ74T
	aAhPrq7Xnkd9Lo1gmg4G2jEyjqkUO4OGzRes/pAulBRSij5PbguhEPI6vtsRCjhSQPA4EujTt6S
	ApiRLEaCwfm2cVvnE0xrIYW/mW5j1Ermo8+4su1CQgoH4NPT693e5j/Ie4hw1g6sSHA7RZpYsUB
	0kOWRTIHGzQZuKhiZV6n/+uAngxGPNITZQ==
X-Received: by 2002:a05:6214:860b:b0:90e:9d05:b757 with SMTP id 6a1803df08f44-9122e148035mr9798376d6.0.1789349834523;
        Sun, 13 Sep 2026 18:37:14 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm82134856d6.43.2026.09.13.18.37.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 18:37:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Oliver Endriss <o.endriss@gmx.de>,
	Ralph Metzler <rmetzler@digitaldevices.de>,
	Daniel Scheller <d.scheller@gmx.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: ddbridge: Disable PCI device on early probe failures
Date: Sun, 13 Sep 2026 21:37:00 -0400
Message-ID: <20260914013700.51804-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA mask and device allocation failure paths return directly after
pci_enable_device(), leaving its enable count unbalanced.

Route both failures to the existing PCI disable step, after the cleanup
that requires an allocated device object. Preserve the existing error
codes and successful probe and removal behavior.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: ccad04578fcb ("[media] ddbridge: Initial check-in")
Fixes: 22e743898dcd ("media: ddbridge: bump ddbridge code to version 0.9.29")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

diff --git a/drivers/media/pci/ddbridge/ddbridge-main.c b/drivers/media/pci/ddbridge/ddbridge-main.c
index 248ace2..591a43e 100644
--- a/drivers/media/pci/ddbridge/ddbridge-main.c
+++ b/drivers/media/pci/ddbridge/ddbridge-main.c
@@ -172,12 +172,16 @@ static int ddb_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
-		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)))
-			return -ENODEV;
+		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+			stat = -ENODEV;
+			goto fail_disable_device;
+		}
 
 	dev = vzalloc(sizeof(*dev));
-	if (!dev)
-		return -ENOMEM;
+	if (!dev) {
+		stat = -ENOMEM;
+		goto fail_disable_device;
+	}
 
 	mutex_init(&dev->mutex);
 	dev->has_dma = 1;
@@ -237,6 +241,7 @@ fail:
 
 	ddb_unmap(dev);
 	pci_set_drvdata(pdev, NULL);
+fail_disable_device:
 	pci_disable_device(pdev);
 	return stat;
 }

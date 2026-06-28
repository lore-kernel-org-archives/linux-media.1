Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1F35975
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 01:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782608482; cv=none; b=Yprd8iVDX7IW3wxOpT3nBhno3QsJSxACMEs5tlYqkQ0YQkX3vd3tYaz3NSmloj9b4la+J9EUOYhuTcDI7rFCUvMUuYxqr/3hUPpyD8SkkbQ3AQ1dNrdoKP0LTr47P3k8fUuX7mKkaVGXH1kWTTKFH3nwlsAHg0afJRTDqdE6FWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782608482; c=relaxed/simple;
	bh=PZU4pQMQAZRKSnd6jPqARjjl97ttqmW362csCIgTbEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmpJvo7E+tWsxlkBl/9Sh6Wb2X5JG/MhCITB+Gxrk5XRg6ttXZ01bgVedQbThTej1KSmqywIlW8SL8QOCbm27Yliq+delfdE1PumD7MeoM55Ekl5Upnv8VJe/qd5BRuAw1RjHyGV409FtBv/irEsOXHcrqWjMEc1IY+uz5yfxn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO+F1/m1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO+F1/m1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493a285ff0cso2115945e9.2
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 18:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782608479; x=1783213279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uiXXfhd85k9VGmjTuyvn04rBlfZgTWc2oF31wHvaQAs=;
        b=RO+F1/m1p5prxAiAF2kbWzMP/IZSYoJfHKQZTRL1OJKLTEoeSWw7ivusfRNFq6cPTO
         XTclJ0W+NY9YfANplrR7NFslCya10RoEz9cMzOb1+o1qYwmB0wE3st+rnLqOQ1Z/B/gD
         +S0SlLDaxbBFpKkKP5YDhmuj3YtFKm8dO9FXsLF1L4R6tbacXkazj5EZnyejOnohWg7i
         OSVvDKwCFjLPhNEfy2cmcoNBA31h92YKHpgjjo8cO7DzKoxOu6FKSmEb1JBWJ0vJJqjH
         l4N3x69Ecn9TN/5PjBFN2ZUciXGKFFsOX2nYcbjVGrquecLq6CglCoFQ8LRZ+R3VQA4x
         LwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782608479; x=1783213279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiXXfhd85k9VGmjTuyvn04rBlfZgTWc2oF31wHvaQAs=;
        b=B/IlWHgXmWi0BR+QuLHFBhAtLMH5V+Gp8XFY3EPw6lVsH10E7Pv3Rs98rS4kgz4mLn
         Kv1XJwld4wyZiu0GO8xkFRkVe+s+tfXy3T34DkB0IWDTkF+Rb/eFLE3dtV4PPAJfKp4K
         SC6xfa3o9X5UPUQmXnL4huNcBFoEt+s+rEvEWcbqyosHRieFaiprbSz/jprfPkVxOcaU
         cHKm3HoRsdTd/Lv8d1gnQvKdGOcKHVn78yk/6xCa1c+7fRQZkVTcoAurUktKj70p0GlU
         ADld+t0wXdP0gGw1lqj9SXNGalGAlgD/Lv88pG0ZSrqt2R/FF1L9fkjJEdIAVDobbpCl
         0RZQ==
X-Gm-Message-State: AOJu0YzKFtmFp2I2Pa5Mrsh9NuWRYdyLJlDwJCMx/tz6Te+19HiRSKG6
	PRY5DYrGa/WbvGSwtSxPq/ONcf6w2oXZeKK0ZzXlix4TR3eoKk3UqG7i
X-Gm-Gg: AfdE7cnEbJLDb02EETeX8eGrcymsH40uGPTUBomkNYEVSsKrUJWJMPkzBy4O3sj+Z5k
	TnyVWY+xBRqEx/gNCCaw+riv8hXFQizjpM3ACYggebqr4PGLVDtc/O2rKoyiuGQsHG+8DtAs4c8
	VUDENxVRZq9xUwvuhrO6XqwsccnEy6Hab6t7Zn0oFiSMhIVD9dAzJG4zmmHdnnkQTvJ1NA2g47R
	s9RvZ4V2sPCnbWhjlKxnp5h1g6v835s+k3vr1P61spfplZnPY9v3wE0SZGerzsRuJMk7jlET8fy
	xHsY91vlKyX2ugsBfrcs4o2ObwHi1l5cZfj/JC3kNmmiaqouI/exBAKL1wlJoPocoNMaCOvUTRc
	4GzafU+f9lV4/WdpSO3eQ097vyVFGoY6xLOa/krd27mYAG/naY7ny4xeSl2+sNweaAtCYWmJkd1
	eigc00HAs0SgZlndjSdLN/PGjcW998ZPfmNNrn
X-Received: by 2002:a05:600c:4f43:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-49266838e92mr172234955e9.2.1782608479263;
        Sat, 27 Jun 2026 18:01:19 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fce60fsm185943785e9.1.2026.06.27.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 18:01:18 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: msi2500: free controls when video registration fails
Date: Sun, 28 Jun 2026 03:00:38 +0200
Message-ID: <20260628010038.32007-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control handler has already allocated its control array and copied
the subdevice controls when video_register_device() is called. Its error
path currently skips err_free_controls, leaking those allocations each
time device probing reaches this failure.

Route the failure through the control cleanup label.

Fixes: 977e444f59ad ("[media] Mirics MSi3101 SDR Dongle driver")
Reported-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 282256ab812a..2a2773722172 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1280,7 +1280,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	if (ret) {
 		dev_err(dev->dev,
 			"Failed to register as video device (%d)\n", ret);
-		goto err_unregister_v4l2_dev;
+		goto err_free_controls;
 	}
 	dev_info(dev->dev, "Registered as %s\n",
 		 video_device_node_name(&dev->vdev));
-- 
2.54.0


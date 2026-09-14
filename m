Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C31E8826
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352899; cv=none; b=LOAdJJMeA7CuG9NT+RfqOJtU+HFGiy0FtCvvw9W2/zGy0amHJAFED5otfANejns/XPmyAIYXNAfkSx5T5Cu5H2KhfgZ1t7pfh8giJElmIK/fr+v+5uN8A72UvDXI6RYZXv+LGgV0PAnIAio5hp056EHUFa5RRX/KwL7TpK6LE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352899; c=relaxed/simple;
	bh=usI9XZeqS68h+aQ09RC4HHK1fkirxcpzu11PiNKhG5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S34W68t9mQW1aH+uk8trE2z55YwfP6LGCDkZUDhQKHT2TqGCQW+9MPVoAb8gCyh/chHC9iFnmw3zvoIYjjBd65sWMF2ab/0otQkg1BRaw5WeVIaLe2w3ISc0DcsrDI8xh6Cntq7vgwutSn2QGDkf58g8wQPTNz9f6GQNl8UKYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT0NPb6O; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT0NPb6O"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-939e59ff27eso269921385a.3
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352897; x=1789957697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+euEtVk/lOdTYTMh0Py4M4/UHpaSMOa7kpgqctZUnY=;
        b=jT0NPb6OFW59yr48xpVHc1MPpgjxa29xUOEH4n7pdSaPeuvqbM3ytCLYHwmuWRi2vu
         feYX3f+im/EcLdaz3i8bf7Os+7eqCc41/Y6pUvvR2aRw5wK+7PCfV4WOgOf0qi4XS2u/
         X8yM7G8T/rOSdbDyc0zPuai4UVBmy2RypxgKtkeBtGPRlf6KdXFy/L08XlPgBINBBLEQ
         RjZ4aMt8T0qerXaFBQBf8WvhenXxCJfSpum2tUUNsLymewB4XsXN9z+NpnKvrrwffE5x
         aOIpJ5xOqlKWIniZLxjazqfLwZr8HnAdf6kvVl3lkdoI0hLEAzDENdNSIAUcfUYCdSKs
         WXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352897; x=1789957697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+euEtVk/lOdTYTMh0Py4M4/UHpaSMOa7kpgqctZUnY=;
        b=R63kQx5JPdZJreEnRRQnfBnztIJTeWmz379BGlqQqPg8P2xEa2TwckTitCW7XXduKz
         phxBeVCiIKPsA8Oa3kvCURyfkBHLi9tlynKtoA4D4YTMQMuyBdLXo5MNBFzqUNsNSC02
         3YQS+YpAgUlSknuYnHefPnnymF/bDTWXlbhN8aPJU4dJodyqJOIHWs5qA/gChbAl1wB9
         0XknfzUnZoNpkhwwtvqkTcW68fs9FGqBVmku/jnbp8gmY4CYBItqqpCycvaVINU4Glii
         vG+Wpn4xOYJwU3eilSxXKKmxlQgDVcxKAygTZFNZOWf3HEpTnmB4mQJymQMebaATaEf8
         KwSg==
X-Forwarded-Encrypted: i=1; AKwUvBx9e9c8MwUJSwT0MmpPLiNxwdEvVKXqvuULJHbo72ytG4FgrqgoSt02XlH97X4AVT40rRql4nqwlIuQtw==@vger.kernel.org
X-Gm-Message-State: AFuF++nESyibI+S2tkEVT2QpvsouUXkYdup670cl8cLxxk6zT09psnIJ
	UtJm2hdhHhgd51c/zKDsm9mhtsnn9jWgpiW3JWAmfTQ9f38J2dSsDOvrIhJkwFFvQrxf
X-Gm-Gg: AYBFou3uC+5C5hP222t5PkuD9jRg/TUG6vJcdylaVberxkA4PmO/2kts/1wl4+iOfuo
	rYYxyL0ledDLkDwY4o30RQA7cn55CgVGHqEqjYvvrRYr1expqsGbun1awXBl07hMoEYFaBHgzPO
	YQbFOGmS9lqBFgixAv3EpE5tZOsd+xFAvRYNySI2vARyijnApChw45LNeXWG0AD/RQoES9JwPu0
	98VrcOUQzMkTNFeilyPQuwkb3Lcqfaiky0UnlroN8cG/pdQhh93emTz5g21AVAJwmf7Ux8npjXV
	0mFK3d+2yUtLvJPK4kM8qPXurVRfiN4/UYSTcZry0LAA+IOC5dSPaOpHrF34KMOTB8auZDtfOZP
	q54XlvD/qqVHownzmJasvnGXZkDDT+1yxNdBdrWaAljZHryUxXcULpFG5a1RF9SOyaVldYFBOX3
	g1nnBlE3xU+Ua8L6S6MXvqvNRCg/CVpV73sPrIQ0ADB9882pkBkVo5BrHxtLRkO9eKHON1eNDML
	6xfQJYxp4LwrHWrVkHN2G6xEsRMwojUkI56SapKHvMPtOWylpAMQNCP2yirHjEg8ecaOavm9Q/0
	yQZ1zrkF6jFuwZWPcEmlL1Vy8XhuZ/MYvj3S+m+DTQ2Q
X-Received: by 2002:a05:620a:269d:b0:939:e93d:a66a with SMTP id af79cd13be357-93a29939a08mr95154785a.32.1789352896708;
        Sun, 13 Sep 2026 19:28:16 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fc4a9455sm658677985a.31.2026.09.13.19.28.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 19:28:16 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Steven Toth <stoth@hauppauge.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cx18: Disable PCI device on probe failure
Date: Sun, 13 Sep 2026 22:28:08 -0400
Message-ID: <20260914022808.70592-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx18_setup_pci() enables the PCI device but does not disable it when
DMA mask setup or the memory-region reservation fails. Later probe
failure paths release the region without balancing the enable either.

Unwind the enable inside cx18_setup_pci() when that helper fails after
enabling the device. Once setup succeeds, disable it in the probe
cleanup after releasing the memory region. Setup failures skip that
cleanup, so each successful enable is balanced exactly once.

Keep the existing error codes and normal removal path unchanged.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1c1e45d17b66 ("V4L/DVB (7786): cx18: new driver for the Conexant CX23418 MPEG encoder chip")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

 drivers/media/pci/cx18/cx18-driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index 214fac7..ac90ce6 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -805,12 +805,12 @@ static int cx18_setup_pci(struct cx18 *cx, struct pci_dev *pci_dev,
 	}
 	if (dma_set_mask(&pci_dev->dev, DMA_BIT_MASK(32))) {
 		CX18_ERR("No suitable DMA available, card %d\n", cx->instance);
-		return -EIO;
+		goto err_disable_device;
 	}
 	if (!request_mem_region(cx->base_addr, CX18_MEM_SIZE, "cx18 encoder")) {
 		CX18_ERR("Cannot request encoder memory region, card %d\n",
 			 cx->instance);
-		return -EIO;
+		goto err_disable_device;
 	}
 
 	/* Enable bus mastering and memory mapped IO for the CX23418 */
@@ -834,6 +834,10 @@ static int cx18_setup_pci(struct cx18 *cx, struct pci_dev *pci_dev,
 		   cx->pci_dev->irq, pci_latency, (u64)cx->base_addr);
 
 	return 0;
+
+err_disable_device:
+	pci_disable_device(pci_dev);
+	return -EIO;
 }
 
 static void cx18_init_subdevs(struct cx18 *cx)
@@ -1120,6 +1124,7 @@ free_map:
 	cx18_iounmap(cx);
 free_mem:
 	release_mem_region(cx->base_addr, CX18_MEM_SIZE);
+	pci_disable_device(pci_dev);
 free_workqueues:
 	destroy_workqueue(cx->in_work_queue);
 err:

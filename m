Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939756;
	b=P49SCd1x5aAIBF6j/oqgBJ82mH33Nuc+JsErfGSCwa2Wu0wpYp656VvkX8pBqKuVvRE1
	 SUYLLbD4J6b0CZoUsNq0KP7eZ1lublFCpexdpODVv6CBNoM7U2NPgP4Y3F2CSK7fmsXs+
	 CUCbAg3QgtSKgKC7Y4gWbI0PHpbvo33EPck2yUE5oaR5rypVIPoYiAMcQtIq2BpjCGPhm
	 sjWSWD0e+wsLv3VNUk9Jaukam42SZIBf37sMdX2ZRMsvg71+IuERFcRa/+P3a0h47WHxT
	 wDdW5/jv/qg5wl4yVZvbbUGGmJH8mneUvk+I4sHOtkYbsR0xeHQ9pY9eycx9I+THCqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
	b=xA6TRVgU8MPp3G0ZNewmUFH7CYMsjjVvkyUuX3VHrcwhK34AzxE5mjdOZcHBzIisDHgI
	 iRPLe6ah7wZQuleBEMGB0Oe2xlftA6eOUZmJRm8SzTrFKe/mjcLSlVjsC0L+qkdG9ivK7
	 JUO/3XRiWB8AchZlxAQco/kBrp7KZmnEOVwygnSvmcC/e1KhTe1JgTlUtW/onG+mya22C
	 /ZhkvqeMCAhQnMMgpj7qjvQR+GbfoCusEkG5yDYYqHNEuTZ3zTGDbXaRaZQoVtbLmK86o
	 7h5f+GCIPDy1Yr/k5+EencBVtpwnB0z2ndBM+NffGX+U7b5I6X7B1mJ64IBeRo797Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTACDzCa;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE557606A31B
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 04:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE557606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTACDzCa
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso166640a91.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939755; x=1794544555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
        b=jTACDzCac2Ap7ipMOkR9opZR3ZLHb1GdpGAzbS1HvOMvEg5tVrS8wUsQerXPqikdk4
         GGSGOcvMtFx5P6BUdVbmmJ+fE8bx7nvB4cWaq3IBM8H5L9pf+P/yTiNmSx30YrHyprZH
         yIQhXlgpCILziLVViPSb48a7C5ALaBg+Pke59/L1DsYRXKvr6s/oEOQlKUUZabaXLbj3
         T7pLacqbE/JOmvHmTdN2yK8xA909tuOgTQ2FRdv3VFqBTPQQ7gPEkX7fGfO7g6iV5MZ3
         ZPkkJe45ldeZ1vbfOUKrWa56JvYCZn4qJsXXj88KR4jaJZHuL1oLfJwKkVWfTTZZE/zD
         TjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939755; x=1794544555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNfdsim6JmlWhi4wC/pPC/d/fJvMZLNKiWhCufGclNE=;
        b=AvsVK886RlJSbbmR6UYLqETmhN8Ws/3zy4vaymeJuuRUoxXIfJGStf47oKsAU2oPD4
         GqkO0ocx/lJ0zqfXa+cVvDPSCwh9UdTMDvAiC/xqiM1k6k8NtAuzEVdvDekL/rfvl148
         2hgtePvh6y24L5FhCE53AkU/Xv/cWM283aI++4+Eq+ebzeg6H743sKNPLHajkvkhk3Zt
         AUYxkU9ps6n38rGbXuuHBSNU5aQFELz2gIPRhqFab5NYlaj79xTI+ePJPzg2lBc0tPHq
         0VriF5+0xilJJeGWgQm63Ajse5sN62+GFbLolsOrbQpSm8xwVQsAO8S76PMZ9X6ykNV3
         HBwQ==
X-Forwarded-Encrypted: i=1; AL+hErHzJq1Tz/EgHzG0l6bMVZksBhx0V6jSf0MURkYfQqQd5QSaKFp/77Md4uLyppvB6tPj0ODm8y8IXU8MrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MG9yckti+jE2ugyFT37b6D53CRPKvxiY728b6xSXwR8JlUyq6
	nD6WGfGwEwSlz4eApw/UaAvvFef+8kiw81+zRKCy9xxC/9eKH+zi9u/z
X-Gm-Gg: AYBFou19Egv4kcDSiCOW/yiu+gFsRw8WjdyfiJM/RyOPL0+mwK3XsjIlB2do3uWm00b
	aRH2aSBUxB21fZ7ZdyMH/XY4qg/igcpV/rzi9BcK9IqAL40MYprTxLhWhTr7ZdNOc33KxpfT/E0
	ekgwEspk9AhDn14fTu/SIWML04MnF3EUAcbZh1Dhc0bSsI1ZZMbkoxttmndXoWbu7l0OWP8qmfA
	ds2ue1SyCuQpEXKGHh83rlgns1qf2R+oIJZrd1yPPinFNIiiJYEI9wkqmhPtY1dsjEIJ5I2st/J
	PLNNiuuzCm2wcuqnP9+MjiSg36joxDKc/JtQRQHInWktPBUXqn64YSI8q61XOjX8YYRWTybrxH+
	88yeVkXW2AHxpTxa+aKSNIR+V9KfGWm2vhi9TI5aRZEuuBtgR0dNC6FPV/g6mGoTelRXYXJp7on
	tlkUtCRzvLBkIXPqYEiKaBBb62+BhVv4dvIUBF2aA1yivzK1f7K5zXXoGv8tA61E/WJbu2veuiR
	MzXrDqZJvDiHm3b0lzWuVvkLVxd2smApvOm8pj4/MfPH0G3Lr9GW+4/XnYHHwoAKdoKZdnIycyd
	SnoOTYlE4u3xnuCHf9PhhXTwHahDFbxMpsvjAziaPKwNhV3DcQ==
X-Received: by 2002:a17:90b:33cc:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b0db6d37famr1221823a91.35.1793939755107;
        Thu, 05 Nov 2026 20:35:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7cb447esm1610110a91.17.2026.11.05.20.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:35:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: mgb4: cancel err_work before freeing the vin device
Date: Fri,  6 Nov 2026 13:35:41 +0900
Message-ID: <20261106043541.1902730-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

The input (vin) device schedules err_work (signal_change) from its error
interrupt handler err_handler(). On device removal, mgb4_vin_free() masks
and frees the error IRQ, but never drains err_work before kfree(vindev):

	xdma_disable_user_irq(vindev->mgbdev->xdev, err_irq);
	free_irq(vin_irq, vindev);
	free_irq(err_irq, vindev);
	...
	kfree(vindev);

free_irq() only synchronises against the IRQ handler itself; it does not
wait for a work item the handler has already queued on the system
workqueue. If an error interrupt fires shortly before removal, the queued
signal_change() work can run after vindev has been freed and dereferences
it (vindev->mgbdev->video, vindev->vdev, vindev->queue, vindev->timings),
causing a use-after-free.

Note the dma_work counterpart is already drained via cancel_work_sync() in
stop_streaming(); err_work has no corresponding cancel on any path. Add a
cancel_work_sync() for err_work in mgb4_vin_free(), placed after both IRQs
are freed so the handler can no longer re-queue the work.

Found by code review; not reproduced (requires the Digiteq MGB4 frame
grabber and an error interrupt racing device removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);

+	cancel_work_sync(&vindev->err_work);
+
 	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));

 	mgb4_i2c_free(&vindev->deser);

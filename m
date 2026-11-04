Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785866;
	b=bzFVLeHpPT/PSL0wESlUEvuQguuCKE2w//63RojmPMxdjdvvkWpLqPB25rYToOLhJ2zZ
	 Vb/qkNUMGilkPotAQaJ+biJvPFpag6E4H4pJ0EYAP7WcF4vPfwUFwqHHfpzdv2A5WiVT9
	 K71UbiLIaNHDjRT6t98TysRXSLu9+48HI0cYXmFFvgDmw7TopuOzxyV65AE2vg82O7hBM
	 duPTs4YBtMtfzdfBhXsPhjDzDbGaNwB0sV2fJJ2hCBghGZGvZlvkQHIEcjfUtnwWiODIL
	 ZbEL7VCO44obccXdvlVyNSSNI2W59+yvzhNZq2f1/iSkb7brujv0nI7QGIngOITF4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
	b=S9xDvvrt9tZvXnXJfxAmUpg14wN2OOhLAaZ6vSTqeuhEB+biQ4jsoFzzcM1ucrch2Afc
	 I0QmFeZcs8dc95V/TZWOR4X4ftQxBupcccOshf6YsOTGbrANhxJVJ5cKLCjCbEHs/Lcqx
	 UW6FsxSGMq6/XAZJ39uGIX4DZu3GQqLJGoeuok8QcClcma/tdDm8o0Idt2LSzXKLd7EJI
	 viEW5cnkGJYqIWO0be6Lc8JF2MBdnw1LWnIFq28ssbv5lOOKmjLOZWC1opsIs4bhqnVPo
	 dwSdK7PQS5lKztuPjRq6Be5tOmk7lPgL1CgaXEU7KANGemHNYuL8pgNP/yu0XKz3pnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4id2crq;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD79606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 09:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4id2crq
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso922622eec.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785866; x=1794390666; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
        b=A4id2crq9enniV0UEe3S9PcM2zqBBo9lolzKRqBxWkkFhSroIRB6fWgZVTnteGNHNi
         ozVKgo3tKzysoauI2Zxv8cbyxMiSRMwC1xJkBIG5DSJpuumzxgrUXlgD3i+y+dKkiSha
         pjY+4g62GUY1yiupYvzTn95vOFslgSEVVQMgULbGCYoiLBeZwSwU34HebA9vZ7WYAGcu
         LvC5cO3kx0Tn52MIdi0YOE1ess7iztzEDapLM017J9LZMaAQARbFyJe4Nqua/sDOkZ/u
         TVc54KPqUdu/ES3sPg9KOA5K+VxecyTwyXdYvYMiMB9u0XTY2fk+NZZsBOexV/gM1v4U
         TfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785866; x=1794390666;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
        b=BzmoBUCachdprea1hwrhQoblsxIHVELp3yQStjgto588V7+HE4sFY3PVRIAv4qVj+m
         y5UZ6QyUvBzYbMZsPS4vClLb50xDIgHHqtikBfDLy5aatgSMR+MzAraRK8CmjX6e7FFJ
         Zpmrg7DYtM2Zis4YRjo2pFkVH4wL3kvcBWw9bud9RnFA3q3aU5xnni9efO3P1akdxGXR
         KkJvPipuSI+9yjwJfhiyFCBVEAa3SNFbFAWpcBY6jbP/wTmrzx0kS3dNX+kNpjYD1OWU
         lRDrz30sqEdCo6zKdsPC7NU/tuS7S79J9GAFYUMPHmpWsL1ffznNBC2I45FcVM8vbj/D
         yA3Q==
X-Forwarded-Encrypted: i=1; AKwUvByhatN9083t4cACZOY1CNs2PZnJe2ep7oSGqf250FC3h9gBepBn9jK3yYdcQWreiZPYfjpvC7R9JMMCQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CTSkc7ZG/h3IXe3d7yk61L1GpPwjE3iB5UmtaT07MhXplxTGY
	Vv3XyT339c0nqSBHUhBCRHrioD1gIbyFbGyZfoGNMs6iVDQfPjK/x+Cp
X-Gm-Gg: AYBFou1Oat+sduvdWioaml+jnYad1prD0wHu80dV2XTd3Qj6A+VzyXLlcGd+mtAg878
	HG62oof5fYKAZ72Ahgp2RD/dAOhUoKNEBpCTXLBoxo1cGQiqOQxoAf7JV+NAO/xzLCxDUGCLdnf
	XN36cV+x8ovBTOnHriY+Cl0Z3c58xNEgIadIxPZzZHnwMS+ByObxWZ6AJemvF6q+eF6qbfm7i0F
	B3DYx2Zx8BaplmQymIubueShxHps1SRPqWtSAIQovOnCW/AGh2ZRckJB+EpC5AoBOwUEXZoKOOq
	iP9r8nqbmmMNKuYQgdn/6Byv4qhSxes6y6GfACAEXvXMFHIrH+1apnnqMzv4/bCP+8D26uK+kOQ
	WwrmB3DKBCizo0Kz3u4mPwS4If9dcvSnexUkQXsvBsUJggEylXZHKwfbtEfxSpw00r4N2l1iZrn
	x40RaAfE0WnfPl2F93Wyggys1DVUmVX4FA9wFGLA8xkP6GRI97R9voomjsqp1gYtpK9dohmbpGL
	W5bLiQW0FTWu0GHShGqV6ypXjTGBMN9WGVxBH4evP1V+XxD+gCirGs0DleMarPcJLLGiu4wCF7n
	q1CkfruiYK2kqExllpdgfZ6CDJgudFlkOGlrx7nm0zWpsYI0h3ocIZx4e+cjf6N4yLU=
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr24922994c88.46.1793785865246;
        Wed, 04 Nov 2026 01:51:05 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm6536137c88.14.2026.11.04.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:51:04 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:50:50 +0800
Subject: [PATCH] media: v4l2-mem2mem: cancel job work before freeing m2m_dev
Message-ID: <179378585020.73536.6089775766038265997@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com,
 Frank.Li@nxp.com, ming.qian@oss.nxp.com, dmantipov@yandex.ru,
 121811682@qq.com, ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

v4l2_m2m_release() frees the mem2mem device without draining its
embedded job_work. A job completion can queue the work while device
removal runs, leaving the worker to access a freed m2m_dev.

Cancel and wait for job_work before freeing the device. This ensures
that a previously queued or running job worker has completed before
the memory backing it is released.

The use-after-free was reproduced with an in-tree V4L2 test driver
under KASAN during stream teardown and device unbind; the same
injected scheduling sequence completed without the report after the
change.

Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..c4756e7bb1fb2 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,12 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	/*
+	 * job_work is embedded in m2m_dev and is re-queued unconditionally
+	 * whenever a job finishes; wait for it before freeing the device.
+	 */
+	cancel_work_sync(&m2m_dev->job_work);
+
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.34.1


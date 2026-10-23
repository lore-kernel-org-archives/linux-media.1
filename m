Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740887;
	b=10oljuJeOV9WjD6EpdVnaQbIHxKiBxw0INdzBjqEc6Qlx6YaCjl1/7L0OrgHU3O8rfUk
	 HOPIKp/iTPcjl4jRkLciWGAYhLdwzKxEitbyoDc+hEMCxEYrVfrkYbpXMg2vlGh0xUO1V
	 WRCAAizCrFsoABqrJ96usHbexycGsnj/qmOOVkhKsaGXEh38sgd77wpw4YeLIp1mAfs4h
	 c97q9BxeedPPIGc6zIVNujRkP5TgTJcBJ3vii4SAqRn8e/aGeFH3JyKkRrEtKYrC78IFa
	 i2GHWvOl0xG+xhDcFLwMyUvS6HDLWL/FaXfzJ97Kwgc6qqnCnX89BUVyZrGfwDrWbKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
	b=Ju20Qyc69kcoTpn8Bzcsx7dlci+PZwK9rs7JqYx94S6EEC5QS1MDRoPQRP3Ousm9lBdI
	 IgFpngJtb39U+uLy2zI9CA8tBqQzGkvyV33ksryiqnU4Vgb5/nNIaJWf0aWXMCHhe3gnc
	 bx5crvLisbtupsKfy+PaBDNBWijAMoMyoUlJOUFe8Pff9NCGhYC+oVHHVyXbDOe7MiqA0
	 N7/cWE1Iwo8YhqAIXXbCKIAnZim/YMBzu6yMjG3fISmzrwO2oKvyfGEcvcNzTSJO/xeGx
	 4pC+OTBDymyoQV5ZtRAyiOpYky1IbBKNztBPyfwZ5flhQgtttr41aWa01d0N/WvY/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4USJsgp;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB0606A334
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 07:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEB0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4USJsgp
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so314899a91.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740886; x=1793345686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
        b=X4USJsgp9JxA5EpAyYe8aLydL46DSNbPwbJi0kiI0mhWflPQ/M/eMTf/QzhvdpJns3
         twae2P3d37YqaRgrpXtg/lw5LOLDODdegh/tw5SMLihERPY17wrrolsYwJep9ZmwUPGf
         DYWsH3E3C5GmZgQE71/dIeP87dCkCeJhxHCwbhI6fBwC3hJ9BjG+pVl5Dd0m8HenzgUj
         jhooj3bqOBBujEfja6XxIIsCHZRQykXaabQNYzI4aekAzXHbDhZ9e8+q8sGXG9VMI2zh
         ivG8/InhY74SjFOVKV+8ZW+WbRAyEwilMCZiOPz7ZBIh9So81GTK76OGG4AYJ01xfraU
         NUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740886; x=1793345686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tpM4qwPPRxhW556q93X3t6/sYmlkwqaAEQTB2Etyic=;
        b=FeVgq+vNPliiqV0aD0xutwKl0gdQqpnvdT5QrnW2VlegWFiE/+aTnNzydTwF2fpqiv
         wyRpXF9gPUO074QttjdNWJjUUqz361PZy1ndJg0FK7Lb+5gSl//J0iSjng7gXHM9edju
         LBHMEHPUXi2DnPDAQJcNYslRJukgzDNaBotMgKHutEmmjfPITEp1TO6mkYK04nTANVut
         cExPE1mg1FRcMCaN480w1Y5el92hj57VbtbemCThs1HnaGVwrRZy5Ro0cTKqs0KrFvnY
         TyMnD4ZKbrPUQMUjB+exU75kHtF4ECybO+Pit0RqVR/YGugwOeEMNfUBHjLZYMc0t6kc
         Am3g==
X-Gm-Message-State: AFq9FYIua2Tlqn/ZAFfGnDJo5XJtwDegO5TPS4I5T7lf9YwGYHGBj7bp
	CHwy9Lw7vQf2eSpUW4R/rjCZekycX8UKu9RrBYEbR95j0aR0eV88O+GwzhZe23TO
X-Gm-Gg: AYBFou3arNWrTq4M1Ks8Y36mBO4D7OtFo61Giuh7r0SUig1vrnFsiLiqq2PLmqeSYUL
	tsqNWWtIqN+CB+sugfcuYHutzedQ04eXd+ok5WpsemQI8aBNmSlyNMPsio9TX5XB39s6PgJzddl
	2WiqjZqfdLWDpH/9mBYNVXticYI4I1HtJvk7Y9v5Ddj+BO9l/1hSyOdGBpKhbMMZ8LeJiIYeZWB
	UauvU95Axg0NuU2ckmJR8unQadOufBi57BzA/eCCjjuBsvZ8kedjo/WSHzUMYmTpbQvpOeHzpOh
	ms4ezQxF2fPAv+muBBtR0YBey6ozbH+1+BG+g2EsPzCsEe4B5OGqpxe5TeRcEeWjGN+P7SLIlNy
	cMTHMgwl9xbVViM+lwuCh+Gyd4d9YhLAaBdyTLg3vQCFGr675Mgo0lPVPaLHR+WykiO+LVOQO9a
	m2+HgiFRvVPNLBvJ1g5YZAg9ZQha3XXwKL6QmYgZDwjqbVpRTMCHhOXR5IGLF7zjxY+yqm3JZ+4
	YJ4xOEDnxWgf5lfzUFEKzVMI83lS/kqT3Y/avi+5TpKnCJ6dK6HeUWo18Ze3g1WyY/qumnIchg=
X-Received: by 2002:a17:90b:558b:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3adce081433mr1163793a91.39.1792740885915;
        Fri, 23 Oct 2026 00:34:45 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93fbsm2494372a91.16.2026.10.23.00.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:45 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Fri, 23 Oct 2026 15:34:37 +0800
Message-Id: <20261023073437.1517305-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head.
pxa_camera_eof_bh_work() calls list_first_entry() on &pcdev->capture
without checking list_empty() first. The capture list can become empty
between the EOF interrupt and the execution of the queued bottom-half
work: pxa_camera_irq() queues eof_bh_work on system_bh_wq on every
end-of-frame interrupt, and if the DMA completion path runs first,
pxa_camera_wakeup() removes the last buffer from pcdev->capture (e.g.
with a single queued buffer) and stops the capture. The already-queued
bottom half then observes an empty list, obtains the bogus pointer,
stores it in pcdev->active, and unconditionally writes through it in
pxa_video_buf_set_actdma() (buf->active_dma = DMA_Y) before starting
the DMA channels on it, corrupting memory around pcdev and likely
crashing the kernel. This was found by code audit; we do not have PXA
hardware to reproduce it.

The sibling function pxa_camera_wakeup(), which operates on the very
same list and sets the very same pcdev->active, already guards against
an empty list with list_empty() and pxa_camera_stop_capture(). Add the
same guard to pxa_camera_eof_bh_work() so both consumers of
pcdev->capture behave consistently.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/media/platform/intel/pxa_camera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 2269d852a..73ce48650 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1161,6 +1161,11 @@ static void pxa_camera_eof_bh_work(struct work_struct *t)
 	cifr = __raw_readl(pcdev->base + CIFR) | CIFR_RESET_F;
 	__raw_writel(cifr, pcdev->base + CIFR);
 
+	if (list_empty(&pcdev->capture)) {
+		pxa_camera_stop_capture(pcdev);
+		return;
+	}
+
 	pcdev->active = list_first_entry(&pcdev->capture,
 					 struct pxa_buffer, queue);
 	buf = pcdev->active;
-- 
2.30.2


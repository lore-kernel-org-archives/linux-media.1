Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB502857FA
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434096; cv=none; b=XgSgFf2EHFY+1pFlBRpKUy1IrVzneLWnue8PtytyLKzipyCtNOLbMZUZ62753KDP0nEhKoVexOijGfiEeh85QlcCcENJ+7xTORnpM6cgPp5f392Nb5YdG6YgDnMg1ney2jAchAXMolBen5emjDbKxrAcaTvjh/t0Ht4/DBUi7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434096; c=relaxed/simple;
	bh=a2CvPDWK8OINt/Yx73WFbopm3aGUJjkMAmtmX/0I7hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4/MD6YAQY5/3m5Ig2ypSgMHTxpLmJY5ym2aPzYr5FzJWZ3waivKzOtZZTL/QV3/qOO4NV2MGP9mLxqSIa59+2Mo3ZlEx5QHcYKYDxNLKhW8tKNh5S7H2V6r8iPXG+otsaPWTMVBiGXZ8sWEJBaCce7h+AjYBJTkooOaiq8aIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb/lczxz; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb/lczxz"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90ceab90152so37865136d6.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434094; x=1790038894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJid9mVb8+u4dBU/DUaqBCMQDqXmAvzr8S+H2u9/oJc=;
        b=Yb/lczxzVoVQ05eyjgvfZgg9XtQygMMGTYHxO8JxAOH34EncYaTPq3u7sGew1qo7gy
         BR/+xKBrKT+Rgrnf5PoKbD0FWWMBWxCTZmOdl9NJXFNnd2YuB5jiTB45QjtBuwptx8sC
         BFqBZUaxZcTw96NVKWmlWET00tYHmx/QXVPmMswvCfWGMdt7XOsS1iQmmCpNzfqmzNhe
         aXqUahp9VvNPsVU4Sn/dEhI8ruFUj/H5HA7vi9VxihNNZ+bMwBeTV+20/10roc48BqWr
         +phPeu6GanX5oAa33nLpxq7/uhYNiK9uUknnbk794MdOayVGfIf5qMjtdhHAxX0sftfN
         6ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434094; x=1790038894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJid9mVb8+u4dBU/DUaqBCMQDqXmAvzr8S+H2u9/oJc=;
        b=YUwv67VBCOGybAFSyjsGgxwQf3QAeSFSnif55QgPX+zAYBE/5Oc1iGEqGNmMrJdBds
         e0DY4TN/1L8fbfIUmnbYfNhb70M+t+BDEjrNklFUPA6BWLvnEb6lMXOxhI4JG/AQXFKT
         XOvaPyNk8uH3YjrSFEFje23YlGm8rBlMGIYh/nDwYA92JVYTR0nKwbHmCoSu0++tjV09
         kxpLyS/zyY6UC/yRxjSGnSjdBn3N2ZfxMgRA0Vd7gLWxMQXXJkAI5JXqjl4QL+nRQ/1Z
         wpG24eVrkp34keCveaSSLiItnuwong0ijtJmLCdEMyh4IT5DbFlShgX3UuyC3MPrcMz6
         8jaQ==
X-Gm-Message-State: AFuF++lyKr5QZSYbiSaxwsDir4wDbCfrJB1p+dsiu8ogjg4CDfl3XMuR
	nXJqoE6u3HScAjfekUKbNOjU09UwJgqTDXaMf2Q53fZoBW/CeKk1Vlk9JFAR/71H
X-Gm-Gg: AYBFou1z5vyzkM9VTHFpC4AP8m3SSPrl+mh2QPMPmoCn0byZG/ocHNr0mC7MY8RjkBJ
	rq35R0eMr63XEkOntbH4uVVib3qBCoHNuK3BEo8ki+d5yxc3VMtwtVtWxDLorUpynxeV/JMTJYT
	ded85fVp+s9iMdFgg7d+xmSDsarwTDYtnvT4jJGasy80kGd05ZYUBjEc0vTL1CCxKC+vWXUj5yJ
	8+H2gEajBFK18dVIYA88jjIjpot1J4C+rrzCwWP91ZnRT99VSarCTNSfA7I9a+9aXszZN8v3cjB
	oQ8SXz8iT3868d/89W3YPhA+aDniSV3dx+eZyapMGjB4DR6JWLriJ28eXrd6oCCI/73mixIXOsY
	T779sRzlMqYgRvkhgI4ahiajpXU2yofgYPK0qYAUqSAdPetWcoHZMGqHjaMocSHRat9Pi14nq4b
	uYPZzPof2iG6FaqDvtgAxM5/Po+b5DRsS/m+oHg+nWKTJNlHTF08HZ7QqkoZlv39BSi836iX3lk
	2+6KrVqEKWNGflMAnfjiE9OBHZu2bzhJVOIMWSnVOVx12OL
X-Received: by 2002:a05:620a:2955:b0:939:6df9:6547 with SMTP id af79cd13be357-93a29bf983cmr753040985a.51.1789434076622;
        Mon, 14 Sep 2026 18:01:16 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18467sm1147705885a.11.2026.09.14.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:01:16 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: hws: serialize video quiesce with queue state
Date: Mon, 14 Sep 2026 21:01:11 -0400
Message-ID: <20260915010111.101551-4-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
References: <20260915010111.101551-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suspend and shutdown call vb2_streamoff() without taking the state mutex
used by the video device and its vb2 queue. This can race userspace queue
operations and violates the locking requirement in hws_stop_streaming().

Hold the channel state mutex around the streaming check and streamoff.
Serialize monitor passes with lifecycle quiescence, and recheck suspended
state after acquiring the monitor mutex so a delayed pass cannot enter
hardware access after teardown has drained it.

Reject readiness checks once suspension begins. If the core is not ready,
return an error instead of resetting shared hardware while another
channel may still own capture buffers.

Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
Assisted-by: Codex:GPT-6
Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws.h       |  2 ++
 drivers/media/pci/hws/hws_pci.c   | 11 +++++++++--
 drivers/media/pci/hws/hws_video.c | 11 +++++++++--
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index d87d52674b69..01a6b00dcca6 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -8,6 +8,7 @@
 #include <linux/kthread.h>
 #include <linux/pci.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/sizes.h>
 #include <linux/atomic.h>
@@ -161,6 +162,7 @@ struct hws_pcie_dev {
 
 	/* Kernel thread */
 	struct task_struct *main_task;
+	struct mutex monitor_lock; /* serializes monitor and lifecycle changes */
 	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
 
 	bool suspended;
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index c9397b13392a..7fdb1087d247 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -177,8 +177,10 @@ static int main_ks_thread_handle(void *data)
 			continue;
 		}
 
-		/* avoid MMIO when suspended (guarded above) */
-		check_video_format(pdx);
+		mutex_lock(&pdx->monitor_lock);
+		if (!READ_ONCE(pdx->suspended))
+			check_video_format(pdx);
+		mutex_unlock(&pdx->monitor_lock);
 
 		try_to_freeze(); /* cooperate with freezer each loop */
 
@@ -338,6 +340,10 @@ static void hws_block_hotpaths(struct hws_pcie_dev *hws)
 	if (hws->irq >= 0)
 		synchronize_irq(hws->irq);
 
+	/* Wait for a monitor pass that started before suspended was set. */
+	mutex_lock(&hws->monitor_lock);
+	mutex_unlock(&hws->monitor_lock);
+
 	if (hws->bar0_base)
 		hws_irq_clear_pending(hws);
 }
@@ -357,6 +363,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws->pdev = pdev;
 	hws->irq = -1;
 	hws->suspended = false;
+	mutex_init(&hws->monitor_lock);
 	pci_set_drvdata(pdev, hws);
 
 	/* 1) Enable device + bus mastering (managed) */
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index bdbce09ec3e6..8e029b71b5b5 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -611,6 +611,8 @@ int hws_check_card_status(struct hws_pcie_dev *hws)
 
 	if (!hws || !hws->bar0_base)
 		return -ENODEV;
+	if (READ_ONCE(hws->suspended))
+		return -EBUSY;
 
 	status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
 
@@ -621,9 +623,12 @@ int hws_check_card_status(struct hws_pcie_dev *hws)
 		return -ENODEV;
 	}
 
-	/* If RUN/READY bit (bit0) is not set, reinitialize the video core. */
+	/* Runtime reset would invalidate every active channel's DMA ownership. */
 	if (!(status & BIT(0))) {
-		hws_init_video_sys(hws, true);
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "SYS_STATUS not ready (0x%08x); runtime core reset refused\n",
+				     status);
+		return -EIO;
 	}
 
 	return 0;
@@ -1349,6 +1354,7 @@ int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason)
 			continue;
 		}
 
+		mutex_lock(&vid->state_lock);
 		streaming = vb2_is_streaming(q);
 		if (streaming) {
 			/* Stop via vb2, which runs .stop_streaming. */
@@ -1357,6 +1363,7 @@ int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason)
 			if (r && !ret)
 				ret = r;
 		}
+		mutex_unlock(&vid->state_lock);
 	}
 	return ret;
 }

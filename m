Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DE93009E2
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140795; cv=none; b=pOvOeGwC6aInGBO4jyihf3JQsMI9vaS7/l4Lw6i+s6vUFxIfaTDohTS2SB1TQMEMd0JxozTfgsnqoHgStaeDn9ZwVyQ6rGOk1yEThrhJFqrg8kFPXHTpssIkFa9DaqBqWsPKKecRPROw5K3H0i/araTo/nyNT3fAOCwo6LASHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140795; c=relaxed/simple;
	bh=rd4bVtBebW5Eh3X9btyAfOosrbirLB3M1wbnj3/C+mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1kNWVc1fDHepSzGy6lD9J09afIO6QuhaaFtzkcnGO/Wr9BQsfVC3a32lnq/uZRSbyqfjrs9B2s87MWmT2mr9pFZzWPPNsATdbsOSKuOstKoyeRyN/CMeR8Dn53Avtbrl+o6mqr3Q9Rq8FYIGdqFGcAVZFDiBp4S6SrQl8HHd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh+9KJWR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh+9KJWR"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeafso39564485a.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790140793; x=1790745593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xv3eebB7JJQAp3Uiqk1W5LHA/Ob2Oi0cbs08SqtlKHI=;
        b=Uh+9KJWRKSuR4dXeYYSL9Bh7Ke/kxwRKu57nLCFnC++eHkjr50M1zXVBr0+7XbA9eg
         9uLjwwDZ2DuS9FVTA2O0jVXFFwSwYoz6nszwJZAb2SzwCReCzTdXLfBCPKmZIGMgbwhA
         rw78PGeVkXE8JS5kRuG970uyZfvAKjz6b7THA0rwNbXeoGFYAVV5E6V5AhiISOOdg2am
         urfZatCo0upDueOK/brmYxImgN2k+X/JH8votrDrOlmyr+6t0qSukdUrgrVI2Q7N6Fij
         mfgV+9Gz8Rl36mkh1mysd9JRxB9esfYiI8CFsf2Og9irWhMzxwV3Cy0OuAzAykdMgPPM
         +jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790140793; x=1790745593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv3eebB7JJQAp3Uiqk1W5LHA/Ob2Oi0cbs08SqtlKHI=;
        b=ubeo0WZ5abCZ1uv51y/csMMGDB5duCSwWvbn3XSgoJzHfYqXHDuT7yOghWHiGS5ibh
         A5KQYTPzvGZzLC8ykPpEymn8Mx5m0yjye2MTGobAy3ZSwOZroGX7hQPcoqAsb5xv9V+p
         hgDaopaIVxIiV78DocdbXPEsbqWVYsJn4mBfx8XJsqtnq3Ri7cpMTqC6fcGKaUCxL/Ez
         +x+L8dchIhm9FX10kndTNX/wcWLU0KCEb5zz8PaeiF61c1GhsQgc4We5gfnNCXU10aAl
         QwOQNvkKxPsdSM/86xkxqVuWWFVJR6Zwuu0gN8G/odFOqX6Y1eizjj8HDsYvR4eAYFHK
         Djjg==
X-Forwarded-Encrypted: i=1; AKwUvBxSU7z+8oK7mNErxgFJb5OVjIBMLcRK6WZzJs+DGgJQ38BgkTYWFsDPnen45mBZX3ENmNSAp3NVqMeltg==@vger.kernel.org
X-Gm-Message-State: AFuF++lE2bz/6pvCWvpubT8Vg9hQ7oWRJ/jdhiJKMkzVgDsTcp+hD8f9
	B2VzbP+5MDqKkl9qHNTspI3Tk5iZCfFti5slL1oq+MSmugroD3Y2tNP+kMVPG9AnOP8WRPE=
X-Gm-Gg: AYBFou0r9EIbIZ5fLj6kiaLX22CA3w4yxFORRUWbxan5qyU9WKL9dPyoIUU7rnpJUvK
	LJ8j2vlBj94SphAUhUjql+ZDLn0x/AyOqswGzJ3TevsE0PtsfW5PUhJEXK0udBuSl2c5VmIUU3p
	NGHfnkrPXYS3xiWJihuwQeYP/v9zSuIACaHmcdMXH/sDh/LoDcBHv+i7B+XetK5cCrDAmEKs8e5
	UdGmsTEqi5pFJbm3ZL9ajvbgHvQKoDYAd1b9Gzzhy1gIqJ8CBITfNChkKrhqWpUryQ5ANCUDvPe
	MjAuGK9F8jvsbIEgh/csYy7ONFWYML6yPBlzheqz3IAPB5xuagsyRkgKDBkhGz2qSndHRAYPyWB
	lQTUihZE7TzbKMD5eXx9zkfEf9I7VeIhRvllGMUeHij0yTWn4lHnyAHI1Qv1zaAOBGCWDgsGNO7
	CqQdZYvrrzpwZK+PxSfLCBHkSLkUnuUE2Ls6phVLveDwaG8GdAqK88oJA7AonI992znM+A3yfRp
	r41IphEswtxL2d5vEdUrqDMQhfoASq0SAkk4gBVl/IZZLFtLrsjk6IaFozDBVbk5nJMMkw9akaa
	BfN2mwKCcvIILQuzX3F54PueBcknaSXxGy/6f7/iLyPDNoPuY3kzof2xVbMxtR2beKmoE5NOlP5
	fGVIQHDw59NUh
X-Received: by 2002:a05:620a:8810:b0:93b:e917:6888 with SMTP id af79cd13be357-93c251052e9mr240052285a.33.1790140792573;
        Tue, 22 Sep 2026 22:19:52 -0700 (PDT)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248b7f22sm149877685a.37.2026.09.22.22.19.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 22:19:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: amphion: Stop mailbox RX before freeing the message buffer
Date: Wed, 23 Sep 2026 01:19:50 -0400
Message-ID: <20260923051950.89403-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() frees core->msg_buffer and clears core->vpu
before cancelling the message workers.  The fifo keeps its own pointer
to that buffer.  The core workers read it and queue inst->msg_work,
which uses core->vpu and may send on TX.

vpu_isr() fills the fifo from the mailbox RX callback.  i.MX MU
free_irq() waits for that callback, not for the queued work.  An open
instance holds a runtime-PM reference, so remove can skip runtime
suspend and leave RX active.

Stop RX, then drain the core workers and the instance workers they
queued with vpu_core_cancel_work(), while core->vpu and TX are still
valid.  Free the buffer and clear core->vpu after that drain.  Drop
the runtime reference only then: runtime suspend frees every channel.

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 28 +++++++++++++++++++---------
 drivers/media/platform/amphion/vpu_mbox.c |  9 +++++++--
 drivers/media/platform/amphion/vpu_mbox.h |  1 +
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..000000000000 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,21 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }
 
+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);
 
 	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
 
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}
 
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+	core->vpu = NULL;
+
 	return 0;
 }
@@ -700,10 +702,18 @@ static void vpu_core_remove(struct platform_device *pdev)
 	WARN_ON(ret < 0);
 
 	vpu_core_shutdown(core);
-	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
-
-	vpu_core_unregister(core->parent, core);
+	/*
+	 * Runtime suspend frees every mailbox channel, including TX,
+	 * and is skipped while another runtime-PM reference remains.
+	 * Stop RX first.  vpu_core_unregister() then drains the core
+	 * workers and the instance workers they queue, which may still
+	 * send on TX, before the fifo buffer and core->vpu are released.
+	 */
+	vpu_mbox_free_rx(core);
+	vpu_core_unregister(core->parent, core);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	vpu_mbox_free(core);
 	memunmap(core->fw.virt);
 	memunmap(core->rpc.virt);
 	mutex_destroy(&core->lock);
diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/platform/amphion/vpu_mbox.c
index b2ac8de6a2d9..521fd47f1d90 100644
--- a/drivers/media/platform/amphion/vpu_mbox.c
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -88,14 +88,19 @@ error:
 	return ret;
 }
 
+void vpu_mbox_free_rx(struct vpu_core *core)
+{
+	mbox_free_channel(core->rx.ch);
+	core->rx.ch = NULL;
+}
+
 void vpu_mbox_free(struct vpu_core *core)
 {
 	mbox_free_channel(core->tx_type.ch);
 	mbox_free_channel(core->tx_data.ch);
-	mbox_free_channel(core->rx.ch);
 	core->tx_type.ch = NULL;
 	core->tx_data.ch = NULL;
-	core->rx.ch = NULL;
+	vpu_mbox_free_rx(core);
 	dev_dbg(core->dev, "%s free mbox\n", vpu_core_type_desc(core->type));
 }
 
diff --git a/drivers/media/platform/amphion/vpu_mbox.h b/drivers/media/platform/amphion/vpu_mbox.h
index 8b7aea4f606c..a934fe61b294 100644
--- a/drivers/media/platform/amphion/vpu_mbox.h
+++ b/drivers/media/platform/amphion/vpu_mbox.h
@@ -8,6 +8,7 @@
 
 int vpu_mbox_init(struct vpu_core *core);
 int vpu_mbox_request(struct vpu_core *core);
+void vpu_mbox_free_rx(struct vpu_core *core);
 void vpu_mbox_free(struct vpu_core *core);
 void vpu_mbox_send_msg(struct vpu_core *core, u32 type, u32 data);
 void vpu_mbox_send_type(struct vpu_core *core, u32 type);
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.47.1

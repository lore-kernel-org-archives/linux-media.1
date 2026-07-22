Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2214C77A5;
	Wed, 22 Jul 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715827; cv=none; b=G7NKslTL8JzjWjJ0V3uKklWCM1GSrenVI/0FVibLdBqw2E/3V51Zb7bYUIm21uSkbMEXfQnPSZ7/9bWTHO6+/8wfHHc5z+MynIlTOGITQtJbUwMvFnAxNBDTaUKSKy9edrhHI43MN9s7Vc2v4w008Y6S7JjTHbkrGz34ubjpTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715827; c=relaxed/simple;
	bh=4CpmGGiYX0XDIWEvB5BLJQQ+5BYs2QbT7UxoeJF38kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGB2B07A8Dk4GGnz76rds11gU0gnjqB/zc2fX6XcoOgi73Sqcu/SUtJsZtpQUGVArUEmSoFCI7Fe8M4ILiEnQpkaN+/6gK1LDXoKTKj92jyIYrNlJcMw5hv7/mqTznhD4dXlsyAZmn/fnnbK2vY9Qzy7v+Tdw/apXSz+7BJQvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=S6lho7Cz; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=S6lho7Cz; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S6lho7Cz";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S6lho7Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715823; bh=4CpmGGiYX0XDIWEvB5BLJQQ+5BYs2QbT7UxoeJF38kY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S6lho7Czl+rXsDUPPExvYeDZ0iwlJWgcS8FchgF/ciRpp8TbvwbwmtCd8C0vrzN1j
	 jNYoa8SCj5p2piaA755k7O8ht+ce0ZTElAOlryIFtmWVq8S2HRYQzVd3x/IrctGnIM
	 RO3HGv0l6w3v0rQU/F4ZvoPSk/RR2pATn9J1aycPA1rR+RvRRF1URHI6NuNhWD9HWM
	 vtU1LX3sYPgDrdiF/WiBK5o74yU+eXA7vR7RS1QInu+paXTjvbyXrm8tzmNsQuZLhA
	 c+UlfQ5/pEk6vpDMVTQL4G2lzZsH5hZEfhsabK+rnBXnCBvAqK5dmus+SO+96PkrXb
	 FJFYX0+dnaaMQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id F3B0D42540; Wed, 22 Jul 2026 11:23:43 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715823; bh=4CpmGGiYX0XDIWEvB5BLJQQ+5BYs2QbT7UxoeJF38kY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S6lho7Czl+rXsDUPPExvYeDZ0iwlJWgcS8FchgF/ciRpp8TbvwbwmtCd8C0vrzN1j
	 jNYoa8SCj5p2piaA755k7O8ht+ce0ZTElAOlryIFtmWVq8S2HRYQzVd3x/IrctGnIM
	 RO3HGv0l6w3v0rQU/F4ZvoPSk/RR2pATn9J1aycPA1rR+RvRRF1URHI6NuNhWD9HWM
	 vtU1LX3sYPgDrdiF/WiBK5o74yU+eXA7vR7RS1QInu+paXTjvbyXrm8tzmNsQuZLhA
	 c+UlfQ5/pEk6vpDMVTQL4G2lzZsH5hZEfhsabK+rnBXnCBvAqK5dmus+SO+96PkrXb
	 FJFYX0+dnaaMQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E27DA42528;
	Wed, 22 Jul 2026 11:23:42 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] media: rc: Fix race condition during rc_register_device()
Date: Wed, 22 Jul 2026 11:23:25 +0100
Message-ID: <3605fbe4b95f8c3f92849b67a7b8b79b28dad736.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The correct sequence for rc core is so:

     rc_allocation_device()

     /*
      * setup hardware and now calls to ir_raw_event_store etc are
      * permitted, as well as rc_keydown. There is no rc device in sysfs
      * or lirc chardev.
      */
     rc_register_device()

     /*
      * After rc_register_device(), the rc device can be used now from lirc
      * chardev, sysfs and IR is now decoded and reported.
      */

     rc_unregister_device()
     /*
      * User space can no longer access /dev/lirc or the rc sysfs
      * attributes. They will get -ENODEV if they still have a file
      * descriptor open.
      * Calls to ir_raw_event_handle() etc or rc_keydown() are permitted
      * but they must stop before the call to rc_free_device(), so
      * this is the time to stop the hardware.
      */
     rc_free_device()

This means that during rc_register_device(), we can get calls to
ir_raw_event_{store,handle,overflow,store_with_filter}. Ensure this
is done race-free.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-ir-raw.c | 20 +-------------------
 drivers/media/rc/rc-main.c   | 18 +++++++++++-------
 2 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 26962b500b0c..963562f03770 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -71,9 +71,6 @@ static int ir_raw_event_thread(void *data)
  */
 int ir_raw_event_store(struct rc_dev *dev, struct ir_raw_event *ev)
 {
-	if (!dev->raw)
-		return -EINVAL;
-
 	dev_dbg(&dev->dev, "sample: (%05dus %s)\n",
 		ev->duration, TO_STR(ev->pulse));
 
@@ -102,9 +99,6 @@ int ir_raw_event_store_edge(struct rc_dev *dev, bool pulse)
 	ktime_t			now;
 	struct ir_raw_event	ev = {};
 
-	if (!dev->raw)
-		return -EINVAL;
-
 	now = ktime_get();
 	ev.duration = ktime_to_us(ktime_sub(now, dev->raw->last_event));
 	ev.pulse = !pulse;
@@ -129,9 +123,6 @@ int ir_raw_event_store_with_timeout(struct rc_dev *dev, struct ir_raw_event *ev)
 	ktime_t		now;
 	int		rc = 0;
 
-	if (!dev->raw)
-		return -EINVAL;
-
 	now = ktime_get();
 
 	spin_lock(&dev->raw->edge_spinlock);
@@ -166,9 +157,6 @@ EXPORT_SYMBOL_GPL(ir_raw_event_store_with_timeout);
  */
 int ir_raw_event_store_with_filter(struct rc_dev *dev, struct ir_raw_event *ev)
 {
-	if (!dev->raw)
-		return -EINVAL;
-
 	/* Ignore spaces in idle mode */
 	if (dev->idle && !ev->pulse)
 		return 0;
@@ -200,9 +188,6 @@ EXPORT_SYMBOL_GPL(ir_raw_event_store_with_filter);
  */
 void ir_raw_event_set_idle(struct rc_dev *dev, bool idle)
 {
-	if (!dev->raw)
-		return;
-
 	dev_dbg(&dev->dev, "%s idle mode\n", idle ? "enter" : "leave");
 
 	if (idle) {
@@ -226,7 +211,7 @@ EXPORT_SYMBOL_GPL(ir_raw_event_set_idle);
  */
 void ir_raw_event_handle(struct rc_dev *dev)
 {
-	if (!dev->raw || !dev->raw->thread)
+	if (!dev->raw->thread)
 		return;
 
 	wake_up_process(dev->raw->thread);
@@ -612,9 +597,6 @@ EXPORT_SYMBOL(ir_raw_encode_carrier);
  */
 int ir_raw_event_prepare(struct rc_dev *dev)
 {
-	if (!dev)
-		return -EINVAL;
-
 	dev->raw = kzalloc_obj(*dev->raw);
 	if (!dev->raw)
 		return -ENOMEM;
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index dda3479ea3ad..365f3d056a06 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1701,14 +1701,24 @@ static const struct device_type rc_dev_type = {
 struct rc_dev *rc_allocate_device(enum rc_driver_type type)
 {
 	struct rc_dev *dev;
+	int ret;
 
 	dev = kzalloc_obj(*dev);
 	if (!dev)
 		return NULL;
 
+	if (type == RC_DRIVER_IR_RAW) {
+		ret = ir_raw_event_prepare(dev);
+		if (ret < 0) {
+			kfree(dev);
+			return NULL;
+		}
+	}
+
 	if (type != RC_DRIVER_IR_RAW_TX) {
 		dev->input_dev = input_allocate_device();
 		if (!dev->input_dev) {
+			ir_raw_event_free(dev);
 			kfree(dev);
 			return NULL;
 		}
@@ -1724,6 +1734,7 @@ struct rc_dev *rc_allocate_device(enum rc_driver_type type)
 		spin_lock_init(&dev->rc_map.lock);
 		spin_lock_init(&dev->keylock);
 	}
+
 	mutex_init(&dev->lock);
 
 	dev->dev.type = &rc_dev_type;
@@ -1917,12 +1928,6 @@ int rc_register_device(struct rc_dev *dev)
 		dev->sysfs_groups[attr++] = &rc_dev_wakeup_filter_attr_grp;
 	dev->sysfs_groups[attr++] = NULL;
 
-	if (dev->driver_type == RC_DRIVER_IR_RAW) {
-		rc = ir_raw_event_prepare(dev);
-		if (rc < 0)
-			goto out_minor;
-	}
-
 	if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
 		rc = rc_prepare_rx_device(dev);
 		if (rc)
@@ -1980,7 +1985,6 @@ int rc_register_device(struct rc_dev *dev)
 	ir_free_table(&dev->rc_map);
 out_raw:
 	ir_raw_event_free(dev);
-out_minor:
 	ida_free(&rc_ida, minor);
 	return rc;
 }
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514796;
	b=DEWPvQ6V3LY2r2WvDskiLegAh4QD392fOFRsMH3keBzny0Qe1gq2fnP6T+NfAp2uJt8o
	 3QKPZkL2jGZXGXDUnVqaV8SEXoXrEiNcVTy7FUYS/ruI+ZDEvXLk0V8tPBbs40/peW2iD
	 QWwnNdaswCYYlvZgocPLUn8E7oqPJNRFRBYgAb48ExfwwoYDFvYQIRAUQ49V9MZuDjyYb
	 GdciBpj3Ww+7DzXXvH2kxxcdJWT2T+uKaud5wDnf9IKFSrxS94pxpg+hHEQy35M7GAd5W
	 9l4h9+Ku2YFP7InnpZc+d177I4/FtBFQCOfAgf6zXksR5ECr3tDAMmv4Q4KdI91qfBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tNKqZdSSUUBfuad1yYKsj9b98/kpbpS+TMopq3UE6ho=;
	b=VtzClBleoYdzSHrxpZn4kmC5HQRA9aYByRUtYWKEh2EOaaeV2lrQuRu8d9pfqE3fW0/t
	 kt/ou8OvtO70+Kx7kI8CpZubxjk9L5NYKvVUio+K2TkP/Pxrv2S9JOTFyru1h2dRKkUze
	 EJ8PCrJLLRvNxgfgFz2Ttceyv8NanT3EzC+XZfnte/Z27AGaNE16CB737AzyCAECwEp8a
	 JitiRGKeQDurHStcWH2XbOwEHUVMeCe4JBCgZzRNa3p2gcH0kn+8hLo4DrVS1lwlw5vpr
	 27XxRu/FB6BtO2jyZrIf4e72rW5Zsik5Lwskl/fRQ5FJmBFG9nXu1LYVLfNaCI04usQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=C5KlXt2y;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519C606A681
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B519C606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=C5KlXt2y
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F8443FE3D
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514790;
	bh=tNKqZdSSUUBfuad1yYKsj9b98/kpbpS+TMopq3UE6ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=C5KlXt2y4v6hFuw2605lN82GAKJwf+xdiBCLebLAIBOZE/Ft2GQqsydTpM2BLvX5c
	 736rzOGtJVlBwJRKbasedLK2TicfoiLVmuyNeqtNhJvNP5wwN2BaVpizW1tIGQvdRq
	 cEy3Z/fUU6WC1Z2nrDaHYl6FL87ll/WYTz0+AKTmaRbpdwjgJ/vI7Cv4ttLk4lS/pg
	 IU610gkEzf8dMr65+VVz7HDml+vhIBRYjWigf7Kku1fsD8KMR+ElwuPM7M7+LSgZBX
	 1bAlok2lNg7bB1WCK1HAkXKPPlhUDQxJci6Dea7u03X4chY5e+7/BobfQS6K56yJdd
	 LmDr+ra7xpbhpxrIVq9J7iOIx4kErIOmKbTeswom78g63N9koWh2b3EMIrdg2yucmL
	 Ol6O59hXSQZ2LXZzpooy3G7/ByJIEudcRVGhSmAYtPkFl1HNZTbdVa5WNfX1XuhwPs
	 n24bZ5PTtnjEdHe5475e3bzknM5+qaANfN+KxLm+FUJg6nvd2Ft8+3q8J5NStVcMXg
	 evnQLHdVwi/Ztdd2m56j8a0bqAsrYyv9KVuDdQooS2ApQEJR4U/arD3Y3z3MFMxyDn
	 F54rlx/Fbh3W/vU05nJwXTCIwOiqhscf+kLnfciu1kTccg/DaetPOx9bKCcUMhCn4w
	 ojj/Of/pqFvBM8uJYPFMEb8U=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso30513205e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514789; x=1796119589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNKqZdSSUUBfuad1yYKsj9b98/kpbpS+TMopq3UE6ho=;
        b=NjH9i4jVNrFJlZaDgciYFY4JJiW9Ep0+WoqCmeEvSj1j9LmeDFDfk/1pfQF0gmUhTl
         sG7GRY+pm5QxAoYy2WGNo/D+NVDS09gQjH839fmOZnOJhbJXWr2tnYg9F843LadCpCtt
         vxjJKLSuFRh/pAyHRZ7vjotcHdYOlVk1Xizwecz0JCbYGdQjjLvOrFS5xV73ny1q78jq
         /wwewHw8dccu2sjr/X1yBlI1laSVvPm5EPIz81Brw9d+44Tn9FGrIbMDYK9qbW7z6Xs8
         rul7+R8LmC9xPBHpFgP1iFl2yxjh9lfJqWJ87npL4BUOmTQwx2mG1JqK9kYIXAwoB5Dn
         S8qQ==
X-Gm-Message-State: APuU4Z9nIeAxzZBtuZuWzJ57iqKq99JfJyudd+OoGQq2rppTPC6FqdrE
	wv/H7Nk6/lKDV7XlVj4ekVQXiQvz+uEnoWnQQ/hDdA2VYAA6iseDSssafkwGgXmioqNejZNuT4a
	IklJiZ35or8REJk2uZnERZbBhmDpNizX+fKnSyy/ihg/XbvLaMuFLJ03FQ2jAgUPKbUbyTHkRGL
	2z8gXd7vOTbegm
X-Gm-Gg: AZFdTZfpSIQNxTHJByjjhBxzL07VMvPwQG88Vefy+4oImSGJxfcPt0VQylUkKNmjBDL
	EuPK0xJ/C1Jitt89qMugdJf1SNuP4mqSrVdYLJ0rgsmR3Q3Cg0FzpWMtkesGAynLQG3i5MEqOVA
	A5RY9+t7apAORlxcCqho/h85fCOPn8ReoUyRRn7lKNb9mkg3y5hrNmU+xrygVwj/qJbAFHV9hay
	r22Og6d5ptnwerbt1E0vPq5oaIugzPRa6x+GPDIK7PYRzb2Yc/xvQi9DhRX8XoaNzLWlt90jUOS
	e2AwSmlf2FLMw/JyCc3MaiVKUBMRc8eSqkAVmbLFW1K7WzUMamQKcCWSqwzY1rT3Mny6gdO5r0E
	BJps7STr7kn2b0L+vKAApCzEHVFDX3JTNWkl7clbzG1mWIjd3ALe0HCzZ6+EmotE=
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr265309255e9.20.1795514789573;
        Tue, 24 Nov 2026 02:06:29 -0800 (PST)
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr265308765e9.20.1795514789056;
        Tue, 24 Nov 2026 02:06:29 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:28 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 3/3] media: uvcvideo: Do not abort resume when restoring controls fails
Date: Tue, 24 Nov 2026 10:06:23 +0000
Message-ID: <20261124100623.2227323-4-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
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

uvc_ctrl_restore_values() delegates each pass to uvc_ctrl_commit_entity()
and returns at the first error. This has three problems on failure:

1. Within the failing entity, uvc_ctrl_commit_entity() aborts all
   subsequent dirty controls and overwrites UVC_CTRL_DATA_CURRENT with
   UVC_CTRL_DATA_BACKUP, which is never populated for a restore and
   holds stale data from before the control was last set.
2. If a master control fails to restore in the first pass, continuing to
   the second pass would evaluate uvc_ctrl_is_inactive() against a
   corrupted or unapplied master value and write manual slave controls
   while the hardware is still in auto mode.
3. Remaining entities are never restored, and __uvc_resume() returns
   early, skipping uvc_status_resume() for the status interrupt URB.

The USB core only logs the error returned by a reset_resume() handler:
usb_resume_interface() prints "reset_resume error %d" with dev_err() and
does not set intf->needs_binding on failure (that flag is only set for
drivers that do not implement reset_resume()), and usb_resume_both()
ignores the value returned by usb_resume_interface(). The interface is
therefore neither unbound nor rebound when reset_resume() fails, so it
is safe to report the error.

Restore each control directly with UVC_SET_CUR instead of calling
uvc_ctrl_commit_entity(), preserving UVC_CTRL_DATA_CURRENT and continuing
through all remaining controls and entities on error while recording the
first error encountered. Track whether a restored control succeeded via
ctrl->loaded so that uvc_ctrl_is_inactive() also skips slaves whose
master failed to restore in the first pass, and reset ctrl->loaded
afterwards for auto-update and write-only controls. Finally, always
resume the status endpoint in __uvc_resume(), prioritizing any status
endpoint resume error over already-logged best-effort restore errors.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 80 +++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c | 22 ++++++--
 2 files changed, 64 insertions(+), 38 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d11ad3da1d50..b773efef4441 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3199,31 +3199,44 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
  */
 
 /*
- * Report a failure to restore the controls of an entity. @err_ctrl points to
- * the control that failed, or is NULL if the failing control is not known.
+ * Report a failure to restore a control.
  */
 static void uvc_ctrl_restore_error(struct uvc_device *dev,
-				   const struct uvc_entity *entity,
-				   struct uvc_control *err_ctrl, int ret)
+				   struct uvc_control *ctrl, int ret)
 {
 	const struct uvc_control_mapping *mapping;
 	const char *name = "Unknown Control";
 
-	if (!err_ctrl) {
-		dev_warn_ratelimited(&dev->intf->dev,
-				     "Failed to restore controls on unit %u: %d\n",
-				     entity->id, ret);
-		return;
-	}
-
-	mapping = list_first_entry_or_null(&err_ctrl->info.mappings,
+	mapping = list_first_entry_or_null(&ctrl->info.mappings,
 					   struct uvc_control_mapping, list);
 	if (mapping)
 		name = uvc_map_get_name(mapping);
 
 	dev_warn_ratelimited(&dev->intf->dev,
 			     "Failed to restore control %s (selector %u on unit %u): %d\n",
-			     name, err_ctrl->info.selector, entity->id, ret);
+			     name, ctrl->info.selector, ctrl->entity->id, ret);
+}
+
+static int uvc_ctrl_restore_ctrl(struct uvc_device *dev,
+				 struct uvc_control *ctrl)
+{
+	int ret;
+
+	uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
+		ctrl->info.entity, ctrl->info.index, ctrl->info.selector);
+
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, ctrl->entity->id, dev->intfnum,
+			     ctrl->info.selector,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+			     ctrl->info.size);
+	if (ret < 0) {
+		ctrl->loaded = 0;
+		uvc_ctrl_restore_error(dev, ctrl, ret);
+		return ret;
+	}
+
+	ctrl->loaded = 1;
+	return 0;
 }
 
 /*
@@ -3247,7 +3260,8 @@ static bool uvc_ctrl_is_master(const struct uvc_control *ctrl)
 
 /*
  * Return true if the control is currently inactive, i.e. it is a slave
- * control whose master is not in manual mode.
+ * control whose master is not in manual mode, or whose master failed to
+ * restore in the first pass.
  *
  * The master value is read from the driver's cache when available, or queried
  * from the device via GET_CUR if the master was neither restored in the first
@@ -3275,9 +3289,11 @@ static bool uvc_ctrl_is_inactive(struct uvc_device *dev,
 		if (!master_ctrl || uvc_ctrl_mapping_is_compound(master_map))
 			continue;
 
-		if (!(master_ctrl->modified &&
-		      (master_ctrl->info.flags & UVC_CTRL_FLAG_RESTORE)) &&
-		    !master_ctrl->loaded) {
+		if (!master_ctrl->loaded) {
+			if (master_ctrl->modified &&
+			    (master_ctrl->info.flags & UVC_CTRL_FLAG_RESTORE))
+				return true;
+
 			if (!(master_ctrl->info.flags &
 			      UVC_CTRL_FLAG_GET_CUR) ||
 			    __uvc_ctrl_load_cur(dev, master_ctrl) < 0)
@@ -3312,17 +3328,16 @@ static bool uvc_ctrl_is_inactive(struct uvc_device *dev,
  */
 int uvc_ctrl_restore_values(struct uvc_device *dev)
 {
-	struct uvc_control *err_ctrl;
 	struct uvc_control *ctrl;
 	struct uvc_entity *entity;
 	unsigned int i, pass;
+	int first_err = 0;
 	int ret;
 
 	/* Walk the entities list and restore controls when possible. */
 	list_for_each_entry(entity, &dev->entities, list) {
 		for (pass = 0; pass < 2; ++pass) {
 			bool master_pass = pass == 0;
-			bool dirty = false;
 
 			for (i = 0; i < entity->ncontrols; ++i) {
 				ctrl = &entity->controls[i];
@@ -3345,29 +3360,24 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 					continue;
 				}
 
-				uvc_dbg(dev, CONTROL,
-					"restoring control %pUl/%u/%u\n",
-					ctrl->info.entity, ctrl->info.index,
-					ctrl->info.selector);
-				ctrl->dirty = 1;
-				dirty = true;
+				ret = uvc_ctrl_restore_ctrl(dev, ctrl);
+				if (ret < 0 && !first_err)
+					first_err = ret;
 			}
+		}
 
-			if (master_pass && !dirty)
+		for (i = 0; i < entity->ncontrols; ++i) {
+			ctrl = &entity->controls[i];
+			if (!ctrl->initialized)
 				continue;
 
-			err_ctrl = NULL;
-			ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0,
-						     &err_ctrl);
-			if (ret < 0) {
-				uvc_ctrl_restore_error(dev, entity, err_ctrl,
-						       ret);
-				return ret;
-			}
+			if ((ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) ||
+			    !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
+				ctrl->loaded = 0;
 		}
 	}
 
-	return 0;
+	return first_err;
 }
 
 /* --------------------------------------------------------------------------
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..ccb5c307c506 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2414,13 +2414,29 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
 
 	if (intf->cur_altsetting->desc.bInterfaceSubClass ==
 	    UVC_SC_VIDEOCONTROL) {
+		int status;
+
 		if (reset) {
+			/*
+			 * Restoring the controls is best effort: the USB core
+			 * only logs the error returned by a reset_resume()
+			 * handler (see usb_resume_interface() and
+			 * usb_resume_both()), it does not unbind the driver,
+			 * so keep resuming the rest of the interface.
+			 */
 			ret = uvc_ctrl_restore_values(dev);
-			if (ret < 0)
-				return ret;
 		}
 
-		return uvc_status_resume(dev);
+		/*
+		 * The status endpoint must be resumed even if restoring
+		 * controls failed. Prioritize status resume errors over
+		 * already-logged best-effort control restore errors.
+		 */
+		status = uvc_status_resume(dev);
+		if (status < 0)
+			return status;
+
+		return ret;
 	}
 
 	list_for_each_entry(stream, &dev->streams, list) {
-- 
2.53.0


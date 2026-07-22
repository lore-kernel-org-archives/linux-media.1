Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255E35F192
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784681423; cv=none; b=iRqsW7qAa3eUFEqbzZ6MJIXjTrs9s9kH5sUajBdufX0t013WvvypRdT07u8vtiqucOalHCZO9is1Uz4xugp2w+oI7N9Efj8NMqKNNNa0fTDXba45Zng5rh8RZvRxoDFYEToGunW8VrGa5JoMRCeMo45077lo1G0GxDTYMEINjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784681423; c=relaxed/simple;
	bh=M6TNbmis4qFLnoCjfnxah+vvQJe8uq3U4DBgseOgzuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVMN357eISqe7JHZZiiVs07Xgu+0+2JYB3p3YrJqpoV2+Gd49oNmfGwMrLnn+or5gnEbwqHn1MXBaFji3R0Eyb/NZDS2VM0aX6tTEkMGfftNmnCEkFK3J4O7g7qLFGTjIzSLyNCLI/VD0F/V8q6aBXqwmB/Be2bx1WdSJ7WOX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YER/9dIp; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YER/9dIp"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81eaf3709b4so99594157b3.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784681421; x=1785286221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJbH45gcna7VV6rOGg0H1UcXgV7i4qjnHK593sOvtX4=;
        b=YER/9dIp/hhIuHDh3z89vbH3yZrZKHjG0bVATpmgx85XY03iy2ahOjEvHoio5apmzb
         6iOh7hgwxpSKy8j1JAEUCuEEb4uMwIaMj86+plcGieXcVrAP1bgmjxjt0DS36puejU2o
         P5aTjbTJUoH1LsjfUhqFpGDD0kTbrHaB2fyLHxZOaE1RZ8jg6W+DCVzxhucPnu1ssHWI
         Rb8ZnqTYvB8hmmnfyGZcNBeKfbA7bET/mGeSC+bpHto+MlFEXEAh6LX4yQMVBkmlkLOK
         Ol0Ffcozhj9Ki5xw6mTfNdfqlvcjuQA4+fyTUQHHa/iW5Cv4Hd4UIK/CnA0DMKdVWdhV
         QJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784681421; x=1785286221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJbH45gcna7VV6rOGg0H1UcXgV7i4qjnHK593sOvtX4=;
        b=AeOJncUGD67NNZkB0Zl3KpHuBGJFkCFvfrRKLTWPibuhQgaOrwRehkEpuLodx3w/E0
         NFE0J7uZlLOe3rYqnNuf8zRpcqZgdPEoybw7HiCfj1GyEPvv78aTAzyRJugo/PDBpE2c
         PvyOHK6cb0L6T7GJuIfF1Y4qfnQNIivsj7xy4pTRXw5LUHuFWBvD/Qgt3nFzUAiHQYIk
         crn7bOiPf7mKsekVeRB6HPNRp3mMj5R1yW7wvWUiNQLRLacwkLW1TuxNbam1Evl4tFad
         P8TXJq7lP35U7PW5hhyYAvxmM72yks5ldz2WwCKS/9QjP3tTMTiog5rip48O1KHMO/Qq
         W/6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqph3+hdEPjJPWrIFd3Wgb1ujHvosMjNr60AM/z++2O4I7vZ2nD/3zdSYlVpvi73XxkRPgdo5lmjf/v6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nPWHMYswUu/rH+x3HPFtP1X19rnNWmqCPgL3FqTvLY2PSWhO
	bgeERba+ZoMwjsFUXeK2OOxtpNNm78tOFV2Bk+c+qIaMsQ7gXJSeb8ES
X-Gm-Gg: AR+sD100rpnQWU4Xa1BX/J5P7KHa/g20sA0xZzRxWqA5oYHonZH2WFFiXuOVqK4hkRH
	h+RDgd29VTTtfSbEjJg4aNtM1KKWP9ArpjiQVdR7JP3Z/ngCp5tfQAhDan74ITKL22W48H83VFT
	7R4d9ZUvxFYlUaA5ECfKi8Rl2XjOoW/z5hR0YHs4Tr7CtP2zNNER6AMlOPOnTfVh+9ZchAoZk1p
	nKfkjdW75glXUM/aFKCoA6oL5p7gClYDAvvK8c2GJuJXdYx+3nDR0inDMWPFvZLN7wS4WiSQPoz
	mOtKxIK+cjDYKESlklXLKXpSFmNSm7r80jSYDr3jN7M4k49yqKN9ou8VTM/wKN5SPfsOpVqUHVn
	okFp6l92C/DqCzESeE6MJNiZJZe/vpv9gqn3LLQnZcZmSD3sANH4V1TjAgexQAkcRWauy+BaKSp
	CJcR7uat6jrnyfIBasBAmtP0Xs2YrDwI298chYPqNt8gOMEmdxyQe4gcjBU9ntf5g1jTft5NMBH
	7v7iILZS+AtHGwLUMImTjjtTFrQ7OpPqhYyxriXKVA5jt9xi18F6NlV8lZlMbB4SFk=
X-Received: by 2002:a05:690c:4c0b:b0:81c:f1f1:134 with SMTP id 00721157ae682-81ef27eba7fmr67979877b3.39.1784681421358;
        Tue, 21 Jul 2026 17:50:21 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.f7a5e5c3-cab1-4810-bdbb-207cdd06de9e.globalsecureaccess.local (76-204-101-112.lightspeed.tukrga.sbcglobal.net. [76.204.101.112])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c34ebdsm6080397b3.13.2026.07.21.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:50:20 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: kees@kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com
Subject: [PATCH] media: v4l2-event: limit number of event subscriptions per file handle
Date: Tue, 21 Jul 2026 20:48:18 -0400
Message-ID: <20260722004818.72310-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_event_subscribe() allows an unbounded number of event subscriptions
per file handle. Since the subscription id field is fully user-controlled
(32-bit), an unprivileged user with access to a V4L2 device node can
create up to 2^32 distinct subscriptions, each pinning a kernel
allocation (~200 bytes). This can exhaust kernel memory, causing an OOM
condition and kernel panic.

An unprivileged local user can trigger this by issuing repeated
VIDIOC_SUBSCRIBE_EVENT ioctls with incrementing id values. The allocated
objects reside in kernel slab (not accounted to the process cgroup), so
existing memory limits (ulimit, memcg) do not prevent this. Most V4L2
drivers are affected because the framework function v4l2_event_subscribe()
enforces no limit, such as uvcvideo (USB webcams) and the vicodec test
driver used to reproduce this issue. This leads to:

  Kernel panic - not syncing: Out of memory: compulsory panic_on_oom is enabled

Fix by adding a per-filehandle subscription counter and capping it at 256.

Fixes: 6e239399e580 ("[media] v4l2-ctrls: add control events")
Reported-by: Autonomous Code Security <AutonomousCodeSecurity@microsoft.com>
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
 drivers/media/v4l2-core/v4l2-event.c | 14 +++++++++++++-
 include/media/v4l2-fh.h              |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 9dd2aaa95a67..fcd8ce4addc1 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -18,6 +18,9 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 
+/* Per-filehandle limit on the number of event subscriptions. */
+#define V4L2_MAX_EVENT_SUBSCRIPTIONS	256
+
 static unsigned int sev_pos(const struct v4l2_subscribed_event *sev, unsigned int idx)
 {
 	idx += sev->first;
@@ -218,6 +221,7 @@ static void __v4l2_event_unsubscribe(struct v4l2_subscribed_event *sev)
 		fh->navailable--;
 	}
 	list_del(&sev->list);
+	fh->nsubscribed--;
 }
 
 int v4l2_event_subscribe(struct v4l2_fh *fh,
@@ -251,8 +255,16 @@ int v4l2_event_subscribe(struct v4l2_fh *fh,
 
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
 	found_ev = v4l2_event_subscribed(fh, sub->type, sub->id);
-	if (!found_ev)
+	if (!found_ev) {
+		if (fh->nsubscribed >= V4L2_MAX_EVENT_SUBSCRIPTIONS) {
+			spin_unlock_irqrestore(&fh->vdev->fh_lock, flags);
+			kvfree(sev);
+			mutex_unlock(&fh->subscribe_lock);
+			return -ENOSPC;
+		}
 		list_add(&sev->list, &fh->subscribed);
+		fh->nsubscribed++;
+	}
 	spin_unlock_irqrestore(&fh->vdev->fh_lock, flags);
 
 	if (found_ev) {
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..65a7f31af889 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -33,6 +33,7 @@ struct v4l2_ctrl_handler;
  * @subscribe_lock: serialise changes to the subscribed list; guarantee that
  *		    the add and del event callbacks are orderly called
  * @subscribed: list of subscribed events
+ * @nsubscribed: number of subscribed events at @subscribed list
  * @available: list of events waiting to be dequeued
  * @navailable: number of available events at @available list
  * @sequence: event sequence number
@@ -49,6 +50,7 @@ struct v4l2_fh {
 	wait_queue_head_t	wait;
 	struct mutex		subscribe_lock;
 	struct list_head	subscribed;
+	unsigned int		nsubscribed;
 	struct list_head	available;
 	unsigned int		navailable;
 	u32			sequence;
-- 
2.53.0


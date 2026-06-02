Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B783E51FD
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415757; cv=none; b=BDMdk/AxzM1v7XtGzv/jWmBk3Q8fiGRU4Pq/RWjQgYCJbpf85pcKpwgJQ6CficH5gA+e3l7S4CbfjSc4TucdN/4rumOE/fFB3PjzqoN681o91vL9uePp+lZzMB78abkq1VEfsaPnORz4fW99zsVZ96XwpEHsnKw6EM/6RoEr7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415757; c=relaxed/simple;
	bh=qPc7vaqspySA0sVhNsav9JdsEy+F1Q49FNvOGL2bhp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQkH9i0do/hUoyG207GmuLHj3XX8FrtqVN4gMOOU3llNzPCGaUAzD3oqRSH0TzH8oqcAYB1SjZKQAiJYOX8ZTjiXhZNS0bJ6fZlUWkAH6tuzHQX2/h2aJvJODjWsqONCk0wSlbUuBxYr+J9zTud9wfvZG//wngZeyw/Ekmv8muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jrpmail.ca; spf=pass smtp.mailfrom=jrpmail.ca; dkim=pass (2048-bit key) header.d=jrpmail.ca header.i=@jrpmail.ca header.b=ovJkdIDt; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jrpmail.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrpmail.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrpmail.ca header.i=@jrpmail.ca header.b="ovJkdIDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jrpmail.ca;
	s=protonmail3; t=1780415752; x=1780674952;
	bh=kEkmXo4D9m3wKs9slier6c6yPDLwM21XlI0MV+XLZHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ovJkdIDtqtnwU6ajPxIoOs3QAfD/ZnNWFnzPSGbiC8wF8jt522maObKDeXvmN3U/H
	 Cii3uznfF2MwdN6OLjwjmhLG2a98UIk65EJdv9tjRjoHB0CrWaWGpq81mDFAEAS+Oq
	 C+uj/nmZMwevg/GsJCBCUWz67z+mQSaHOjvvNIIOp8ZyQEzKOhbMXNFjEHXKrBhHUb
	 WU4j6JBCygF/+i1Rad3i5XVIryC/Qy0LjN0J/5o3YzJBexnfbq5mJDdRmtIAGTWnAj
	 P79yukXtMYB+aCYmNK2cBgyBrFIrSYVh4gr9mQJVvrTPCX3NzccGi44Cr6ZaCJXcuI
	 anfae/ysobDDg==
X-Pm-Submission-Id: 4gVFmQ4ynNz1DDrD
From: Joel Peech <linux@jrpmail.ca>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eadavis@qq.com,
	Joel Peech <linux@jrpmail.ca>,
	syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com
Subject: [PATCH] media: usb: as102: initialize mutexes before registration
Date: Tue,  2 Jun 2026 10:55:29 -0500
Message-ID: <20260602155529.4097328-1-linux@jrpmail.ca>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <tencent_F063E97E23B8C4431762377E26CC336AE305@qq.com>
References: <tencent_F063E97E23B8C4431762377E26CC336AE305@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

as102_dvb_register() initializes as102_dev->sem and bus_adap.lock
after registering DVB demux and frontend objects. Those registration
paths can expose callbacks before the mutexes are initialized.

syzbot can then reach as102_dvb_dmx_start_feed(), which locks
as102_dev->sem and triggers lockdep's uninitialized-lock warning.
Frontend callbacks can also use bus_adap.lock after
dvb_register_frontend().

Initialize both mutexes before the demux and frontend callbacks are
registered.

Reported-by: syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
Link: https://lore.kernel.org/r/tencent_F063E97E23B8C4431762377E26CC336AE305@qq.com
Assisted-by: Codex:GPT-5
Signed-off-by: Joel Peech <linux@jrpmail.ca>
---
 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a..60827acd7 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -296,6 +296,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		return ret;
 	}
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	as102_dev->dvb_dmx.priv = as102_dev;
 	as102_dev->dvb_dmx.filternum = pid_filtering ? 16 : 256;
 	as102_dev->dvb_dmx.feednum = 256;
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.

base-commit: 6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
-- 
2.54.0


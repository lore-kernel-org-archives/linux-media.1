Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95562226D18
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804577; cv=none; b=b6DhP1jmYv5UoOjfMoL3I8LVfA2lUsVt7iVioacEIRVK1N/fKkOYHYDQApo4TDQGFpyPim7qe8nZJ6vgDqzyZVDrd9YS1Bj4MpAqIbEMfWykCR1BWnYRsHP0GMcnIpax6FtljVikuikCfK1shK4szTIcmMlYpIn3j1FkEGiKNoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804577; c=relaxed/simple;
	bh=i5j4N3jc9IGaXr4Y8SA04YnztwfrViAVW8ve5zNs9Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt2PuJR8ysvXThs86HxLGchji3WwSWrekzP1NlVUhhhBmmK6hlpvH5wKdGuAeMjRYog8HnulgjqcGpUhpWyxrZxoT23WDd7mCvautw5xsY8acaZBrgq6ozm1HSCqS4v0gb7/AlVkQjcdUT4tUFPtSuAKXd8HSKR8Ju1OOBWzduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPEiYx8t; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPEiYx8t"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so18639875ad.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787804575; x=1788409375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7U1BnFeXoGQfM9V4KkXP+ZPWf072nK5WtXag0RShRII=;
        b=JPEiYx8t50DXnUk7PJlui5zwWPbxoKKJbKF9HnYBMEJWch61cnAHjw9A9F6R59ODle
         /6ycmoQ7IxQr/JvIGoSYL0B/rY2dOjFJRLrrFehQYpxA9zFPJw8YohJ20lkJMojeK1v8
         M/gBa+NsGH99tbOIUdQgpibMw1LPhEGaqFfovYo+VKp/X6kv1+deCcmf4hIJYHV5AMlj
         RGN6iS9s5bF2sPpeEzGsakGoPgtzxNMPJhOskQhJXzUpl4/4oyjuYutUD/6lwf7s7EHh
         0QA55NjCeGenkUYiQvB5P8vgE8YgCbo59QYohSirur3vkdbAhRq4Iz6vyFtI+yB9QlKT
         Qq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804575; x=1788409375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7U1BnFeXoGQfM9V4KkXP+ZPWf072nK5WtXag0RShRII=;
        b=bL5o5PCsadkelL4QF1eYym3Ikb3djHqHO4M2/TSZRCCpZHd4IeTQpyyCsf2dUV9bZI
         NrwlKs4CI8kbQbnAkzlMvU4rWnBp+lAPz19+Bk6KWXj4MTAPPxulFtL/AKr4oFuat+YI
         oU4bG/Aw++Wz3vvUfupf2KIsBKIXztPr8pQ1GqLIWFtACWb+q6Czy1DKmqSmzRUs/+lp
         H0nyI3xnXnWO9ObsBG9bXXZ8Gjp7MoYkxhzWkukPR2ysxXUl3BimHTDotoJV0VTyY7+Z
         M77B/HHdR2uF4zVVSRMh4GFSmtMV29yqERuk6eQzf0SghqrursOsUUpVuSIj9Bw/Yd5q
         9+kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBByog8nMeU9eWnOJEf+cFgukyib6ePKkBG7/QzJlYPhOmI6DkmkVOo7qAFa0kRsc9AH0MYtFe7g3MUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++na5bvQtmXR3bcp8M0PvE3cnBjk85lAYKMYnt3y2QjwZd7zANFq
	IclAYrIC7qB1bVk3CG6XUzU6o99KsUcO4QA9nA9+wbWSHQ0WwsuNQ6q9
X-Gm-Gg: AR+sD10CK5eEv+kzVHLcz65p7f6hKI+t/v4HtPnlqoTI247GR9EGZ80iOUOrUxfPnZb
	wtfDdBi/bNGO55Mxo8jiUVBnBlgpun0Fbzw2HuoCKA01LpDJyivD8H80th80clpo6UAX6/ZZRsN
	EzrGMeA1aWvxkkJDg1W3dHYg4w7Epam1t6D7ISllsuTjF/lMGW4S7UWkNpByjEIqW8SvleDCfRG
	qUWh4qJO9oSs4DjTaMwiLG2RScSAlSiGtiXQ/wRyXytgLqL9+bA7FTPyuZY1aJlMIsa+u9kuXJN
	Uw/JQ8S06kFdjUv6qQsjzxW0i8QmuVcMufpqxQjtZpjL892dGdTmDu6MdX5AG4ySesfz0xxaxQ5
	i45q4W1MUryXdGUgrFvpgTMv6BGQ8e75yQJfehdEbEln/iEFCLuyhbDEWMvXWaQuapO5J2JhJur
	kLL67Uu6vdfxP7AFT7kZX5cIXMZvFCT5Xjz4Zvn1TbcI4wt4wPlifZWY8UvYHk8WWuxA==
X-Received: by 2002:a17:90a:e70f:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3966d4587b7mr25543337a91.12.1787804573880;
        Wed, 26 Aug 2026 21:22:53 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm19697942c88.12.2026.08.26.21.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:22:53 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dwlsalmeida@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 09:52:29 +0530
Message-ID: <20260827042229.12561-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attempting to unbind a dvbdevice that is in the process of feeding
data causes a UAF as we free the underlying device without
stopping the feed first. Fix this by stopping the stream first using
vidtv_stop_streaming(). However, our codepath in the reproducer
(mentioned in the below reply) does not decrement our users
(dmxdev->dvr_dvbdev->users) to 1 after it has been incremented to 2
by our read() in the reproducer, that is only possible on .release.
This can cause a task hang as dvb_dmxdev_release() uses wait_event()
in the wait_queue unless we use a close(fd)(in the reproducer).
Is this a problem? Please advise.

Reported-by: syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c7fc4794e59786f5b4dc
Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fd69b4ee16f4..98d918c7f0ff 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -550,6 +550,8 @@ static void vidtv_bridge_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dvb->feed_lock);
 
+	vidtv_stop_streaming(dvb);
+
 	for (i = 0; i < NUM_FE; ++i) {
 		dvb_unregister_frontend(dvb->fe[i]);
 		dvb_module_release(dvb->i2c_client_tuner[i]);
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698573;
	b=R2J0M8H+2rNflYMiOH8TPV8zKCe2TVEaBmdpEfTQuln+g9M0wZ4B6LM1ObF0j1jAN/ME
	 OXvEn2+bh7WAMTHLpMxjqz6oG8/MmnOPHHvp/tuIAddtI340vVO8DbK+hxOM4523Buopk
	 L9L03oGLV0v8jC6p948Qr09k/JtDlMKRiaNCl4CRvRq786DXwbUhOwFBS53EO6wG+rfLm
	 GwFcQeGjHXV6IW6SmuY6Wq9Hb+utBhNKxQs/Nv+vnhyfZvHngtqAs6ElRqYHlv9XEbOaC
	 DEfjgyMq5JjUXYtLjMjUTsVI6Zpwi+1bk7jML/B/INuai1qQuknuyncOJ9kW1b4vXWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
	b=tBf/iULoZ6tTWb4qtEZS+UlVuk0Gtt8aJx72rjVy0Nz5BS7bz0qtY9GtnGhB+MzwGvWq
	 AYvaqxu1ENb1SUTu3B1nVj9QBJWOOXrfTj/nt36+Eq4vVcW/8voSztLx2miHjM5LHofND
	 ofmFth7iM+oMfXLVoILoOYdYvOvvRjcEJpJp0cSdX2MA9E3D/8N2zqYVEMYFbVV3/QSjz
	 in3BE70BiPdeJHLkGftduklsq4QwSIOuwLwntyCC8VhppsV063eHhHmeWEO+2FnrfgJfe
	 KYN8yoeSTb2ob10BWP3/b2FsBnYQlaxTv6ajZWCDYQN6njqvwK0whC3Dd3y5fgxgsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Mq/Uzs9F";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA89606A320
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 19:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mq/Uzs9F
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso121115a91.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698572; x=1793303372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=Mq/Uzs9FX+SfS1W6qgRHY7ID9oHJ8jQC8RenfqjZLRidZ84Z+5ICK6ckMCpm1SyRbB
         pV7oouXOy+vbqqubV89r7eFBt+efCkYmgjOTx6K4XBBqI28au1PFXzhL7QgT3+sCXMt4
         mbLe/4nf7SmMANTxH33MNG3ZMAdgBqxmgSS2+wO/0orQUoK4gemtSrA1TZtOHSBuhTJm
         b4bunv+oXYKCDbwEh/xF1E941KdrffgJ2c83TcuF9s20O1L96oTjazJD7qCFkZdHXD40
         cbl+W4ykMVC2QpIyWILbtItm1kDnbLtGs5gOXDgKfCgKzEy6MMSVROrFotV9rKVu/NfN
         TAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698572; x=1793303372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1EfijeQewP3c+Gff9BU9n49Kow6R0+JcO0yHhp/Z0k=;
        b=mQdnDg1OGHPRPH5/BwcL5jlGNhQy59Njz66cwMIUpMp/aSc4/D0DVKXRq/RuMxUzcs
         5CU3kZWu+9U2Jddq2XAah9xG2e4WhRybYlWx9mcMY4TeaDOuQgomIxRB16pT9A8bkJAl
         anAWLa9SGjpj8rdXeT/pdcJjeUnODMqCoHXH2ZvKBuQen6Abk6EHV+sgV8hceAA96tv8
         VkqOholYwOpjAmcxZxGIep9LUp6sLK9LKoHdQDWkfgfsKNeNNp5qcOe/h7LhizxlR290
         eWQ9E2nlr5FtIkApa4iSNRu8NJVf0S7/1mtPc/j6fk2TmRUAgqLS9PKwJtR/mVMmzRP1
         eMVA==
X-Gm-Message-State: AFq9FYKSPCssvesJ+wsompuZtzE5dAu0pq1C6vujusatK6doLP7NHa4C
	Ac0DnCdx7dFbBfRIvj48zB91SVAGhFuYwPBYLvaObAX7EwPuGTCorcGK
X-Gm-Gg: AYBFou0ON0bfyw6KVzdjAfxMmTb1wRXfk829oCroJvkcDyiRAWm8hntUfIssNvUgli7
	sx20oy8V4yqPWxkc2nKaLP+537zhTn2KOquYhmfGYxaCvJZJgoeaufnb5wnBE7nqdnY7Q480+nP
	eAw3xjix1OfRo0oFpS4eMe7QXhf4kKswEfhkKspssXvm6vtI66eb1Pgur5KN3R2NFZDq4DDH4fV
	65v4pV5tX4pg6+INoza4wnMQvGng8lTgGtb/R8afpgK8+niccqfmhM6xTx8ssHUciKFNA8GRIgz
	SkHRFxCfo1nlvejE9E3yqElKUIB0JsPelS18el+hZUJG5TXQso5xgcnGAMZqWqX5zkzdDWKP3u0
	o9WsikkX9RqyLZE3ThDuQLfVRwyhvGvThKEQtMkFKEZvpYageYDYyrBgiil4nOev8QFBKhPfZbd
	urZ6RqPF3hwX+nRqEyUJQ0XCe3HRAJlVycCB/9ijUdos7om0R0HOolMMeLme1/vkqhNSH+zrAHO
	89gzffIR4+ArgxrPxdtV3n9f9thezhn/NUqtR1f0jpK/XN5vg9wlkdDAyWdhu6yn1AHZ6LdlSqO
	KwIucHmddCcOrR75IDJ7rqciv/cByxKs
X-Received: by 2002:a17:90a:ec8c:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3ad86c91b1dmr5059374a91.27.1792698572531;
        Thu, 22 Oct 2026 12:49:32 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:32 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 2/3] media: em28xx: clear v4l2_dev.mdev on media device unregister
Date: Fri, 23 Oct 2026 02:48:59 +0700
Message-ID: <20261022194901.14302-2-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194901.14302-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
 <20261022194901.14302-1-neganhat@gmail.com>
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

em28xx_unregister_media_device() frees dev->media_dev, but leaves
v4l2_dev.mdev holding a dangling pointer to the freed allocation.

When a process closes a video node after disconnect, v4l2_release() calls
v4l2_device_supports_requests(), dereferencing v4l2_dev.mdev and causing a
KASAN slab-use-after-free read.

Fix this by setting v4l2_dev.mdev to NULL in em28xx_unregister_media_device()
prior to calling kfree(dev->media_dev).

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad44e..40fec8b025e8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3776,6 +3776,8 @@ static void em28xx_unregister_media_device(struct em28xx *dev)
 	if (dev->media_dev) {
 		media_device_unregister(dev->media_dev);
 		media_device_cleanup(dev->media_dev);
+		if (dev->v4l2)
+			dev->v4l2->v4l2_dev.mdev = NULL;
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
 	}
-- 
2.55.0


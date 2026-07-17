Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4463A1E80
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321770; cv=none; b=ZbM8LQvqrXaQwdVQT+T2mm29CpwZ64i47o8UamcbrTx63R7NVWJO/IkE+EYmY5Vhj3i1PLs6vlPHuxpFHRvbwMrwex4FchMor2zkDvZbBC15okOraQE5F1C5AKi76flp347AgsxvUhoV8FrIoiLd1eZpUFzB7KG0nb9gb/UBCyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321770; c=relaxed/simple;
	bh=jwiyrxfQgomvuGswE8+LEVhWGmTsiXsVXkjrwYAy8rM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZkdkuIrZYAvBe9RBD72ZLFIvSpoGVmqZJKSXA/95A+60d8nMuZnVmxuzkjMXoWDbt3C8q7J1g4QXPY12/qIR7AQHBBPWM9iIswLbRfBjOwQdNN7HkDcGNlvrkMqduG4xXDkAxaRc09sFiEe10qOzCfpkpUCP7Yx2tZTsLkrz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMfmLWtu; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMfmLWtu"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb545db3afso2904635a34.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321768; x=1784926568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dn6lNE6okfAVFge0J6jVrbXGd9etd2d28/dC2ZBL9I4=;
        b=RMfmLWtuKEtyJ+trChG/K0gtkKKdqrvU7SDG1XoZSsptgQvGJcpAIB4N6MKha7NuuJ
         iEnPOzqjnw2kBIhV6f7Haa4misWwU3O1UwoUC6p8Hc/2odStA4tJ+kk2p7massP2Hurh
         od5zPoiuGsJbnanF+qa8Df+oT8dhFC9fU8faA60oQrYgV130Ep0nMvppguu8CKvn5gXv
         L1Nq8VfF/8VOW8IPyr//vU7oZeid737JoJEpfNcPjRXhm4RQAp0ukMwBIP8AhdHWZqu1
         U0P1xJxq1pgBAegkkY3io8PQvvHtWnRF6kvfM4Hld7FlkySa1Vru5/QHRdYrwcNc97El
         dEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321768; x=1784926568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn6lNE6okfAVFge0J6jVrbXGd9etd2d28/dC2ZBL9I4=;
        b=Cz1K8rw2ZPEv/DoKjKVmFj3UGFdB6qvgaa/b4EA8KkRfvy1eP+NA5JEVQPdpOYKZf9
         TiaOSbkb0tal7euvJP2qGpq+GNW9yCB4pTRcW8Or7MyBzQEmYJmgPRGTTL5wEzFPaKGd
         kqP4mOC0yGllnrzS22za3uF+QbjNgVQt4Q1E5L4lByE/LOXbYjoGdHApkE7I9BGkuxZL
         uljWo48aK9dvSGXd+JFu9lsli78O/FYoxg8sTRzPEYFq606S5JJeS6bv/o9k2bze7uP9
         UVfQikUaIjeaVdq4BZJpN+/z8EBt1w6hzky8tJAyT2iOh//7sWMF9eGS9UhY2VgM1Bge
         q+Mw==
X-Gm-Message-State: AOJu0YypwTcWBkYZm8jZJ+5cygxoTELB1dwsmFoz9+iw/1IM1gIdjOlR
	QAln4wycPJ//01Oc6u7Fm/88A8YH7AfxfHA6sy4/iY/Q8fH69oVcpy/v
X-Gm-Gg: AfdE7cnudt5EyrtOxQxuD7jCVJeYL8uiPMNH9wuyd80GvWF+XTFtaZGaxH42fUx4wmW
	0HupH0YqDp3EcQplUO0pP+Dv5gU4b3SqetsXBkq3DX2Lzt2qD/hKW2ND698CqisvyGyOKDsGarr
	bqKaNBDy/vVoRHray/hq/XX4VmJfEg9TgxgVZrLfrxUkbO6Lwr3M6WeCClR4cdQMDcqoIZK4ESY
	1Tgp1gghp0NaGfG+PwZDKolArE4bafTGu0FtWvoXzFfNxOVthzo+KHkkA9qJmKVPZBC2JSm5mFv
	b9zI8ApUa+yKUzBrZrCTXqzDU10HF7ZkamsiP50b4EMADjHKQvwO10HzacRd91yvI1gSENKiEzh
	0kJKTwLMm4c6c/Xhm9HvMx/lDbXEjxjYig/EjwBBxIBVe3DpCTjsgR0nXLuOGn6zMF0Yl3AiCPV
	YpD5N4be7aZY9NfN3YCCAmre8=
X-Received: by 2002:a05:6820:61a:b0:6a1:8291:b06c with SMTP id 006d021491bc7-6a536817d5cmr1946935eaf.24.1784321767649;
        Fri, 17 Jul 2026 13:56:07 -0700 (PDT)
Received: from capidev ([2806:264:548c:900d:21a4:2af0:52de:9e80])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e61d5fesm2378948fac.10.2026.07.17.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:56:07 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
	syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: fix use-after-free of dev_next in em28xx_close_extension()
Date: Fri, 17 Jul 2026 14:56:05 -0600
Message-ID: <20260717205605.1688-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus: Norton (VPS 260717-4, 17/7/2026), Outbound message
X-Antivirus-Status: Clean

For dual-TS devices em28xx_usb_probe() creates a second em28xx instance,
dev->dev_next, and initialises it with em28xx_init_dev(), which adds it
to em28xx_devlist via em28xx_init_extension() (list_add_tail()).

On disconnect em28xx_usb_disconnect() calls em28xx_close_extension(dev),
which only unlinks the primary device from the list:

	list_del(&dev->devlist);

and then frees dev->dev_next (kref_put() -> em28xx_free_device() ->
kfree()). The second device is therefore freed while it is still linked
into em28xx_devlist, leaving a dangling node behind. A later walk of
em28xx_devlist - for instance another device being unlinked in
em28xx_close_extension() during its own disconnect - then dereferences the
freed entry:

  BUG: KASAN: use-after-free in __list_del_entry_valid_or_report+0x1d4/0x200
  Read of size 8 at addr ffff888047254250 by task kworker/0:4/6312
  ...
   __list_del_entry_valid_or_report+0x1d4/0x200
   em28xx_close_extension+0x10b/0x2b0
   em28xx_usb_disconnect+0x19d/0x610
   usb_unbind_interface+0x1dd/0x9e0
   ...
   hub_event+0x1d81/0x5360

  Freed by em28xx_usb_disconnect() (kfree() of the dev_next allocated with
  kmemdup() in em28xx_usb_probe()).

Unlink dev->dev_next from em28xx_devlist as well before it is freed.

Reported-by: syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
Fixes: 4a089668ef22 ("media: em28xx-cards: rework the em28xx probing code")
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..3d6b196b8483 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1265,6 +1265,8 @@ void em28xx_close_extension(struct em28xx *dev)
 			ops->fini(dev);
 		}
 	}
+	if (dev->dev_next)
+		list_del(&dev->dev_next->devlist);
 	list_del(&dev->devlist);
 	mutex_unlock(&em28xx_devlist_mutex);
 }
-- 
2.43.0


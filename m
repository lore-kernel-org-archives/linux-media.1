Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628896;
	b=Aowi8IIVH3x0mvwNOKs6z0Wlg6gKpWaec3eOOFtOGvzIP+cnrUVjhu0coYPOHsAuOTV7
	 jjPoOtl0mjDf2HNaSGMQn3MNv4nuUGQyIIJAkB4U5W4/4+Je4b1iWq3UqwgtoEbvvN3mZ
	 RboswHcPlW+2WfB9N9v12s+uCmcOULd23p1aHp74NM2gHGBKPs3Hr54gEBps1ui97m9pn
	 bcqMk0mJDOHb9BN4gwsaYCTimeQlXsBt+whYhutapHoJihArVwUCCugtf3hpTgm3fClW8
	 JjgjAWKC3+Ck5D/qFlBTHSAY2MxDgtHxvWVOvRr4Nq43LwDH8ISJ03xxneDItR7rT6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
	b=utrgGWsU6Pad6rFvift7kxrh4cBi+2UpWK/O7UFb0LVv9MCA2eX1kNhz7t/MvbxORxkK
	 3Ue7RyX4I6JA9LPMQ/q4DWVlYj0UfYaATyOBEIAfEl8gZNtYkKQ/NyTkyHNFtmPwIVq+M
	 jJ87yAR750viW+01qqs/+hgQjyetg0mYYghENn3H9zib7V0+mNAigmaLwSBdayl3okBEy
	 JKXsUlRABQ8nX/fd26+jhBCZD2r4e/GttcJ8Dg3Q4HO5yT7uIY/IgARYDzyZLDA34jHm7
	 ldr8SEKhxISzu6uFDKg4jv6/IltmDgO8xQLSssYfJKFz4fcSY168YWoVdYlgj9jXv6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rivtYcgE;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41460A262A
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B41460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rivtYcgE
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso5394972eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628894; x=1794233694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
        b=rivtYcgEdPT9DsMLv2bZD97+QGkZScESC3O8iYJZF9q1qDVLt07CSJ3FckAaulHl+Z
         EJOdRKt6thSeVc7XG9pnYOWxsM0xg6rbUT/ev9qH492AMTS6rthnD3rBy5dLU8I8Z+IT
         SjKJpLwkB6idMHuX687ZjyvyfQ/Z6U0np8fVmxFsgDeA+kGSGmc4NKndzUFswP8/YLSa
         8xVVtgPNqRvros9/0EcGmVPNZrUwqyVg8tQPTAninMvj0TXaQ0q0yq+6hgk6qWckETMz
         WN9IFxWoJuZ2i/14fkzsAwvbVmI1ox3fGVJp08tPOi4SEGgx80zoAkN7OhlB4x3fPJ4P
         a0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628894; x=1794233694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
        b=PIitepDnJ1Ri8RGrWDr3Qclbyh79t82znKiFYgShFuMEP+15WAnhIdeozus4TYB2ag
         BKeZHjA/KSQDY0TVUb9Dxx8SP9AKXUG4SCijUepdQuma+FrVHgrPOdmO1XkhpKJGHGNm
         UhgItdJMdfMBLrh88uS1it1oik0D+zl28EW/myiVffdPi9bPD4nyhUmqpKkI5gmT+pz2
         1f3OvaxH6rcA0erSgzT5yXIBz4auIkLvbYU+4Q6RBOAyAZ4xxiTwJWwbFLSp3i2W4h/F
         2uTnRYCmuNpfEngHnYflXMIvV8+8ostPUaliv/LcNwfkec0pdmmtNswNU0YKS1DpltzM
         0Dng==
X-Gm-Message-State: APuU4Z+KHCNO8fV+ywEwoQw2K1yEUqoI5AGp/6jyBu2OYCdkXETnYa40
	zg1+18tpnGYLN9Zjtf3Nd3rlPR6P8NSVMBH97pHMbZmHsj0Y05Oot266
X-Gm-Gg: AYBFou0P8o6mbglVTvcEtd3b6bVch2W/F0Ln6i0pPPZDcKFwL2qe5CEFHp8O38ApD9S
	ur3sI5o8thFd/C00/ZQ4rJ6luZP8Vk7XwBRO6g97gASVaTeiRLlxTnzUwhFB9iiEsVumbQARh9T
	WpIdKh8z7SJAPp3KLA5RfNXfAjSG4YrHBoOpwcHz7MSR/NioGIfPtm+aZ9M3+mlVXlndCS/iSx5
	2VHsMFtMjTqdwi/1tEBByQKblNiVsZwVXXZ53JR/OSstSOE5TI89Hnrj9A+oA3rrvGuQG4kkVI9
	44NiNdg95eL4n3YV7xGssx6HHurjOCGf0z/HFgZW622oMT7pQZdXqu8NuZh26jAJYsSAyucENNk
	XjUsQ8Cs2pBoI5WD9rS1J4M4GYeE2CKukGwzikk2CQlHfrywvUXob2pVdh8/03vIHizGWxbGed/
	H1bdGpNjlHUVPPgHC46LwS+i+Gg0A5qTSw9lZlmXHZ8UDIdCbTP0edlXQ5U29+HusIrqA89uQBW
	6Ve4bnCodnln1T6WHbl5BYQvgFoK+Ccs+ufKr6ES9uT0PS7FQ6qE08lMat0pNjqDUE1vmy5Rkme
	C0zheFjUWOwSdLdajNpYIWFi0lS/vhNUek4Yzi2gbVYkMc0AcAEY1lsWJyaaL3B0kVFr5faJgYs
	dMEcBIzaze42g10mJB4Z3M45cZSdEo7Ej1GHW1hQGsGWA9aOmL+EewQidLSXrBamx5u7+I0dsHI
	Vz
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr15295070eec.38.1793628894445;
        Mon, 02 Nov 2026 06:14:54 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:14:53 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH 0/2] media: fix em28xx v4l2 init failure refcount underflow and a media core unregister race
Date: Mon,  2 Nov 2026 19:44:37 +0530
Message-ID: <20261102141439.13505-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
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

syzbot reported a slab-use-after-free in dev_dbg_obj() on the close path
of a video device node. It is triggered when em28xx_v4l2_init() fails
after the video devices are registered while userspace still holds one
of the nodes open:

  https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6

The cause is a double drop of the initial v4l2_device reference. When
init fails (e.g. in v4l2_mc_create_media_graph()), the unregister_dev
error path drops the initial reference but leaves dev->v4l2 set. On USB
disconnect, em28xx_v4l2_fini() sees the non-NULL pointer and drops the
reference a second time. The refcount underflows, em28xx_free_v4l2()
frees struct em28xx_v4l2 while the file handle is still open, and the
later close() makes v4l2_device_release() call
media_device_unregister_entity() on a media entity embedded in the freed
memory.

Patch 1 clears dev->v4l2 in the init error path, so that
em28xx_v4l2_fini() returns early and does not put the reference again.

With patch 1 applied, the same reproducer hits a second, separate
crash: a general protection fault in ida_free(), called from
__media_device_unregister_entity() via
v4l2_open() -> video_put() -> v4l2_device_release() ->
media_device_unregister_entity(). This is a race in
media_device_unregister_entity(). It checks entity->graph_obj.mdev for
NULL before taking mdev->graph_mutex, but not again afterwards. When
media_device_unregister() runs concurrently on USB disconnect (via
em28xx_release_resources()), it unregisters every entity and clears
graph_obj.mdev while the other thread waits for the mutex. The waiter
then calls __media_device_unregister_entity() with a NULL mdev and
faults on &mdev->entity_internal_idx.

Patch 2 re-checks graph_obj.mdev under graph_mutex and skips the
unregister if the entity is already gone. This GPF has no syzbot report
of its own, so patch 2 carries no Reported-by/Closes tags.

Testing:
Both patches were applied together on top of current mainline master and
tested with syzbot using the reproducer for the bug above. syzbot
reported no crash.

Known limitation:
Patch 2 does not close a remaining window in em28xx. After
media_device_unregister() drops graph_mutex,
em28xx_unregister_media_device() calls media_device_cleanup() and
kfree()s dev->media_dev without waiting for the last video device to be
released. A thread already waiting on graph_mutex could in principle
still lock a freed mutex. A complete fix would tie the media_device
lifetime to the last v4l2_device reference. I left that out because it
is a larger change to em28xx. I am happy to look at it as a follow-up if
the maintainers agree with the approach.

Deepanshu Kartikey (2):
  media: em28xx: clear dev->v4l2 on v4l2 init failure
  media: mc: fix race in media_device_unregister_entity()

 drivers/media/mc/mc-device.c            | 3 ++-
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0


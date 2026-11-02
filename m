Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628920;
	b=SVo+UNlH/1D5/cMVJwlNiMi/HaHkD2KN/R77JQZ1nXPAJfEk6AELO9p1AEPiwjJP/zFe
	 xYm0VAi2zqTShAxAJeAbYdJruFkkLhfxta7ynGzI/uy6P47geVarpENasrKEk6mkpguHj
	 u28BnvLXnwgIos64RIX78OfLANR9laVxsp8Ju8sVR8HuDfbeB2fxe2RazJlPqFjNZlZB5
	 dd4npipR+HwnQTQKacT+Cc8ZCSDGArfnXI/7t7A6kjYr3qqlSmTOjHhSzJd7ySn1Hc4ED
	 qAmIAU5lWtl61FaxXjSuMA8nhDpymP5iWpLNDGvoaSyYeyRnYiDpcdq4argIPNfh9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
	b=3IayNRWSN/+k6csBo7cM5Pc4EA7udD5MuyA5J7mrNQSX7Iqj6MyNMB+oaMWcj1+sUGN4
	 kBj1z7PvtBmAuM+k6KYtxjbFXDKZUnaCSGmJcyF6tWmoi+nUZL/NkvjHgP2NyZH+s88k6
	 vxYZpFOiJytULWAeWK39GWsSBsoL+jv2b56cgKatzQNEIuIEO3oUqIasPvmE9cBg8Mphv
	 0K/uMg7TRRjIb9FPLtG7qyJHg9rRC9l0qHO9q/3XoYhCf+Lc6mbzrqTjHukcF6OS7Jijs
	 7Pesz0PTd9un/e2xj2ctS+CTxVVbYQYkGTqvs/WC92zXsCmpr4XQhVqnSnl+9ZxDeEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeW8WrUu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DB60A5BD3
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2DB60A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeW8WrUu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso6060442eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628919; x=1794233719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
        b=GeW8WrUujR59h00XP6jNTP+Wt0lM56WwyHsMC3BFEQTbNiclg6QXY+aB1ec6M/knRP
         UryPPYSl+I+hMAJBIlYiRfueEX9cMTn/3FZsM3TaZOVLiGlurR92qNXQ3iBQqjG8aHmd
         FEGWr2LW7n/vy/5TStf3UVecyBw/rpPLAIXmmwF42qQgRPozqOBPwA5C5s8adMHoHq8A
         v1p75IzDXdUn5W46wZmNe81GOCu6BRdFoUXb1llsAaP2ElDqunp31BhTaoDG/65Y20ww
         PPus7XtRfJda9yGBNpyRJroFWM7A7+afqgiBlXaqxzFCwTgDEFq8ZG0z87b2Tl+Qfef7
         ZpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628919; x=1794233719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJnJAQ1J2840u9KECjcYuFBU8CaqLFZXy5w57Y9rz80=;
        b=hFX/nSirZHgFTkViFHhb3Gseq6nKNHENlkjN+5ZkrxOcBhuHuLEbA8c1Wq6vvmu1hF
         dj6BYtmCvB1x6CbtaHZJLZKBvPJ7vZI2ESRpXaUxIQGphQgZfdIV151TWNUbxzGiSohX
         l1wyZKi624PXPL1wSKitFaxi5E5LNLlJ176PT9g77sI13x8R6Jl4bBBxaQfkLjgDE8sK
         3HKrkP5Gnf0WIpVdKRaBxL0jxBhk/Jg7MnlILsHwYlJns+OrOfAN8Z8X6zJ9dwYLSPXb
         ufyK00Y+2h+JGviKrmnmRLC4RG9lJ8UPF2q4YBvNoBoJfCvF7VXqUmiveht9CxkY7qS1
         JySA==
X-Gm-Message-State: AFq9FYKw54QT1lYZWWB/n0b0CA1CZ3Ekus6+sZqDx0ZCp9J1elmV67ei
	PvtoFboLcRuD5O8i5S1HRpnA3TVAuu4uOXqdA8Sl5lbtrTnJvQlX0LgJ
X-Gm-Gg: AYBFou1T2+WcY5lGcgHSwY8EwZ1bBOD4D1ApPeAz5NkxUY7udRM2QYXpxAt1gAedujy
	tR0lZ7hiY5I6resiU51dflfXiqWrdmucrF8gAFKM8Q6Q/ljSfOhqVVCc8a9qmTg2dS4CmtOnbSX
	2VzpRuVyigx19vWP2XLps2+4oigSspNJV4hwBrxIN7CRdtXkC+AkK42EqP7bBBq1IO7zXPA9LUp
	tiN5YqBZUe0w5IlOmpEw0AKnLm4F0O7wTeh+ryJLggEzLCwRc+Sh4Y651kfshis6KwRaV35CaOr
	lk7anckWeZ0sO26EtH0k+OyzvA1CCU6hQ0/gXG+Jb/elEXvFQpf7S5XCgAlFXW6ofxOoH4LWhU9
	CJU2dwB93xVEo6AbNiYEAWYPzXBLTzlTzjMkDZcvHGFNDGgvVpcq0XbnEjFkLQ4nuqdNcIxLK2g
	FqR1cNutVcS+dSQeIq9VOZ+TAvHUaoh+sdbyoDEoZMS3ZB2LvFDCKDuHKu5R0572v+HakHgixUu
	Ey8WEKd1Trv5gSSHR2123IwEJoPGREv1JNkRvGCA5s09MnQbuXVWPNYuqxNukx2U7OhpCDY2fXz
	loUoA/rgcp/y9I93ccqV9mptjLe8acbNrpq8yTym+pBPFH2PXmW86yFCWM7Af1xQEuufQPGPux/
	cKytzLabjGEFG+J45OM1ySVOiLnS1hEmcvRVi1mZ8fUohUIvL4zvPQU3TzoQhPfp23C/BqrvIug
	gv
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr16692157eec.10.1793628918760;
        Mon, 02 Nov 2026 06:15:18 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:15:18 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: mc: fix race in media_device_unregister_entity()
Date: Mon,  2 Nov 2026 19:44:39 +0530
Message-ID: <20261102141439.13505-3-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141439.13505-1-kartikey406@gmail.com>
References: <20261102141439.13505-1-kartikey406@gmail.com>
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

media_device_unregister_entity() checks entity->graph_obj.mdev for NULL
before taking mdev->graph_mutex, but does not check again afterwards.
If media_device_unregister() runs concurrently (for example on USB
disconnect), it unregisters every entity and clears graph_obj.mdev while
this function waits for the mutex. The waiter then calls
__media_device_unregister_entity() with a NULL mdev and faults in
ida_free(&mdev->entity_internal_idx, ...):

  Oops: general protection fault, KASAN: null-ptr-deref in range
  [0x00000000000000c8-0x00000000000000cf]
   ida_free
   __media_device_unregister_entity
   media_device_unregister_entity
   v4l2_device_release
   v4l2_open

Re-check graph_obj.mdev under the lock and skip the unregister if the
entity is already gone.

Found while testing the fix for the syzbot report at
https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6

Fixes: e2c91d4d78ee ("[media] media-device: get rid of the spinlock")
Cc: stable@vger.kernel.org
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/mc/mc-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index f8ea7cfe10b2..039ef7d04ac7 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -674,7 +674,8 @@ void media_device_unregister_entity(struct media_entity *entity)
 		return;
 
 	mutex_lock(&mdev->graph_mutex);
-	__media_device_unregister_entity(entity);
+	if (entity->graph_obj.mdev)
+		__media_device_unregister_entity(entity);
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
-- 
2.43.0


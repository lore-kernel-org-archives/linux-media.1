Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC13033DF
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877475; cv=none; b=XY4R7+wkyzGSWLnKFelYCToSJPwm2nzosPHPU3gzaMYgvjHvDGggyz6YzCcAZbkIE56WbWQY0wvzEb5WyxZZq+9Rjr/aF/sT6+AY5Crp1qZ6sHz+d1bxOQCWU5AB9RA4l5bja6eEGqYl3op6tQxi5ZLqKavm65L5eYgJrFv7IAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877475; c=relaxed/simple;
	bh=sD614/wHqA+UNZ8ljapcNbYh8hzDq3pRigpRikE5CYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnkKxQhMvhjvBbw4fJx4yUoecp5hRMkN9GexxBi/gItgk3r4LUOaijGwrRSosNLgNfqWs0hFYw2IIYl14QOd4MkkyAWXE74+1ASIpL9LDblvWgsl5LdTHzgDb/HvfeaKsowybHBVNL5wT2PfTkX/4SF2xoorbdMD8//+2UuU/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb5P+2Ih; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb5P+2Ih"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91786b004f2so15046936d6.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877466; x=1791482266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fL9Q0QFcSoIbKOwsxFEseNsJaSBrJfTVHaNZtRQHhY4=;
        b=hb5P+2Ih+Cnr47HGOR3lT5hWL0tLvegKdaW23npF97InBUCtkscU8qPl1Sb4dAdXu7
         UUSEJq+ec2zaQy7k4zn/w6iQw3twGT+pqshqL6QvNPbM+7wFxwd8c4Y7bOhaOctv2GOf
         R41BjYmqh3YD+I96ZFf4eGrqTmLju0bOgzSqPJwLPLf5Tz8cr4JgLaah5/1hZAKSrvH2
         ZS6+1lo934VGjyhyg/VvJF0PBUYyXWj5dIJkcwID6e51FCGrQEii7kQm0lnRb/MGITiD
         DuXxwHcFAs7O1jacqUbo/jAFkFler8d4I6lCl+npz0O15JOdYExr+PMHrxxrlK/XQydu
         GYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877466; x=1791482266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL9Q0QFcSoIbKOwsxFEseNsJaSBrJfTVHaNZtRQHhY4=;
        b=wTUvL5KU1vHa9JUY+y2LNYwftDYtuqwff539sNDALIn7zBYhvV8o6iCS4hJH5IcZWN
         9fWVku+0QlsHH6vsmYkrICznEv+Sg/KM4eALoN6x6NAJD7q4iT/ll5z8BmHnzc+mM+ng
         wgfhb699hzBpVWPdalH354lFyeX9aEzMPKkRBqGGqVvLWAS1oValHzRUV29hLi9TPDKy
         4rE14i9LpzLwk5zSXsi0iuPVRFTKD+KRkaoT/yXKT7PLUDS49lAJGrc75TXVlz52wjIf
         eKeSVF8Smc6DgpGmu9d/QmXcTN2E6SVQ1/agQJ0KCXKfM6G4neCBZ8EmrkNeHzutdSgu
         AjeQ==
X-Forwarded-Encrypted: i=1; AKwUvByjpcvU6Z6DDnJlEJC3cXg9S6gI/W3vQ99wIWaYpkC2x2QO0RtJoZtcb8W/4FIqfn3TOvB8RHyIUxUNsg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwH4e2/uH6Lhw/nRlu0N0sM27eNS0PRgMdk7szqBx3oIeuG8g7
	aZRmM5/d3h2XjRRp8qXScUC4hOvUEnaH00Awf7ese3GhdeKw6Ft8fhw=
X-Gm-Gg: AYBFou2e6fcL5Sm7qcFC2Rt1BHJOl1NXRQDCVxEiz2fgRo+I5QQEQvuRwhqfBIRQuxJ
	mDJonN9bZ1tsOhi3/xzFU/68K8pKZaEjGhtl0K2iQIn0sF92MSjokr2E4zdupsaueN0e1s+ilHd
	FVkzE4ICtiQ83nbY9nwyy8ki3QASLTw+G1UvM0ugzNrd19QkElhRcyq23TOPnFiqYhy26oxYeHR
	L7aQ2JIh0mAH8WNVBZQFhLB2tx6gcWYXv94/g1fjkU2iKCDHwPNquQSwWHql9X8QdWmT2NuG1eG
	0+UsXOkt3M8dNQksXnplJYhnARsQXaK4GVN1m1Y6sy9I90LY8TapVjujjPjV9x0AY0DsvdQmFJS
	SPzdnk7aQwq3Ww0AfwOIf3cC93m8/jLskIiyprwh7HNOrQgS8AxXVBUVy/HDaw5a65wMBwRFwix
	CZH4+LEuEZHrA9bJQob1T9pfedu1hjIWrWy/wDw+2Hc0fLix1RvA9a+RBS6kQtXV5M4D8LfFrV0
	0MHqk7eDAtMbS2b8Z9vQFbiDEmERzfeSmq6+kohqZMslBEvAf0UHWDPoHdGTqSbpVuXewRZc+/g
	hh0/TWe9jT2pL7vPeMcJxLd4b2do
X-Received: by 2002:a05:6214:8593:10b0:912:517b:40e5 with SMTP id 6a1803df08f44-917c01931a7mr3207616d6.44.1790877465165;
        Thu, 01 Oct 2026 10:57:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 1/2] media: amphion: drain message work before releasing core state
Date: Thu,  1 Oct 2026 13:57:36 -0400
Message-ID: <20261001175737.4048254-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175737.4048254-1-mhun512@gmail.com>
References: <20261001175737.4048254-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }
 
+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);
 
-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}
 
+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }
 
-- 
2.53.0


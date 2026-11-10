Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349485;
	b=oYSD3Ik0WWV5bRcfPcx9PddgP1CxR/gjChVmKv3Oe1WvcibEiZaghWfHEkJ00UC3YROp
	 iuW9+8uhMVuarzxTc284iIVODIXvi1Bg68h/RAZPOTiw7ZzRypV88mYU6+Xjygy4dIEku
	 cdxd8lHgFyJmrNCc70p7nK/U2l0UavIHkHc31w/16HfZ1herNzCoOctBSG5DGJpc6w/Pp
	 rr1KbvB8RvHHw9gOzWwsGvRiaRSG99SJMoZEASVpUrsBsyjpNfXxxPID2+3NKdAWBunlI
	 mjTTgigSGyT7cQ8jb6opoBTNjvVWENCrc8uOrMpzkCSpRSl3fkzs7cYgmQsjhIA9bEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
	b=pH/VzJ6loMowAI4h7slbusGGBMYEhdwoQbUFKCVkyXIebGBdKVhl1I9nS6ic90BbZLW8
	 GYt9h7FxklCEyYGVlmIvrlPIJx8Ioca/cym/oKNt0Ds5JHEQyNuniCY51LxUBZiC+FCWu
	 lh1R3xO3mm1nu82tCG3uhZhNqV54b50KyZdGuKfqYbjRoNbiiMkAOFkIVUksdqQkIsZBx
	 D78MeAQTVa/W6gLSy6a4a6B1BAADzz+HO136/eeIlhiyibPdgj5kpva4v5ejCQO+dILT+
	 oL15IRK8S6QDcndLPod3Rxzz9hV0LeukOszJBQni+h0Lr9d3CXFhOMf4/5YmA7cva9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeDk6ZyC;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E0606A320
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 22:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeDk6ZyC
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37198ed3727so3266655eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794349484; x=1794954284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
        b=yeDk6ZyCfgkxoDEXhjOxP2cxy0HvzUprG9b7m9aQw1Ez0wR/ORih8c8h1I323tq1qL
         lxAev85gOIEZiqzk5o2VnNO04ABsG+7gwxlapO3jJQ53DpT5jSy7Sv1cdBnFFLK3yJnJ
         ILHHMSqUsslekSbydXMT8h+h91B29o9MhGfKoTsMSDKquflV1fkdNlZCSHrwJ1YHsKtD
         FWCNVseWOEYdEwjUOKCNK1HTKRlHzeDciT4qF7wMhgPUlSwsMvMi9p7TyqXri0Iqt6nM
         djPXlKN/D13/zkyJ1rKxnOofrAgwb7FTea50bgrTNiQEs8vtBeBATfocmggQo0JXoXCJ
         +sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349484; x=1794954284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J78cfmAO5c/8RMgwJFrdko9q9pXZgG9FioRV6oWOxJU=;
        b=rs6E+1T4xM2lQsH4xd5TeqXrxbgrDnCaUdYl05EZ2t0E42vNRluSDcepPYJvqUR1Is
         K7N9KQvmWSN4Cl1Gko+hXJforIAo/vzi3LbmO1DygcdJQW0Fiubp8kcBllFrUSHizusJ
         GAoeKr1FCGnqB0b/+83de6EArTooqGfeTVz9oXj3V6ZDJwBSPJKYZYhvccLjecd2fU7K
         3NMnF7EMV545xvhwHNtwmQuOHT/VPrrcwndiP6in0obeaQCTpCPDnEgPvdvs9NgjMmST
         Ay4n7O/PydhO+Uf8r5Ni58SDYPMJCKf0NNd4RFePScprGp8jvkXzoEF09SFXKRvDrkWv
         PJnw==
X-Gm-Message-State: APuU4Z9iADfyW0d1Fpzr9MjrSAFcCWKAiYEpUZIYcv96EOGfI/aCu1vG
	hLIzRVX6w0dpuux6WCyLpLNtLX/SLf5dnwApzYy7Rsi0Sxdv5YlVXOMA
X-Gm-Gg: AYBFou0x1XnryZ1HTFbK39laB4ENqj5kR/ZTf9hV9dFJuovio2Ck5Fu000mTZvW2RKD
	sA/UMAmjIYbRVp7PKDmYxjkZ3ygh/97igT23O8+TmDqFwhB2w4kPFeDdxELnev0/wvQvwjJs24x
	GEHhNFs09dXRaaEshx4nwKNBKyMbjygsQBwmsFxtLStzid9o74fhQJFTjCRD8sadnhe/oaEzoDT
	A5jaFb+eZcn0BFAknDG5yUSELRcYw0+F9w9xUbNErBQUlAKxJ4pE21+zK31r+L62zMOlmj4c/oQ
	mUHkNa5/zDDYZLnPPxyuj6eEIScQPnVF6QKF4VAcjQPAQnubWpR6Ii9vyxvoBwFBgd18Vn5E6ug
	A4nUf7t14oukdA1in6RAucvleO7K1BAFKABZtCdSqCJd77EawMJ95/PNbn7KGey5Yg81s7uZLCN
	AEUBLMlpBEpHbG9d8Cmh2sg1qGcDIdmtn2scCj8bb4HvyhGuvNW4k3yqiY++BrkoN8aWXP34cti
	/z3lwcKzKfjGE8YSLgrmVSyPJyrXn5mXAUX6WzK2xyUjzwZdx0BaVEltT1Tzn7+GlE6kIzqO5Sg
	xZFplTJKEZyHNGKcZ5fSBwSL6LXHgTsoR2rZE0qYW10LLZOfKVgGrKbRvFg=
X-Received: by 2002:a05:7022:2594:b0:1b3:a8a6:b55e with SMTP id a92af1059eb24-1b3bef4c391mr1435246c88.24.1794349483523;
        Tue, 10 Nov 2026 14:24:43 -0800 (PST)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm8424966c88.15.2026.11.10.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:24:43 -0800 (PST)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
X-Google-Original-From: Praneeth Balasubramanian <praneeth@ucsb.edu>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>
Subject: [PATCH] media: hdpvr: Hold io_mutex when restarting streaming after a timeout
Date: Tue, 10 Nov 2026 14:24:35 -0800
Message-Id: <20261110222435.205738-1-praneeth@ucsb.edu>
X-Mailer: git-send-email 2.25.1
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

hdpvr_start_streaming() expects dev->io_mutex to be held by the caller,
as its comment says. Every caller takes it except the restart in the
read timeout path of hdpvr_read(). Commit 6bc5a4a19275 ("media: hdpvr:
fix locking and a missing msleep") added the lock around the
hdpvr_stop_streaming() call there, but not around the restart.

The restart checks dev->status before its USB control transfers, which
can take seconds, and sets STATUS_STREAMING afterwards. In that time
another thread can start and then stop streaming with
VIDIOC_ENCODER_CMD. hdpvr_stop_streaming() sets STATUS_SHUTTING_DOWN,
drops io_mutex and waits in flush_work() for the worker to exit. The
restart then sets STATUS_STREAMING and schedules the worker again. The
worker does not exit, so flush_work() can wait forever.

Take io_mutex around the restart, like the other callers. A restart
that races with a stop then sees STATUS_SHUTTING_DOWN and returns
-EAGAIN.

The missing lock was found with an LLM-based tool that checks callers
against the locking rules stated in kernel comments.

Fixes: a503ff812430 ("[media] hdpvr: fix interrupted recording")
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---

Notes:
    This was found by an LLM-based static analysis (GPT-5.6) that checks
    kernel code against the rules stated in its comments, as part of research
    at UCSB SecLab. The patch and changelog were drafted with Claude Opus 5.5.
    I reviewed the patch and take responsibility for it.
    
    Testing: builds without new warnings with W=1 (x86_64). Not
    runtime-tested, since I do not have an HD-PVR. The hang is from reading
    the code, not from a reproduction.
    
    The patch applies to mainline 9ba46df34488 and to next-20261109.

 drivers/media/usb/hdpvr/hdpvr-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4290b2367fa3..b7afcebe80e6 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -475,7 +475,9 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				 * streaming.
 				 */
 				msleep(4000);
+				mutex_lock(&dev->io_mutex);
 				err = hdpvr_start_streaming(dev);
+				mutex_unlock(&dev->io_mutex);
 				if (err) {
 					ret = err;
 					goto err;
-- 
2.25.1


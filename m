Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7F4E50AC
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363833; cv=none; b=NXDVxp0IpDvHUZocnv3KAhGiuM57bFf6uz8CBJswDSR5b+rdFfE538WKxf8qeJC4kgcVJbDk1DXYf371w71loWp0iROPp7AUBPUT0+af+NQ48BXp0Xlz1AxjsoW5pnFM5cPYyQX1HnZwX1JsiriC+D4ZDDzredIPvWWbO+ErT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363833; c=relaxed/simple;
	bh=cx+Qxo7ICqpNTesdr02Y5BPfFrvbALtUCzOZqGDYf10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vg/+Z/GbFsCRMn6LJ89CP3dL3UTL9vHu8APuRspKImZ8ivUUiuTIlFskfFoNamGw087kja99afp0hoYaUAUa5mJxZC+nR7JZiKMfvjx5fE5OH6lPOmyTS6I2aKJBnCvewEkiAfVjInSk3pKjik+1FPAguNAR7NpQPgCMz7EPI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J427zTKm; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J427zTKm"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067fso157375585a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363830; x=1790968630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVZBghBD2hthXf6SLqJUAS1zp/fiQW6QZMeVDkbpjJg=;
        b=J427zTKmGY3rvXqo3cjJ0HLN+jG9rtNpwcggo1EJQ6hmkMjFumoeXAXSyYrwbpszWU
         cfREcNyarQC4KVuU+17M0t+51ZPr63KxY/mjL0BGvwSu0prlL8TPQnIMM4JvZ3e8vB5h
         aJ0RDd4hXRqK8L9aHlIfZJDDx7x7Z7XbikYaixy5eE8pJ5ShA6m5U/luz1RLXI2Jhxmr
         Bk/Q4FT8//lSBiverkS81uNxhrg2h6SSQiW48LROdf7t0C1X7Xwp6lqg3b342nMngptd
         +mF47j2Bg6lXG748k7hcXN3Nq/rbbMdI/pq1P/Cy4hmNCqDI0eEeWYYSqbczuGr5hvxb
         KCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363830; x=1790968630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVZBghBD2hthXf6SLqJUAS1zp/fiQW6QZMeVDkbpjJg=;
        b=Y9HTrJcUyWBx5zohaS2GQ/JD1L3tadOhgBEKni1cLb8AG1rmZNdWQCXTmFcEUDUsW8
         41G4FZiH+h9yljEFBctHqcmB1XPyeo6Ps2RuutB7GaZNaG6HmNu+rIsAvNXskVjZJgJv
         fm5JwEJLJbftDtoSxPL2mHLE5E6nEKIGvoAduadKZFrzZOIfLgy6hUgTH4PFWSvb6XgP
         2l1J6zr8MuHmh8Nm6zdEI3KHkENrkE4aGvL9weVO8S+AVDfx4IrMvsdlVfwCdH3yHaa3
         TXnR0/lBhAcku3C+WyfN0AKE7LBLEfdKxuWfeiozzkzcO6ZnAOBzTUtHGVRhl+A0gjFH
         4XDg==
X-Forwarded-Encrypted: i=1; AKwUvBxL54Fkz6tepyHTwRalc5A8HXgcu8aKeaFd0rTdp01fOW6wiRAA5uXrLTSowlXUOjlNlccjSTqOCTO+5A==@vger.kernel.org
X-Gm-Message-State: AFuF++nikyAVB/UE4r2+8M16cZpsnIoogypPyZlomp/KrxB36i18KV4F
	ekiUdJ9kRJtkoQ4WnGC0zZ+EC80cHa5/FWOJ8ka1/FM9e5wwxhhR8tg=
X-Gm-Gg: AYBFou3c45AGFN382hXtBBDSuFwQYX1l9XatbU4B24gEYoTgpAUP69o3dJbDne+TpSN
	E53VMmXzr8whfr6HwgEN3+7+NZ/N2lNRhZjIYmaL0lW4fst4ILERzZvPBu5m/dBYeUjL03mi0l7
	FDMLXqOWTBAFRX7DZpSMbciCvV9Zmx7XC86fggSvtm0hAfAs0JvqusA8kR0dy28qTckHqetZwn6
	K0XgBNef5cYe34P0nOCoslUC+a5Fo9m60V732o5LbxpGLoh+x9BWbge8pO4hGiHiQriNEVAeEgB
	C9ZO/0dObZFWkiLHt4XhJmzynYQuxHC6bfZWsHdPyna/XqKiFHYJHCjKZITSRAXJu7jiObkElDU
	N9ok77ckobSkql35WEfcJtrbOYsKKsZ/Kf4DceTo3DBczf8xk4e0u4JZ84/0LsBqGFIdZ/3MNx7
	ckULTs0K8tcNHnpX+0dnxopY/4vfT5Gr2rVlCZpHtvoj30pe9UDDBz3B3y8qG3cfc3/FHUbDWcI
	qBnehNvP9UhBMAyOc9XA76GesC48OPQ2zVnRcMvfMf8GL2A7QjqwWH0yxCJtNUAIZeLZ7buHMgc
	ru1bDI7qypQ6Ltw1QvgqX/iIv1WU
X-Received: by 2002:a05:620a:a7a0:10b0:93c:56a8:a0a1 with SMTP id af79cd13be357-93c56a8a319mr54053485a.58.1790363830310;
        Fri, 25 Sep 2026 12:17:10 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm23521776d6.28.2026.09.25.12.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:17:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 1/2] media: amphion: drain message work before releasing core state
Date: Fri, 25 Sep 2026 15:17:05 -0400
Message-ID: <20260925191706.3144437-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191706.3144437-1-mhun512@gmail.com>
References: <20260925191706.3144437-1-mhun512@gmail.com>
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


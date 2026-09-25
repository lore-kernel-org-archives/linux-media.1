Received: from mail-qk2-f30.google.com (mail-qk2-f30.google.com [74.125.230.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4553BE623
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363822; cv=none; b=r1Kj57rULq6sLH5XQxfiBWBUvdOaXvTsH8XIUiPvoN0YUBX2S4MxdVoydnDA/iOr7wdaj5joGDFDzxAn2ViYDwm/ZXmvzYdohSY58gy8DSnWWqOGLxHxYd1+8zPXql84PO6JthEmfZFz6ytJDI6Pew+8iRASYuHKgpED8Y+3MIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363822; c=relaxed/simple;
	bh=+96OmNdu52OLdp6PqNcnZbKt8nrAE4bnHJngCEEGTaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoEMJsV0V0R6YLNJg6cacA8itVba561dpSqKv3B66ZrHs0yHdg8EAgz0jwzvqWAoqa7w+xRxdZaK+6ik9cLhEimoFInW8MpcvHdwLwvWCTzxDIz9zohKlGg5O1zeF1aGkpGWJAgtGqZK7jj3hN3Yg81tvlNvgVRMlwiI1XIFKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruPTmgrk; arc=none smtp.client-ip=74.125.230.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruPTmgrk"
Received: by mail-qk2-f30.google.com with SMTP id af79cd13be357-93a222edc62so135848685a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363819; x=1790968619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvpGMpsWr2y15kZYUKT28HeHCdI9j+YtoSYsRebbgn4=;
        b=ruPTmgrkZnuKH7sceS0e5xg0u0Ob7erHTEHHECzWYsDJmsfJ9WfHojMjTlMvfUak26
         8TtmeyjGbwa6x+q3ImVrgkXp1cZzq922hUaR1ftJops/zXaNOJ+lQZ6JiUGcN4iDfJSJ
         ujp/ziptN666wraCJf3zIPF2le9K8NWyusg0SjLwYgrFsXYlGlj37u6pig3oZO4SV7y+
         jwd/DTAaV68lRCBticIVsF98trlNgESmNEalLtdSm7iL5oFBwb5Ol2csVQLlYNKDtWC+
         jcZoT+OlLh/r6RcSRpNbqgfl4GhCGtwZPf/HQ8hBwbDRuu4NJKmAOyD6qSfWJYHnR+/8
         YvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363819; x=1790968619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvpGMpsWr2y15kZYUKT28HeHCdI9j+YtoSYsRebbgn4=;
        b=fkwWL2y5jHsD7H6vrbED3J7pJ8Iuo/yb7F5O9By/6R1l+CvNMCQO6MTflleG6OSedc
         TkQCTYF79yLMPGWCn3nXuMW19039093d6w+j5if3jDT37xBboQ3oknsKeVhRH1ivlVen
         XAUWLWPnRNBQBDZMAjpmA5I8wXURQJPtDXv/eiQwGdOUc34FhbKZCWwv803YfXMGqcy1
         GQmLD5/OACapuXuu3j76W6Qem47oGRqb1PG5Uvgxy+gZDDPmRFrmZa8gLDNq3crht/A+
         WS/OKhXYBoywJzTOFsIg0H+CKOjpPb//cY8yQGjf8s+qaS+yCL/uy6vDXn7yJe8VH2C+
         H5DA==
X-Forwarded-Encrypted: i=1; AKwUvBzedgyWxxyjFU5a/BT0GlewTUDmsu2q1qjJlsLgLC4mzvOGlMP2gVW06iEqLAYlfsU+K7QqUbeAXlSn/A==@vger.kernel.org
X-Gm-Message-State: AFuF++lZe2x7k1r788XWuzGKBcwEPtdJfvj4oGDZ5mWaHwJNl9H+eo9K
	Gn72rpgrsGhAA1Vnza0uz3Mb44Iq1ar3WaEONRGGoxvekRBPXlZa14A=
X-Gm-Gg: AYBFou1xbvbttA6F+pkIGq+ehvhVe7uK0S6lzsYPwpSDjYss7n+5pD1uZgUhg9rpBkI
	o1RjUOE+O1EUXBEYOoza1tMN4cmqWqGCKDeC/WSEGJ0aTvI8OSXUMbVDn0hQOu2YqJlXC8REBvU
	Mj4QbOO/IKxhd+4ren73+ezaUAw+NU0fBJ1NUXWqilVDBYeFE4M52BVyKzL/h41M7XMHRtl6jbP
	KY/eAyw/zmu/cXxMJSoxsoTpwwMqlHC8kaKLtmXldhsOxu8x2YHNHQ6xDCn80zKSKJfs9pOzFmj
	WgujrvuCyMY8HU/xYLVHvODmazRnDvv9GqRAdklOMe45iF4APb4Rsg7Jhg4xQ31mcXs1E28MCj2
	ors4z99v9KDM9F1jLj/00zITAvWUz5bbac1Ju6h61W9S3+aPKV4PUvveoSHEoDPBTE+jzjAuM+i
	fxl1oTzZx74KqBhmBJErkf+c15qEXENjFZzk1slPCTYKKn2nmTrWu8nOxmuoCLtGf2T4NDtVWwe
	GMBlS/P3ediYp/NWu9e4bmhhk4ZsQWY/8nhecbf29HN7dEnxtB9f6OxoiOnThtoYFybgD5OYpD7
	CPl7hXb+zf/Rp9hRT2OcJtVOt538
X-Received: by 2002:a05:620a:1a1b:b0:939:7c8:78a9 with SMTP id af79cd13be357-93c43b61a84mr653468985a.3.1790363818750;
        Fri, 25 Sep 2026 12:16:58 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm24142666d6.6.2026.09.25.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:16:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3 2/2] media: venus: disable recovery work before HFI teardown
Date: Fri, 25 Sep 2026 15:16:53 -0400
Message-ID: <20260925191653.3144006-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191653.3144006-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0


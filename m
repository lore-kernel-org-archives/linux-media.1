Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42553524AF8
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877321; cv=none; b=VbPiqRihUJS98zaTH9rz5xOI54/fT+tLke9H+KrXA1Nc5KV47ysi2wf4DiuPfGpFBYK+ZQR1SEq4mRnFssCX2iqyH8xBZbAIYN7IaU/eyVNYD2jOPoSEDY680P0s3R/ClwzQ4oO9Itr5i6Rw+h7WQLbueiJw/ayUxhjYLPlfr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877321; c=relaxed/simple;
	bh=DSpR+eIPRBF54SbKN9yo7UEYapSBpiuM6wm8TWPC1+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxcSSGg/TXeSlvmjWpaA619ri8Jdsi/Rkz81HaE+7Ks/iv/xnqNrfzbQw7XnH09G/vIl8+edSmfNE+f4yOSEs5jn8QLIqMSfWPsjf0J0fzl3j/+cNKarv7O6V8CLZt4C2WT8Fi5mEvJKSKdSPxhkseEKwgoLtspT9QGoBYQMUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Id13UQ; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Id13UQ"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917a3545923so18303776d6.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877309; x=1791482109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=E7Id13UQomuPL9aWkapua+tmuQRYbj0dThURePlTxw8/TeZ7Cd+OPua3QkrTXge67F
         eu/ayh5Odq656jVhBR84uic7znNkWW6o5Tp27K6yKPOAgyoRWOKj8CfNU6C9oV6KCU/g
         4TNaC/DhfARHEn3hhuG05fnvAMUs527VXLVlD/pHw+Rb1nJ2m+bLxbgBprlWZ4sCXMTf
         bzHWCxW3c4W5J86oq0KbGlU9wfZZIpKMv5oIc5p0h4dklZsduRiEQyWIfW/wtBfMALc0
         cddu+EmN//Jz87YQZsrjRPJzzmxqq+EiPsxCHZgcma/a2zibgSyoOGJ8xUFvI2q5UAyy
         eiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877309; x=1791482109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=wt8h43jJuGeZDpHqKyr6qPjptnMvFEQfS0tmnLRUwu/RorqCvcNRAwyb/ZYFUDkmbf
         4/P8b3jVYJzo2ymRzoS4AJown0f/AGxMveR056msSWD2GOxQz9SKiwaTflOdTXjiGk1a
         yM+nZbzovYsUwjIaKGW+lISFaISh36TLiu24CbaolqSyI0ttKtaYxLy0e0SbueycyUIi
         T7XJ4IoVsfboQtXD/kzW/GqAniwFJ67NzqJlcs0NLyO5/38OX4fnUr0eVtM9lBvTHd9E
         c1qYBpdNISaEwPPK5zHN6IxMuYNOBdYZiYC8pmIcx0LKOsRc7FGIzk0ARZYHDcy2ENn3
         qCyg==
X-Forwarded-Encrypted: i=1; AKwUvBzAFRFg6nzAkfZOWOEyqBSWn9qjjuiBNC81Wr5bwD+KwK9Nv2Jtqv5e5OrjYnu4jhO6F7gO5+pqrW0JQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjCwmhxiCZI4DM07MDOmXif5JmdqsiTtV7xU7BXq1OLKshDJxd
	qUN6ushiNhgHsZZvZd6wB/Yv53dgfw9rDnIR+Wy8bERTelDls7/r6E0=
X-Gm-Gg: AYBFou3jyBhuWEXAZwc5ejcxurcberRL+rwRhN07n1CTzHYPqrO4aunxWplrQjtgPvb
	4uJ3pXcTvkSmPgPVUxr7/P0HxeHt39xPIr2WxYbID/pYH5uQ2JuqoQekOaMlEiIn57JcMgVWrF7
	qN3BhPJWvfJj45uJKiH92lOdrWUbjPKzisMC1dL2TvtHQwkO2B/s0hkFJCGG7LbSVeNOO+g1Z/4
	MG827rK1Fbxlc3OZf6scebcyAblApaia1vqhjvVyI2SoiNaTQ8+6BqqCls7ND0MTKua58QbmwR5
	wQm09uAtLvU1+AeTgZXCDg7Iwc4pIPjHDI4N41aoFvDS6/dVcGT4rq9L5MPQOxOW98gMP98kWjK
	sdTReyHt1htiZeBre5it4LLkktwHCxZ9y+gxmnaDg/T4Xkz4oph359QjJatbxCmvCGgSca3cxQY
	2TCBXaG6SEIDibHtwlRZsl8rWoCNAYdZUkGVy9g9CY5RVuyudpWUl5c3Xc9tFcfO+cmPkfPN0m/
	XDwsuZHlgJDI08soLF0k621fm17mDqxH3DYEnK+xA4RBY4nIaTcFtPIWOSGqmERJVeOOjvSMpfC
	t/CWFa1HFIQd2aT5jLiQI2TGEqtU
X-Received: by 2002:a05:6214:458b:b0:917:a1f9:252c with SMTP id 6a1803df08f44-917c018f4d7mr4051756d6.26.1790877309360;
        Thu, 01 Oct 2026 10:55:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
Date: Thu,  1 Oct 2026 13:55:02 -0400
Message-ID: <20261001175502.4045853-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175502.4045853-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
 <20261001175502.4045853-1-mhun512@gmail.com>
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
index 7087af32060f..6e495bc04691 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
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


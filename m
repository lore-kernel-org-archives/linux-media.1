Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B09358D00
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561533; cv=none; b=mC3Ni7XpkneNa0hsC6OpLq57noMCjEoU5Z9OxZzZhSt1GiUgksITCKqgJ+WYgesHxK7hAvtiyynWZQNuco3FUO0MOcrcC0vfEYSA2REdIN+Cmw3V71Iqnjpc0JpzvtWKk9kCAkUbXfkk+6N1prSID4waoKZR9dbEJn1f6dGYHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561533; c=relaxed/simple;
	bh=GNlfIQn3/4sj74l0bcAd1OCnJv85ehz8xRgjB3l7X6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q1vc1dbJvTuKF/GXSQoQAefpQ2EkiEKkTQXJx5Vm1FiL0uIqgMQLv8jihfW4QRjeDkwaBjHvWg4vmn5Km0Ok1/EP+rnGR/bI3znJyTV3Ng6zKznfEx1UX+YoCbIwwaZ3T0u09ekfSr9c1ATVUEUU8fPh8uDFig1UvoGiEM5y0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXbLxKVL; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXbLxKVL"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304f590dd91so433765eec.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780561531; x=1781166331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al7V+0dBM4yLTh7JxiBYF8Db9WJHRQf85PY/9QPCuro=;
        b=XXbLxKVLKa6Picp0p2Z7ddO/jLVr+icoub5TuAom6IiX8YK64IAC1XSTxkYW5ChS7h
         GgIYlQWp65BoFopZMDaIZoc0wVu1GwJDQqFC90pU38SHB3wTNoABxF/n8gW/Oc45WprI
         Tl1yq9LnhiWsVexLHjq1RBYOo0oOwARB3nox0WtHoraBFjU8MWjhRRm3ASI8J2jUo6I/
         m2KCmh13PKNkCQPiw4WuH9sEpeBDOul5iGQR3d8Pp3e5lWt4LGPT4NECouOFEnALEJ5C
         W2DbvXTuWhIqy68sHdVwRuGj5LhfxCQFZGjcVeWvcFhT084Efen4nq7HxrO8kZW+qiUc
         cjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780561531; x=1781166331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=al7V+0dBM4yLTh7JxiBYF8Db9WJHRQf85PY/9QPCuro=;
        b=mVDHk0Eems2JfWPMc83r6vmauPjZG/1JHkV9DKCIFVmyM/l3l6xDupYmYMVfBcyUgR
         oL36xPnvMqwgZ+m/ByUgWGnQLIyNaAe8gW64sn6AnLgpYTs5oOP+BEmy1TdcyQ0ZVIBR
         337Ug3RS/GYKMA0DemUaKKK3CN9TsvOZ0EZYt1tA0WTnHqWGFLLd5tbP22UHL9R/KaBW
         3HEUY8NvZcQJvF4GkNamB1KArnBedZA8ZBnB9BPTiW6aHVqRy6vS8BbuMxvU3eSs52h9
         cBKlXcaMzoD/BlGk6V7SbSgghE0ta1JuquzL2gw53Bo+03NvUMKRt3+L+28toFb34Cks
         GE0w==
X-Forwarded-Encrypted: i=1; AFNElJ89WlFpgSVgcH8HT8pGyWbyeU5cOr6OYNaV4YV6zTYom+0ViJAFMWjGFllTknvSTvrjRx1rpvw57z3rgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kapv6hBmu1lMWbvcya9/d1sVWdkD7pWR5GpmicoWOOabuipD
	5B69rA+WguSJRZcHbyE7RLGant38UUhjqffwLkD2ibiileRwA9qCV3FymyOkJFnh
X-Gm-Gg: Acq92OHHDid75xVH9RL+qPt0svyoIe9OjhNQwarGiUK1TwBoUigWQkJvEzFbVaHcysi
	NCGWm5ClTN70l7VLWIz19TndNf6K5EUUZ0dMBHdTCZv58/RI38gTiDnSPzsPjcH5cPCnGvmcwOH
	a1/LbxlBxOLJcGwFnJFdfxJMVlj+7EBQ2pHzcR6HsY7HuGPSMd16Lg/CCBg0WFeFKO1i3BkC22C
	oC2saDe23B9L30HywtH25Sd95pPj5AoMaBDRxlhx1oOnIlZPtTiJckZqmCMq1MlgJewqJEcsuEm
	o70GMoGYLRRpb8eB+IMP6rHDi+PiM8mCMmhBPTk9D+uMsoKjdb5jjc+1ao/tUm56IXpWUTOxhuG
	5q3x7Xiq2hOUKsbbifhSWLOr+rsvKh+dWJLOnJ8b0Bapl4n3x/3ldElXXVBZN1KNhNPe61s/LCS
	S5Oxohyavrxsef459Yg2WQnfsqQyIyHFEBGwfRxyiGlbeOdWb893k4213uu6Z4RFPgKg==
X-Received: by 2002:a05:693c:68ca:b0:304:5db8:da95 with SMTP id 5a478bee46e88-3074fb8754bmr1843173eec.23.1780561531220;
        Thu, 04 Jun 2026 01:25:31 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm6014312eec.23.2026.06.04.01.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:25:30 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Thu,  4 Jun 2026 08:25:10 +0000
Message-Id: <20260604082510.45733-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <v2-message-id>
References: <v2-message-id>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pm_runtime_get_if_active() before accessing hardware
registers in the threaded IRQ handler. Skip interrupt processing
when the device is not active.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use()
- Handle negative runtime PM return values correctly
- Return IRQ_NONE when interrupt processing is skipped

v3:
- Remove the early enable_irq() from the PM-inactive early-return path
- IRQ re-enablement is already handled by iris_vpu_power_on() after power-on

 drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..59040cce8cf1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -100,10 +100,15 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
 irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 {
 	struct iris_core *core = data;
+	int ret;
 
 	if (!core)
 		return IRQ_NONE;
 
+	ret = pm_runtime_get_if_active(core->dev);
+	if (ret <= 0)
+		return IRQ_NONE;
+
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
@@ -111,6 +116,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	core->hfi_response_ops->hfi_response_handler(core);
 
+	pm_runtime_put_autosuspend(core->dev);
+
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
 
-- 
2.34.1


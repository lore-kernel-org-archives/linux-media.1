Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728D267B05
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100929; cv=none; b=EyA02Rgbi32jpErtH9mVev24+5HNehWcXShC+1KupuGSHTA37R2kSqE+qTQdBRH2WhY2TrrRR4wu5R/RWVIOgCG2UdHui7r45nxczxzjak5KmrnD9f0nrkPg3+8Rl8zjjP0ydfj9PtAL8toNlbAOS4+IeoikU+mH6JW5WDRtKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100929; c=relaxed/simple;
	bh=4BoqfQ6mL38Ac+JXS/jYEbtdU0AheQACrXClFLVNg/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2mPz4bgK3G/ol4zpJvng5jO+xY39kz6t0kUUeLz7Qkaj1700gnjhBvuNLAaao6cG35c2vTaAxXouVsxZ9gIqxdde12bnPm0pEkLyYIs7Hqh2Mf3WMS1jusSRRcq3AT/fZrcN2AVQ3xPYqdRu4c5vHfD3FVWCfPTgL/8+fQuhNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr+dH0jL; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr+dH0jL"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-307263ad0cbso9419240eec.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781100927; x=1781705727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BL13xctmBFivsXzXnLUZmni2yJ2AzY1XEjVgT0sg1Dc=;
        b=Mr+dH0jLle90BqeIceBUtK2WiOy/hCioNs1Neshlq6vIYtqF4DRREuG4TlgpY9XXxi
         5GJLyCMtGQoI6rsaienZBgCnwzr1LivGBtP5j9PBOIe4DX7uBVhjtNSs7qQ65E6NWK+z
         GiLJm3Xc/V0mN78cs2gru1PZvRLm7b/nsmI2zjR6xwPn99K4bwJuAQAUmpeyXWtZBYXA
         BIu0gIyW1+6ae2B8uH/20R1Ei4SwQH04uzw3lqR+Aw12EaydsFlp7y59RWdzlP2CYGFH
         WupwduFGOzCwTi4cG6/P2wCXMNL04h3o5PY1k8N8gKHAzfQArFFxMd4kPqP91lvHrLq4
         ot0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100927; x=1781705727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL13xctmBFivsXzXnLUZmni2yJ2AzY1XEjVgT0sg1Dc=;
        b=HxQiBpZPjMBE8ZFE7sHqg6j4cdqKq3WMA/de9n9q7h9VtkttrxGqBKYEQCCIfhwYU9
         sS0EayeGU8/5XVLMXo2hLxxWq4HDatNkSdpwMEbPJWCqWGgtGBvXWaFOLBvTGoDtCwxm
         QKS1WHkxn2IBCSlE57cMih6yChZvJgMbQQoPmA+vUCJcHTwQdw9txRpEwz9TfVEk2Mcn
         KpfJGtG0JVcIgAg/abo8zRwaB+FIXkO1ALAvlfB3hSWUbgXdDdis0vMXqzmPWeSQi6AG
         UF6gr45yonHzSV1tTSQHC062Un/v/E8nQ8/1QxRHH6/DhsE/6sgwPkQ9ZUY249pHPKHV
         WiqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Pr5dk/Cx4x64wL5kPSKZ17iWS+ekRzI1lkyvoCGspU7Cr0y3Pzz1v2CMRrvXlNOfvlBbhH0N+YOR1Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCjBLw3QTFdchn7cZkUX0nF+vUUxqBv/WzXoZTPYnhXPBZjRt
	fFsYXwGrSf72WIkAdh0xrGBBIlyoebycMBeQ0Ea3OvqvHcrh4x4+P9a5
X-Gm-Gg: Acq92OH6RDOJj5p9Bfv3x6RyRSFFMNch047JBpY1r0Wh3zmTR5d0vPfbAYZREVPz/DI
	LS+bnx2sNwOUCvb8HOeXYcb6//lQgvLlwkJFp6+byq7TL/CWNdlaP1fpAEqUOzllZ7cE+k5WKtz
	nmR8Yxr4EI5E+GP4PXDTJlbdmPXxPmR2e1aayPee1YprXn546YqKFGNgxiXAa9zD8fnl9yyP5At
	d+iL87hZ7loJ1d9Cf2gT9X8bgnHC8lKXb3azyxZA5IJZJn34pytMEulJwIACUFL93fAeSS4xHlR
	f9PSJVnhwET9vkgrqXDylmpU5497grON4FOs0b/5yPmhsAt8NM5xZBD7fWvoR1OPKRrIn/78jIp
	pNp4Eib/vexu+Slk3ZrHh46vo37+aakF3xd522WX9hS6A3tAjYLppvjqyL5W0tiqcYkvxbFJca3
	/pSdxsfc4cBT6aQruyBMGekmwE08iXv+osRM7+xhLrspnJ73Ng7O1hDSs5S0XbRHWEXw==
X-Received: by 2002:a05:7301:5f0f:b0:304:de26:3cb6 with SMTP id 5a478bee46e88-3077b1c51aemr13825901eec.23.1781100927217;
        Wed, 10 Jun 2026 07:15:27 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm31456004eec.3.2026.06.10.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:15:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5] media: qcom: iris: use disable_irq() during power-off
Date: Wed, 10 Jun 2026 14:15:11 +0000
Message-Id: <20260610141511.92352-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ is registered as a threaded IRQ.

Using disable_irq_nosync() in iris_vpu_power_off() does not wait
for an already queued threaded IRQ handler to complete before
returning.

Replace it with disable_irq() so the power-off path waits for any
in-flight threaded handler before returning.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v5:
- Drop the runtime PM check in the threaded IRQ handler.
- Use disable_irq() instead of disable_irq_nosync() in the power-off path,
  as suggested by Konrad Dybcio.

v4:
- Clarify the possible ordering between IRQ_WAKE_THREAD,
  runtime PM suspend, and the threaded IRQ handler.
- Describe the race condition motivating the runtime PM check.

v3:
- Remove the early enable_irq() from the PM-inactive early-return path.
- IRQ re-enablement is already handled by iris_vpu_power_on() after power-on.

v2:
- Use pm_runtime_get_if_active() instead of pm_runtime_get_if_in_use().
- Handle negative runtime PM return values correctly.
- Return IRQ_NONE when interrupt processing is skipped.

 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..538659284c7b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -236,7 +236,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq_nosync(core->irq);
+		disable_irq(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)
-- 
2.34.1


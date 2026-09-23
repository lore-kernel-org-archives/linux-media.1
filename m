Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4D37207F
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206973; cv=none; b=abZSFhzWc3Pia6N+fswo9nOg9ANs78TaVBKZ8slFToKXD9THZfx5YWdjkj3/BM2BhXs9ghw+z27IojWQDWcuftQzS04b7U/CLrgSCHh54LQ3mEpKn92ptnUcrXauiW+f62JtZmMk1zSk5OxhA3V/C4aMERnVWDA8pVRyPObJEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206973; c=relaxed/simple;
	bh=scApZ48JKByYXRUZuoAY4Adnb7ZBllREjmuuQPO8t9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stpRPjdt1JKwoxuAh7F96JKpewzA1tHsyeUEZNEDxppBpQ6q23j5HgJgGMpeCH+Br6kqvPExTvfi5l3TQ85VfZDLH1Yki+Rl738mUZKlUTfZo2q2MLOA8y/E2t+33+mV0qFrJtFF8fqmhNgUyqAMxDByVTpBYDQFavco1CPYWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKPc4Dzk; arc=none smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKPc4Dzk"
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-3286624d194so1037459eec.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206971; x=1790811771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slUIx4ec0Cimq2PSOCuDVhE9ZpRT6hWAlORZbx5Y+H0=;
        b=NKPc4DzkaKK5W5YSGERvMczCWxYJTcu7/b1Yvy9assFL9J4XysT7WqfXnuVUhBr5FC
         6Ij/i4QxDqRzqG8GjnaTmZQqZm9L0h0hRlJifr2ANXcNto4Apvh4ucp7aSkCZVfuUc4a
         ch5laCCNqHWCiRUt93jErBDCJ1NIalHRG55PnBqRtoUAqa+obcCMcf/yJlvLddL/HfWJ
         9kcLAcPlk3tnq2C+UtemLYI1dcfPIM/NShkEMxmKonQLcLmStMaiw/c16AiRatP22bLG
         sY5fnTE+MNkRYv7prKHSb5t0mfNoFrC4L54TLg7b4Cnh1mlpvYgZetQH0wppiUZLtHlc
         SPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206971; x=1790811771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slUIx4ec0Cimq2PSOCuDVhE9ZpRT6hWAlORZbx5Y+H0=;
        b=iTHYWKzoNCXC980tkdLqpsJDF1ZEqw7+JLcFJjo3LqAiyt7JRxov6mQkff1r26YnIo
         mw/LWvKSeRTpp43k6zE0oVGwjegWQ3/r+pHzWFg1bOpaOFYXdhvN7nZDxepaCzsDlHhD
         snqShOW/+J55jzbpX0JDibLpE0gzC4XnmXde+vXyTIAdPQZKWc11IrYZbPb/LblvS9Jc
         QZrUHz9rRkUt8SKiM4Y7v1BMW1LrXx5wbH/C7Cw5j73LwwAjuMlHcPvSPc5E8VCEzAAA
         tllvroEmQ4zAOFc8yoD4F+TW8OQ4oTneTxdcWvnL1UjAy3CDLihktyGuxw7qbz/CHVZJ
         MFoQ==
X-Gm-Message-State: AFuF++kvlmra0eNwFFsfemY5eYhHxOF6MLJYV7YVwZTxXuE3CsF3QRQT
	3O4esqQvBmDeVsU3wQZUfD28tAWJDFOb590J9qCfe8YcTyPQrPDM/frBv1CkvfgM
X-Gm-Gg: AYBFou2vm6gM8p1g5cv2O/Yt+lHUaeLLWzFIYDOHnWKLstWV4m/Vscb6LZvGAnjIBEV
	InELWu9rbSy4fUDHtOD6cinexAVeePLtG7B/LEzWO/XRsKH39NR9IgUyKhjWtcIsEhhKNVNpvQ+
	aKHWuQKOEVZsEghM30v2s8pKAHPO4b973GFMDKiLd+rqh/Yvs87MwZaf5FqiMim65rj8cRwIktJ
	Rqx5S/jini047gth6HMKLZFOVbcpht2PIQXu6VNCRlH5tLILwZ6HPcUM3wn0nhmNp+eMzkLR9A/
	LLkHSjBGUtmqaZxmua628tMS8pvg1cscy3U2mfvMV9VNTe71uGLaza/ZQfl5E+jgVhnIVgM646F
	pvAZH/NwEYr2wI0G5Oh9zjqXUlR+X9tyW6+mX+GHFSKp22BLDujz5Br/qLGYX8yK4MGYtJhb/dz
	K4BN8eRFoN+8MILu3In9kr4qH//CU5RSJzYlYH6adDN4nAo3aM4oR65nv8PeK8PZQNb9XibctGl
	mVablOtgHk+z4Pco7uYBqmRa9lZHZBSYW/f
X-Received: by 2002:a05:693c:621a:b0:33b:c69b:7074 with SMTP id 5a478bee46e88-34002be16ccmr527382eec.4.1790206970986;
        Wed, 23 Sep 2026 16:42:50 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm9088502eec.0.2026.09.23.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:49 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: ipu6: Only call the isys and psys ISRs for their own interrupts
Date: Wed, 23 Sep 2026 20:42:24 -0300
Message-ID: <20260923234224.325504-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234224.325504-1-calliarifelipe@gmail.com>
References: <20260923234224.325504-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu6_buttress_isr() calls the isys and psys ISRs on every buttress
interrupt, and only afterwards checks whether the interrupt was theirs.
So each isys interrupt also runs the psys ISR, and each psys interrupt
runs the isys ISR, only to have the result discarded.

Beyond the wasted work, this makes an interrupt for one device
dereference the other device's hooks. After intel_ipu6_psys is unloaded,
its adev->auxdrv_data still points into the unloaded module, and every
isys interrupt, e.g. on the next stream, calls through it. This matches
a hard lockup without a trace reported on the first stream after
unloading the psys driver. On a Samsung Galaxy Book3 Ultra,
instrumenting the ISR showed that a 60-frame capture after
"rmmod intel_ipu6_psys" would have made at least ten calls through the
stale psys hooks. The same capture made none with this change, and
captured all 60 frames.

Check the interrupt status bit before calling the ISR.

Reported-by: Mars-Wave <tmorolias@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260922063507.690-1-tmorolias@gmail.com/
Fixes: ab29a2478e70 ("media: intel/ipu6: add IPU6 buttress interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 63197f746..74c191d72 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -369,11 +369,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		writel(irq_status, isp->base + regs->irq_clear);
 
 		for (i = 0; i < ARRAY_SIZE(adev_irq_mask); i++) {
-			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
+			irqreturn_t r;
 
 			if (!(irq_status & adev_irq_mask[i]))
 				continue;
 
+			r = ipu6_buttress_call_isr(adev[i]);
+
 			if (r == IRQ_WAKE_THREAD) {
 				ret = IRQ_WAKE_THREAD;
 				disable_irqs |= adev_irq_mask[i];
-- 
2.55.0


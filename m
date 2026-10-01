Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434BB526AB8
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877319; cv=none; b=eyXZjzCffMr94m8A2hdcle5u1zUaf47d7BMei/u4mErc9ZL7H/EoqCocDevgr8vIERs6iQOb4HD+nBRPWaES/G9EbqzNG+pP+DEaGZrGMO2WWlHSTjzFUx10R6MmkDwzWF7b4jcx+AUdudwSVG/MGl90VCbbgm8Uxy7D3CzgUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877319; c=relaxed/simple;
	bh=j5qbuXrDX2plwlT/z3lSzoNInbPkdLmaRYkhQoo2lGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVi43J8aBk0kM0ZQmS14ATazpJNUIrTfJAjiTiFofzIK3Dl7AYLzzQpR2ymRbPHRCdVG/0Psp4Zsk+NCN5O7pOYwmwk/XsCwNCk7ncH/+Ewaf2OiBQJNIZxwsEDih0SZDLWppmd4sQs5WPi/cPi9mYtbcanhJudaKoGA3NPkp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIPTZDM0; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIPTZDM0"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-915ec8f411aso32355856d6.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877308; x=1791482108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=qIPTZDM0c/Gj6EXjjDOZV3mYA0aDWCjPwJar//JToJ1LZ5D11gltJ9OJJetbSryOu0
         AejFTNqt2ER9Pd3f2mQFUCAFqlTBqNoP5uqhx+gfkW1DXrY/ayQRZwuV4tpPa4mSp/Ij
         fElMqfqDoksjJ+unPLXT4o3XNxDpEcw8Hokq8MOTaV/FOexBlLPyayEyfcrpVSC2tgBl
         is+A0BmfBhGSQfcEU8RudiDd/OktcUniDscZJEiSV8yzEEXuRRfrWJJn+anMl3jkfsuI
         auNZmBFHn689J2FcTXmqHLIvNRb/KPRfqJiz13oyTcr7D6RcMk3QZz78ePjXzSn3W74r
         DcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877308; x=1791482108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=edkYaz4j0kOkZJ0LZ3iCp+wQUy8xmNTbhgg7fkgPaJQCD/2WS/oFH30mXPSkK/rPTH
         NoQiunp7B+eMWy9jPnhFHql1Jxwrn6kE5hxi+xFCD2dC8PZeFCZOPqGSrMhSlhMP9DVb
         2WoeLdccvSd2Mx94pKz1RiowtWpugrCMeUWfLbys/hXg/12yISDJQlE7WFzIx9Y6wVmy
         kvUzsBJ5+MEQ7LsxC5NkBKb9yiLtFnIfpQhQ0jpUwDjGD3ZAa3CSCATlfUc2s3NXz/Pd
         o9vavA3aVYPbg7G9VxWvb7yDxuwg5+8NoGlqALJB6R4cJsbsfnr3cfKdDprsf5n45jOq
         z+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxJXdVtUQja/wa0k5qcZTjAkmk02M00WlUmVKTZICz5/Lx4J1cSTVOb1SV6EuPXkKe/UDIL7dITxJU+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJL9XTDoV5WKHGFBm9N3NHOwVDoutImW/nIerdcE20xTjNh5Inj
	YeRTWRUELC/3kg9mIPl+C3DUSYiRkLVqTCYwTc+BqIq9x4JEFBjtRFQ=
X-Gm-Gg: AYBFou2b7d1uhv0yBDARrlJ3XwYlAyfO50H5DNP72M/1X9GmgfIbxVNFaZ0QGZItzKD
	fdfHP2UIIldxLKBpGBVCCHjUAu/sA8QU5nk5YdXtjsm8q3NyTO1NYqZo1IhbP6kRWaqS1cee/BA
	8aZgt8gKUzGIUPVfKTQSVUugZi3aAqQCL+qyQ8KJFNlzyceuslg5M+dedkB3OOrDAZOdwxVx335
	8yD+OhwUiyafmD3Jrlkko84bvf9OhsKwgoEx6tQmBaRbItN8ysZ4yMHhUDtTP6/q1r0A1oidkhb
	kdzLYqlH50uYlMuZ6hY1RPMkuar5IM3AsZ0Dc8vTfqDq/OPXdXrGn9mgJN8eRUXImrd6I2dImts
	UkyYau1e2+VFoEuehr4Ij1WJy8/gXkRWt/GLLWyC+AhuZflS5XJJ31NbvBRzPaLTIemnYRmyiVH
	uDLCWhh/+Suj+qJZESNoaTlEdbPVuQ12mziAfN/7EmYLM5aC/N6JrZmLr4RzHS1ZCUAJoapIv3l
	hN21YOU0fKyFvbAUjbxYKLO87uE2TQ3BS+PdGDdi8cwdVTSKYEB0OawgsNnomJT/HuswMlOjVQR
	+pdTEYxmR2fZo8j5ojSFr381eX6lU7WVGOP9wUk=
X-Received: by 2002:ad4:5fc7:0:b0:917:8aaf:bb9a with SMTP id 6a1803df08f44-917c0087891mr4797716d6.22.1790877308033;
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:07 -0700 (PDT)
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
Subject: [PATCH v4 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Thu,  1 Oct 2026 13:55:01 -0400
Message-ID: <20261001175502.4045853-2-mhun512@gmail.com>
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

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0


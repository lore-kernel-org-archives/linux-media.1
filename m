Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76E255F28
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179332; cv=none; b=Zwi5IBY+I/ZyoR4zjW8wOsHGmnOPNBAGiXGfWWC+iGnjnjPcpE9OBDzo+Jb5SEAoYk0nCiptnOrio8hcMBCDOKwtQbCcnN6fkTZrhVZ4qKOTmtmUn2zzW8VO3eSLMujTN60dfKhqRtdkzYNBXnfxwy2ngL4PgIeSh49o3C/fEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179332; c=relaxed/simple;
	bh=zv0ElzJlVvbl0OgvSll+f60VWjbjDDhEW18sJYPfm0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TPBi+dcyZxiNfQpoGYmrsvMIRbsjEqFd6a1nRdfSGrxIMF6f0kS+SxlZkBxZm+7EXozgXimiOrDCuXu/LhtI9GGmu6UabHenMIZ1USnFOInmxw0qEwNZFwdGUHJGsJloRTY+sT6mHHol5HJOC3ejZ6s3ns3CqX0gZ/VZXZPntKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYdMbeu3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYdMbeu3"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so235815a91.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179330; x=1786784130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT4P26bPYlF0R//NP7ZRz7hL1o+4G7Qy2zQl64df7OA=;
        b=cYdMbeu3UTw+uXbYsnuaYDh0xKrnHR/zNLQt0LMk01a5mPmzrmv4Trd7bloegbXfMz
         Zi7cIlAnCoodlo9mNKPkGveb8UirGC9mR6dckbWqErtbJ8y0R8oOjWh+wWdSjEeTQD6f
         FvqKjzLTgkiO6U1tkpufMoOitnwbiF1jMNiwZfrwsQ4UkJ2h7cNWLh8VzkTMEzF8uqU+
         41GAVQ92cxVwbQhB15dN4cLjuxB6jZUUjqMqAiHMmQaINskVyr4FO6AsQMGB8iUSqZNl
         MuRvFlEICF02rC9Nv14iqsfuoP5PUsX5J0yvbF++7FjzBsYMlRLDUu7pFpxm0Bbn2FA3
         CmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179330; x=1786784130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT4P26bPYlF0R//NP7ZRz7hL1o+4G7Qy2zQl64df7OA=;
        b=h13MkxVBCPZNHhn9gT6zxUImByirRSCg1HKnWKHB07BSeqREaKpAbu40YbriHcNm7M
         /VDlgs4tjfinjonAneUnq0lenOd4kGRewzHuGzhRH5NJPt7RBFa1g4fRyzlTmcahbURK
         v70TSLD8ItLnzLnThMETdgeichP20cw86C1De5FSJn4AVYtu8J3t6AXxBhM7snnKjkTD
         8qhvGtSX+csjRCDpr4Jffe2cwI/GWIv9PmtrjQIOChuyS1uh9fAHoN4R1MDIDntuDhlP
         gdsKg5PUxz1MY6kONnHOio3Tj5W71pO7okEvSNkp8Z7M+ZgcyiSfIR5ogt8w9t7kzFQz
         N/eA==
X-Forwarded-Encrypted: i=1; AHgh+RrILOcmIDcdU6Y+FHtZImwRoVj0DvfRQiLjaQ9yCOxX5YT4m4LuHizUaNXEW52kvzrS8s1RxkX6zBsTzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/r63LAwRyR0tpOL8Xvjzgz62swfqEUNXP58c7Fh6P7W0gDxg5
	QMlVXGjjLxZZGNYF3OLGI/iAIWOsI8s5URk58DKwV2OOD510VBoBhKFj
X-Gm-Gg: AR+sD12TJAV2BnLg7y6eOv77xxhEP71m7W2Lv/IZRm7XNoTNb+CmCqRBSn1iLqxkqUE
	SaK8nCBGkUWZqoj8NjP+J8H1AUZfHWUhWCIKyAeaYLdO1xPuzIBMsRkk9QV5aj7XCYA+pba3GG+
	8MuYt4bdIA1jLdSAB5m0fCbXIRQV/7wpkCVcSrir/bQ0SigRbn/HA7haHOLKkWGJWaQ9eOkG33z
	oSWhT8FoNARO7A8+lyg1dnDSQpQ9iJpWhjMp84IPYTraoPSJ8XwhYyEiWViyrUF+DYBIWl4Y9WR
	6ajR1IWHJ+85lcZDlgscuLT36dh/NUwXJjKioe6w/a1y3thdHWwxmKs89f+0J46iUnc5/HktHa9
	eKP3TBFPasClWzt0rK0CYFKaGfuOVgk6KFHLkUmw5wmu8tFDtnDk7rcNBGEbH6ga8FfTN6BRV+0
	z8w/hkiabMLNHvbMXWroe9VV2DTtx2DaALZcKjEmmyJ7e7fMLwCVPKYWfWMRb1XIj2koRhtPPON
	afYNQ==
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr16011147a91.21.1786179330366;
        Sat, 08 Aug 2026 01:55:30 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7ad29sm14357727c88.13.2026.08.08.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:55:29 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32: csi: fix async notifier leak and UAF on probe error and remove
Date: Sat,  8 Aug 2026 15:55:22 +0700
Message-Id: <20260808085522.2650409-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_csi_parse_dt() registers the V4L2 async notifier with
v4l2_async_nf_register(). Two teardown paths fail to undo this:

  - The probe error label err_cleanup is only reached after
    stm32_csi_parse_dt() has succeeded (and thus registered the
    notifier), but it calls only v4l2_async_nf_cleanup(), never
    v4l2_async_nf_unregister().

  - stm32_csi_remove() unregisters the subdev but never unregisters or
    cleans up the notifier at all.

In both cases the notifier stays chained in the global notifier_list
while the enclosing struct stm32_csi_dev is freed by devres, leading to
list corruption and a use-after-free when the list is next walked.

Unregister and clean up the notifier on both paths, matching the
required v4l2_async_nf_unregister() + v4l2_async_nf_cleanup() teardown.

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..65800aacf28d 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1059,6 +1059,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&csidev->notifier);
 	v4l2_async_nf_cleanup(&csidev->notifier);
 	return ret;
 }
@@ -1069,6 +1070,9 @@ static void stm32_csi_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&csidev->sd);
 
+	v4l2_async_nf_unregister(&csidev->notifier);
+	v4l2_async_nf_cleanup(&csidev->notifier);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.25.1


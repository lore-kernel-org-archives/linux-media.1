Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532C4423149
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826004; cv=none; b=geLOm0+qIDW2u4oD+GMS322qlUqT05MeNumKOz7lAMQwqAeKhACZp/rhfRIT5BxIoTHMSknnwTMNomvR+9ErnIsmSnpMvXsFJjIEU75/TCWJ5AY1uh/5to0IUTy5OwPxBoQGbmD1rC5fEcDnJROumC782zU2U8fP9Uml08RH9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826004; c=relaxed/simple;
	bh=z8wxs+UliPE0bE9EvjH8ommNq4Q9+859qLoxJePls20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XwPapqiAxrXXTNX25kFc2sCDYcEkjn+8VoFb8hxp89fn68HH0nukhQVzFRerLFp71qCyM8jo07ebvGgYeugeiU7P8W5wg0eBInti6wXqSlcekn0E5TR1Q75SbEnbOvvPDv31ieVA1Ev3OHYULgwyaetCbQrXQcHEUL246FxvFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bElGYk+E; arc=none smtp.client-ip=74.125.230.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bElGYk+E"
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-39af167f87eso13852361fa.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826000; x=1783430800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCtbIud45S7nTe5FjLzz2DOhp5efRAJQqbB7c988YWQ=;
        b=bElGYk+E4oCDN7IJ9VYHw8Vokrk4vGRxqXq9EbRpZoqfwCDtbFE/I4ZAjckO6OXU+0
         dyDjLoD5UmRTzFRW+yBTvB3h6ZoavnfViCXUwoHsLLUN1FwddzcHXqTpUlZhuOZUbX++
         4qXEDCtvOQxJ2MFSoQf4It2hskYkf40PLKZA/yQQKWnl0D6FdnQjEuNCy0flZdprC2uI
         zbH4tytS+VQcjFisgxoDnBcEG/qm/e3OvKt21uFyAfUims9fgZv8nyaEOl4mLxwRG6Nh
         +f+S6EJ8DiOEqPYzIe4LCZhguq9uotjdnR7WNf0ncU0JhVn+j1YXnnpvM5NjmYaEnpTc
         BinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826000; x=1783430800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCtbIud45S7nTe5FjLzz2DOhp5efRAJQqbB7c988YWQ=;
        b=iVzuqVwb58m7+MicCOFhkhehDAPLrMgVCgSM3AOOH8Itd17YtCjXK8um8VQ9yacQJH
         IUH9rnEdnzPWwWoB/g0XRIjI4LFYX9Ur2VSBepyGx2964Q5jwdJ/a1ho/xh3K9OxB3lX
         6USFZkAdxvaEeQ1Ae9ckpc07ZMfAqZjvrHyrY83OWlQPrWq9Cp93bcoavHsAsjT5ll3V
         +WxmqH2LS7t7dLeidggMOmizmi1Cix5UtM1lhpt5ARSRC0G6jAx3BWC5ui23LWObMBeH
         5RTgnE3XaDsRIS4bX5MzpZHIfcKUWqGKS/LV+3NA9WHxKziuU3brn4hXRmHaSHhIIFRN
         TLrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp47cZnvijKhz/82vttpQ8c2NnrhfR8J3hJDzxUR+kATpS/ZZw5GH3murWGyqzOVDVw3gI8ab55TnlIdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvA4fHLmr0XeHOMSAe1XwD8bEyn+aysVuMrm6l4++bAw5AWM77
	WHHa55+ODHjtRSh2KNBnCrqDZTKMm9aFmDFcdF9QeqdbJIZb0AN1z6vB
X-Gm-Gg: AfdE7cm6jrRVrsvoCNjoK83PXf34ziXm00BmwzEVWEgm9tuml6qiiBdqfw+CU3SfX3T
	/rj8UwfBq6ejq1cgX9WWeGQUGVOBPvM/FBGi+X+eLj1nDdKdHvKa2w8eJk9DGEQcmREXxlP4i3J
	RYTtQvfAxGFbPE0w8iDhS7gn3i6+eaOikWL1pUeLEttxnvam6hG1CpMUbmfrXGfNnRxPB/sjRNy
	75nZ/nBqK+SG++TZhnxwNCzkmB96642UW5LxtXMWzaNwlP6dOL41amTNkO5hJMDdeoq/Rj1u+/g
	TPtdqxikiDPHFKSOkm6Q/lnAd1JvDQ7/56qAlTfIEZNxzIhONU2DA537rL+kBFBTspvdo28Mgyc
	QmeRTu1lvWRyUmGrFnzk1lIxH1iyYRw/AsCmPU5qB2aUplyISrseUTZj1mhd0C3yx+3SNpg==
X-Received: by 2002:a05:651c:2203:b0:39b:d0:e992 with SMTP id 38308e7fff4ca-39b1da26188mr8230171fa.4.1782826000423;
        Tue, 30 Jun 2026 06:26:40 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1d81c80fsm6120731fa.4.2026.06.30.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:26:39 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v2] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 16:26:31 +0300
Message-ID: <20260630132631.25762-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by checkpatch.pl in atomisp_cmd.c to conform to the Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0


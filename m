Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF122370D49
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920355; cv=none; b=Dttyjc/9dstWsh7RlRxmzIJbXtWxL+Pe+OzJ/OeG113TtJlAwWsHx8Rz3B0aokpeNq15L9DLaI/EyFDXVEE94iX2ggd+MXR40dOuWU9bHO3+NFYX1xXy1KOMkSFVXQThQ9r8oY2SOIIDWMpBZ9gOLKN5RWgIdLuVJBs5be0b3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920355; c=relaxed/simple;
	bh=d3TDx+W5LQCq/wcbWj/0EJPMBsW4tl0KmH3EmY0rMQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qhOAYF7QnkOPPFRziXczAs8dwFDeye861M15ex7f+ZMN1niVWCvD23PLG0DPiz3udIApsX+jhdWZnctOrsOQK4eRGwmhRpOfKU8AhPy3GBTDsioZ+u4EdCsB24ffMmM86jE7z16we9fBBWeZNu8ut1YkeVNo2+m70ocwEqSfpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSWH/u0Q; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSWH/u0Q"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304fb780deaso4113871eec.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920354; x=1781525154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0zJ9OmXKz1HpRosgZiIPMmPyaSaP5wHJSlrRGpW154=;
        b=oSWH/u0QKeRuJIldfXYbUQtF6fUI4T00Z/N/ntX6WV8nPsRJaTyVHdBbYyxFztL7M6
         XkQgHzR06lOstXezeHmNynplLwME2/Xw3gJXslEtrzlGyj9K01xPwulc5gIvZm7NS1s2
         0FUwJ8f0GxwI+AIaGpDk5RhI6qsFqXCqmlO1CLSa8k+Wo8lXl6KlZ0raK+yCtUGhC0VM
         wygaIrRH3BXHIviuRb/aTepIuE2ou95j1SOElCcFgvB5hn2rN3OOEMlmxp8CxmnRBB4I
         nLGZFYe6TyQeICSviGDBbUswjvJF+6QQCWjJyVa8aIkllMPNXUJsSMU5SsXWFvQQtwSj
         hqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920354; x=1781525154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0zJ9OmXKz1HpRosgZiIPMmPyaSaP5wHJSlrRGpW154=;
        b=lzTmvPozfeRUhyG3GM49TqjoUZNYlFBs71Wt3k3Zx3G8SeeObBfh7U5Z8ZUD7nmHGM
         /S8dqZYj77tXLD98LyG2aLE+ShD40ZdAOoSjSkuqpQMWQZ4ymsOrfhlbEG1nBX2OYrt7
         ts62TO8I8rGR+wmZS2xwmi1B+lO4ey1ocWo95WvIK/H5zyMxlu2Fiv66vfoiaXwUM1xO
         EIY75jAK4U2Va8YCSag+xJE4gTkkV1XFFJBVwMlNpZ6omJ/IG+zF1AmvDziLtWfF/Nrk
         B/xmulQB72hFmbcEkfO00hFX6TGiI3PFjlUmPW/03q83JyYSqghU40I/WfDxY4evatgo
         HkuA==
X-Forwarded-Encrypted: i=1; AFNElJ+Yt9MPYOliUx4IwdHZjPwCFCkDhij8Mq9hj/Na7D39pVucTzSZTSCLPg5OfO//qVvcU/JWEcmT/pIRmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dIXtoYx/epo05tNgE7hap/Zc7HegTzgfeqAXCN9CpNYqtZIS
	069kPxwt2QBb7QYr/twqffQavyLjV8ssuLQlSAsglvbbMdc0iPIPO0DC
X-Gm-Gg: Acq92OEwzPoZKMHgDMRAUgAwjRr2YS4ED3wwtIjLYvyBdXl6wLU53LSycUIP0nq+KLm
	On9uWwbAcbCJDwuRBittAem1hHpHkXR2QR6kq33EIgPcr0UEaxYhFNuvVqU54YE+5rf3ZaWUXEp
	azNX3+EvYDtDOKrAtcQ9E6pI6Jpes8et/P7B+TvFQ2fjEBmHmYZJHbin6cpKuoUz5WN5yQ/nbIt
	ZQa/CXwKN6HEbksLLxy1OaQkz2xfeKr6mEo2BzXLgSQn5pAimeW7LVqdt7XHifflR+TBBS3SUnu
	yYiagp6WxZ2CMdkD0d67wlxHPFTnJ6sFXfsUVMT7cLZTmEfxl3VTUQqDQpcL7q+c6SEbba1tch0
	w/kE0cqpCyzH0xKTVU1yCPYga01la5o2ykEtp/CkkkJPvMgC9TKn+6EADveDscTRk0XUwh7zcLB
	TBPnzJE3A4FqyxnLxqzpj5619nt6OjjdhnVH3WzXFnRmCESIZIym/uzL3j0io090iArg==
X-Received: by 2002:a05:7300:fb87:b0:304:e587:5063 with SMTP id 5a478bee46e88-3077af54770mr8086461eec.12.1780920353685;
        Mon, 08 Jun 2026 05:05:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm24603775eec.21.2026.06.08.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:05:53 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: abhinav.kumar@linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: iris: initialize OPP pointer at declaration
Date: Mon,  8 Jun 2026 12:05:31 +0000
Message-Id: <20260608120531.83459-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize the managed OPP pointer at declaration rather than
assigning it in a separate statement.

This avoids a checkpatch warning about a potentially uninitialized
managed pointer.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Initialize the managed pointer directly at declaration as suggested
  by Dmitry Baryshkov.

 drivers/media/platform/qcom/iris/iris_resources.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..fd643cbff8d2 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -61,9 +61,9 @@ int iris_unset_icc_bw(struct iris_core *core)
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq)
 {
-	struct dev_pm_opp *opp __free(put_opp);
+	struct dev_pm_opp *opp __free(put_opp) =
+		devfreq_recommended_opp(dev, &freq, 0);
 
-	opp = devfreq_recommended_opp(dev, &freq, 0);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-- 
2.34.1


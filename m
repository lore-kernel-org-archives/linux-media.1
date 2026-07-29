Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6F263F44
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287413; cv=none; b=aux1bP2dHaIyE7oyUk9DkfFoLNJkMblbCexxqAqZ08OHt6/cHOvNNwIV4xajysXSL5cL/2kCMN1DHw/flFIrpko33eLB60bbSZQZCzsOieY0Nv5kYRt5FJKfjOuadyR/tkRuZ74gl/DwoMxXHS64kDq+8ELp156yrkQXYGmqtSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287413; c=relaxed/simple;
	bh=x81cnYi5xOey78pJKPMlaZD41CNHN+/vxuJqqkYhFFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGml8nn6Nob6GvjHJj+ZTIeqIfKIiT5/exbXftdBg7aaijT5X2HE82j++bbDbfQQ8jX/q4S+OGajObXz/WrahHvPFT1ynlVacd1TbuWuplt4YL0l40TLlATzuyUrv4Q4j6/544UXX3T2P1sleMjixYMRuCxD9Lt077UzR/36j7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Az2hJS; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Az2hJS"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso271350a91.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287412; x=1785892212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrRHwamG/gB0Gq5CSny5NYLFwDvRskbs4e08DWoZ9Jc=;
        b=m2Az2hJSnMYvjSIocaf/+NAQGNuy9z3iUZHf1UiqKKwUAlBSzbKxBU7f4Cpwg6Vy2T
         i8x9hN5o5ISyXVVtAwkTiqTCqSvWL9O06HKa16bffRVq6V8Glj9NM3WM42WPGovOZxzr
         55fckwpKIZ71ZHthQIupwABxDTMFRTSKlb1b6BJ5T2kPP+RbGxYiQdjCh53RYD0pX+Ky
         LMyn/zwZRSg7GnHcxDJvIZgWTg9tUSoN2JjOb/akerSt15ZQpYv9GqqQj2p1lx4UcrNl
         MdlV35hxlFzC0kjMnh1uSpnKbpv/WXYHtKFUOXx6KCoBrRcFwc+2q5drXvT6fmss/qBq
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287412; x=1785892212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrRHwamG/gB0Gq5CSny5NYLFwDvRskbs4e08DWoZ9Jc=;
        b=M385Xy0AcT57qA+OiwEe5XWdQ3VD42CATvIf+uRh+J/bTbgp42G+UovTUpAgXCDppd
         glosUdbynVFoYP9heXT7CtpR4As3+hAXFb5KqP5LN6slhFdhLHu9+pVSCCbijP83rIpD
         yi+bucDek5pM26Y02cKJWdZMrzGQ92i3FMyLrO3d0m6ZpL6+CdJ+79iRF7Q+P5iiitsX
         ugFPih0LpTDTNvCViNWlnuAf2xTQqkLCdm50AGPq5Dn6tRDSCS7elwLhy4BlsRtlxklx
         PMTU/3bqHgdPI5BnZ3YvS9nm3t5hf9Qkv38/TW4YiLi7C+oTQBwR2h6JM1+GKFrDlIXd
         bgXg==
X-Forwarded-Encrypted: i=1; AHgh+RrkGqX896sAVHfMC355csMnKpMmKto5dLKJ4oA9rwhvNQPcA6r1R8Bk+qEGenNXZ5UoPvueGoaAsJObtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0r5Xt1ffrjmgTTqtWG4hh1wuvutiWXizSjFLaGl+EAzcfTc/
	JBgJB+zivKSA2Avgf3VmvuBHX5mLL3l4BiCLTqwYdfIC0i7YrUFhUR77
X-Gm-Gg: AR+sD10HIq1rn5WLYW/BmKmBxlalRpfpsmuY1rSKpETGbxSBi5kyhQCCdsDUndXHe6l
	c1WSN0yxdCjiX9BCa/yFdZ6DPZcCYhmOOWecVJIpJ8OfTgrRF8kJybCLk+DDEF8YtF02FU3Llj/
	SrZqIjU0Xyz1lsbDYPJyHoXsfCQM3T7K8J/M7aSDpeCnR+lvMlLqNip22v7uhhEGPksn1QOpiWm
	G/x5Joc0tc5qTn31BcSXqGiUez7UbYCyXhTVu9pcWTb1t+dkIvxLGn80FK5+EBKnNtkRAW/7wji
	opZrkNkiHTu0xI6Wd5ffupamkSX2D6mgLF9Nn0IbXrduVO1wUYxyYmt1vHrf1thc+TMAyREvH0B
	jnEbmUD7eX43WS5BaPS9GEmytgpQBxPiQpUpAjrMd2lzJTzP+ykK7G70o5g24Q5eDy8AVYJYsUn
	YgTKgTqK7tP5pu1G8Y2CWsaZbyf+FRqB02UPBuTGQW/vBhAlAhSCMNFtMlRFgxO02BAr+z3c6v0
	g8TPg8vLJgdlspfLt27
X-Received: by 2002:a05:6300:6698:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c8aafda266mr5682923637.30.1785287411686;
        Tue, 28 Jul 2026 18:10:11 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm3843783eec.0.2026.07.28.18.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:10:11 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v6] media: qcom: iris: move OPP handling to VPU power transaction
Date: Wed, 29 Jul 2026 01:10:01 +0000
Message-ID: <20260729011001.16999-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power-domain helpers currently update the OPP for core->dev while
enabling or disabling one functional power domain. This makes a
transaction-wide performance state depend on a low-level helper and can
leave the maximum OPP selected when a later power-domain resume fails.

Move the maximum OPP request to iris_vpu_power_on(), after the ICC vote
and before powering on the controller and hardware. Unwind the OPP vote
together with the ICC vote on failures.

Keep the power-domain helpers limited to runtime PM and use
pm_runtime_resume_and_get() so a failed resume does not leave the usage
counter incremented.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v6:
- Move OPP handling from the power-domain helpers to
  iris_vpu_power_on().
- Request the maximum OPP before powering on the controller and
  hardware.
- Add OPP cleanup to the VPU power-on error path.
- Keep the power-domain helpers limited to runtime PM operations.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- Rename the patch to reflect the new approach.

Changes in v5:
- Add an error path to roll back the OPP vote when
  pm_runtime_resume_and_get() fails.

 .../media/platform/qcom/iris/iris_resources.c    | 16 +---------------
 .../media/platform/qcom/iris/iris_vpu_common.c   |  8 +++++++-
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index df9b7badf0c6..5cccbf0636b0 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -104,39 +104,25 @@ int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_ty
 {
 	int pd_index = iris_get_pd_index_by_type(core, pd_type);
 	struct device *pd_dev;
-	int ret;
 
 	if (pd_index < 0)
 		return pd_index;
 
 	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
 
-	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
 {
 	int pd_index = iris_get_pd_index_by_type(core, pd_type);
 	struct device *pd_dev;
-	int ret;
 
 	if (pd_index < 0)
 		return pd_index;
 
 	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
 
-	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
-
 	pm_runtime_put_sync(pd_dev);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ac9881e2cdc2..5209c32933db 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,10 +472,14 @@ int iris_vpu_power_on(struct iris_core *core)
 	if (ret)
 		goto err;
 
-	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		goto err_unvote_icc;
 
+	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	if (ret)
+		goto err_opp;
+
 	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
 	if (ret)
 		goto err_power_off_ctrl;
@@ -495,6 +499,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 err_power_off_ctrl:
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-- 
2.43.0


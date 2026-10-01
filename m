Received: from mail-dy2-f1.google.com (mail-dy2-f1.google.com [74.125.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B12D3A6B6C
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866252; cv=none; b=AZ5XvWp4CitVzBQ6/vmf4UQ2ksqDCOmPh/bTwXmtRyvBNSpVjBoTg9RJYOzv4DmTnn8ii7BfYcXZdsS/4WuDN/dyqBgSqoLSRw+aQj1Vr+2REpou+kRAEYlId+DHv3hoI3XlM5d/IGjwz9Yn2M8ja0V73vSFX+6tJCemeBs4Z3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866252; c=relaxed/simple;
	bh=dDIRB5Oi9FoUSrNMqIkdMDYOwZXhk13+e4IgFEYdx7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyV1p0WmrN8s+iyJGfYe6PXcssKbQ6jyKQbcqtQUlks37qMJiDuNX0t/NQJAVKq6PBYLxVrvS3EuNF0xXIYHF0b8ln7mWXgbAaUfVkJ3ZwY6RgEY5y03I3D+vcQ3GB5wsYBYLp1+wbTDuCDK0NS9bdcdKDeSmFav4Dyf3fe9JjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3PwQCu5; arc=none smtp.client-ip=74.125.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3PwQCu5"
Received: by mail-dy2-f1.google.com with SMTP id 5a478bee46e88-313be8d47d4so74526eec.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866249; x=1791471049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MawLjsR6a0c8Iz3+/frylZDgFlv1Xa4BhzLG/vLSrIU=;
        b=I3PwQCu53fz6FY7V6VAX+1t1OXe5L4DlKKEo23M5BX6WreIRIYi4Lq5W00BtLUTeN6
         PfFfFC+7nJY3Bv6gzAN+gMoMQKDHm3IFd4+QjIYb100jiZw8sdQO9Segon+YW0C2OGJz
         LR+qsfWZ5OLMvKVoSgRNHIDH/4PCkbFvmgHa7DnVnAeidvHnCDAGYLrcb0h1ecBTqPmc
         JfxuX7tMu3tab5PsmPvwT1XN8V7bOxCs/5CZuRqc1DmGzutsElIacoGZvAfQayPx0c1s
         5eHiUUNXm/qsWeMbtChn3nEvgyQvE48bJfy7bfTtvWrGA2FfwcnCdSRf7Px796W7JTpg
         0jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866249; x=1791471049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MawLjsR6a0c8Iz3+/frylZDgFlv1Xa4BhzLG/vLSrIU=;
        b=2Yi4qD0JdrITtDYZvjj19NThjfmIr6BvPIoZIfxXIU3zCsDO24XFYTu+ZD7Lf01EI7
         i9OmQmIsfyRtoWVs/K3zdiTlAyZNsGjiyBYvyI3+feWfJv/an9or2Bnxs0xf4cI/1F5i
         THVls2mRnPjlkyMtSeQqtGbGsaUXvoIhU9HYtlQrL0Gb6yJ8cxOjyB768KNNvNiDRGiI
         hwopf3xzEzNyRSpXcHQf4VpDFrw3eL4HwZ76/w/lb7+wMHNXClTa4fiJzY32dKxvTZz1
         XupHVT/hU0D7MvP5e5zwO1EgocxElyatsaIUVD16+7M1KEOp0U/goS72jqdj7FUb7ve+
         VE3Q==
X-Forwarded-Encrypted: i=1; AKwUvByeMjZqXvLVZwdDLN1FMScu0fH6DA20MwJBVl2ujfd4PTYbGe9baQjBYqTjieu9YbJlpMIFgq1ARFDZNw==@vger.kernel.org
X-Gm-Message-State: AFuF++mVc4wpJ6tCkYHdOPnRXkhsN0cf+CvHtv23eCg5MXM7JK48EL6D
	UcglqNp9CIrJzHbbycTle7X20vBqJ9EtltTnd8NdOl1dJO5RaDrfQzLh
X-Gm-Gg: AYBFou1vcMo5KR0F8V63q+AJdxQ9R6DbrZ/J0kM5JR1A7PoeHXMQVNDKh5x795A77S9
	B9iyiT/bEO4n2tRgWMma31U3j7POASG4oK/YRTtwvyvTJISrX5S72mJ+y54d9xQSLOImDwYil/l
	udja+GiRzxqRHNzeDa+CL2G0k3G5g6WcDHMme7bEvWJq7vkthGY/J49iSIf6Kn+VkculbwORffw
	EXAy6ElRy9PwFCoDptdeVMwgAxVZrhjQQGQSyVzqlsIBbnmGBNo7JpGBlBa1d3QYOqilHhRrt9L
	AfKSp0bTbqg2ADjhSC+BUFUWQkm9KOorm8hwO5vX7ccVMDX6ZPE09UM4PJ2a0dcj4ZXlkpXYRds
	gIeTtA0iljz1MpbTz4eQziupiZRlDaeuKoumAMGEpYa4jlMOiRH95QouvcioYaG8vKvv0ARve1h
	/hnQqS/7EPG6S6rhaR2YF4KaW8v6NhqoYNmkyMQQcV3wkmjueXRuhwQsNAqNn7ic0d9KsrVxF4N
	rMXfJjgdft4qQ2JXIuyRnkwii0=
X-Received: by 2002:a05:7300:8aaa:b0:34b:e21e:5e2c with SMTP id 5a478bee46e88-34cdb1feb63mr5732460eec.12.1790866248511;
        Thu, 01 Oct 2026 07:50:48 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34e7ff86d5csm5048122eec.5.2026.10.01.07.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:50:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v7] media: qcom: iris: release OPP constraints on VPU power-on failure
Date: Thu,  1 Oct 2026 14:50:33 +0000
Message-ID: <20261001145033.17652-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-block cleanup paths request a zero rate through
iris_opp_set_rate(). This selects the minimum OPP rather than
disabling the OPP constraints, so a failed VPU power-on can leave
required-OPP performance-state requests installed. Supplier reference
cleanup after a failed runtime resume does not itself request supplier
suspension.

Move the maximum OPP request to iris_vpu_power_on(), leaving the
per-block helpers responsible for their power domains and clocks.

When controller or hardware power-on fails after the OPP request
succeeds, unwind the acquired clocks and functional domains, then
disable the OPP constraints with dev_pm_opp_set_opp(dev, NULL).

Report an OPP-disable failure without replacing the original error,
and continue ICC cleanup. Keep failures of the maximum OPP request on
the ICC-only cleanup path. Recovery from partial failures in the OPP
transition itself and the existing normal-power-off behavior are
outside this change.

Fixes: f6940b79fcb6 ("media: iris: Fix opp scaling of power domains")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v7:
- Rebase the fix onto the updated power-domain and clock helpers.
- Remove OPP handling from the per-block power-domain and clock helpers.
- Keep the maximum OPP request in iris_vpu_power_on().
- Use the NULL-OPP disable path for failures after a successful maximum
  OPP request.
- Keep a separate ICC-only cleanup path when the maximum OPP request
  itself fails.
- Preserve the original power-on error if OPP disable fails.

Changes in v6:
- Move OPP handling from the power-domain helpers to
  iris_vpu_power_on().
- Request the maximum OPP before powering on the controller and
  hardware.
- Add a zero-rate OPP request to the VPU power-on error path.
- Keep the power-domain helpers limited to runtime PM operations.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- Rename the patch to reflect the new approach.
- Update the Fixes tag to the commit that introduced required-OPP
  performance states.

Changes in v5:
- Return pm_runtime_resume_and_get() directly.
- Handle pm_runtime_put_sync() failures while preserving an earlier
  OPP-update error.
- Add a blank line before the rollback return.

Changes in v4:
- Convert the OPP rollback to a goto-based cleanup path.

 drivers/media/platform/qcom/iris/iris_resources.c  |  7 -------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 12 ++++++++++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 7149a5bf4e7f..b1734e5ecf60 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -77,10 +77,6 @@ int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_powe
 {
 	int ret, i;
 
-	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
-	if (ret)
-		return ret;
-
 	for (i = 0; i < pd->pd_cnt; i++) {
 		ret = pm_runtime_resume_and_get(pd->dev[i]);
 		if (ret < 0)
@@ -94,8 +90,6 @@ int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_powe
 	return 0;
 
 error:
-	iris_opp_set_rate(core->dev, 0);
-
 	while (--i >= 0)
 		pm_runtime_put_sync(pd->dev[i]);
 
@@ -107,7 +101,6 @@ void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_po
 	int i;
 
 	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
-	iris_opp_set_rate(core->dev, 0);
 
 	for (i = 0; i < pd->pd_cnt; i++)
 		pm_runtime_put_sync(pd->dev[i]);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 22d394851ef1..9bd59bbfc109 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -413,16 +413,20 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 int iris_vpu_power_on(struct iris_core *core)
 {
 	u32 freq;
-	int ret;
+	int ret, opp_ret;
 
 	ret = iris_set_icc_bw(core, INT_MAX);
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
@@ -442,6 +446,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 err_power_off_ctrl:
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
+err_opp:
+	opp_ret = dev_pm_opp_set_opp(core->dev, NULL);
+	if (opp_ret)
+		dev_warn(core->dev, "failed to disable OPP: %d\n", opp_ret);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F019043801B
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424872; cv=none; b=GanRAP20PLOfR/3gWX4FjZ7KOD7Ok0R32qSXEBOBcHtqC2mmXtbeswICa5lSKLJRzkiYf0AT1BWY0HNYkiJ4VVfoo4QWgOiMxe3N3OQe3WmP1rB1H2eB+MIbaGh0kR56adta4iCnGMjhWmcjFGWGI6zd/RQpqWUQ12BWorhv038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424872; c=relaxed/simple;
	bh=Z9YVCIn9gOvK6SSCe/yg6Q/JOR3Ghll8qnR7XK1MFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwwZ9uqFcpn51VNUZ9cYZJZ4PBQrRE/3q79bWiXZ9HN2ZESfW4+ZA7IwsOZhHVyvUY7ZDKPHctt7tmWJONXgW78QLxG3YBSqynZ0zwWoy/v4gQMmzP5XlJMPkdFmXys1hVGMjGi9f4KV24F/nXG32hodR2YKjGDM6uXSf2TO9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CT3RLybD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5sXsuxo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CT3RLybD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5sXsuxo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiWj3986903
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=; b=CT3RLybDCEEOLaPL
	hMeaQzTmrBqymxO/+WOdNJm6pytRGuV7q4KTxQ0P5+0hEYIYlOepgRbgMr+cihwQ
	zcIAmsuM1tdUfXyETObEi/cjyraPtU1gR7LvC+TNKBs+w+nHnAAJr346QJ63E98b
	sATw8Ok2x9MEI0bJsTUCxpt9DY0V3bz2jXj3WaNUKaTCHJVQT4Pns6PWHROy2Ttg
	J04Jd0VZZIf6YHadIHaYfSURuwyMjVIjiJoTFFRVqIznQ8PNP4BNWlO1kg7o8bec
	YncOGGbAV3Pwpg7qS+BvwCV2LhDTSKQFY+BU4UyAqb0lDfYFkL6hr6/aRwSSBdM/
	mmSjGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0f0a0760so46515371cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424869; x=1786029669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=G5sXsuxo0EOMczNRds+ACr3yq+6v/jbLmwEpzJomjG3DOfAS7fzV+x6CfpMISmBMrG
         tA80RD4Uo+4/YxZLrGGPLAmYc3AxiblP6me3bywZhoujBY4Y3fawebJM/kQuvKPk4uOh
         uVo/cR6UXG0glVG6bVuIQrsQBlICx1ElBI+OBhj5546aWA/qsuoPlsrTv24B/n4b65pX
         eyarF1PcFwT5hqCPmyg1vmQfceVqZKHHZQ6nGbzKgj+1+J55XjYe1OiiEorSMyYgRKlk
         Pwx468HSIJ0FzqNrDpJB4TxqDNgo5ef79zI9dFoeTLNyhz89pNDXuOlmY7vR+KuvdiRJ
         NxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424869; x=1786029669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=X2z4VyRYl55Jb3xNYhD86/OLWsEYX2BVcqIduq0HO40CQqkNHwIe8EIWrxI62aZIK0
         egMFWnGwsWiHYBSEdf6KptEmOnXVFPOeZYjERMi4A7A371RT1Tlsy0fLISmAyRpTO47V
         3ATnXSv9JM+2t79wtxwZBXIhBHaDMhwAQ0s4/+XWr7GxRNQ4K2EBQYCfrrsgyb3buujk
         jDjO2SC57d9vorvvAUYKvyB2mPcV39pp38jw2Yt+RKHUn/H27JSLQoVEiuO4Ka+FImkN
         ZgQEUPNBEU1zzMwBEVsoka3lV1Sj+trQCKLjJmnlXmYZCTVY1l466Z652wkRTOsKaA+r
         FxgQ==
X-Gm-Message-State: AOJu0Yw5sQoPTPRcqbAujMQb0eiCcSBm89XZFKC4SWtkykeiV5TJr8z+
	TZn1ye2jxoRGRvrVAwQlqqoeMjJ/J2KVaJGznyOiPPSqYF6M25bEpdB/4Iymv24gH2PRmdlYLhh
	V8bibbi6LzmYUmDO3l3tGJyu8wPfR6T0yZ33Y/uLHddHWjvYYwWT+R/DPZejPTfJvgw==
X-Gm-Gg: AR+sD11yKOcfINDjlP0MFU2CAhyHIBPEOK9uiLbxWfFKN4EGz12YfhC9hixukARnbLv
	Ih7SX1b0LsR/etj+aaOqgnKNyqCY6aHd/Mync8n7I1c2coQYnz07dJTzc2CsRlW24Z96w4TgByV
	q7NhNcvX2HwhXa8GjGmMJw/9xQ0oXTJTpb01k2I1jvNwRtgwzRK9kP/cVzFCgrEY21KZ5FIgSud
	ceoyLW1dbFfAVySHXZBX7sGNzTr4sYAYnQYGXaPGn03A/U3ZmXoedTetIS7Kp/dom8Ha59ZLnzM
	wDHYKGE8ZmuYCobOsQTEWmkZTjDuGw06NulGvnMQcL3bzFUlTjVeEzGkW1kC/Qi59eTW9QkdMsy
	nP5QSEpxLd4rYt3DV2mKRfaEGOMJn2H190v7Iz8iw2IdWpHcI9XBCag80D/jz3athMogtO8mKXZ
	twGLpDZdFy11kC5w==
X-Received: by 2002:ac8:7d02:0:b0:527:8dc5:51b9 with SMTP id d75a77b69052e-52b386a997emr30158171cf.56.1785424868577;
        Thu, 30 Jul 2026 08:21:08 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:527:8dc5:51b9 with SMTP id d75a77b69052e-52b386a997emr30157751cf.56.1785424868004;
        Thu, 30 Jul 2026 08:21:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:50 +0300
Subject: [PATCH v8 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-7-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj8UzQSoTEypLFxWuTJ9OPEMEGui3AHWwyMxcB4RZ5E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vRh0x2IxjBhFkFemROWdRHkB+X+TFDpMHK4
 bzgcqF5ZS6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1QmwCACm6GxvVjZHtmqSWAlNJY5pHhUzXLI9reLSLuTacC1UOp5RbA4RifYsXJEn4Iy7RoyNeuC
 7VTS9XXOhkm8uhSGUtNfmh16/IfCwFCZAlcRvMtXN0SaPZgOheB1xyh/HmTshAHEv+TYHAfuzhL
 sAWPHNS/tErEfImh2K/T9TJToNHn3hF6WA3UeV1ZZlrbsitVGChNfTGY724v115vyJV5EkzNrFC
 jLFhh71r7xaLsat+dwzjig7TUthx01Hrb395iwC0Gzsefr9TMrAQ5tsgC+mTGZxFbBDWFoiClrH
 Ht19GzH++jauYt21fnPkE8jKbbFlxj3ailamDdtuQhcgDNZ/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6be5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: elh3smqjFSwKo85CmQMNfBVyA8BMX4ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX4jajr42pT0jY
 QyeR5hPEu+R7UZv0LJTZot6f9B0OlZn+qtg0P3r8DQer2iPqaaubnfNJLz8BgKCyr94w85vj/Bd
 weyae57CEWa5xmsMkS2CT6AsXCqFHSksWTWsMsmQK565BNiiWewS2uqgN+GxZZeVeAF/3Y/iJrn
 7DQgWF+Uz7mV6pFrrfLhBmlP/tJHop7ETiz3KWfD3aChD/miw8xD/1DRHQJRZNsWO034z5ITcQk
 gituoikifqGem4MOtVvwqiK5Mslf+2VrUPRYY9nC1xTDw2YfBrGg5BjQRvSUqxo01PHiic9JStC
 avuZGiqnODZlO2WsJYqs2tPbRR6XtAkcj1zbAMdexAIZRv1BAgqRv8l57/yGhIyTScspCOdztm8
 DVmH3gdy1jSOCJp6JN3jJaUtIIABqfpY9xG/FQT/dYYeB5tY0GiRb8V8yoInw9H/NvcQuyLYN2p
 lG0QdWSfYn4OE8S+tKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXyy45h/Jr3xUh
 TigA2CjkYTXNhOAF1mj/9KViKuBbZ2ljER+IKezP6YiK9FZzc/mTz95sKASpglcZihJu1c3P/Ue
 tge0g5O+1arto23jdHB9mc2kUxxpURE=
X-Proofpoint-ORIG-GUID: elh3smqjFSwKo85CmQMNfBVyA8BMX4ec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 6dbe18be5b49..526f92575264 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -46,6 +46,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -79,6 +80,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


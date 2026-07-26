Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF133B6E8
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045050; cv=none; b=mTdq959NZx9Ow2ZzqkRE8H8TWq+Zsvi2E1UUu8MZ5D0molF6Ge9oAIazB+bueRRTNKSoR5iY7AzN94NWkqReXDnRCCn7iYq1SAVwzvssES7IYWB3njLeKUg05PpPMQ8n7f+75M9BFIJqlCJAYGKylAyGKf4HjqE32z855uNioAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045050; c=relaxed/simple;
	bh=tBM4xBzn/Xu0jRn9xB3qtH2PBSvLI/9VGMLOvNw3o5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JA5ggVT5jfdyPZGe2O6Qj1z/RzX+tIvQIpayZ0xrGTRbJLfk1jVoqEytd+ZDGnYvQku695scDfF1AmCJzIabIR6BXhkQxF14HrOCWPMhsEJP2KIDoy1LK78qeLuQe5myq7EJwZtauXpOiDRRSR2r3XHam1KllNPDBDCe3youZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N37zCBU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxflYrMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N37zCBU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxflYrMD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SMVq4134281
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=; b=N37zCBU8zi/kdZS8
	xqMzHzAyjPkmopORF5sszGCBwCvwctFg9mGQHQIBCgPt5eqkdunlfCiDFDh4hvB0
	40CKhx9aQlAWJcDy9O369l8biS2Arr7VNW9WFXLwN5QMHpkTUArVUT2VNr46/5CF
	3HaIR225VwQ5rn8akkoBY6jckqN3qNoRh36xQhGw14ryVPQX/ZkORGD/yiEGh9F2
	HHqKdnbFq5Dqg00mBGasOccouiCSA5PUnTJK4tknduubts1ylYJyLcaTssImyKVo
	vm3Lobos6MiWpUEgPYf6fGgIer0O8EevzLgMAdGy5yEN308pNq39jpWS+J/2WSMG
	qtJ5eA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqyacpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1891166a12.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045046; x=1785649846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=kxflYrMDetfvxMcMGTkz0QtSyQ24ns6dLv23oB1lnu6H811rI0lOoprR5LUzID9Enr
         Jc5oktNWz6UIvhFvILwYzBv5Kk+mx36/4Cdyd/fEddXNuGOmkKNCoIk3/SQv4QJz7FRV
         VM71Lt5Q9fQ+Ib3qqOd0a7j+4oesMilKETIAd5qH8idGi9H3O4gqFgqOQJ90SOfCLU1z
         SLktvZLMRJmi8GRCa5Lm3nauk+JIBp3EsxjODSeG/r5b/CK17B2UBmhVRvxRkFvmlbI4
         fK9VmW16DHBo2c360bvMpFIJSuDUxf/ddlZutTc666WhLPqWYpnb5vNqfHwLicNNpeU7
         mG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045046; x=1785649846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=irmtenkIjtlvCRf52wkwiHmxkzY0KYUNMkQGD2E9V0ErggaLHH2H8p6mCBz13oTgwZ
         F/92OgnMpGmLDIoAhcuMVJNDaJ1K/pA774HdfUuE+8b8aa39px3h7zKGW/BtQT0NzYA4
         bxBUTYjtuXY+jSFcdDks7GfQSFTYJN7AHH/jESxp91z8w+M7ul+9Irylv10vtNxbfRGr
         GWJFg4Xy1GBth7nnSSqcemEVDPVS9uIeSty4ZUaaV5Qj8VP2czTkP1e8/u4vxXiXwv4p
         hLABmeQ3hxcpVapdDVPsKwK1YWnSLelcrNJ1ubqrqLo7kibSxNQVhG5zNwvy327aur6c
         xACQ==
X-Forwarded-Encrypted: i=1; AHgh+RokAEvq8/5gQPn4Rj6AITGSzK6eg5L1bt8bHNy/07YDKJtW9hd/k0RCz9/xDgTZ/2oA+kjAv4/67PzOkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9h8f/Xe1sYdnLUSxgo2Hydwd3N5EwXh9Y47ycZBhGG9wkraM
	tMRdsMUktcoublvhsCkntdy2z2N7GOvRY2G0kARSIZZeWeQhmOEW7vMwP9qbNVUDfnLXbB1ipWY
	qkASUOggjyILvSrPrnqOSTbSdg9SbvERnTw3mTyg58nwUcWJIxozzcoPz3EY4xiNMUw==
X-Gm-Gg: AR+sD10iLajsH4XbG7l4hy63XV9jpoBIiW+UiXw6loEXj8V9UAQ5C/az+mmmsnXqlTB
	Ah7sfSWcPDI75DmCWg36Z4F5S5rnQxOX3mItthmfyT1ppZYVFNfQn9mqjIS9ZCKyZB7ksj/FMp6
	e6abpOzf49hZ1pgYlJXWA37wb+S8cJODudpsP5XgHuGXjGYmf/uRNlCsQsrDqxS9CZZDhaq45vc
	Pnb3iCAOwud0yrSW5i7LwGIKNWaWx8METYYO+/kXHRxi5F2cOLyEsv6Q1AFYKbXQ/R2m9DOZMQ/
	ab+wuphQFpYyiUwQXdlZ3rvZ4mBt7tIy5/16z+A+1NahffpZuafcUCM+vfG8EvFUDojQYQfVL/D
	JPw9cMxLO01np/qPqGHg5Jy8EnGdL0GhJPg==
X-Received: by 2002:a05:6a21:6490:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c67dfc9683mr4262721637.62.1785045046430;
        Sat, 25 Jul 2026 22:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6490:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c67dfc9683mr4262692637.62.1785045045897;
        Sat, 25 Jul 2026 22:50:45 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:32 +0530
Subject: [PATCH v10 02/14] media: iris: Add hooks to initialize and tear
 down context banks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-2-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=3226;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=vPJQbRQVpDgoYGPs3GH5JVsYjK3ZXwBn3AcrWWr9aTo=;
 b=XwBLiFhIVnHpxd4zWYMjWy4pc/AV406X63lpq8cOlyRGrExG1AxdzgP2lOhtlblIPjh0ZRx3h
 V/XvNHAJ3gEAdGggO/wK8bgsXKEcqrceUCN9yhm6Bm/L419fbzCFruk
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: k3t50wucDo0VXZ_BBkGQywc5I8KSjX36
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a65a037 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=UiTy4FYwoVgUUf68WHMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: k3t50wucDo0VXZ_BBkGQywc5I8KSjX36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX7MCZ9dUcPFYM
 n+TBxThrFE2H3a1l71IdQaFfi//NfXLIUxA0pw8VJlTY+0njWapUupA+rmFkOEBpuB9bZ+Rpexh
 uFnPNqCv58tYLcga73ltQvx/v5dUO11cSBeSa4spraawdMjtS8Nvup1Xm7/1U0sSedoEVy1opaW
 jAmsBQFmsVzzZza7HKHpOzAiI9Sikxd083fLMOYSrLlaWsQdIcfpb7JvQzJ3A+tbzyBq7Vv+5M5
 cOQwI6Vo14IT0f10wMr+0ZIWmo8RzTQk1h/Zwc+FBOBiDsp8DUpiPps3hx+kXx6iWKpk4TPDGNK
 eqXfkm647AYnuUpya0T+obJQ5v/kbf+EIKDVjtZKsx6riZJw+nuZmZ7xhzAXs/nS8ji17JIhKP1
 a+IIHV6nSO3RV+Hh2zSYdW8DKPPGdSlJ6fkh8VYH3SLljnXYAbMS+Pb9nOzCyW+8Ffq+CtmL//W
 C5tVfbiBi6H3Yc0C9Og==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfXwfSFViK8a9wq
 5vZXLk01Sjxu7vQfW8pIpA3lcMS1fCxdPCruvyJPOP8Jnr+hipkHJ1y8A1YLyDiL3Ao503j9+ve
 4+H3SXPacTbrGIU6Zdl9sxljjP+WmQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260054

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add platform hooks to set up and tear down context bank devices.
Different iris platforms may require different context bank setup, so
let platform data provide the required operations via vpu_ops.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c      | 25 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..2594f5a67378 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -15,6 +15,7 @@
 #include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_vidc.h"
+#include "iris_vpu_common.h"
 
 static int iris_init_icc(struct iris_core *core)
 {
@@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +290,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +331,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..a8df9af0d3da 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1


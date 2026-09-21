Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D6476049
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984316; cv=none; b=CTuhnvihl2+ixoRn9jcSwkhiyhBEVpJUmwBYjKMk6oJfEQiXSIFHjSOZ2GO2qjtY7FbsRXU8EEL3A9SwUiYSGqQ18NZDg1AfH4UMpkCuIvSMe26CkY/S4G2KnT1XGAy5ng5DZEej7bD3yeiAnsu5kpyvmOutxgltayTD244RJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984316; c=relaxed/simple;
	bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMwvfrs5sJhb8rQoWkjrDeo5wCbtXOoxT35Ps176PAu5mlfsCw1L41LULa4IrT2EQ1pR6qIBj4WMID+Px5Ho6PFCOfQCUMgseo3BnUIQRReo2dDIGJTiK6FHiLylKJSamfCwM4dOgcQgk/GvZSoNU+21CRKlVCihVdPPyNu0Pck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0wq1GJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blKekK3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0wq1GJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blKekK3v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7A4GM1097010
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=; b=G0wq1GJ3dmwl+342
	+6/tdjpe9ygQEel5h6+kDPNkKyLhAwpMsnZpo5WfzVR7iaqMoq/rzEaGlJzAA9pE
	BvLoC38shIX6pZJiXeY5ILgWrTd1WLLe8q35K2zpBJ2GFN3XWd6enUuKhT+GGaFv
	EiTuDn7M63fCb8nfBoOwbGxKap59Mut60EcnYLdgYzLJ0DQ8oOmZXb98U6mnzU3N
	03TsJec4/F4LF1Iy2UUAPOAIXy69FSf9yWX6SBuASKHJhrFhs5EdesLn1tWfn8b4
	7FBjP95cXkdt0nT4GAyq2DUEFbniFa00fwVWO2ohYx6vW9Lazf9eO/9bCVli8u4P
	V208Zg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0phs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so54894595ad.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984313; x=1790589113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=blKekK3veoROZuMXD5M6K5arD7u3slVo67Ni/EvdRwUqzqBRTELY+RJI5WqTk64xyk
         YEE5f/slA2OJ9SHDkueRVrDTWnXYeFzcDwQ1lJCABmLOM1DIvscpSYMq+jXHGKvD+M75
         37zORQ/7jLQ84bmkI7maWgWX+MuSgw68tyTVwSNdkJLIlkKcfGq7v6pCFPWdWCuZdKeD
         NfftZdFK75Vzn+KmWKOk4GvT+KwHsRODZ95X+eCOrOwJtFq2/LNI6Em5fEPe7yz37fyV
         p+O+IsVqg8I+wYdoGiZCfbZZx9dsLmBUqFyJb0w7oD4Jl6JkeSp7+aYJ71Q5R/CundOt
         kWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984313; x=1790589113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=doA/Q/LVtD+G4VIURzk1IiF23btO1cKofqvzZTyWKyh6XbPba4JuCEOd6nlsz4/AiZ
         0s9T0lsh+nzrvtoSUqOnEcgZ3UtnotHkutqeFE2FYCx2vLMrUquS6/HaO3GiGJEeZc76
         yQgkC41Nqwf+mTkp9UqbCx/TEwk+foUHBf/x0SqluQbiHHxtx33GICBM7ophg1f5KU4Y
         rcbeB6bQ2JqvJiycTHuaLAIMVbzJva+whoEl2S41j62Q9LykgJYixKGd4kOaHVaIiWlb
         ysv/xQ13OX7MAVlYe+TUb2ukt9QGAFeRuQc9NmQEh8yDy7vvNncH2R5zjPBuF1E+6iAu
         4V6A==
X-Forwarded-Encrypted: i=1; AKwUvBxHwaIXDonL2cXHQFgnssYd/BDyVHHi8HZVsyw+tvdBGZapSybltVFPLf0EuPBDHxAB5N/cFPbHAzEvMg==@vger.kernel.org
X-Gm-Message-State: AFuF++lhHrOpBqTMaT+7yWEHbd5gTGGCPeI3yrg8u1iQI0G2iKAlY2yZ
	UqcprbKeDtucwQI0glX10BW1gGA1yUjOirzXYVjfZUFocSE3ZiRwooCR1Hmntp8YMry9Dr67vMb
	3oYKThsOA3sKDATWFYARSIQeHoG1JrzoO0xok3BVDbGRA30ytTXahwJVnNKFx4cPx0A==
X-Gm-Gg: AYBFou1ELwjRCjknNVkuVsnq8s2Ti7KYBDjHz+1aDp9Tb9xj9gxisur/Qn1F5iTP0go
	Ou3zNXLT1FsYhmLt1rcsT09x9pbeymbItOXkcKG6LIv8qr5fwD9uVjXDLVMu8MxSfPV5rbAddiL
	axz1Tu5A23Gy/dwNwYGIXVh/C/L6PsaEy169tJqU8tt6Xyrgv2Fwp5geKg5rnLw9ngtskHOyh//
	9JdxEEEOYGTUWN8h1dVTuqhPC8TkznYcR/EGZO2KPVSqwBCsnN7TjHCj1Pi/qeWUnqdZDcEfPhp
	bh7EQctc6y4TbFmyYd+ptjCnFEaK9XCltIfQffsBVsBdz3K/WUOQivYebaHA0Ll2PqDSzwMiYOu
	Skue/cT5cMLw2LwXwDoNAxBYVpfxDqQgaLR9ysNYUj6mPFR43JZDxbs69FCVs0W7G2kDNM5ljnA
	==
X-Received: by 2002:a17:902:cf42:b0:2dd:c100:7cbd with SMTP id d9443c01a7336-2ddc1007df5mr87883765ad.57.1789984312866;
        Mon, 21 Sep 2026 02:51:52 -0700 (PDT)
X-Received: by 2002:a17:902:cf42:b0:2dd:c100:7cbd with SMTP id d9443c01a7336-2ddc1007df5mr87883495ad.57.1789984312459;
        Mon, 21 Sep 2026 02:51:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:35 +0800
Subject: [PATCH v2 2/5] media: iris: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=4797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
 b=gpue3xUU6Zcd06eW84AvRafGsUtcvTxG5pr0awdV1Rd/xwc5zrttsfOMoigx4QPpYBnDbjOsa
 qOQ1mPML94WDuVxe6i+54KIxdVD+3fikT8wk+RhGYP67pxirpKyC0X4
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX9NI7FYLhODBU
 EK6aFOEllqQzaOs/F7NdPDH987eqgXzW3tP+NZ82jMV1yVQOgJQoTXmn+slx4XypIuPIjYMPoZi
 qj9AZfyX0xZn8OayEGtrR6TADZ+33dyByj/v50LQIWn6FQeU1YA13bed6hRdC/ZTmm+ZLJOyj0m
 YZOCvjSC7CdMDJyvTpPEJlVWfgXAjbnXC0oXfh8jsvv6AoUoRI/HbNIyDhMdszMk8FK8EZW2y5f
 3/sJqHlaokXOO6pXOTO5OXTmynEjbdhtZp4wusEfECXRQpL8FnDPIOyb5RZbbCL3VYEKUiZp3yI
 +lTgTOTjydMp2SiMV8DjsJHHpg52hm6OLGE3G5VGQjmO7ND/GtGW8KiX9vH+LUN7moQjK35IKcA
 RDIt3gionE5EXPDSvJoSMpVQQxPpPSgRf/YOW+qKQUX3UfNB99AafoRNEBvcKZEgqZYhmP6uX/0
 8v7jHiyun60flHwNIag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXzkuQ4vCzNzgH
 Yyy2We3yRKw/7nlAWDM6CNeTzifX1xS3Ks657zFhwrC1ud3uC8sLM7EiQjc/ypgvXWDdmqQFc+x
 SWeXDFMy3fuc7xSrdpSm2efHAskHmSk=
X-Proofpoint-ORIG-GUID: Hi78SbB7TiZfICu245MGwAZTWum0urV4
X-Proofpoint-GUID: Hi78SbB7TiZfICu245MGwAZTWum0urV4
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0fe39 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=keAPckw3ocdkVcR2fkAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210141

Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
clock/reset tables. Key differences from SM8550:

- firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
- vpu_ops: iris_vpu33_ops
- clk_rst_tbl: sm8650_clk_reset_table
- controller_rst_tbl: sm8650_controller_reset_table
- inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..69c239c60b9d763e5e2fd0c16de0e95482414b58 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -54,6 +54,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data eliza_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb35cef91ba4d0608bd1eb58ba7194..4c6d565bfa6c7e176aa41aabf27ade8c95be2fa7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -42,6 +42,12 @@ static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu33_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p2_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -85,6 +91,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+/*
+ * Shares most of SM8550 data except:
+ * - firmware_desc_gen2 to iris_vpu33_p2_s7_gen2_desc
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - inst_caps to platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
+ */
+const struct iris_platform_data eliza_data = {
+	.firmware_desc_gen2 = &iris_vpu33_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu33_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_4K * 2,
+	.max_core_mbps = NUM_MBS_4K * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..9e601ee802097ec31531fcae85d0b17a7944686d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,eliza-iris",
+		.data = &eliza_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0


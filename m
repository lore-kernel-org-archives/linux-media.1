Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C63947CA72
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455334; cv=none; b=BeP6cWlcXKZ4/3oEO0RPWu9HB9kScC9jUm1PlQipkFWaoD+M9RIdptg62xyMNHCMv/0+AvmmJevnj6p3jAy9caTEjMIe/Nq5RrN6sD2Q0MMFZrKGgdsIbAvNJfFuanCXAJzf69npkhRhQ0q7lF0pSCuAatAlzKCoTj5Qk0INoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455334; c=relaxed/simple;
	bh=k9KzfH5moeAtj2tGudlob3aHR+PeUOL8Wc9zHKcCgEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY6Nwv6oAV52veiCWS7rSO1L9xq45U89mqkkflk5IlfLs588T8jLJxlQS9uPEu5sL+TGhPnRZpCovZFPs5RFa3xylmZPA4vispDSFEVyYNbIfvqOQ5CNw9NuCNa6U2O5jnkRzRmvUQ31eEGD9Nl9XXQq++qiVpooL7kRkdSozMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fh3OLy/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+GggjoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh3OLy/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+GggjoB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNKb0X3441700
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf/HXlevJfyNDfLnSeaxND+BiqcB27uNklEnjj+EbmU=; b=Fh3OLy/aPGusdfxO
	/o7vTjHsssP/3yNcm5jnOA730bIkCA0PD0LluUIZr7avtVA37DQN6voG3I1XS4UQ
	bI8tIiG5ASDscnGMkwI/oyfVfDaqOUXKUSjd3kmmfykR2tPNUZ5GfNqrJGsf5Ky7
	5lyuWB0W60cQjUzZQ7GNb9RGvBle3h97eeuo0QYooAKrC0VXxi71oVETjPSKWnPY
	vzBnVVMXMzkIzskqA/395K33yS8CCMFwU1Ak4Zh/Wy/vlcu+fEbQkNoTkNhPyjiR
	kcO9oVlqbFz+rPorQuF0ihb4yQeJ8p22YYMtjfyvwUSEamlIfLxFje3QRQb4huE3
	X1qB+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg6kg2b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so46559785a.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455331; x=1786060131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf/HXlevJfyNDfLnSeaxND+BiqcB27uNklEnjj+EbmU=;
        b=L+GggjoBUltnutUEnpo32bh0lWaRAWHPvm0aWP1NMChNZeOuNe8DYmQnWBa/i7manA
         F7tTjCD9Lg6+tBYR8JYTeiuxa6J3DLyjD8Z1NmgSD2gIhhMBF/FtZ93rli9GCfhIbmy5
         kMyQBby+WOQjlAAn/eWaruOLNLnQ7ix20X9edHfzKnoc0DPVaozKLn/10c7gcwIRcqHO
         BMZtgAetPML+MgEUyBfiQF96nEJQ4TaQRO3ieOm80FzM0fZCIghEafZVq5213yIirudg
         BNT4YDcP0YqkupJse7t+PCWCnBi+bBD1J1K2tcnF9nUzlzQDwkSBP2au7ADn8ZmnnnBs
         2SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455331; x=1786060131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf/HXlevJfyNDfLnSeaxND+BiqcB27uNklEnjj+EbmU=;
        b=h8y5YZv8IeUhLPc1D5sudQMQBnMo1oHf7miaS4ucBNQcsQUJpl02Na/xItn+0kB43O
         jcJp+K+JNLy0QvdGo6H3JQRCsox96FUBiCo8kflJ/zZx1iX4Y2W7f6kPWimCVs559z5n
         l3OZIsStxCcdeVznB97RANQXOmMB4jviqBp2Yc9DURb4fRzpMZov2WJLHCcaf2c/GCUe
         QbaAkuZlJAuX2sLouGaNSn/at4Fbk40u3zW/k3amYlneK9oLlvQzMFo16MGeu3BWUc4X
         XIbowFx/ISN4gSkcoXUsmGzhBDbpXJgceFFVJqJW3Hqgr/E0n8LbtQuL7ftg+/edcx+c
         2zQw==
X-Gm-Message-State: AOJu0YxH0miV7PHiKrBqkVh0GR+oiJjGsaXrsYWHYgHZ8W8nogQAADqx
	s5YUzra6iX6KQ07QGfXR/wHQn7OkXDFqEWV7OcCsUJbs8tqr+j5GThyI0jlDrl4qgXrZ+m2FTxe
	3xVwtcuZiQ3eO3CAMm5LCqr5p1gW+dVOjTHqC41Os42o2xT0QZXmRwJvL1F/sYnzaVw==
X-Gm-Gg: AR+sD11Ey90vQg/JqDapWCjGgZ94IwSdl3mk4lvuT2VGOui5FXlg4Unlo3IXaflEnjy
	AfFsa5IvjA12ZmgXQbg2jEkbm2dL3VLn1WKQXS+RaLDsL7BDVGPJCukv/09sE6QntceBR/ohITk
	6AIXW9gacywhcXUQHb2fgPG6WlyTUAhhPXgcEPJMe5Wa7RmqDfYtVbNp6R0gpXfs8+0fcpRP74z
	Q/TuZafAchXRY0wBK1i3mbbcQOYzjX2BPeLk6aGsTKb/qNHzqwp9OmBFZRwEP13JtQyZI8VdeIV
	NcrFTBykChKQfmS7XSa/tikfXt/W9NEpNk0dxQsgb/npztnzfXqAInyGXNpJBaMNKwDDK9mpqmo
	DeyQd1/7F8h7xbZTbpfZ1wkMXkbZRI6eG+oi++VUiL7bl8MSB04FGanxw7LN8HtHsYQTDvzUsAo
	V4tG0ksq61hvovdg==
X-Received: by 2002:ac8:7dc4:0:b0:517:9407:5c36 with SMTP id d75a77b69052e-52b38671e21mr49507701cf.53.1785455331102;
        Thu, 30 Jul 2026 16:48:51 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:517:9407:5c36 with SMTP id d75a77b69052e-52b38671e21mr49507441cf.53.1785455330626;
        Thu, 30 Jul 2026 16:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:31 +0300
Subject: [PATCH v9 10/19] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-10-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5398;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y3kKIIaGHoai0/26Ss2XGrVD3WfXqK+8BJ4kd9yhH4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LL2KlL5JH5QwnvNJX8AUy+G0eQDTluGpkVa
 ZH9nuN1lH2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviywAKCRCLPIo+Aiko
 1YCTB/9WYpzHYX71l9DR9ajDr2mGKfsxUY5360KOgCxfl99lXclKy3r18ouxfgFlK2h672aefpD
 PT5r92zroxrJz5NBwBH91bgWUknUNkejfYPpganghu+e2jYiEqN9zACkLPMXE7UFwsf4ryIzfLm
 kEB/KEV/k66F4bPh00LjDiyg5HREZPzCXRjG+m2npNpyvqXrLm/fef4K+IT++BZyhbdhFWiTtId
 e0Bxai/rh3i7lqfc5b3ZVwUCXB2Uu0gO29Fa1yTBqQpTFJkUj3LU2Jfo+lUFpWJ/Q42GHMPS/yH
 Zo2qeylSR8GqgNZsTSPurQFJorp/x+1zb45B2KG9zlOcZw3l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX8UEEtq9kUydA
 AQEcKusK70vn0Gtl68ouNH8a/wRqAquyL4jpsUCSagTnYmrRvBJgpebh5X80Iy6tOBxvpGs43Pm
 rejfWxIWUH+pSoFQy1nav13jmLzA25W+xoifO41CBPrg7dtFMc2p9FpVToIIoGtlq7uh6Sfy6+p
 HStX+zfTM9y1dNgzE/ZuJRWdvfLz3YLAQ1djnImJQ4frbD+Q/37lFZYgBYZZrDQ7d0YgtYAUpVv
 +rEOuCF9OCfUUV8P4eW/9DcGDiYFbxzycGnWRm22Y36kvpMw9CcQWVjUfjB/UJZrdZ2G6yZGwMR
 5ZR4k2HKSbr3OdEv6QLVFj7mmxI/kXsGULGZlVHpgWMeiNUviccbGu19yHBcty3fL7xGnYonxfQ
 Bb+0uAZlS36zxvd3gz+siskM8+9dKLFUiVgL1ug8oRLNzped/cQY7NmRstc4QzCeTu0fv4CrIBd
 gNhK+YjwGdxhpInZhOQ==
X-Proofpoint-GUID: x6pkWmFVbRWq_-t0-oAwHrKnQ_1PWuwS
X-Authority-Analysis: v=2.4 cv=He0kiCE8 c=1 sm=1 tr=0 ts=6a6be2e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x6pkWmFVbRWq_-t0-oAwHrKnQ_1PWuwS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX7gB2fAsi6Hwq
 4Z2suMVZOd1nl1Qe8obuoKoFtIh3ForZu8oTIT/inpbFxocz7QL7yMCFpbkPtEnYvfJhjnQkCFq
 lkCWzs6HFiQEKP2RqrZSeGR/WxHyteM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index a35b487b50ee..4246c2dc5cd4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -319,6 +319,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 562ff0d6716b..e594c7a25db3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -132,6 +132,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -163,6 +164,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index eeedde8fc9ce..b8099d7ce556 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 2c4d34c7bd77..883ef7e75291 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


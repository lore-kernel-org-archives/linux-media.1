Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AE44999F
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424877; cv=none; b=DPkBEiEMEdXDp5JWckoln/FrAijAUmc/DsnYQdlgeAkhRTBWcJcM8wkMOs5LDAzFO1fUtNi72pf97bqjHO2P/BEtyF+ai3GVqj2oraoFDIlUfMJZRsfsLrxTc8JfFkWf/TCVhLIZSeL+Non9Lp2f9PFZZUKRONaOnASoBaPXG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424877; c=relaxed/simple;
	bh=jVl3EDaMuvXiF5cSH+hSErSIS/hSpIYZwmqXKlVzuIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7CelX5dgDT3FR+Djbb5PciSCTnDzPj0ZLtdXTLqiZYZF68UhFS4SZJqbV70APUc+FN1ByKlVmyBt0y/F0oZ+G3X5XL1Rxxwh2ormAKeX8oTrBQE748YVyTV4znPzpPWcR36cddgwPho84DVTiMDPH3NEtujCtpk1THJ6tXDt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ecqum93y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jr+qdne4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ecqum93y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jr+qdne4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh5mM1384921
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21bqDljtBLDKcBhUuS/e91ZFF98MOB4VItOs1eRX78E=; b=Ecqum93y6GYsTWXF
	3Mv/P7ihmt/PFjSZct/ReeHWVBBaerkr4cAZcB52ZFr1RnjTZyDwSf/9qsj6gcX0
	AwpfZWCZ+l79Xri4mF6d5kBSb6SP0xrk4kKcKTxTWGGBNxiT+tYKqCh+VyGiaxRO
	/vMZr0/ksgW4JBOSVZOCQj2Xmm9wnw15Auk9DGnFcOksIdqI+YmWfos+N5XG5stq
	2+vt3vGphuNsQ1AjvYwrm9Mpb9JZ4l8uY6ez4sRXmG7FKg1j6/VoFg+HWotPwPME
	ak1wemp++J8Rh6rrwL/S/jyytjeTu75GoM1sNMN0LlvrdDhb5u7EPOtNTHZcycO+
	VkZbEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md06tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930dda91cbdso392372585a.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424874; x=1786029674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21bqDljtBLDKcBhUuS/e91ZFF98MOB4VItOs1eRX78E=;
        b=Jr+qdne40HtQIAK2fR/PbdlnRGp+zqjOrXxgg8MCpnMZHtkV4kaQTxU/NpZDLnVrbs
         Gn4nsfAvA4jVJQISVRj7WyZv40oNhSosPueIfU0cq6c7EV4gUqDTkjtl7+xRjV4jU51L
         2h30zJEOpz3XMige0ZnO0xXpoyJFW8rdAotFDoCrYk22ibobx3+nCHcJ28bocCIMw2/2
         3uXTfADD6te7hcOhMFDP13s9u5ZBdn2zCkZSwfnnraN1mKh0wHjTe+oDtwcUHJc0EOsx
         r7j4bZyWsMluQir3/XAF60lOz6C1qpac50MHJR0ni4aAE30uX6R1j2D4/I4BgjUL2ABb
         2JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424874; x=1786029674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21bqDljtBLDKcBhUuS/e91ZFF98MOB4VItOs1eRX78E=;
        b=oN3n5EA3Dvq26Ml8D3PJ8lA2zyOnOBjzYJJv6R0fx0jludIYm0uF2hcJAWHETFbZq3
         14kQdg/w40euqZQibbPsN6jgK5JnT1GDqgOjiJj63bZofKEhyjzkVqISh6JbJajl+8is
         hixHopOtZDC1TK+bwLYGxg9RP+QEo+Q1ly+l4eGQe1PQa/aCNq8tdZu3vS+PG6CQA4oZ
         9oSz+uTtfU1PJ1v5fbzkj3pv9rT3YQ/PBxXnipb1y9ES8gnFE/m/1NKCL3fKHdN2QjX/
         VKJU7kJIag0jqMFzxw/jffg/kBWBjo4nWVM/rNY2kbyte9HT+QUZOzso44Of7kPRc58v
         xmtw==
X-Gm-Message-State: AOJu0Yxjq/nMvpfBYpR2SEVHkLkLszLayMpE8Oavi1w8XSoZgtFKvBM5
	sbTUAPgdS8NU2ewct2IEA+sZQJl6/o2wS5iGSi4NTsKLMGcjvW1c93EaaHZSkoEKTbIcuiuHhpD
	AepvNdlzi6UQ+sY8Ya55uz66T7HY6JIgF9PjfJ9E503+/rQvSBx/ljxTBc+eQPV/ROg==
X-Gm-Gg: AR+sD11ronWfUYJUl6/dhfudbFfLwkXp0allrHC3ny6PN0AI6GoqgAS+NYrjApYqi5g
	+4F+2O+BkQz8q8wAth47sO02kM+RRnHL3RtFno4T/YocWWLmHW4vZXB7lzH/BO1hDZuya2tTqW2
	QZ1N7UKwmkjd2e+Im6ykIVbYHV4B9Ucv97sgj5UrzsQag7tO+JFisJ3RAXe8TUh/h3Zv+j059ME
	YKit9IdaIlhpgcKDDqx+KKdKa3/yIJdHXu7kntNky+ckWW/IZ1r5yfF9SprSvmiYqYW4R9oHZ3r
	AWAGyonsVh2zIL/awZlixQfCU+NXheRg1WdCcGADqU1SBMjNnVr5AwR02NWkYl51Shy3CmvZE2z
	texE1ObuH9CmKoGt/Rxj7NaHkD84RwZLmPDWTE2dWWYT7SlMH3Tg3rGVlvTS8h2O1HfNT5e+1Xj
	Ii3yN4UwyK+Gu/mQ==
X-Received: by 2002:a05:622a:259a:b0:51c:185b:29e0 with SMTP id d75a77b69052e-52b38387758mr35168061cf.10.1785424873699;
        Thu, 30 Jul 2026 08:21:13 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:51c:185b:29e0 with SMTP id d75a77b69052e-52b38387758mr35167411cf.10.1785424873031;
        Thu, 30 Jul 2026 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:52 +0300
Subject: [PATCH v8 09/18] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-9-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ghS8sJUgwicjgj2m9UGRZXri/1RcpwrsGkahtLsgteE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1Z29sW7lk6z/D7lyktGWB1y1GJ0a1n1V2TKXD3NvPDpO
 /Nl29g7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRvbc5GDYvOemb0JsQwttj
 emxzx32L6oo8Vd/2T/me/Wzs51LX3b04zdO6/MS9nKy/Fgr696cXBvl1JyUdSLNdGXOugrfgjkz
 BIrY7z6cdbHnB/MyYT4P3/D/hyT8lnaIdNJ9YJnUe2nik79C+6J3T6t9rbm8tnHj5wcrL8xeFSz
 kHV7++zceipx1cLm4U6nHO2H/F1icFM5J3VXIsWVst7Kjeo7w3/u6Ees/lfi9X77gfnb+5ltHTz
 J7drWfSY0HtXKbwvg8Tar5O+neyhCeAqUdfrOlKzwI3MecvqpzyMW2v/CfOvrV/UXgmX2P7d6uZ
 z+MO/bnNbcy6k0mp/eidhs0CBa/9nW7uqz7W33Vj1QtpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b6bea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2q97bRCiEXtL36oqR-vBP9V2VvNzPGtv
X-Proofpoint-GUID: 2q97bRCiEXtL36oqR-vBP9V2VvNzPGtv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXyvuDbFgxVh03
 +DhsxnU8d41lz6isAZdsaBmGNRyi+GzRM2UoHu24rjW4VjxwGWrjRjeaZTkezPw3jM/DsWTVKRF
 za0VgkQoAIANn/dKbES/F0Hs/F6yyHU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX6hvSfnz7QicX
 Ze5CquwXqHwXwzZkAatyY9+4rdSUpNw8mLCz5RjqoPPaaxpezGtUgU8RlUfI+i3GsflKxPPSqKC
 lnPL2h9WbKzmC2aWpUuFVxyUwZKqroPCRmx1MBcWyVb+OxMqBDFEeETerdzIf9BNYyYLyk/L9FP
 CZ2QlVbNK6XtXZq+JU6yGtMAkg/iFCS5whYrH7zOzjSY9D++X5XgdffgLlRgjWbYYG1HIzlYirQ
 MvhOedb0YAz0us+OYlgGOrpDRSqq2JNq4wYMy6AUwGlKkfFjcdffUKeTnL+nS5keIKhEXR8kN2N
 whkrH14sx/q9oMucBjJtSRagu/j0NZFtNyPqdJDc6+M/2ZxVTkOTzlvqqOnwvYTaeN+DMrgyBdb
 hjVQ0pFUNE+POb86dNE9lDVYldpheVXVpgUWnROudJ21AulE9ncTm8zDbGnMEAMwtPmo6FiYRC0
 B126gYYH6VQgPBlpKSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300116

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
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 940daddbafcf..e194f67a6f48 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
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
index 872bd09656b1..3ee38def7697 100644
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


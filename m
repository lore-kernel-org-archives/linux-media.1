Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F008442134
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424892; cv=none; b=p7f8hZo7dmqTxSP7+avFAjV4cuybsoRIA88R7AL/37P/6/g3JjuWzrZrNLcZLtNet5Cf2ugWfMaoIxwBokKP+lz5IIqhi6aD9qY2kb5x4NKMuy//z85KwfGsGi/OaWlWdc9kHWfltVu7SKgrd9uQ3S6MDo/gJQpEGah8cQ/3K6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424892; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8u6xIhMjBwUGqdlFu/ua/A4V004FkuyBEPxAtD4VL4hOaTOLmXSBrMtmUrJnRdf7Ab/jBIIWbitvq15lJNLrbvZXWG9kYO0CjGhzmAXibw/oeV0jEmHCN5jZcDQ6TbpydShBlyUIvbzVj4m3uqeUaJlwnnx2MWOJO8oZylzcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0pXIq3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1vO4s/I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0pXIq3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1vO4s/I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEflYP1118063
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=X0pXIq3zK09XvkA1
	HFHacGnRKEXR3mQGnB6NT+TkN6fjfEKWsrS2CFQK4o3Y0p0Uga2fAOqHiAtakRZJ
	1fSUtO/IU5jjnG6x/0vBlruwUB3T4LlT+EBCctBjz1DvY14CHmftDr0SciV8jd9J
	488jfjFn7ELygzBl+Kr2hymR3xfNnLtVmpx/hWjxywm8j5yevw8SQ5iOrOnyf5cU
	IR5X4Q5TpLHgZwhFGT7JwbRUl4iczZqZwvrsiwsjqM2jyVZY6jEU7z81N5fumxe9
	ilkvAO+pDexsHSagDPnsnlfB4v9lEgNg/W64IpL3s0xAYXkxUT7VtGG1xX4GK4uH
	W7Micg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn07ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso24886361cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424888; x=1786029688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=h1vO4s/IeNA9WBxp+Qn6Md5murskZHARLMcyqGmUnq8WmI/yV4MRGrDN7lcujJYqHF
         WOoSkWBBdTMwHKfaOzjdIPOx3F20KkagHpv3H6bvyffPF6VcD68lVaSWDpGBBo9bbjf9
         8YM49BItKECiIKHmc4couURPZRZeSNVOr/uwOZylRQ7f7hx8wcs/MD3QaWqj0YrHgSKD
         n6WT8j2exiyUkiABdOk9mYs+uB4Mh0WE6diE4YrU0hMIyV9hezNThexyR3suxPsib2SG
         dXSlx6UYwOBUhuaV2XzZGK4794NWjeXlXPGTH86c6vnDfcgga7GGZmMdgU/xyb58s2kk
         lMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424888; x=1786029688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=Np4ud4bZzWTBYnnXAANEySM4Etpgf4MD3rWlGdlieXM/NQTBqBaFob7y3Z297crKR3
         LfkwgCSI7i0/1SeDU/QLxcF4veucNuVrSuquqRF1UBzmbNdpuMlpFKhTyiBFB8m9JRXK
         KPb6UjSDcE2Z2ZHz3lyxAPdFhLit1HbbtjQ/gekUgavnZy2XC6e81tGUxJrzqQxqQv8m
         qsXDqlp99CoWNkZ9fExuh3dQKuxb1sWDp8aDl/VXNQGKm7OLhnGLBgHBEyuJ0sxQpF4k
         IRPaMLwcWY/nEccph9hgaE0vrAWJwmQo8C3tKFTUJRuo/gHXIEb6btymJNOJxkzC9jaY
         JjGA==
X-Gm-Message-State: AOJu0YyhQuUk0yk5hNN+19SvRtIXeVEbJWpZDs9PLHiNRaseEJAIVKso
	jLXpe/uLyDeVaQE2GB4UWuV+M+fD7FGP7meP2L0udrX5wWNOu9DfpHJws/1caJkjckj1wMBmzpb
	KKxivLa+T7Ft7FkbCi4pDEpmi3ih/Bl7X/WKFS3PmDxQ5Bmir/NhsuCRVvjLdqtrJtACRy11CuA
	==
X-Gm-Gg: AR+sD11saH66lAZVzKcVSsD7vJBXvcM9evgtL5OLVFGosNy0sd1SVM+/X3OY4jSA7HV
	YPs1zNtwGg3SVoVzYJ60Q1hVJI+soIXTGk7NS70SWvkx9477Nde4aindugvPg+cT7QwEesrawZg
	DR7scbYQogCiL99ChhN+3Nj6LrWgTsQPi3FJK8Uh+q+99pzKFCBaiIrCIedF6imOFKIVDL2bpo2
	8YeoGjCrbutCKwbo7fqUKJlglwHycxTvBOthuig+2Y82endGIMeBmaFxYqyPLNMrI2oLQYYHy59
	WjZbrRuFRTsJIeAVRQuQC3pp20GzXb0MO5QCOBFv4F7evJTcXfKiVCGxKOG2bbJjVrYkegM88Wk
	g+kgL8TyhLpghmAZdbb7MlEcNARuZHvTHeKqjbf5X/DvqrHW+PLBIS2C6+bmX/BOYJlAAhxN8xR
	sObz2fQ9mKGbzVNQ==
X-Received: by 2002:a05:622a:1350:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52b38495d52mr34454751cf.26.1785424888372;
        Thu, 30 Jul 2026 08:21:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52b38495d52mr34454411cf.26.1785424887830;
        Thu, 30 Jul 2026 08:21:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:21:00 +0300
Subject: [PATCH v8 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-17-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vTAe8H5ag94UQUhXgbNgpLTaZJljzjlKL8D
 WjHanGGuE+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0wAKCRCLPIo+Aiko
 1fGdB/9WX/2m4EsTsfhd6XPmd20JoFIINSJHXYYs0YEDy1xqjx0qe4Gt7ugplvecPA5WxjgdVJl
 2usgLo4EszYqopAzMlEDeyUiGeujsNJ6bjkdk9THDPlvuSYAwvAWIxXYCfLz4oyAB9180i9K1+b
 1GXHY1DQcssFefNJy/PL6lmHqjxN+3dZVpnnDOKxe6ymXvgTNmwz+oXRTglkKvInPwf9/0tqatW
 XlZ7I1toZRN0VGuV2q1AKcuuXwwTiNn4wDyOyYeQD+lSeVTZVN4yRzs3mtIcaGDIuM/31D7as/q
 1pHtrVuB12HqbXuzJyZfFq5fXECZD9TBtHg0Sfb8EGXZNlM1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX3Xc6O0feWv8n
 8ai3nkRLowwVhLayncdGH83cFDvHTEs5Pujm3d7g/7zJSfu3kuESUs8v5OlUQ76skkLVTavrEuD
 KpQXlhMqUZAhwyUkAMt3bIYP8H6gdM8=
X-Proofpoint-GUID: -RvIiR3FzxuiDVZQaxqahMBWzOtGj9G4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX4J4jj0pgT0Qx
 Fe4r4O1CSzY5b0x+KV0EJjny6tdlouVJvHLuVIbDSnhSoQexQPv6sOatjR0/mH5KPMrwleQ16P8
 Ava3sJ1WvJtwtlUzpKt4+1RKgo95E2IzVCqsblevUL9/uMT9cKSXIy4rgsKTs8QYj7fYFWabDic
 qVzbOwytMW4AkJDFjg7CyDWY52wNJ8dzKcrx34ssgkmntZfgkPm1xIQBs0wXTlQpj/fff3wt4st
 r8GxdbNMGfDptjZIGKg0t+SurJxJbgd1akLMDydFUaGanKVj4WA2uYvU109U6zwdu2yizuR7ywm
 jshk1rzPXqgYgEy2sAF+hGwbGdOE+Woi9VcOB1HThyLvSjqxSDIqqMTng99LVA7SdqLWT3Z56cn
 u1Ql9YFzq7ARqss8V66A7hFCxSApsg9LVJfYXTbhJQT9HOcdNepCXUXdOvlSwYZBEyj3o9mQGJ/
 HmvowNWOun9bdzXf52w==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6bf8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -RvIiR3FzxuiDVZQaxqahMBWzOtGj9G4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E04EDCD3
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889443; cv=none; b=UgisvddhF2C/lsbWGnxVPGBtCDrFMTYNXMQZiN6rdlcwCEHWpjCLMutHFY1Vr8oN0+fLm/eWha/E5RRdYrZTML1wrEPiMRWYdYOqM/GnmBoAB7rCtu+2CcO7wtaAQpXm39GCJ5KWG3lnIk+H+ihm2BPgK3V6DfaG/ZOAnopOGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889443; c=relaxed/simple;
	bh=xykPAC6npzKt1N8Ub3PdmBipVvXvtBAn/Kb8/faOaxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4gBH0kOKUTnEKyijGExqUq7TOKKXOR5PSKlHnmf9Lzz+Y7PCOCskpET0guQ+HYnB1Tf0adadoio33qQNje3nl/z6xlSFWThuKMdgbOsrHRnyAx53RX/awWYOHHMCPN0wPVgHDUIVur5+xiCI7hfijRSozXm3mCOYa3jCYlINc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/A0BRgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV4J8kN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/A0BRgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TV4J8kN3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvCq790830
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yjjxz+j5Mb/djdiiskXr7pvI3RGq7Uv1B/7Kyj5lXpA=; b=Q/A0BRghoHmUfM57
	ppUraBNvkdVKVAxQxf/A6ktX3uIjSiWPoZ3HEY9pc/ypElv8Vgd2I7ACs7YWo+NX
	yXeSelc6Gws9nlXe/G3H+Ld6cZV/1ZHXntA0X12SNF3pbmeE2tkGWN0hKE6Jk00+
	pAMGbB5AmEI1bzY6OkmwYEvNl0pAtZtavZvasX6DWYywdxe5uV9Z0TavSf1Zwmey
	vRei/PrnbCoogIqrtEIgrAKjzqCWwxfDg4uzJkhexAvGSvFOmpoqEUQI/FJFj2eP
	q+nngJb3I72nExZZHAnrhc15tBfhBKyHzIaIwQbJ7Q0xQvvp/zOo8hbFrZr7jS3b
	k9EaKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrhdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 11:03:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5f7fe8ef1so1303882a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889438; x=1792494238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yjjxz+j5Mb/djdiiskXr7pvI3RGq7Uv1B/7Kyj5lXpA=;
        b=TV4J8kN3gWE+2130G7VvT7JFRoOlf3O+Xa5jwVZGCoIDNxXBNrMM6/PV6uQvXFxHWj
         rMgLvuUckA9/2CwmUV05NZpBl4nA1ogCprBMUdM80xXmOC4CC1i3c2Lwtxjwle+aREEO
         qPslNXhUcgI0D6MSGWAs4yksSPq3dQAdqhHrJFD/+n0CXZMnbqzeJQXinfNU+hyhyCV5
         Lq5aahWnvb9cHyYTH0kxW5PDVvWfusDqfSyeP4WRvzBwLsDiIzdMnqgy887OOnD06bXh
         3OHLVPanLxuN/XgATIIlbNl16oxX4MUuds4iuePenx2GdYXN/HTrFgxs4ao2WvsEzHp/
         c+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889438; x=1792494238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yjjxz+j5Mb/djdiiskXr7pvI3RGq7Uv1B/7Kyj5lXpA=;
        b=LpJrGwYwVo07djjD5hdiAYarmIhPVTvp2wl4knEdiME3embkcxSwIygU4UpD9tHSPj
         mGOdDq6tLaL5/Qlp7pBgnsrOF/6T07Qmt6tjARDRKGaAjHu6sFIoiUADkelHZ27foY8u
         v0d9lvDH+7+KE2rdrP7nalURN1ThTPEd8YuIkJbuoWjzyjO+bspzrmGJ0ynDi8FpFYsD
         NYaHqeG7Cd0xRKc7HYUfV/hbIWoUx4bG0mXEXaTJX8rbkMvmaM3qI0VTG863qjug+1FW
         58Xzn3xTdiZBz18LnJdfnNP0BCfaOEpiz37+86xO16k+aMeCA42M5yPqv9cs230VITQ4
         QHGA==
X-Forwarded-Encrypted: i=1; AKwUvBzLS5C2azaf/Y9rd7qtJTFDzvALf5DIyT4DvtYLaja7uXMArZ5DXvTlsq8FhlzJ4MVt2JzJubOsHlPbDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ09XE5+4kZzbMBv5dN861K2CgTAe1STAd39IlfM2EPWQfhQzqD
	VRcK2gqIds0Z92ZgBNuqgT8hA7KnhkH9NQUabpVIZl66jNhVgIwkPg9t/qknCagoIORZd9WF5cq
	P9QINBjJM/1X8Kalxtig8E4SDtcOriZ/9p5Stlc/l2Px7NvEiwF224oBIWcLiNqN34Q==
X-Gm-Gg: AYBFou1O2368OowIejyS3PW/WThV3/oFWENqr9RRbCz2tJ9ZSwXogpxpHevpSfMx5nq
	CohsedX/yV8z+c2f3f3+LVKQKcasJikh7aVENvQFqcOFnd/MBeuycuCp8vb+ZXszPfSkrskV8gq
	cLHuDXsYEL4pwN/KPaDuKk2M46OT8SVQ4lSrP/MGcb6r1CnxCDQUl6vDbu5Y7kDjG5KKTSSD68O
	0pBtXnUxRe/1Tzexktm0iBvt872CE97sMe0ndOJQonwcb2JpkA3R2MR3+MuYq2XDhfHKWjFiChM
	G65cvyZW1/sh9hYUVPbjggxG+JJBhz/RoqCM2dQkqtvifZdF0iqHEFUey8ZkFs7kLxd41dD0Tlr
	4OToyxVEV00kwMoTagIOAbVKM9FRwtlA=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4655440a91.6.1791889438271;
        Tue, 13 Oct 2026 04:03:58 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4655419a91.6.1791889437715;
        Tue, 13 Oct 2026 04:03:57 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:57 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:48 +0530
Subject: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=2717;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=7pVV9xmzq97y648MJ4HgkX/lIj1aZ5N3IOcjNF/uljM=;
 b=5a7Be2QWHLszRyLNCc4rOnS+d+oFdnXVWhSt3defns9MLGh1bkRINRPsYTg6llQt3UZl+niFu
 KNQXOAXm2i8As6UaKHEqq8USt8zWMr9WnncnDGClaWBE4+ERgJv1Udh
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX2bk6v4wNmiu+
 k+eL5y+3VcH93Wqx9hkRrgs0RQFNG/CQZNgUKQkedzRMm1gVQXE2iL0AO4CwqoalZQBUdGEbtjY
 f18IRKF0i4/OaXJnZAK0SA/FacahmXA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX+v1Unuu7JkHq
 Wsu4H73Mr/0vUJWXYPceOuF+1aCYNa9yWxuHb4kq6GVSKNUlit07+3P/0PYtsTTk0laMdUnbr2g
 98Lj4K8aum14lAu96iz+hAi0j/RGezaTwaLLjQCavyZ1tYcqzxbH6MnSmxvVEtvcUUVN9XxlE7w
 HO65mJh7CAXRpqOpH+yzhsatUqJLpsS47syQnjXnk9WEuaQKTXZLqWAggmFjAWzlEJOg75eHAw4
 CQhidflsf6rlk+5+vG1UfWWCimp1JxU1iCCgdZzTxlH2iUnrBbWG1jFGybzqANEYxKLtGaij54Q
 p5qE4t1Ts7hqb4U1caxn9WVKX7MIjBtg8oWEzreg3g3I9+9+AgJEEFAvdCAU4xIggp/puZpn7ec
 GMIg8YNYBBjzyNk89HflpXeYI3e262viM6/zEzmI0sNoq6Pb9BFk+fTXBaMGdVaay+qrHZCCKyF
 V2wLERinIIXwnoynPbA==
X-Proofpoint-ORIG-GUID: a9y-ZyYWmBWEn8RNWIFeJ1DQ_e6nqi7_
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace101f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: a9y-ZyYWmBWEn8RNWIFeJ1DQ_e6nqi7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
resource table from Kaanapali and the TPG resource table from
X1E80100.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5db7e12a6f86973df372c0428c15c286d9f7e60a..664237ad5ce60be64806c5386ce88ed2133f0552 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4381,6 +4381,19 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_hawi[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6086,6 +6099,17 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources hawi_resources = {
+	.version = CAMSS_HAWI,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
+	.icc_res = icc_res_hawi,
+	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6121,6 +6145,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,hawi-camss", .data = &hawi_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 0551211f7948190a7cc2a2e7971e6c549f92ff60..2b0990b95a1fbca8cbc06628223437c24bceb792 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_HAWI,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };

-- 
2.34.1


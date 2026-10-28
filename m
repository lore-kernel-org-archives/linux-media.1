Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200879;
	b=JwMVjYcEEFVt5Tl4jxul1YWuJcn806cUiyp9ZQreFIA7JRKwzotT2pdYaHidcU0hAYH+
	 5EjD7PuGATkl0xQMIUKRNDpNAti3i0jUl6Sal8CV0cxhoGO9pvx/cYu/DzI9CKBZ+uE7C
	 KihlMHtv7Dg9lZhHtTpt2xbORuZYkKE/zsxFkei9zyALDOsRKAL84srMut/yVJoqXymnc
	 IkKvv+JZgLQmkuekiyEGhaslnLKQphLi8L5z9xtP944S/ZUzsjKOlAKvt6+87yBSXMjwj
	 51IBMqhMygQozCh1EpllbgXAgJsHAX9g9d+NccDEoN4nMlr7EfTPaqkYgROscLO1SVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=Aq5h0MnNpnFdMHoUp5gR2g/i9CUxTYgsSK9bAE6hlZ6Wjz5YPUocdz2Q5CLEpE1gYXyU
	 VQaLF2llReskUU92AAMSh5IApj/qCPMXPhKhFN3nYYNJAg9CYSblDOR9dlivTCt1qlTLR
	 k3uPaeZtSGF2AUFby9epeU35qwdRupdbo4gHHOVQBsplp1GBK0yF8CdsuQpRtThAn3QQO
	 tk/s7CKeJUxiGjL+EW9ze/I7gbYLtIRlKJ3phDTpssbcG+zOPImhTeWabTMyQydPdBQrF
	 WlwiHrIauuawjNcPpBFb7iRn/vgh6YW+tL39hzNtxtGodVjq5NCnIzCjc5WwGcVOFEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A10606A32F
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A10606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAeds423530
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=F+NFIjQdS2yHtIq0
	XVAfqZLJkJbeyypfqPMoto3ULOCSYsonzYMFk1m7L6oggnOfJrOUO+VPx+Q45x2R
	gskrkkoQ/M3HYqIMW29inufC6KXCHsLz5SS9Uylp+NOcxoAKEujfpyZ+EBJxPRox
	glKj+vL6AcYOMWxplYAktVQHoHWWBPkT71PVgZNGt4w3o2UHmsb6Zxi/zlv3KYaX
	rfTaeUO14fiSwENsSIgvcpp2QbwXQ0DJWEskvLfJLc/kv9l8gPWUgVyDyWj60r/A
	qiytn6nF06/Cx3bWdTW01qYi7eSwYm5xs9CTC1fO4NWLtOV+NM1lpduM4EbQe0b2
	bxbaMQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1h1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c2db10b1so1845943d50.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200877; x=1793805677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=O2U8h9KzwXl3Drgf1Z0ZkiTDS9BR8I7evYrvg5H+08SJsHOF2uw+tg8wp9nOEa4Fg6
         zZw3Kd1EZItTfjPveXpTPlf90ug4smYK1+0DqtYtaWHxvGHWRD9/53XJzDh0w7DmHJ3w
         wXfQ4sAEAEDBW4l/dGGsftk/Sp5ZJdiyBY0AiZnsXr7l3H8wzIOUHILEMUp+hMzfkfDw
         tXoJoe2fMaeZZ0OjQZj+G8vIyteP44r8C/Efqhe4X9wG9yLYHmskKaL1oRazVdweGg78
         kkCOGPbv268cDge8jzjtuRspHxyl2bPSESr87gA+/nXBvnItizDc5f3g1RaDwvDTyuQ6
         E6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200877; x=1793805677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=gTUDjo0ni+iC+cwcktAdlYiFnhtEd21BHXESa7WSW3LqwR2sv8q1fuxJkEpMhXZh3K
         QQX0RohzIN8JOwf9nJ/dvDk6Se09ATKuQs52tgxeUFtjcDPnku9b90ToPElvJh3pau5l
         VN3sf47EYeB39sb0AhCFMaUxGbNkI7a8hVGD9nfbIJr9zkTXUjwU6mF+fsE9jPNNoRih
         jCMMX7SRqVwCyQLx+tU84Oa2kXCHw9pfLKONlG1ZiGSoFGx7Hq4fKcjDwJDXw9rmgSTU
         rn182Bd5glldRcPC0tkOR4fu9dJEZdBRaKx9cbngdMe16UeaBbFQowBXaoCXnGJTLJ1C
         lPyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAobqfueWya8SVl58x+F0PdtSG7CyE+YJOToFx6kCYPXA853+Vafk+xxD9ZjtCKxpR/1mWLR3RQcEK5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBmDQvGW4bSAJT2oArPMFuiYCW2sbhWJqHrILqzhqIUxfEVoRv
	KMHXkHN9SZ+ThpH4PS1Avgo4YwpVJXGbELszRqrcVJwGuTPrhv7GtPAK9ngyJzritt0E8IqDpMP
	vopsxs1a/nN5sBi6aoqzR/9vwaBL+mriHY0nzlJLT/mY13FSBOlwCXSq4k9dG5dcPRg==
X-Gm-Gg: AYBFou2MgSH2LPjKMuRWrfZIYjkQxXogR6b4KJNqHB242zGzoWQTusfO3r+S4hDENHN
	5LjsdSo/pCwOPHPl8UPd1+jskCPN6PxglJNLnYUoikEhh/j+uS1ul7IS3bSM/4y0WcCxNkbeRIR
	Suvl5FIro/CLH5ml4yesqQvI13eVP32vVrFCfl4GXGQlxTG7DrWDYcQdN0U7LFe9xBuhZmUFQBn
	dGhp7vgf2h880Q25/UxF6bntYaBvVX4p/n/hwSZ6v4k+TX+MU8KKki4whR7w9wEN2+h41hsogyP
	7ST6w4Lzsi1IY7Ya0kT9nX6Aco96vK7Dx/T/KrnklgMjzVZ8rt3+NrkxmKweempjmsvChhmqlZJ
	UiHlVsezMdXXJD+kbBHzDTWhaTpaE/NkodJc90+WL32E9Wzy9mbNtmIzaKc9T+LXk76BGgcG7Pv
	Jcr1yRbLsfxfWff0lLeCdXuhRR2MwKvsm2jUij3PiUl+pi1ZYxQ1j2JIpz3AVT
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313077d50.14.1793200876506;
        Wed, 28 Oct 2026 08:21:16 -0700 (PDT)
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313046d50.14.1793200875859;
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:40 -0700
Subject: [PATCH v23 06/15] media: qcom: camss: Add Kaanapali compatible
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-6-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: OYbtkZAOU_aWjp5Yib7S32oGmuPGt0ex
X-Proofpoint-ORIG-GUID: OYbtkZAOU_aWjp5Yib7S32oGmuPGt0ex
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae212ed cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1DyZDqzs5ZN9
 lDicet4NB5SUNYmCJg3MvdpGd3KIjDUH+i6FBCdpzr7z3rKALdIxzPM/TeyoA0+XhIpINBRPGvS
 k2l22OTCwYLbMg1xp6De/eaXicNcULTKbh4jtsNpAG35jUtj8w4Bd/ApmZoXjgISC1XXuR+ePzN
 A5o3Jicm2G5sJTtt/KNy9fgQEoxKesFw7C9PH1WDqE8A+pwnevL/eEJ1PuzRYQO+k0OGMjVRMwA
 PKlMoaVcF1t4bAWWfDOwa1k87jkKllWstmD1S3nsmGikvXORX6vnJuLj95w32M1DgvGItPWMGAM
 eSKFc4xIw+6f6v5h53vcQpyOKGoYZNv+jxfzuk+yoy7eQsIJagsRLhQcGExB6YV3YchtOWCI7ek
 DdE0iMr9y12TyqaDVJjCtGe8H3FJ0ZucL1R/gXrEvCP4P0Vx+ALbNMjx2FiJqJ1ljIxAqtAqx0e
 aUeA2U40zu1XolROyzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwaaQF5UecJMm
 zyKBHRBO6g0dt28uOku+9pp3fznfv6ecNpiX2r/9uFbTobMba1nbDVnUNS+J4Gf/D71V1hM+iHy
 pjYH2sM2KEUjAF+ytZfYGhc6EbYvCoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


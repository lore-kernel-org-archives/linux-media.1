Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548048;
	b=j4AhpXBcQyqBuq/jdqXvC2BtZlXpCLAfZdbzFbKqRMtfQQ0L7W9KeOR2WxL7L6+Kq8uv
	 tQ1jLiVViHlyXHm8zERXyQ7qGQ77iKPm/omorGLq7bcGbP+fxiXZ4I5P9Gb8PlU2qV3Ru
	 YY9ktcXbF94jX1gTA1BQJR/Lp0u1obw0QUQhWHEu/i36fOSs4fJLp44j1cVhpqpne4e6b
	 3Orb68pcXzqHNzju5c52J8KApOrmSrDVO6++gwgYr6timnik6L+Adc/F0SVRqA5skvwU+
	 A379TmqnVcb7HknFGRbrMSFQyL7aQdTbrAqXyhWmaIT85D92McUy/xTmDCRC+WWiJhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
	b=XAzYS+rtv82p1AxvBvcwvCyUHYszM+gk+/Pt9d/R6oFN/yWciXWo1aTD+IwsV7nNWxm6
	 2KfhrM4RM3VTDwiNihICVXXP833K3EO1R8X2NCgF3I/YEEM+NJrF+M+3nfJq5vOADf0jp
	 vUmn/ubdxmfvioR5GnnRpinDzwG4l0tUHPd++hidPe6H9Fj30MVR0qXdtHWFJ7tpaoQBU
	 9U8IzB3pNAYUKDQbUjRfeM3x6wowj9+QE8O7U+b9pciivZGEXK7Ngmo/239CANmQU9Yiv
	 5uYygxqAxxQCFLzn3cqIUZ6YNK5nGMbYWry/qL7nZ15IWJfkRsaB8RG1L4NmDia1V8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110860A3818
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C110860A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1PJah0C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iD5FFwrc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57j3N3284130
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=; b=p1PJah0CEtUdWkpN
	pnByS5I7/mOuo0ZDI7Hvsu9DOG9ukIw3sDDuisGuJmJ0cnM4HgLj3Uz5WEoJKEnv
	GOp3YF7YwlYQpjd6keOPySolviUmZojfgCQZoCWp9nvG+0r6ebEU90I4NiqEaWUo
	VclKAb4oPLBzEmQGClV7iZxVsDzP/IpkESkyhWShzyFpDcBQoeGAkrAtScuy/aAa
	3DiV9LnFZ8eUfihQM4CwIgrE1ioa88MpoZ7NTGbqQod8X+Io5FWSVdN0+2WsjlEb
	E0ulUCmKRoSfSyO3A25Hv8qdJwRdBzMmbL+b+c60cwV1WhIjFsplTXXVW2OXJCLz
	Jm49OA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37g3uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:06 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-466d41a1d9aso700334fac.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548046; x=1795152846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=iD5FFwrcAiO2yE0NTXbJTE1NZjsLivUxy4S5Ulmr95lYm/ybIwRoxS2QwH5UCkEgBp
         lEttrgmt9zI6Du6SzOZcXOEMgSJgi1BLnZTKKZ0NO3WbzlPKZcV0BkbKNEWNmjODsXw2
         jBsivLTlQa4N3rQl8XcdAlQoDv9OFcS3jaonoDCEPySNmeK1B7SK607ObxnJ5wR1S1zu
         Wk3qUOOZGj1cSPm+jqEUuAF+7SX+vRvdWx9taQqW3vSqPZvWLgE9Kino7W6cv0TMPaeE
         W0q4Uj6PsuLYClLR0YdLhVVRio1XODQpCPyq4g2ow8NYsitmHhpWAiG7A54XW/BfUVE7
         jqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548046; x=1795152846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtvmwMJ33RWSUNmE5I11asHiWXJILMh26kLEbzoo09E=;
        b=TuQ7GgYRrMteXE9qlcT9WgzvAiyzFThD3OBv0rjuRciNdn17BgmwwihC72gYkBIOVP
         cqPDtU/r6zGr3iKHq060VSZWjgStb/EIy3js/aOiDDz0oIoofme6qwbbCNAEKVK2S9vF
         ywyC+1uISfq/OBzpUkyXGHqoO9pryvjmOudgkqgIQQByQ29l/QXSgyJ4DfP+OEsi4Ss4
         sN0j3z3iNwCez1XXnUMgbhcvtlf83iGVT/mk4z505QtH0IHSqgzpShuJd5V1c7/z55It
         hSc1f5bA0FuYV5uyAOFxqc/CLSyuLjQ4aivXmIoamwGyabYojTlXphxb1RyG2g9eHH/r
         a7aw==
X-Forwarded-Encrypted: i=1; AL+hErH9U3jmNW1yiJqqb/sIoQCEIGni52w0SBrXqPXCH1IiCSuEps/YhjUJFqZMp+4PLnqYKNlSJxLS0VGAGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xW7vpjtbMbR+ES9tC+91diPTwBEb5fNucwcnygpdzN7H8aZ7d
	1jnWp7A3sSrmaIdvsPZTKuZJY55JI2APsrmxnApkWih0B6DZ8duWx+2KDufIeGMtGMS0PnxvxuJ
	iCR3PWjTILj9o7Q5AhuAcN7HPEovkBKhexzv3bGzO2gD/q0k4Awj58v2/fqgAB7EjMA==
X-Gm-Gg: AYBFou0kL+veuBP7vXkiE+oYUSLHnjqBwTpAzpXbVihwWXl94KqHx2W6XgJl6AUwRpH
	ZZKcIzgiJjlJjSypFf14PeEjpZw5Z9MCw5P+GRxhEoYfC02UCRPy5VxsBdc2J9yuGt+3/ctxwdl
	8n5kIajlnzP/8UdphhP6jkFDO7P8Pw+CJ73/21wUFl0ZSjH8eplMTzj9DoGBFS9ykeiKAVLOtnS
	zV3EKiEev+5DBK1Ab16pYKFFwfBvRbSt4C+VTzaPeoWumOIyCzvvP9VD8kRFwuNwAJOMMrNxkMu
	WM13IYQzh4ng/+hieFr2Fm23h24eCVcWj0UoZDzkJOGVmi8ivbeSf6bsTNdVBNEg5Wrk9us0XpC
	R8iCe5BT/zbXRcW5Etz7Ci1mh0ATqXPGf/s23UoNCINfvKVGvRWOiNr1t6Rylgu+1RANuUy6N1c
	0hxGDGypvHK5OGUdPpwZjjhYUwp4R3sw6mmMw73zM138OGfrmzT/26CsEN+Y/p
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673526fac.11.1794548045813;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
X-Received: by 2002:a05:6871:329c:b0:4ad:514d:b19c with SMTP id 586e51a60fabf-4afdf49294fmr1673501fac.11.1794548045271;
        Thu, 12 Nov 2026 21:34:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:38 -0800
Subject: [PATCH v25 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261112-kaanapali-camss-v25-6-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX8nUwlwlVOiSu
 fqWlCYUF0Cf09264/y4Y9TZDBZww4RrWX76Ax1Z9reT0TJsI9DocdsAcSKLsmRrN5DEJpMtQ3cn
 dEU9f41S9Hf4gyYwir6gEEBKdPaoRFg=
X-Proofpoint-ORIG-GUID: Cn4_wzZInGMBMY71lEcpS1mXURPWmV7i
X-Proofpoint-GUID: Cn4_wzZInGMBMY71lEcpS1mXURPWmV7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX5idd5dMVXo/u
 8LOJncwLalCdFxlIP8MGVn4JgzBdRxx2oYtFddINVtdfHREHQTklHIzDvXSX8LoNaYJHzJEL0xC
 Yo0+Ut5L0SCMfUXUSA6TnpECmvqF50xWevwLJHlsF2WgZUxMrdcCSVy42J/7GzE5j6NPHWAFpJw
 ZnCuNZ1r2buHbiqlbzt/2CsdrCDqLGI8zc1jB0RHy9MTRdAYPf03KwdCMJHauPEUDPLM9RohPHh
 iZvgmkXvSXOucnyOR0TrBx2oZxPFuO8LqvRuMH3U/91x0Lt6AsacYau3czf/sRLguyD1xSOnPj2
 Ks1XpC0pe2FPOrtU8Y2EMKuWBoIZLz9WAcuQHa+P9ig3hvjI/ROlDChh/SRv85cPGWTyxD4VfQ/
 XliOW35FPYs9WmpYLvk76TmhdopObQZx6kUYkLxDWxbmqjzOwMiXM/FLRxmpsffLv0BnwFbDsRl
 W5JmKGSbgYx7UTn+sRQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6a14e cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130021

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9521301ec972..cd6adf749c6f 100644
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
@@ -5585,6 +5599,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5819,6 +5843,7 @@ static const struct camss_resources x1e80100_resources = {
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


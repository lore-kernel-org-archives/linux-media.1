Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898254;
	b=kZ0giudLoku8rT5M1v3zn1sqxX3qEEdfjRKpjEf92iRYVBmT2XX5UubHKGaJBIvIaWTo
	 tj66KsoKxGstr40vSIJjIcwAc45psDw+2RgEk+oaEEMEd3XuOdra2do7U4uoSOwrHcT6Y
	 hzKYpht4qK8imbfVNkC2/0kA2hjBmvQe99R0gk4NTZ0+pQBttvbtgYhY9sKNEw8bCqSFj
	 pEGZC4Upck+CcWvU4xjDlBfLLd06DsanTnx6zfOmdGtAQWl1z0PQEJJpZM/7cFh6pD0xZ
	 scxmqnav+frdwa0Os9HaROd8t4uQmF/JEpLSU4XuFYfQMU3tWWjdpLinhlQ7Ywf92ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=ynBxYj5efpO5rRaw2wMIkSZUPrNu+V6o8SMudBgDz1H0f8XcanxaiL4G6fhD88pxD2J1
	 Zadz2xKzigfoSkTtxTwCoF2KR9/SFVRiFFFRXaHTQpyWd4t4KW6IjGzj/kq3Ar9eSM7Bd
	 MFzL1XCyZUVDnsac7lqYYG2vMiCTBI0XOtsTuQ3/Uwna69iDxPofxO7PSSWNQchwfJpdg
	 i7dhhZQQP7caAHB7400lXxQ2EVDMCJ1QHoMLiqoFv23NGWokIjW0F0Fp7boJZf2b9ha+i
	 9YuWbn92/qpF+PGW7RscmOvv6lJcqFbJOfm4uql1G5gMk1ZZ6m4RWkiA6KgyfYeLpIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC95C60A3833
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC95C60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P170Ws2777525
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=OZKWQNWT4TkvCQXu
	+v6UTayRUYUaMkXQmkbSbDWqK+TNtKBbvvsftYBZvd/c/CTbbzSxEDxo8ovKVgTw
	GQAUIjbvYpkRUdvhGanyv2HWgZyr/kihXxSzGKbAQEhY0y5k2o7FLs9gB4oEnhJw
	xgDx+Adf6Bzhs8D25EVRZmTlTPETsx0JGBpfEdv6Tf2rKEt/Tdp8a5cD35OyZusm
	hB3PXvaCOYxTGZKhHD1woYoV8NZ527iXj/r2xLFMH3U3ZZCcURSCXPh6W2cKzioY
	5A1Zvnu/dSBMN0HM9+tAtwD+nRTeJ0NpBN/mZMJXSzHQh0MLQ1IMCx5NcjZZlA7a
	1tu0rg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gjdhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so5507889eec.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898252; x=1793503052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=Bz1GBPXIjmW3XY6ajfoVctbb/tI91wsS/DkzodrC3ab9Il6wO2fQvwtuInPiAK5Ej0
         QI+uUUfe0eGLcDXEISHb4kk3dPoRS6mDMPyEjplXfotYtVWw//vc5/goXZQH7ewPcTLA
         h5wjsD+ohzSr+nFZafsUGTOO4pJ3fSoBwe/uAlyqfbKJ4UU7vFq/HGuwMU6ErBLQFAZ0
         ox51ZNZJ7+XE2lnVt0yCVV/Pt/rJGnUs5EHsSF1ltHjP/iS+P6y1BbzDVeU89jS/pkF9
         XAkbbS3OFXFQJKhM+6JhLJMbLUPCqhIFeXsq8zrUJ4SlWqq5NpniCAfrTsQKgBxg4mzD
         v+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898252; x=1793503052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=OV9c1xQfe9/RZi455Aa3DUGJUrUyP1mqcRy5fQQ/5yXuMLLy/NB8RzY/iiwceXITcz
         Lwqzsru8Uxhnxv4X+Or3x/1OqJYBHCARpsGAGwZG7sXAy3QqDdEq91GfzCK7hXmOQh7T
         4enHGhigZVAJgsh38n1nm/74fEXz2w2sKpgB0Be3Cl+7+7dLxCntZ+OQcCDG6a9hASvh
         Yxdx3+K8YbKgdYSjKXIjh6eAMZhUQgU3cQUyvjvKZe63P/I/FiVK8e6/Bot0sACDGT9+
         yHzwQL4tvq+n9JUKZm/ClIsa9oStxbLqVu+igNtQ5Q+gzWevTWGE9VYtOljw4SNDbFy/
         HxdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQNgv0TtlbaZqrLId7JrzxC2DQ9XRqktU06AT5DEnlkjpOAo++hI/90kdiNOkZZG8hE9MKmq9qtbxU6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2v/f++gQX4DzwNsCNNmDHU5IpQ4S/oNIkg2yOZtitvf8boTgy
	0pAXdtE5UaqxKjfE0RZ/BMCsyFRx/6OLDNY7hyBgEv5e+rOcMhMy7u3QduVLYURdYTnMG75erou
	QnxQjvwW6Oqh3D2q1jBx6YLHwrvn6i4hN5OhgbVYBkhaDbpePMIgfMmQCOrwY8nVdfw==
X-Gm-Gg: AYBFou0+bDscgZdvPiv8ezyUWbXhGTcpRpGj88bJkMU+FkHkBMkfE9vO+JNapz73RYF
	sUq3XUSSi5YXOqxAw1jX1cibb+mpS0qhOY4UnKit7XI5XpwAKausDxRuSpSOxemKBEa4p04vCP4
	tt/PH7lk4SpbWcgzr0KrCmeyKNDlKEvad/i8vJ7oOGntVWA2/C3twLID/pkHIEjE64PdX3jAwEy
	Y/SWFiLLetviSCMywKouTp5P3CtGRJuYe4lk1lDw8jHVwexzxRmSdHnAaHUbkDtbWXWca/Zl0fn
	Qs1PeUXa4fhw2Bl0/f6CySYG112+rN4wSXIA7yFt9e7f5yv+YoUxdThUaxyBeaFN66xLBAfyjb5
	IDNBteAB4TYfrO4nqHfJY4G+Yu+ZcSk7bnT1OUMsHC0FY7TVB78/DCfUy+L0Y8qH0YylkqQxZFc
	semc9/Iqgo1Q==
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734820eec.38.1792898251713;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734782eec.38.1792898251122;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:25 -0700
Subject: [PATCH v22 06/14] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261024-kaanapali-camss-v22-6-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CNRKxVpku6OJkEGzhINtnEXO6D3M-G5l
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6add74cd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CNRKxVpku6OJkEGzhINtnEXO6D3M-G5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXw12QpNl1s+Zn
 hC3tsY9YD1DjnKvGsKZReYei+tgrLXaTq1WHHdEGeRcsjaBNVYTU/JfNNAMPRwL9h8THt+QYID0
 Sca4AbNtz9elYcJajzXnVVf8yWwFu2hZiZRC0N9f3NP2fyIQiNg0lvwRgjr+/iG2VIhwRfRHvqO
 4h9w3twXOIil8QvpUrryEmoTSVSoBp2d8kQ2LmFRhcHzGC3sq1+/GbCwBSd4NysJjK2vWwg6Y6V
 kLPWbGg2NVqBE2t4yLdAiU7KtyndXiYWpJ0T5en+JypsIa/GtDz5gf3jNSLAvhHySmcuhI71xN0
 mZT4U+/pJJA1Qar+Ju6/qpKyEkcMjAsEPKEisVVIgj84b2BCK/oQVVdk7U11EYHEKh2zolk6Zwc
 ZOur4kZiWKZL7JkHJTjKwcRFoAyX9sLTXPvryl1tjamVb7XAnHpjH+x3mphUSfpbPLpzZ4mKrtG
 +lq6rvXhPsMaIc9/Bxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX6mzbjQkGqU7y
 JdIvLG29XHNP9JaubuITcSD0eDeS2uDCZ4Cvoee37fJrfh2OTg3FNhp7hRXZT+DqhrbAnSQ93fb
 xXjO7npDa3H1CxPQcyY1/YPz/5D6HFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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


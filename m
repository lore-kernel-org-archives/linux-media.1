Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293B53D5236
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443687; cv=none; b=Ml317MW+EsuKU4Bj8WU0Yk7+1UL5ZXChN0Wzoc1+Mt9MHZrllzxYisp7yHQaCmzA8Dd8xH83EFvLEIJDr8EwhA70NzOi4PEdjAKbOyurEMObcHDyJ7U3xTAJk4VuoYimOb6BT5G6tQOPgaKuJjSLtOvqmn3OXUDSiZFLJ5IoeLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443687; c=relaxed/simple;
	bh=E0zmJXyFB9UUyONFiiLDkEMYrqag5BkZ1/40aF+gQAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQbzeTsZ11WgeUzDmHQvLMZSXL/ochS57izllbD+j43p41o/lifhKsZInoGWqKzHNcd4JD04sS0iyMoiCVo/lIIfHXxE9IsFj8w7r+GLdocFkAVJF7nzQE31RGnh7qI/+25qhpDfrglx9IooQ8g225Qc0VdYHl7avd828tjzHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZJ+7ta9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnsfvUTI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZJ+7ta9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnsfvUTI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXPS1157823
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNL6a15I5wBe36MIfXOAoGfOtm+pc7vArSdX4fN0RvI=; b=EZJ+7ta9XGbk4vej
	GwDUd9M/5AKn1nKoAn1R9a2Uc+5h+Js8fGJyUodGD14MRRS5RYvfsTlOk83GL9Yi
	4IvH8jWZaei6HdvRg5KHCJ4jQhZD6b+2YbkCJWRlmkjNV+pi7ny1yBAyF1u9Lg00
	D9AF8kN/SOdC/b/w1HTy9/20SlFyOXVM7C8RLofUktL2IPs+C0ml0se8aPUOceUu
	31xpu4tR/8y+sjYoU54yWjnxVnTIlhAl0k4FL81hk74xSjwqrrvfSOWMgIgsuYw+
	uP/fRFJ6G9aNzd7SiIgsPvI4Ho2lTvXYjgMDkFZZVvAaOeLjLnQRMJu8sYKbtSRO
	oLdJ5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51nb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 07:14:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9465457eec.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443682; x=1792048482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNL6a15I5wBe36MIfXOAoGfOtm+pc7vArSdX4fN0RvI=;
        b=YnsfvUTIrhHNAI91KP9KgvTY829fw/NMwAwJ44i/yvsCmOA8dglDkqrxigGB2B9oT+
         ObtANFqO5STylQEjkOQceU+Ouq2JazODXHgUs+U0ZBZ7rDaIVLyqgbOMiTsluJ3aL9OH
         HVHxjlNhABMZEYbNK8oCwy4FxMSAILJSvKYLXrlzZgWJLiEPlGGGpdysUpY5A1kDlTUZ
         BULiOhyghmfLR5YYUpnlCpl7ym+EzC9jFZKWXZSEZPaMpvGGlXp1FcPMbM+s4U0e4xli
         TilJXVwS8/3iq0aM+FqWYi1Wuq2Rep445ZzQ+WxwCRIdacgPu+Xgws6gk2mnIKy4ZxZp
         fb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443682; x=1792048482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNL6a15I5wBe36MIfXOAoGfOtm+pc7vArSdX4fN0RvI=;
        b=2rWCHBJ9JELwuwMYLOUxgOHUb7pejnIutPd3+Hf79XoxncDWv2t11XDJ7urypz6mW9
         j5zfiRjXAo3BlhTx8q8pMq9Hx3FKEcViqEWM36iM4mVUl3uqjdnKRzALkPLqnIixe9Rk
         z/Ek8d89DorG/FU1MxA0saxJ95Dv+4Mum5RL4I1NIyAx0b52gQ57Ad9owoRGW2iHkSSO
         NTfOUvQIU1zAYa6OryOe8zb1XEZrBFUCF5xoddEOwNL+Ws3NF1hDIcHVb4K7tuauczEb
         ++WocsuipCtJG94ybeaa4FnIOTFlqJbscoRiq2vr4+wwySzntqConaF5PF28dnXSYcBm
         uNhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLFjlEhofSASj/JaP5Zw8yuSOeZ/ktUpqiVgamytmN+ZV63q1nMVNJI0tr0nG1LkFvgwdJCPEkLH2cCg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqNIZ2wkZ4h3tzr80DXP5svipRrQL3s5V6ufm2o1FEpX/A5+eD
	65/gdBsxdNzfNXISVZ7AZDxuVO1Rj4YtFRhUrYTe8hDKDhb3ksa+Doh4dyCd/aoXAfc/YbRSbz7
	+Bp7pBFHGFz6e+ei8WJMFBehORvP8/xy+6nDo8pSk3FIQEuIfXbaN0BJPGwECBETLMA==
X-Gm-Gg: AYBFou3Ojs6ibgAxTEa5t8Rl9VeqQJDkZ6l+b9n2GQyra/0uQEj3Bf7kZBdzKmGuBfc
	0Zfgm8QLsHajJhyfGrHyYu89TvHUV4xSH0IAeU8aEtOQEuiW3luqOT/onw5+zH7zYFEn8udl2vT
	Vw25xTAiyQiLtmzpS3WwMqnPD9RLgh78BnkEsHB59T0xytkDTvVBnvaZUe8RtmKpAvUbwTmfmV7
	0w/LGtpq9yfofEC5zLCjHktC8SH7Qu8VeDhc75Y9r4segCcxaJgLUiPTmgScXEr5ox7Qsxt6mKS
	9k9AmuqHuoXtO4XIemGfjFCIZzONEr3M70v+6H517SjCUQ2/yZ9puJjDBEq8hRxikeRyNLbelYg
	czkxrXxRhN2YXAmxi8cUuWjcofMb6TlgQ2Hn7FgJWiTcmW4s5sx7n22cuBu5ZxjebBJwrrZmkwB
	Db+qlSLfLk9g==
X-Received: by 2002:a05:7301:7a0a:b0:351:1230:5087 with SMTP id 5a478bee46e88-3515dd3322amr5642784eec.12.1791443682055;
        Thu, 08 Oct 2026 00:14:42 -0700 (PDT)
X-Received: by 2002:a05:7301:7a0a:b0:351:1230:5087 with SMTP id 5a478bee46e88-3515dd3322amr5642734eec.12.1791443681480;
        Thu, 08 Oct 2026 00:14:41 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:36 -0700
Subject: [PATCH v19 06/12] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-6-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZkB3rKNM398p2VcFs0dIBpLuyPSo-vRr
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac742e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX1icg4bGhBbCV
 56xFB5yOAJI7/M4c6nWZ9XbdVMo8hapP/0h1djnwfQ4uxfloO5vQCtC+RX4WWzfOYCX7xETAvjr
 iTNI/gfKrzPDjYlc1TbnCepxfIep950=
X-Proofpoint-GUID: ZkB3rKNM398p2VcFs0dIBpLuyPSo-vRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX58H2TOfRIKmM
 Irb0eQ0OOL8SdVBZyUxFCmpKrItKrp1GDIsPFcW86r6wqyUMbQktMVVfnxu4QpBXBQsMeFCAuGZ
 Gx282lfdMtii4sZKlxwZzesZ0+51ABtnUX38mH8CgOV6S5+fPajZzhVeUjiO0lEaDXG4ZNigkOa
 7wPe/vFaLgnv/WvbWqoSEazwfdDXpLK/Jj5BYUDJcZEb4QCHW9YyHoOjVRxulfGm597we1NFeBi
 1SEIYbwhBpse1NfAbvt61ydZUXGKsxpEd5XrSY506EnssWL9b/6nErfyKM/aYew51ExKRibkMTV
 ymhPuyQ2QBEXPiaHdqON59rVEZEIygZhXPKJHBzTASQVBmARi+JIUIIptiR6+HLyL++qcFJdQj0
 7Vxkvcu0OYSriGKWaCu6rKgz1F+4xpuuyAZRvU/gjRmjNoS6DUCigfpMxVEiyhIq1heronKCTH2
 6qdfq02PPBkfF+MsjPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fca3de214a92..eeceb79c1e86 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5593,8 +5638,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1


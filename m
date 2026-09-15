Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E2483BCD
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467024; cv=none; b=SVEBvM/Pbv2iF562LGKlAvl+oTNXItyB3uBmPu/eFQaUvOX0vorLUC8TbJ8LqP2ASjUf12MxBNs6um+aUapYm+wkYDMlqWzQkDXpFOLS5983N2aGfAdiyfKG3JrQwYvcKYkN5JHZz+lAitHEsx71y/SbucmPrO1/T1ol6g1O+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467024; c=relaxed/simple;
	bh=+gy7qeQtYG7KLJNc9m2TSuu1pefjS9CthP2TcgC/f4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mk9dv2+dzkkWmdVwq2mVoColjHt6RZAb1cCgjuW0d55MDZwoCNj4E4jtFJaBn6VB08pz7BzZehvPkrd/gqPKputU7r9hXnXq/PJpIUNfStdNVkhGWN+WEm6tQjxdbWEk1LrIcTWzAdUK8+8qOh6UkVsATkx+N197nKUDBUg+LKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp++6qcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmMXx8zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp++6qcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmMXx8zY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJlq2674910
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=; b=Xp++6qcC8Rh4hSV1
	TEra6U6r9Z5rtFLxYmoTYVHMN8r3FG8aFwEy+UOPKhB0hTsUm+iGB/K4d5XMaShL
	PinXg23ZBjrruU0K/Z/WLmJ5Oy6VjF0bYW8iPUFzcIouGwBQ5QdSi/7X125VlmNZ
	W009SG+V96Di1yItSHoyYjEnsK8r5iu533igKtgZ3xoLabPkHtM/jNkXHkuB8UlC
	eksSD1UNjo5X6XFxt+1bz7EGsjhfu8KAtDW/MkvOitBF0XJ2ZIU9q30uyICKzSMM
	OArAwtDWgQdicg9FBZlo01n1i/IaKCDTZOhk3wXDwzyn29Cg8+YZk9JSveFTd2Yl
	g2r9qw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye7187w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:20 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e4b52404so5301633a34.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467019; x=1790071819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=;
        b=cmMXx8zY0i/cZvEr2ebp4jsbkpyPG6rIQCdvMZnE4THiQSbH6/qJqckUi40BZun+pD
         2jsxe49OyIoumXPkIZyu6ETxD4AvdLnI9IxUHtWOk5BMszrMUuYIi5qFeWbCynZ9GxqU
         i73wPks/ZtOsnr5yoXJM6oAj4JiupQ/qCUSiFImatvoQsf5arF2TUFewO33xT3QylxUX
         6+uh1ptcYrlgbbErVbOkBjesWT+asWzrA+E1raP5PCI2K2FbhCuOQrH9u6SqtrKIuYwE
         sNWH9yq0L+7wgqGFRivXdcmo4JZ/irUVhldtlfToy0IaYcIvrEeUpl8LxCAmHcLoKbQn
         zk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467019; x=1790071819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=;
        b=XhPfEsKWvSIE0Lb5g8NanlMlL5XJB4zy6N7ZiuhjLOTv9MAhkAUVNWwVVYFPZhRJfU
         pCDeXTfhmJ5GzdBC3AmH1IR4z/B1QK28mzjsY25uCjeWIbtbbjcsFHSn6NLkP+uNtVRI
         M+DvBW0vzLPodrJ4BRR59hdwTDdVcyKF/+TSokD3S6jGP9zgg8JUgO8gION89AnT2GZZ
         71xU0cnq9rcgEx2840XMIYVS8bQ+M43HR0JVb7H+QKBGtotWnQiwcsqnwZ5EDzGkBlbb
         uicifRSM4IEZrT+TFDq3pjp1a7cWy9Qpvj5IfjeGXwdu47gMXDpY/7MHIDFuITZgfGyP
         EuvQ==
X-Forwarded-Encrypted: i=1; AKwUvByd/XrmHsMNSbES37FMeUqPnRKLlC6lKpCmoQ9HOwuj9TWq4DI3LodcFkbyn1EkjkIRoousz+Y3R6mGrw==@vger.kernel.org
X-Gm-Message-State: AFuF++kkQ9nOUxHABXCBDVE2AeSCyNkmUPPWeWfUVDllZ103u/9/U8TK
	ixjkChGPiEgD/jTq5SxCzVCvMl57YCj9hze3sjT6A7AwaF21pOs6nnrnjRyUpLwpniWewmmoWHA
	ybm6VQkWQtiA4VHSEZOo9jnZmiuG7j3cvWp85gD2ahQQhWtvkoJ4nZo3T59JPr9gbWQ==
X-Gm-Gg: AYBFou1kw31wOkuEybNUo0Pmo63AhS1zv3Yf52a1++bgX77Yeokb6h0nFdT66k2HDRW
	BpxoJuEgkMmWOKOVCq33AhKTxgDcjatUyE8fH/Xbuy03Py36ymKd6XpFZqzkij+y9P4jgFFuLjo
	DQqI3fjnkoi/JOxmBBgmdijA+Tzhnxim/+G3Hm29ygd76M9h0+6wckf4LJE9tusNeFiSmEhayPe
	CKjZXDAPEzcExnOG4wuKK3XhVIIJ2jY0ieTGGCgRYNJfY3GSxdaZSmJ5zRWR98NZGSRQgEPEj1e
	IVKWJeIu7xN3Q8AlXDm5xVD4IKaRorNY6PSkomYlty9qgWDToRnRPUTbbp5jcV6+GNuvrQHwnsl
	8BG0e5dCK3OnYveq3S7JS1wDHSfGVhL+U8bdQ68WzMMQpL7CQgbTq9vyXGzpScWeqSHoi8iJjxx
	LoFmMrLG00m84=
X-Received: by 2002:a05:6820:2909:b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6c53f9793eemr3779394eaf.17.1789467019380;
        Tue, 15 Sep 2026 03:10:19 -0700 (PDT)
X-Received: by 2002:a05:6820:2909:b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6c53f9793eemr3779357eaf.17.1789467018975;
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:00 -0700
Subject: [PATCH v16 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-5-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX8+VkIA8X9AhZ
 vqfkwPIWkpSse2Kg9pWEVdqVwooqlm7JcLjbUTML2+KGZe+eOhrmF4D7mcPdu1VNe5sVoYU0ejy
 KrFHZl96D3a2IYlawTuZ50adnuu9/V7x0+gWNKGnV5abxudxjEFyMlL0HPcBNww2gaXev07LtrG
 5lPHyP0fuL0g7B95PyM5yNZ65pw2uSDQFQ1iCEM34qDOsDAYF0qo+Y36DNAIy996/g+B/Vrm0MZ
 E3/lYtzinHxDfw8xAGhn4d+FVpJXQoy8Ue6tur7ECcTq7e5ykBOXmv0bNBVwlHvEQzK5qIZPBwy
 soM/tK+s1HF7UEegIKgLf6ciNiqPPXiyJjvgWMF6lZWKUw3t6B0PDERFN2bFIzGxgJi05SDK+KE
 oFHdYJaAxwyMjjSfCgJjwQ1+EpMGJdyisnGe8gJ3kQwYh7kM21jvT4ivI3/p2yLUfhgmDmkm4hg
 h6sJmK4uR3/iI6uDH1g==
X-Proofpoint-GUID: WwLvATVe2EZdDoPaXKVW3EX6cN6m8yXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfXwwaQ6gTD4f1I
 Iz4wWsbeyM1Mx6AKxcYiW+BuzGhUNw0Qq6/CLOW/ycUE3MAliJ18MTovfL7IEDgXRBuzEkEy1v2
 3GlCdt6mV+4/56Zz/Dr7+zaK4FbN7es=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa9198c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: WwLvATVe2EZdDoPaXKVW3EX6cN6m8yXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adding Kaanapali power domain and
register the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2c9f02bca809..0a79484ea1fe 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5613,8 +5664,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 4227f29ad1f6..b766e1ece660 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -441,6 +441,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1


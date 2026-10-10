Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BC4AB1C8
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648092; cv=none; b=XTdp80WLyw4pUAGV7r8Xaw64ddNPsrs4mUfIM3zyst5NQU1KcCZCTGk7OnjzwD/pslRb1P1LCug0EjYscuW6MZOykfskBjnslecZGRoHQvfYKQtvJisMcLff3ei9TfSsiz87exrl9mgMcHev/wN2UDAiV30T5Qy04YnxQmx+DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648092; c=relaxed/simple;
	bh=wSU6Udjuj/Df4gxF9Zw8yWhgp6GwwoUXpeQ92a8/zWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6i5A23lFf0j4xMB75GahPPAN7OaRpq2t9QgzLHQIpPaqZuPeK/0OY/Gg8um4ZnaAgkaaNxzxaqf42yEI3Wypjh4Como0Hx/PDS0rbQt+XdTP3t+CopXOnGfnVZ3or0ODw0jd+rpLB1tAFYy5Wj5/hYbYG8NiyVpr37aRdgfZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5O3Ol26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZqkq04M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5O3Ol26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZqkq04M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPQx21490010
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=; b=R5O3Ol26fhAVfWpZ
	spYmmS3PS+1exMl84vZ/yWNnDYzhbg9dJ+wAqisw2IpP/F3iQ9Aa4FBu6Vgt0fNY
	Q+tBA7oIjWgjWUrSDSPwVrPZY/zgZbRp4AIAKkVs+IjTvtugxdu3UGqnl5paQW69
	ZQLclx/6ZYvoWr7j7eRiKZpy6qz0kW/V/tIzgmds8VKsBP9dpSlXiD74Sklq8hYx
	KQDBJjPqdT8zYWLn/yH/ZktdDAfoC+upsH/J7RUbaiX+k2wPvfNjF17qZr9v7zTU
	wfeiwUqvoiox0Otl6EnquGKm3TitjzBs6AuROkQ6AGrGjXtHMBEpsACKQUpXXEjW
	eL1b1w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxheet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so3301666c88.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648089; x=1792252889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=;
        b=OZqkq04Mp6zMmOwMXQvpq9uuYfLLB8Mhwso0/z4SHL7XBmZIye/NrXW6jJzWFzzYOU
         fOt2hARkmTdRtcoEI8or0JQnHhzMwybxs34fxnlK8V1pcZGb2aeOviI6Xlt/74s21vJC
         NIp5IcWrUSBDI38z4TL2fp3EyUzd8RlqCrldP0vy20+o/j/bUQUFDEDD9umZsW25B/6E
         L/NzhuIWbZ0XkTXHcSjaRU49J30OrLF16Q+VS+qkurxzfWG+7ThkjGQgL33Ty/Iw4Frf
         ImRC8w/1cvLND7WZSE5mxUXPA+NCOs1iQA3IGUA1UjK7224QOvOzvGsJ58vX5s1LD3v3
         E43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648089; x=1792252889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=;
        b=vNG8VjuVWk8VHtFAeYKTCPpBmmBrondTuR7knS6XzSuGrlSsSy44aJVJmf0yi9WQ2v
         mTagOiqqQIpxz0vt5lGsGzfqtkZPQoL/kYkbqB2hqA5J5d6ZEkNTDqotv1FDLqJvxvT1
         a51Z218NrRBKnJfkuIz4p91oJb7yz+h1x11a7Rt2PTBhTKLzUTvbOGN15/VKfUk2F17B
         f9JzTsdzH6JsyjXCp55Kzyd+0L/f4shKWht+SeF8mHYf3AblU5c+Jx2d33ce58lREa1y
         uLQgmsYFHbxy6vwPWktE0KGCuLwIQLqAyh2Yex1c8AV8aAeK9nMu4tAIdBjWf2xNnDrc
         ffuw==
X-Forwarded-Encrypted: i=1; AKwUvBxtlvy1IlCRE9gz9CSdz6Sv8vvYpHewIW+Je86rmOEX0j88b4n3rym4FyG/cmAMvst6XTGwu/cT0+u6UQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIEru0yWHNIutIqG8DpD8ig0uoJ5cALGLcwb5BWroLI9cDQYfdQ
	7EqrUqMdbhBw1tkw1ZwmTZ4gnLE+MiFUlKYUvJ8ZjvMPc9SY8+hI+kaRPzYu84ttHqUopSPj8aa
	uN/05GfjHJA+Qp77RWoAE2FEpyl0dCrqrv/lpCpgM9zlF8MN7zbUuo8WApmSGl5MNyA==
X-Gm-Gg: AYBFou3Jy423q/sQCgFJuuK2Uf0xrmchfLiJj6wi9O9ErrvQ7mYm16guaOL1POnL2uk
	LhvucenBrCvNlBV9ZBK16LWb/tH0v98JS8Z9VIKZbqiFO9ua/rqvJYXR9nHIfptvWgTGclswNul
	etKTQTRFVRTGOBV8yuQhBa88pkDhbEKsmgi8LmboifcQ2LLTYFj1ArPjAIr0PVa9yAGhoglR79S
	PI5Pf9/I5Cnbo3HsftwSnaAj6v1TNafSgFF1dNvGFIA1mv0ppo1KUXQEikvyE4N3IJyPNMiyXD0
	X0s+YFFEp6xVENeqdHVnVH7iKyn+uMQy/vzXRYOjmQkadf3Q/Cj5c6PmVQunH/u6kBluDBw+FbN
	C0t0YIh4mBy80FEE0Eb+hbHYQQ2yhyluXmYTZI6K9yQgTei2vtrOOXV7fP/8BJQigWbjKWUYKDg
	kgPPlNo3JYfA==
X-Received: by 2002:a05:701b:2812:b0:14a:d8fe:33ae with SMTP id a92af1059eb24-16a6309ce56mr6040478c88.24.1791648088667;
        Sat, 10 Oct 2026 09:01:28 -0700 (PDT)
X-Received: by 2002:a05:701b:2812:b0:14a:d8fe:33ae with SMTP id a92af1059eb24-16a6309ce56mr6040419c88.24.1791648088020;
        Sat, 10 Oct 2026 09:01:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:11 -0700
Subject: [PATCH v20 06/13] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-6-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ndmRHkNbGNq_-Mik1ghu42pUrOA0gt_G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXywJrYMxAuIa1
 9+DYLdg5w5Y5s2/4nJVyhOEmTKM9tO9OvXtSIlMYjy/g9lpC1MtBPksZkjZrmThBtrXVWwfMauh
 3LlvioKmSm0Ki5g7sPb1wJH1YcL8rvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX41NFvAIGNlKU
 FQhIEgsaxXZpt531FctzNMGJPvhbP5x/Yd/yO7pQiLw0KUQqgfoFzSW/SEbYSfI1MFQHkYlLcpa
 H9ye+E/XnoK+hSlYkUM4ZsMeJkveqARDL6WKN6gxhCrFdES9nWewv4cuGwLtTsi6I7tcWvnrfY6
 NGCRzTZ8/7d6SEHNEiWEGJ76EBU07PQvIukadnHl9aEKnGIU/NVgHHytthzRyNJBO0SLScXi79f
 i+Wpg/WgdN7tbHbV0WhI9ub36/7VWTfrECIE3fL7h1JUDeD3YrVZUZm7BS5mHcRsr58S/eD7QVA
 yonlNkK/njlsQof8o10gaatDKySvDVFRdecejbO3DepT9dSL+AzqkSRuX5yxGvYHtNvdpwnGPBo
 gaGUnoq8AynxQxP5b9My/OLzJB9YWWIhuiWs1ZTAfYOVU4XPR4tSQ15x7nMg/Wq/ALZsmuG5mMZ
 VJDx0YcwlFrWCLk4p2w==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6aca6159 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ndmRHkNbGNq_-Mik1ghu42pUrOA0gt_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


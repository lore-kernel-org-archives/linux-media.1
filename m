Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1C3D3CF4
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443683; cv=none; b=jo6uK/Ylix5DDnxL4B1Y4diaqHQrsSDyYTR4I36Ai4dceQKP5rypcKvnj/fmBEcenL5jwbGrEdHz3ZI6KkuPn5UtXHU9QEfaHaWiyeVE3lK2l0vCB/FSbr+kq4yCRybBGkZqU9SzcYRQcJax36n25/kG6SA/wgiaT/ywMvOeCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443683; c=relaxed/simple;
	bh=F70tz/v0JBbm10RJQKh3JMQbaDiFcwC8IriM5NQ6opo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plpo+hyaUwCt+laPCyPDDOJy39QVhRMCEQJOraIucotSifXsEfX5vD1rv8sFUQEoil9MBiwA4S1BYl45PpdWzF4OBzT9ks2pH5BWUfINosN3XYguyppLnm6ux6xKaPSDeo60miEv8vwSZPUBEkGUcscLH4BhApmJOmC5MMDTZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUMCKkcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0TnvXQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUMCKkcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0TnvXQN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZrh313852
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 07:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=; b=mUMCKkcNXFL7fCeL
	RwhRLPeb8ZWNimL+zM3LrABwgEAip5t7eSL4/VuBrhrLsMs6twzO6Nv0tmT17YCi
	E7ykP19QCPX0G6GdG6ASoX9QdprqYtowU1Cv1MbK46SfqW7lay+/FnrnjhT9XdU8
	LjVqmcNloxOCDBfzPX4Brg9ue2/SkTMBzXwTuYe1OZvJER1dWWOosgOtxRjgeLZQ
	b1d6eCFunq5LuUBEE0olxs5Fsljl03RyMhO6QqebWXSyWUFEIdOvGskHmaofkHMF
	l/AU5RgxPGVAEGeJo0f4oGaqpRutathYdv9dhBn/6JR0Lb8c6ZJfuQiyOEI2Wuve
	LGBxug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31kjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 07:14:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so14346284eec.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443679; x=1792048479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=;
        b=Z0TnvXQNYk/fFXP3+1E9Hjt8Ydb396IpetuOukQ9e3OKxlSgF4/Zu2LMVAKuhfpQKF
         SGHD6F3grsOLhV2y/a7PZ/qQvK3WCYq26FeFj+cg/Tt5E+aTlbkDeSi18EyR5Gg51sEm
         WD3Z3CFn7T12Onq6eFwnHRiSwF6gLMPfgFFnj73gsxEkhBpyex9VB6Efdqwhj4Rp4a7r
         X1NSINBI21WJxqYqts79iDga9Q5+RikKJ1RFKpJE8yZBEEE7Sj5iMK1/gPjunpkPuZRw
         KR8LiQniHTo0uQn6bCGoqz917kgNI9EussAZUzZZAIseb7ALejLh9g+yE/24M7kVP+fR
         LqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443679; x=1792048479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=;
        b=oyLi4nv8+BIRYzuoj1Uudj0yemsceYk+sfEssY2ievUDtZY/HffpEB9RLbNxnmvHUf
         zNPyLeu5vBGjMQX9C42h1zT/fThMi+Wqrg3udDxGhk8ul84t39Ru5LbdiFTvIM/eS2sv
         SBIQlEEvcxqyG3sHg+adz+PSEkCEcHpFm4HkVD3Ztb5kQ0F2fSwfKKJtxWlk5dbZYjEh
         s5mloC/WUf46F3xxqKOlQJNhUqZdJXNQo2bJ6cRRa/oLxsF4ubuTbEt5N8aNXFxDv7QD
         bn5K3VZv9+xIKAPicuanzi4SG9L6iY4YtpZjxjQyRvap5f6V1OcoHNQR4ivFIwDIV3No
         iVdw==
X-Forwarded-Encrypted: i=1; AKwUvByHumyOTlpD4lvVvCGAsNv4I4MXGztGxOmHjwbGnvZzY77Lv6h+IUKVJMnPzJlnKyLpj7EeXJACQTcclg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+zkt1VMMK6Uq5tUk8H52ABouqAuo1NlM2criPYFuA3ob2LVV2
	1ymH8aCXe1ZE+hVBXHeWr0U/afrB3YMWOXnfi0rCYlDr0pVw7RW9p1PSmo0gV+lP+7oNAnPjyaa
	Fet7CPWUDidg5UCebKBYA0Wr71HeM2jD5RRxi4MKd13p1Ws+HEmxNEjtMNbtaxXyMkw==
X-Gm-Gg: AYBFou2yqaAxn43yBR0DsyFefFTtnTn9YrHkoq5q9Xz90kdXtG1NqqtG+txouNmECLC
	mzDGemEUIcDYjjv0jhSkDC5rlDNyjMT0EuPyLBxjUD1rC+0BxTt7XenshjOOunfekIT/NoJImRl
	qfiuh8owFZfzYeIH3p60Ta3tTSwZ2MqpYd6CAstLfsI4Q53D8akN9AxQ/7MwcW9sguwqeIMdfPZ
	n/9B8z8TV7+8ZPNsjEUJrV5Xfk+V/CBMyligeNP2MLQB1NOjge0n9ED5zDjeXrLFdqmm/eZHaA1
	xy/5lSwzCxoQEnrxDOfyC7WQ8ZZFMKIySNUANLb6u5Y7BGgkygE7bBObbBVvBUMjwCr4bqjW7yS
	0zWgT9Bt1F15G0FDl7spPwgoMnTX+bp1jVl2q3jGtWiEd260Twt5ZtigpJgk+PQ1SEbSd/yOvBN
	hw5g+Vm37P0Q==
X-Received: by 2002:a05:693c:20cc:10b0:351:7444:8bfd with SMTP id 5a478bee46e88-35174448cb7mr2791129eec.39.1791443679161;
        Thu, 08 Oct 2026 00:14:39 -0700 (PDT)
X-Received: by 2002:a05:693c:20cc:10b0:351:7444:8bfd with SMTP id 5a478bee46e88-35174448cb7mr2791111eec.39.1791443678651;
        Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:33 -0700
Subject: [PATCH v19 03/12] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-3-b2c583ef50e0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX1tnAVKjxN4x5
 gpsPokLmTT/PIuYbhcO45eGHzC+mIhP/2cqA874Fi7shuE2dX741LrKLpqz0hejvaSaleXH9NY7
 1M+2x24h4fgak5sv9EW6thTv0rUjo6bD3U2YYTTzQF+j1BwkCR1v/h0WCkzBtDAkSaDkZLYJpZs
 MLFj6c+YpfA87IzbFLBESwggYn6SpopD+pK+dtQfFDUybMEEj6YZ4PD4fdHzlbiWbp8R/iAqTO+
 pzvhiECb46fUIWK/33hapf+OQknmsf9WHytR5frlMd1JoaLVgWL6gXW2HlNJEZpJvntx7GRFZUK
 hgQFrSRCrVnh+x9lf6YQq5jtGPV8HXc8maYjNe0u3xpO0jLBRZw1vBw5kGcN5XbomVWN4kdckHm
 SMwiSYnUbDe6jyN2inVXLCVvtcMxoKqI1e3ja0sHu4tCVHrGfun0ycnPPejUkj9awgvB9SvSUba
 foEGwrGgnPUOpznbBEQ==
X-Proofpoint-ORIG-GUID: 0FkRf4AfmRfdcLMGuV8Mr3qI6HnPtt6T
X-Proofpoint-GUID: 0FkRf4AfmRfdcLMGuV8Mr3qI6HnPtt6T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXz69zBgW/MqXk
 yQbVjJJ1Mb2ZPnCQdPtYWSkbef2+AM+MEnXYne9ymM8GPKk3YTkHyew/CXe/NSUqVCx5xZLEksS
 jjWtZWfaR78w8zZgNUu3GxWmIV1dmLQ=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac742e0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

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
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
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


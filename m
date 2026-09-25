Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091B3655CC
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315350; cv=none; b=erQ8CIrg63+ajfDiLfG4YJmytfY4IsGWIk4sJTXaeN1lBKgSixt+Y62NpBGkVFmEyKscdhJWF+wQwTloSwV27F5GZJ+z9QI5+jP+2vBB7XqWdQrmvndPxkMwdm89mqYWeheCEF9O23HUUiSBk7xeEfgatZElaVjocDUvY7lvsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315350; c=relaxed/simple;
	bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf6lbu9A3lsVTha9n2qCl5nCQ3FHN7gg/lnXgT2ukeI+9Lqt11cyDf/nEZkQUlJybMc9ozHS4UJNVzoewcmc94QlBdzRVSKPcLdq6Qsza0fF/mijP8+JJmy8sSNL5Vi4+9Lo7M/R1XPgZC+1CeEQFGBkUMv5CneOZT2RMCSr1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXwCeuCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guKO3C9l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXwCeuCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guKO3C9l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JFl6757087
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=; b=eXwCeuClcwVrUfdF
	S0nc5Skriu2MiiHEAwlysFZLXobiLR3CEGgvCuhzexgGzgUT3wR+hOwFzOupyspl
	h5z+yyOsWmsZaJgWVT+8KbkF2m+IwEk6NPBJS6UOXDqJIJbqIEiszlMZ4ObmcDPa
	ztBnzc3SMhhci2C7hn3fMeWzu/P4dpoNbCRFspLTNNogo0ysHuwP1CXnJohCCRr+
	UUu4s3kTe8BcJoktM8HQdyCV33do1f9o7hK7TakaD2/JLlt7OdszjCS9ZwuuS1D3
	XGvkMKi5r1ezt1OkhCnsuzvwi2nPOTbkr+Q8Rz7qGj2p2KSq6N4MnGzHkXLBaf3T
	4+kqsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq082qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-338c2e27430so506341eec.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 22:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315347; x=1790920147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=guKO3C9lsnYG9DYFdmzOsjKLTSag34cn7bBiY1kqEQiITi5wXNyYu2SkINEiiKtOtX
         pcgwP5iGQQodXGJnUZ/o2hHeLQa8bwdssFLHDaO0e/AphSi55HNQakEus8uKHXK5Z0H2
         QCndEo9jtj38HTjeSTg+CrZqUVm+DE3ZlvZ+wo+YZ55gFbp+jUD2IM1MmgP689VnHnWn
         7sUuSHbFKKmbQ8SV14JpCqV9kTBuhHyGHMiBK2h2kzj8/WiPoSX2C+Aqvzx8f3VPaYF+
         sQQHgaU4jtI9eNo6lVNPIVu/AKto4PnzlF/8W9auIjxaE1lktBRZeZqvbdpmucrGu2pN
         eqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315347; x=1790920147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=F9HuhHCgonnhM+it8bpwYLJ7QWYl9iNoNzSdZXboqcaKmxv0QU2h0MpR4AVAwnqDhi
         c2cerei5T9p15J45cxX5O6UGdLHJG+H1zbm3rzFqLKphmAGw35XPBoKHK5dOSnE2vlB1
         gzuvqwoHJzx8Fu9umqLZ9cSsUwwa7E4Ibozjx8cP9rvAGvDIRTdMZ4N6VeK0LDeQQ5Lq
         2VziQ/sFKpLONtLWhgPm7tTBx2e5WGxlm8amWnzE7eZb5qCSPMmR3HPvl8W7bcwBFMPP
         7v7bNcZ1KtC+Mm2UvUq+cd0/9ZfXayBU7F3N0jPPNkx2UO4lo+JQ+2HgY4gljI3+Xq66
         6cPw==
X-Forwarded-Encrypted: i=1; AKwUvByVpsvlRkk8sJJk1GnXwmQmqDRI1rhvVoD/U8OcqyueBoZEK5SgeGX1SHFVZMRH42Dl51kCtL1kcUC/qA==@vger.kernel.org
X-Gm-Message-State: AFuF++mHG8sc4WKCYLGGj4VSN3qhMba8+0WqoNC6ESORMlwIK/xrO1Xn
	D7ZjYWRfmlx2bZFygP7nrYVnD7QLNOCWjEP7fUjb/lYAwc86SVcri/YfKLet5inTfzINNM7mTPE
	wb5UCw/umQ16Yp3nbqRYV7XBnWxevnITG8n1BGQ0CN3JPCc1s0ndhHYNFl4KVTbDFDQ==
X-Gm-Gg: AYBFou0DDTKrxtaTyRW1XvQN8Yud5U7a3GQEtpd1ES/gacZuBM9NIAs8Wx2hNwKyaal
	s4NByF1Vi/37fa0oGONQcmKjRKvgQD5g5qb37kqQYuMi6hTqRN/t6V17P6azgcDVCXd+hp/2yI2
	0i2u5vyjqSdsYVwrz6uEh+/lpkKhBj46JX/YUB5bmm4XAPFETYEPbr8jVc+biLujNtziNR2IUji
	8XXKLUp2hZeoUeA45p+3cSSYfzjC5b6+InwfTvRFV/SVIygV9sEWuOjQzb/Tkm99YxZp4wIBbSl
	w+VXn4xmLWC6iLeEHbeidvqxsHeE4lyvWsluT8ZAO3TW6jp+4iWrLL0lv6GssjpQqFe9fbZ4lvV
	tyS+56xVV38XFdw7DO/y5vGqzDvp0fYA=
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375345eec.21.1790315346199;
        Thu, 24 Sep 2026 22:49:06 -0700 (PDT)
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375266eec.21.1790315345128;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:45 +0530
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1088;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
 b=A5DUX7u+2gUNyMDWLrtc3eW8cxxncvqp/ZA2Ckcf7cb75bVTMAhx22/8ERa731bcbDqVnUqxF
 Y943m3d4OA8AzY5sZylsjF7ITkYLMRmu1NaHifyQ/JQISuSXYIFmgej
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXybH7vXcceyal
 o/WgRaW0vCLdAiUhXFZlJ4KwTZtONQLvwwXueztOTAALqOZ+oNxqc+NCk5UjL2nYlGwuw3gvwwY
 +aYOVDy2I7YhN9vcWT9YX+tvLJ6Asps=
X-Proofpoint-GUID: qJ4CKg0nYEu2rl1SKfyiNxzGE_KqCT6N
X-Proofpoint-ORIG-GUID: qJ4CKg0nYEu2rl1SKfyiNxzGE_KqCT6N
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab60b53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GarM_vGPpaxcprxHJuEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX8QAXsWwo11xR
 3ZAM9ttIidU/2n2B+EL4cXlhRN2DZws22CdFhV4EVI9HV+PYNyu44YB8Z8508Q9pZrkwKOdZGVI
 +z6RQQHusKFFh0Kdys2/BJnKOC9f8UFMSu1fmRw9Urlp6Yl6keZa0qC0BKr3jsDMi6RtWykju89
 ICt/GK+WLWkSoPrPNGnX12918ZoQSiNQnv8JlnvQQeMH1G8l23lqMUwmhKFAFLbJwTt3sT/dTwR
 MdUGv8kpMzWEfDR7rjlyANMxtfOgXXKRvJXX2G/AZSdq8T0XLw4Hy0k1f4AIQ4bRs7CQ8/EqM9+
 txrnI/Wb4Vi/SRdOMaRvBw3ojbaSIMINGhrXrS7oz64fxHPfM6gdfkkIt1CcNRKr3p56z7VHL09
 yJRsvvWyoLeUMzzIcMiTEAACH4ybvcoHZ/L0AgX7Yu5Bd86B5gqearoxCMic8JS4KIKNT2A1ykf
 Ov+GaGuhYFme+ITiVrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1


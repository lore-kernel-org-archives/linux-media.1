Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02214DD3D7
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646775; cv=none; b=ACTKd0jndqw0PPV1ZYzFTj+3Xm47e2xYe7z7GlYCsZu0TXGufi20xwsCN5zAg7pXXU50fPfVAmnNo/avzZBfl4xIdaU6831wfxwA6jWIIdukaBiPZPPu0RqgzEm6dVSdUCDNrldzdwjTHHLVaBUHAUaI3M0MBhFVDFEE7eiqNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646775; c=relaxed/simple;
	bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvPL5lU6/TXNfmKsBk9u36UW9kh1490SyfwFA0/7N2RMnuU3KIpSHgc/H85G1OHxki5LYM0ebQW4ZRjT6o/yttHCR65Oma1+dWxyGIbjy20AMgLJYIvb9xhc/PrYPfvhtgg5wgqlHnTdQ0/ar7o3VMKyuXeA38fLqV58OZqDz6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6BB9sbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEwIeu2A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6BB9sbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEwIeu2A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZnEd2210949
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=; b=H6BB9sbnO7VOarVM
	JyvJu9HR4dFUelkONDeSyz2/0SuVydHLIcQVsBw+w+sLzN6FIXG3VyKisjbic1Iu
	0iWBFTmGzzV8SjLlNpx9++uEh+ghnTsHUCgMQVnluz1Sut3W/AWcc/ktTTRIFhc3
	PtP2H0XAzwkYk2j0FNjERAZERTa05BXTKgOycQLaAxOGsnrEUBGTImAXT297PbsR
	v1Niona2413WsyelIiMeKMDo1tKU74uikSsLqiACGKT3QeVmfL3BJ/EIHdbGZJSK
	Z6Guyf+tokmxrIHQozZVk9EvPp/r6E6JEQtE9ifd+F1uiigZ21HcDuchH3m3KqHH
	E/AJXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m269r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:06:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so560183a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646763; x=1790251563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=iEwIeu2AzW5MZKbCsEmKtHkwm7Vszvx1+9la95zDFCZrUhbnW2fZ6MIZxWDdm6g8WV
         /y1pvSyPdeF31DfTzNkKXTmgw5qZSWuv9l2VlEtsEs1+ou4q2tkeVaKVAL4arKANewSG
         XL2iwg3DmcmDkMRVqlfnW8+D1gnsB2axFB1Y4fX0BGBDisA7aMFISmGoOUq5yHsjxmZp
         7h0Svq84ft3HX05LZrfuYKp1b+tf0pu8cvqhSsKknZxaXdP/j83i9/vantKa5+w85BIi
         vyqSHqegVSnzKK66hbelkfyT7+QfgFXZ/GFfaLqLVVV2wKOqLpBNTN1XKi4AB4LXjC7x
         XasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646763; x=1790251563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=fOE/HB7Y0yLwU+MPXKSdtBJpTcllHKQBhZqSOOve9yd+ItaXFYZWgWf05BtlXSVC+7
         qdfAUvU62q9kZwLGslecTskbYvsSU0q+RdXEaelNNKGKHVc0dN5kx7Xv7iuCoDiuwIAv
         To56IKRtWBF/LfYSC7BosroNstUMLk0OHtPIaP3dXtNEYJchXAjlVZi7mjlaJaFg74D9
         BrS4HQpYIHn8ZP5LEBsHvDYSgFI5c8dv/DcDaGxE3mWSpgaSLbKHKO3q1Y3YxghF6okt
         cdTzz8n1Vb3/R7cT4lPl4lz2veAPAw3/w+fkmH/wTGGBKNKISZhcCcapzSF5JvgfD4Zp
         n5gA==
X-Forwarded-Encrypted: i=1; AKwUvBwTcczx+1HeNXwSTDeDBENSxlzp862IhdRePNcttsAMhLKKMtc3c/5tV2or6ddzLf5pwrBetpVX1wE9Cg==@vger.kernel.org
X-Gm-Message-State: AFuF++m3OQ+JXE2b5Lnm3QV3gk5CZTCdaLkEk55n9njkQJ6DyzjzShQ8
	Qr5//W93WCrz0JAUZ691kPV/C++5+tjZ8FfcXKGq5sGbXYw0OsLxp7tyQxZ7fua1v8RL+GpfDpY
	aukLd7+3N3Xj9vlqvMAoaA9BypFVXz5H/CL+uRba3iaOC7WqE7XTRT29yXRtMCVDz8g==
X-Gm-Gg: AYBFou2GpjJ3CThhTKpH8PShjQa2PyK1RkOpBJy3ImvxtAUI6R+XBJj+tj/dc4KrH+f
	0NRYzkMHM13a7HbE2ESAb8qfamIQ2Vzlf9W0zCcC6T2LbRtB02Q8eu7WFlYSizX3A2vSLifCgG1
	o0nhI3JHBv04qbm1pHfgSIE1AtAxuoAk2/SMAeUB1FXJbbm3LIzfAWKTy+ugiDqm1eXLAwh+oo7
	eAZlGqvi3iOXJeRNQBTQxp3qsnZ1WXVmlSKmAlu1CzvnWmYMlf9GQ2TF0oso0AGiqAmL5YlK81+
	t0M13Yv5T+aX2h4ZnI8ylZQJxB7rPey2BZMrTXNCjeKJW4KtJkn5BMCWwaeFB44R5SyILc1E1tp
	ZWl2brH3CF9J0/Zmv2RR8iDMIgvUU5Q==
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454812a91.8.1789646762698;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454734a91.8.1789646762209;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:41 +0530
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-1-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1015;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
 b=Vp6CS+/Epro3msMsrHzNjpbJRpl0Dzqcy3rIa8rXwAaoIaTSovFc022WtbnFpqPXNDumH/kpK
 xVrA6iJTmv0DOaolFx4T1drOvYXTwLp4Ztaa5UbPhdFP+CvTy96jJTV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabd7ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TrU-ok46ffbKF8Cuv98A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: TilQN_s45L81hTI_m28nUM2vhGr8CvFf
X-Proofpoint-ORIG-GUID: TilQN_s45L81hTI_m28nUM2vhGr8CvFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfXyYTMOXjDTdLF
 f0KRLWw6weQ7f38cyytOV2yl+s+uHSyptHDIk9t1/alqYTXAm1e7Csc4zuB8+40zp3ki12EwNN3
 Lcrb18O5sQBz7ho6ri62hiMgeZeTWBwEN/exmV1zylV/yBfialK1EevcwR1oqOd7xJRNa2DCu1M
 ZdBRFuozTpOR1PVyPNMyEeFnffyLvZBMHtma0T0apiV7r38ioyZbqwma+J+gbR1urEELW3yKOXV
 IcA2GsaaodhGXi4krQgCECJaUKaJ8wZd2m3eAvZD1L84FiT3gLJsMIICVH+FfXHI2UK3HFP9sbx
 Jn7JQjhnRfXmNHZ7nN14x086RH5bk09vZBcuoIm8i5NCDYFmiwnB78NnDbiZnK/fGM/BL/pUDEV
 /IYatDn5yigWKf7DmifCQyUlQmzV8XHJe+jy4Fs0+I8i+NaCBvXnGCeVy7tTgXncI5Mk63GI3aT
 IWfrTVqy0yDH7bgOCPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX2WtHEXIbTWyg
 xgZ7Jmr6M7ty1GNAmtzYiDrGShKN7h78MNPHbfn+ASz5qLltXDbZwuOWGUI/gk+axpTeW6RuSfN
 Lgsrh6EtZYcTEQ1Rl2yBlmdsRnxv/CU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170169

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

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


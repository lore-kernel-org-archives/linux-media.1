Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCBB448BA4
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751462; cv=none; b=fS5N2cpa74Q0qxqEGhW3PPrs+ao9Q7w7oBwW/YHpwwILF5Lm9OYpBaDJxv4R2j1wgNlFAN9vv2vTXQXHDSsOyYSZK8qWEaUrvm42zLcCMD6uAuNsI647wGLXhhMoN5vKu91lPwGQVlwWQB4ohj/aRWMxgTCqM5cXAXv7PFkPk98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751462; c=relaxed/simple;
	bh=nUqbpyIAaXi6hS+BGNp2z1fpzLABA/dfQqUEyCPgVkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g+ZlQqyRstL1WvAUaDaSGDdpXzNJCS7Lr6i/qIiEmfJ8eNVkCswMNN0gJoeKKzHf9jbNGTOxOOaa//wG7QwYS2teBOgwbRsyn5pVjHnaYKDxquUi76PldzFdcL4E/y2qvX7DXs6qbNnqy1Huzm2Nd2liWAXKMVoO2+qPSAa2SgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/Rel+4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrtr9Rn4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/Rel+4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrtr9Rn4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6pVuQ3380913
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 06:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bCq9VU953h/VksJhmq54HO
	kDRYMxMdtMzLKUAskfJsI=; b=n/Rel+4BmxgVSxuZBpsc9TepxZhntZGaSTaZLh
	qOcpr7nCRYuAzXu+gZ3/xVTebL+zSRK3/p8eXRWHZttH3PDgLjpbLD6n3z0f6EFs
	h8kf1Sx7jG7U202tjyHW2uhXi6tQeVjaKKZ9CO4wdpSQy+Fx/Xw6NsKiRA0X4tCE
	KL+28JgyGMCJepZ8a6O/6saKfXQ+UOsG7RNl971jyAgqmVye+5xU+4I9X7w0SHK5
	cOaSD88huCyxK8gCkTRHvuJeb7GaMezIYiszEuvPdlq6/xxmLOgbMDHVX5hZvUwr
	2qQOQ4q+MT6w+nkuug7jyxN6hcVGcKZ/kDucy34G9fmwtPZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97ttk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 06:57:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so528099985a.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790751450; x=1791356250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCq9VU953h/VksJhmq54HOkDRYMxMdtMzLKUAskfJsI=;
        b=jrtr9Rn4Of3cFRuCtVvMwSZilFPyPu9sOPWS5FiNeXnP1i7Mmh1bBUseSspt0Vz1Kx
         pcHCnUolfvvUZaUUtdONGosJxINX8n2t9RjGfgFhVcCyozPCNmTgG49us4eXvxz3YDbu
         ftxRvH+Y6g00HO3dloM4DP2FIxHSWOL9RrFw/sXxOwm+/Hheu6zl7ezMzLpDGXszWsdM
         7ZPKYD4+tZMjMo0anupBUdHFtUIcceIJH8uc9Oyp/O9jzA/w6zflOizjpBaq83HFcGbZ
         XbppHw/5zFrv3SFjhxG3Dt4eTfsmS2tetoejRFDeHw8/JOe3qmH0yA/iTBQbE/rBJC3B
         qLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751450; x=1791356250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bCq9VU953h/VksJhmq54HOkDRYMxMdtMzLKUAskfJsI=;
        b=2uiNkoZrJ0yTHggoN5+YkiEg5B8mQxdZClrBSQwVPMGPnuArXraHiI26nnM0WnSMqZ
         XIHXUKP2JKWkjIoEvPWD1ZGAgKycrg6lmASWB0i9Vu0aF7D93wg7pPdJoecLSDouFgIJ
         xOkLdB5haBocbMZVWI7Ttgcm8AiruDAHuSsKZQmbatTeE6Ym5FNtqHbGNdP7tnjd5Yot
         aSTUSLREnxqCdsu0isnt6wMXZF0heOA6DCd9I2UcW+uNbFaFPFhI1vbfJl4iFI6hjteC
         0kLHfrlKtKgX7CQoPC72jI3trvCZ0NgjeuBvMISq07rjWN0/2baFAHujcygK6Gvmtavz
         4M+A==
X-Forwarded-Encrypted: i=1; AKwUvBz9WcJ4o8N25mrJHoKBoyOfVeQ112GcItNE47R1eYUeVGu3I6M6yIUIrMbWdHdKPbjsi2WUnfd+C6M7iA==@vger.kernel.org
X-Gm-Message-State: AFuF++k6dnktKY+KV1BJdKF6i8nsFcP74LP4GC6q3uEeSzfj1CPnJK3b
	rsAlNHF5qHi7V1/7Y6jbTHv5UhGhgxA/3lnZ86aMlRhoTN0gwXKu/1KWzWRxrL5pETWK4pj53wj
	G+WygkpxEvLtcBOffUnTpalG/VrGwK2Ptkp//y0N2tURE9jHSia7QW+AvlKP026wN3w==
X-Gm-Gg: AYBFou1RiaPidi1vkzx45NU4mtIGMLP+WytDuRKkRj7lLJWyiVW4gDdIFfaNQVceHwt
	QZh7YnEKNcNJplclJcwyiumdsGKzjk9AKafGcBGJSkEejwcVJqaI0YskdPHHgDnsOoUntpieyQI
	LuVS2aCJBiESy63a/fpgYSotdx2t4hDijWRdipPkqWjKzHTKxdVJVkJCoLcncNSc+dCxohcGSNI
	O8oHtmnwJrNxnagu3ouLGcxroUr1TpXryFuWdzW8mV/Xt6NtrbJnEaFfpaIjEe2zSakmqQ7ZC8y
	7uS1r/6nCOWWzQzIY98QcnZx2jasvJQTDCpRxEjM8/LFdrnIclGRKvjXTgOWGufghB/IAyxUHCv
	engjH28APQ0xkjepFnuOAJ6gir3m2+eW5WpEFgwSowzultL48sUp6clHUdaeYwOf87MVp
X-Received: by 2002:a05:620a:178e:b0:93b:d7a2:dd25 with SMTP id af79cd13be357-93ca979a11fmr60702985a.53.1790751449058;
        Tue, 29 Sep 2026 23:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93b:d7a2:dd25 with SMTP id af79cd13be357-93ca979a11fmr60699685a.53.1790751448522;
        Tue, 29 Sep 2026 23:57:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82cabcesm51534785a.27.2026.09.29.23.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:57:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: camss: add support for purwa platform
Date: Wed, 30 Sep 2026 14:57:15 +0800
Message-Id: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuyvGoC/23N0QqCMBQG4FeRXTfZlrrZVe8REXMec5BON12F+
 O5NC0To5sD/H853JuTAanDoFE3IgtdOmzaE4yFCqpbtHbAuQ0aMsIwkJMfdaJ/ypmTjHE54ygU
 vBAeaoHDRWaj0a9Uu12+20I8BHbay1m4w9r1+9HRpfzglO9xTTDBAqaqszEsBcDbOxf0oH8o0T
 RwGWjjPNiKldE+wQLCwELLIKcvUH2Ke5w98adouBQEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751443; l=1651;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=nUqbpyIAaXi6hS+BGNp2z1fpzLABA/dfQqUEyCPgVkY=;
 b=C2t7y2fwylqsKdfwhSRECNpKLzvqY9dRIdrelYmKklwKCPFKyYN+aUNCkcSF9sMEzyiUy0CZj
 YbfNQ1e92BgCJzyomZu2XkxGkrqt24KpQnz/rTdxzhneE+mex6aapEV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 0ifjJBO3kz6pzQYbWBvoYZOBHrfw9MiS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX45yayVklq5K3
 GKR2eGx8fE+hLvKKVpraA4izSnze9K7/Py3DnnLGBcgQ9neBbs6LDP4nwvy9YAv5xvDyic2gYwj
 CSa04DCw/01ZSPcZxQARNaTn9Dv4Jep2dCiGAuPW9YFnmsvVSxaNgBHBTQSQ0nO6hAEDQ83KT/w
 /LuFYD2pe/xsNJA0jG5V8ktP7sedJTCU58cIlHuR7fZBt9HNVlsG4MY+N+GhFyE8QwlfJIs4sMU
 WLlkmUA9V7RSoL5ksYCS5htTFFqUI+CCfOA8Qtn3fqhm0wAKwtQKjvf4d+2/0DtQttmTclBJAt8
 HYoznr4AdtZXdcqBLYMaNCEnFMeguNlxSIrGzmZx/kcvbaPfwZCXAN0ubgHBbthIupvEwX+PxL9
 dTBCg2M7sV2+dpBpuyNfYvaEQuJULiJs1thQ3TgxXWEImh0ccpTSw89UeeJ06m561ndWqtJt744
 aRC4N8aWaHPW8MBABEQ==
X-Proofpoint-ORIG-GUID: 0ifjJBO3kz6pzQYbWBvoYZOBHrfw9MiS
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcb2da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3JxAi99mYFQkvmeL7t8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfXzuLEDPkZqepd
 gSO+jn4Iyx03wDIiNawfNcDLd5HysttxKMMhOhtuoQjF26K67b8wYq+xJteUoT5KzlgvIJgmgqO
 9HcJAc35kAMmHYfzknQlORWVYVFS2Y0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300027

This series adds camss support for purwa platform.

This series is based on Bryan's camss-next branch, which contains the
CAMSS PHY API support it depends on:
https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

Validated on the Purwa EVK with the OG0VA1B sensor. The DTS and sensor
patches will be sent separately.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v3:
- Rebase on camss-next and switch the CSIPHYs to the PHY API.
- Drop the CSIPHY 3ph-1-0 changes, not used in PHY API mode.
- Reduce the vfe_lite0/1 register size to 0x1000 (TOP + BUS_WR).
- Drop the DTS patches from this series, to be sent separately.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk.
- Extend the register block of the VFE.
- Add comments for IOMMU.
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 216 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 482 insertions(+)
---
base-commit: f511aa489480f1ae40dd336db9fa91d7950ee586
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779853;
	b=STqpum4onBwnD1M0L+VRdU5+VHNz05Tt7w4Is0LonVX1qzyk9Y4fhrwvQB8ODwQ52bDn
	 PKRjNnF5kzfykkgThrS+a6rN+Xki/60IReuALJZOzxikWraH2eOyDw6tWf1KUbZOpSULT
	 Ypoc+Z9X7Jr215HqomVMSgHP7LOqVMtTax5JZMn9XZtpF4BE4ljcjB7xqt/4P/R2pFs+w
	 UZgjHzTZPMaLkeVrokmJ4BhYjY8/9VDmBt7bk3We6eERP8cta4eDsOM1V/9QF5U0wFHwP
	 iIcgQHqAAG6ceEeZ50xuKsfG60ijKMEd8YO0f6W4BIFmgs6WkDOphWyArp6qz9y4Ftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GrrAfIHYgJUF0D4AiV8HW7HVoHwZ6VNKntL3Dly9tL4=;
	b=zlQJCvVNP4Qivh01monDPhQbmPbFW8du37llCx4DM3yrysnRoNMxu2pRMB2fKHpsy30x
	 I2IXUEW3N9Lp52A4fjl3n1xUL/JTbrwOo+N03S52TP53Cb2NDXYJ3t2QkxLOSyziLQCQA
	 F7tcpE9Xgf4RAMrTuPOGhAs6D49GmQhAcVCPVhRXIE6t339wsmTJ2MEB1AKVazcxgpHF8
	 sUtNgRfJS+TBRgYpAlfSj0HAvfu5j22e4fWf8ZwJUikOdYSKC6IYAKzCswX+4Hv+LZdIl
	 fZJdoVKMsyxSXUzsf1f3MOe3NilWCggC+zqocf5IdIDl1xSAmjK8JrRJF/xUUIaI4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogUmm2X5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fovCt4gB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89143606A31F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89143606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogUmm2X5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fovCt4gB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYY62058128
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GrrAfIHYgJUF0D4AiV8HW7
	HVoHwZ6VNKntL3Dly9tL4=; b=ogUmm2X5ySEL/FSVPUOCvU22fg1p0LaYRyc2jF
	79QJurlRiv1dzjlj8zJxj5C077PUf0KxfKFumpyiJh36lz3jqa+rILxoilfPVk4A
	flPij4KmpyAKFI8k/TC7NJ8daX4XL9V7Lw5DvWaqYmL524YFlP92TQGA/AOqTycF
	I3oa/R79QzZMcascDw1WZruwTc9xRmraXLh3NfU4VdcseYGXUL2svvEX8/UtIqQQ
	641gWZg3KD6mJPt6hHoxfmxk1qHdbgCd3QrVRbFlP26yFD0UtPdVWxREIwbXq52z
	RcPwr6cuSzoHhFHtlYe7kmS1no7En+0MTw1xPnavsRkiBhDQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas95v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso3722564a12.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779850; x=1796384650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GrrAfIHYgJUF0D4AiV8HW7HVoHwZ6VNKntL3Dly9tL4=;
        b=fovCt4gBDtW7lv6hkGhe3WybuJ53K4Esm7euGPMWHlQpHyoC1GHoIjuFeLPdTkJGCr
         FfJAO6OArsuyhcCfcDANpMKTEv8cYnatlQIJFLnCR8lsNGVjVwqiG6gWk6oQ5lBUM7Kn
         gIDVOXbyuzJv9FzblroyjYaafDGcAgm61BxgWX0Q7WcoYIfYbFcglIky3FSfRKiwWjEL
         A8Or6IpywwVTw7J2/9lE1HuLx+hnP6P7qTkbV2QhlquIxcaSuBgkXs14podTb6nYfl9t
         Hsk5j7L1RucIv34SKmuQOQnUUvRc/yqPfzJvnNH2BP6qMkAl17ElPGLEQE//qXEvYZnQ
         c3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779850; x=1796384650;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GrrAfIHYgJUF0D4AiV8HW7HVoHwZ6VNKntL3Dly9tL4=;
        b=rEMJMEE6HOR6zfJEhu0isszE68MQIKBwAfonnNmfvMVvQaPyWyGA05IGrG0NuDUyXI
         wIVxyQZQsmsp4wv3w6fmHCW90IRM0h4Y+KXHyFywiB1WAYDUcB7acAz/cWOD0nXtBXMO
         4q4mHmkt2uC2p+XvnQC/A9QjUl6sPyOxcpXF4Pe8Tx4UCRnlbllHB4M99gJQQk4g01QT
         Nw5Dx9JVTwvIorAU1QnYt3ZJPTUw9oqD5tKElaUKEu6FUQLZNvNTyHzT6bazFJTLw5hM
         lp0v+uJvBRae3wB+wry1AOvtUyoN1u4tEKG3hBi1npiT/VkegtV2BtHR83/MUa9QDWsK
         HnpQ==
X-Forwarded-Encrypted: i=1; AL+hErG2enB4LiiaNrGHiqw+Hw5o1/HQQbkTASiDnexaPzZ8AJW5qstBXJWhmacI8NAzbFAvJbt852gIRzzrUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IDNMV+gNWVJj82UKhPBILKAdxn9IQHr/KrFTy6u5MJ9YUDBta
	rzmJrLuHH3J77s4MgA3ixABLuYzC5JNfsvlpKzqdQAS6dFPSHUVnoliLg2JbzmSwGpPgOv9IK38
	gnIXcnuO1f2vMuWCH6Bt+Go7ceV3lyeA3W7oT08IxzPnadyFDzMTycsqO7agGp+th7cAvgg91ZQ
	==
X-Gm-Gg: AZFdTZdNOPtAZp83FGWOuxCg1zEJBiod26Fe6k4mPCLU4Jsw+A3WwZd4tRxylDq3zJ9
	kfJb4tjf+iNIY0EjlVejlavQrLu7VixOSmJ8VACTqYSbvbjiT3z9U+R4vJmjF+1ClF1vwYzGdzW
	ca798Ccksd2+E6Py0joFpMTsaF+8/qS9rahPo/EpbFwo0NpnOYQU1xX8LwnjvJqDz9+p1V+p5ZB
	fiEDfJBwfKfh4OZep64sNYgVb21vdlYFuov6L08dR6v8pctGsvAALQlloyMpGZreVAJYMJ4171o
	W0i02P8Y7X6ibXV56tRY6YJdt84xr1N3wgO6Mx5ka9piMinFRc01nTkW8/lAHPNF34dp87mcX4e
	W9FvV9KBR6TeXOiJd7P0jyltnwWsM5VnOwwddgEcuD1rLdz84uo0/tOMdYfm+QJQ5nU6UEXAAe0
	Ik227I
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b41c7b56bemr21726929a91.8.1795779850213;
        Fri, 27 Nov 2026 03:44:10 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b41c7b56bemr21726893a91.8.1795779849640;
        Fri, 27 Nov 2026 03:44:09 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:09 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v6 0/3] Add Qualcomm Hawi I2C CCI and Hawi/Maili CSI-2 PHY
 support
Date: Fri, 27 Nov 2026 17:14:00 +0530
Message-Id: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAABtCWsC/33RwW7DIAwG4FepOI8KDIRkp73H1AMYsyA1zQptu
 qnKu49209ZDsoul35I/H/4rK5QTFfa8ubJMUyppPNTQPG0Y9u7wRjyFmhkIaEQHivfukvjg0j5
 xdEMp3JuAWjkhKACrZ++ZYvq4k6+7mvtUTmP+vH+Y5G37DzZJLjh67zWQUZriy1jK9nh2exyHY
 VsHu5kT/DpSyCUHqhOxUwAQXNvhiqMeHCUWHFWdzmrw6FqkCCuO/nOkaBYcXZ1goEXrbGe9XnH
 MgwNmwTHVkbpV3samDUgLzvxdQqbjudZ5+mlinr8AydxFxOwBAAA=
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=5448;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yP0v7eupkcwkB0CGdGIJuJoQQiR5R20IpoAUfDVaZzE=;
 b=T83UCr3n9oR1diPm41eqpqbPuLB9cGAnt/l7KPdMWf/R6xkc+WsAiN8l8PtQhNptgpracncRj
 0VUmb3KWCruC6XnN4uNfuKpjyW5k33spdqOK8UPWGKBndSFDfgIMN1Q
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 3WI8jvCnVaAclXhMGfFr-R3v3Wq1Gm-B
X-Proofpoint-GUID: 3WI8jvCnVaAclXhMGfFr-R3v3Wq1Gm-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/GCa/lvA92GS
 pzwAkLBZQqHI/XrCT3tCtbycZOKUUxVIkbPox4noImTfRj9eKY8sXf0sa+w16BvWQ7L4pdES570
 1Z6gV6EoyV6+SMF1abSvuo55CpTi76XwTgpXk3ni3WRDR7QDeYLXfniuHkgytzeT1TSG2HlUyV/
 B9ubA8SBHLc3Fnrio86q9yihvtyl/4HD2vDtbsvDp3m424UulkKZJgPtDV36WUuw7zWEUtansby
 2YTmf8z2yVtun1mWTX3EAf18c6+T3KlvaSYnQh6ZFEF59qrps0ZqmhuBxkJ+9IFLIQlQNXD4KYG
 S+6r33dEEm7fTTfV3wKkwJPScCeeN1hA29bEWg21nhP2gJJ1G1Xvr0EEfZSEvmiekifen+8yPht
 F1uAu7dz6YPAyZmXgpQkpd4EY5+9McoL/ZezG7TlJXN1U1S/RJTtWItHxrvuCZXWL4WxyiTdIs6
 L2i+6mT9kQMwVqqDnNg==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096d0b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MdiNbCTM_Z-SUpbbCTEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXzH7id1sRB1QF
 Vbm6eniKTKeZw1o83p1cErvizUgL4clTUnRepgT8bJO5V1uPaKYeNkREfLT1R+j9B3lmDy8Hif9
 0KhJQJ1sCt6iob5Lu411JHYT78CB4EA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds the I2C CCI binding for Qualcomm Hawi and CSI-2 PHY
support for Qualcomm Hawi and Maili.

This is a continuation of the previous combined CAMSS series, now split by
subsystem. This series carries only the I2C CCI binding and CSI-2 PHY
patches, which do not depend on the Kaanapali/KNP CAMSS media patches.

The CAMSS/media patches from the previous series will be posted separately
against the media tree where the required KNP CAMSS prerequisites are present.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=phy/qcom,x1e80100-csi2-phy.yaml dt_binding_check

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[3] phy: qcom-mipi-csi2: Add Hawi support

CAMSS changes will be posted separately because they depend on Kaanapali
media patches.

---
Changes in v6:
- Renamed Hawi lane register table to lane_regs_hawi_dphy - Konrad
- Link to v5: https://lore.kernel.org/r/20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com

Changes in v5:
- Fix correct patch history in commits - Krzysztof
- Rebased on next-20261124
- Split the I2C/PHY patches out from the CAMSS/media patches.
- Drop the Kaanapali CAMSS media dependency for this I2C/PHY series.
- No functional changes in the I2C/PHY patches since v4.
- Collected Wolfram Sang RB
- CAMSS changes will be posted separately because they depend on Kaanapali
  media patches.
- Link to v4: https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Changes in v4:
- Rebase on next-20261104
- Collected Krzysztof, Loic RB's tags
- Added Loic patch to Scale the CSID clocks with the CSI-2 link rate
- Use 8775p TPG resources instead of x1e resources
- Align tpgX and csiphy_rx clock names with the 8775p platform - Vladimir
- Remove redundant CSIPHY resource definitions by introducing
  compatible-specific code and keeping .csiphy_num instead in the
  resource list to denotes the CSIPHY number - Vladimir
- Example Address should match your first reg addr in Hawi bindings - Loic
- Link to v3: https://lore.kernel.org/r/20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com

Changes in v3:
- Rebase on next-20261029
- Squash Hawi and Maili CAMSS binding as a whole - Krzysztof
- Add description for IFE and IFE_LITE IOMMU in CAMSS binding - bod
- Correct the lane count variable fallback path - Sashiko
- Add CAMSS top region to binding and DT - Loic
- Use split addr_update/reg_update in CSID and VFE 1190 - Loic/bod
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  drop them from the VFE clock lists - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Collect RBs from Loic, Krzysztof and bod
- Link to v2: https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (2):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      phy: qcom-mipi-csi2: Add Hawi support

Nihal Kumar Gupta (1):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 135 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 5 files changed, 144 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364203;
	b=G1CcxON4U5g1PRXaM5k8D9g1yayuFjpBitLg3Fk/QiX6STH9TgvGy06oZJKSl7WqQEBm
	 Dg4duzuTyDiucNsDyJO+sB+15vawHXLg4AV8kGTCNgjE7oUQwqo5ZWyCEwWN5JAHNjVIT
	 WeyK8Y7tqZIjHtL7g3KrxIjMkG7H5nyhGYReKpWWh5YrUYNC9HnylixHttvyk46g/3uo4
	 35Cg/64AEuJdHdYmhecZ0SgFneQw9pBpLOmeluDGhtmibxbAByGNaj5TBz4DQRWFpgvBJ
	 RZ+1RAQl9c7TUJ33/ri5bu75ZlRBM6n+XRw68YZJa9o+soklr/v79IDQpmtPdXXVDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
	b=3smjjBZmjAi8AmM8JC4wChJ8dXcNlHKK13aN/WC9mL9/zKbglQ2oZrEsu+CGKwXE7w9S
	 KJrU/CfQnD0gbeXQ9AaCB3HlK81rpLTsXb3mzgBf9ZLSQQcEPoF/DloGCXWyb7kNmfVwK
	 e0oKzhXu7GBzGOA11JK5CvS7c+lWrR2CLPqkkV5JU/DYikoPEfdMw6qCxAxrgxMk4Wzcj
	 jhUgSixnZIT4QRof9vK8YbXtrwLMTSQfr63WUI219wDxxtnB61eehv9+9F8V+5b/QE/3N
	 CG/WChXPE7InIYu5qVVpRYAy9kFc2tCPM8LiFedTNa1epsgrjvRKzZkoIHEL7BDos8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYAv2km3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adZbRPpy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F96606A31E
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYAv2km3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adZbRPpy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGDlO4144837
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3y02WtQy7EFMYSobYs1C0
	IhrIzB4b0G9kvwXB6qTfU=; b=BYAv2km3l1v6m4Tj5aaig98jJ3Z54crMH9120u
	pJe++LSGHLYvh/YF7pCkcVpTifWGbxwO5a5FwCkV9BF+vHocv/jbLvtnzqi2Nb2R
	hlgDThcr4a5tIS+MAtu5SP/9jbcyAd0MQrzAnWjrrgnxwsIe24HkxznO+8xqsuNK
	8/xYNdD+u3nna1g/FHfle+ATZJbYKvUMatE3Nb8E4QwFQHXiIC+R/8U4un40a+qR
	XddYKt8Yb5eOU+c/Bdxen6vT7qf4NpTbQJ0Og1KZnuN5FKdXi1Ued49dKYevTJNK
	d0iyfaYflJW+FQPmZi8EYglDOhc8orcz4Vi71yEoqzHhalXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7531h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso8702945ad.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364201; x=1793969001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
        b=adZbRPpyv9sDXKrbu0Iyr1D88VVAsUVDHUDO+nMazjm40l4Wa5hHrYV2qaBdOWzZHN
         Kea+nxVyU05mgcDPeDyx8ctKXAdtrO3NhvjfLbnA5l01B5DIgnOELCtf60QAr2oR1yR1
         1fUhhEZygtdP+PB/320xK5X2iWsfT17ai9jvAXSMbK1m36WQ6pbwbaxM3T3IjxGjPeE9
         sOnNYlOmKhJzYooUXEIOfDaHeDgruLYgFA1aUIWuZt2A+xMGFW7vtdhmvl1uQQXgQAAr
         ubE4ufe6rI/jpHN/I9noznxg3vFz5mFcGnLd1RpUI0rwvIToLBHsFIJzsMUcIhQSIDPT
         0XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364201; x=1793969001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3y02WtQy7EFMYSobYs1C0IhrIzB4b0G9kvwXB6qTfU=;
        b=jVxiKfU74fQsDxTXG7/akYQimbtnaoe5l+VWlTTfI55po0QzsMMtFEiL1E5SjexnLn
         kym8s9bF/PYru3bLCxZ9s+8ET5KQl6KliqdeN1DVUhvWV2oTlKMPyBJ9XcJatqNG1otK
         F/8mB8jFOo6i6L9bY6bkuvpOfeHBRmygwTq/9wQESVX4AG8/k+U+T2Dk9hSrfUwdFQ6N
         Ed7+2n2+GvInHJyVDJh5W48SdzEsiTplRsiWCc0W94/QNKF/fjaKqZkNsEBgqvmh1J0C
         Z77Miur1qLXbtIeFl68CR0HaeTZ64JmNfmJb89noFwyXUb44cGa0edYDIkrsDRdX8Rvp
         P5xQ==
X-Forwarded-Encrypted: i=1; AKwUvBywvnMShNmCcLAMP3DmZI6iB558d7N5nD6JZjb6z69RjdAydBqYU05/pBSC4id8OdbIvxuDqkmVLnvJ7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Tef7ujplea/fA2uVKq8LMpAcSq78f5UAy2qAN+ph3azTdNzl
	C2D89vqYRGH5mmzBoypTm6CA1WLhbjEH4KbvXpWlgW5uHX1XhDhTjEeItSvMtAuTQsq/KnR472e
	jwzm8EIvX3IAvn+Yyc6/pWarjVS2+Y9MQgQMOCkpvrOqQB/wTOGGMdFh9jBQx5hVNUu9byobacQ
	==
X-Gm-Gg: AYBFou0AhSlFmV4cIslNn5B11hYGpD0l/O5wl+E7BXJUeUTOq/BpEsyKPoVJwFmTKDR
	yzVgUsFYg3Glwd+xv2ycclwbUSh3hcdD/boTFHbwfdC3llUKrUJLmQUT0my3nm8E1tEW0y9sFqV
	W3H4XPTcWc8mR8xMRWhgbT1Jd/jjkMv3gQ5ueovYzvtTA4Lo5CS4O6ZQQIziDDC31fYt4yRjElW
	sm7gc7cDX5uU2Fd+ojLfmzp9+zEq9u2+MVYLF6oEOvDYIjMK9XEmEiYilGQDVtQu9gnCIHeXtsW
	irSeHoJ9hpWL3Ss1sgohxhHkHy2DtFRSHzseu8ZRvbLfPtKhIbsW4ZDwABFphdcrw5rGu69R1IP
	hgbbj1kI6W/i3Zoc3GZ9pDaVR5SEQNBCgeb6GPDor6L9nTO2vTcFoxMqfteCw7bjP2wbMBHXwt/
	U8Z8M=
X-Received: by 2002:a17:902:e88d:b0:2ea:8442:db72 with SMTP id d9443c01a7336-2eb364f19aemr22543355ad.54.1793364200951;
        Fri, 30 Oct 2026 05:43:20 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:2ea:8442:db72 with SMTP id d9443c01a7336-2eb364f19aemr22542955ad.54.1793364200386;
        Fri, 30 Oct 2026 05:43:20 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:19 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add CAMSS support for Qualcomm Hawi and Maili
Date: Fri, 30 Oct 2026 18:13:00 +0530
Message-Id: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANSQ5GoC/32S0WpbMQyGXyXkeimSbNlWr/YeYxeyLC0H2mbNS
 bON0nef08IgoezCBhn9n/RLft2uflx83d5vXrdHPy/rcniaQfqy2dpen374bhkz3hJQAaG02+u
 vZfeoy8OyM31c113nYTkpgA/aTtnPo8fy+x357fuM98t6Ohz/vFc44+X1P7Az7mBnvfdMzil7f
 D2s693ziz7Y4fHxbl7bC/NM/zgI+BmHJidMEhENbWKfcN4+mj3688u0ffroeNt19d0laTndbzS
 JCUODQpiitIIDIAQqiZqqEgYNYX33rSfbz2ndb2ZPLVxb7SHsJIgB0rtXFw7lVCyZJ6nXqp5y1
 VHAcuVIkLhDdqulZnQI7DwhzA2uVaqMjmxcpI2UiV2qWEOI4CylYW2aSu7XqtmGR7N5mM1LXLZ
 HVmPKkDgn9OEZNN/Ucq41MqKZDfBiIywGsGuxHpa8VTdNN764eAQAMUrLXnoaWlKi6m7oYaM3l
 LlovFbV0roLqcHIOUvCWkYM0zEGTZelosxK5UYlAk0ztMHEglC1zMq1waiYq43RC82x0rjxZWK
 UpjmJbGnmK9SRPHOqqVtJc9sWInStGkQ95v+CnlO0gG4kA3JmH70OV+91IvvNDKPPGdTixlinK
 ca5VgrPSpobacmSybDw/J5vfwEgP+6YnQMAAA==
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=5721;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=lsMwYHuyept0TY3G1YvNs+p8Iz3C6tF1vslYFSKw0VM=;
 b=pnWdy0oGgt4NBHEuPPXjYTiu2Dtqebe2LXDZiG5LXd38FTl8q4HOFxYtX5igdHTNXjA0Q3doH
 fJ6AY1mc807DS+GpLcOrzy8c0dH1EL4AA3rd1E7udAhOa+gAudMgBhu
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: _vW8xQUOGGQCv5-laFiWY-2syNpNgDfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9svDiZzdC4O5
 cb10qsqt5tNa/6sdeEdmQbgRwsY4dEbpZ/6bfuvRY83VCH+/WWPifUN/Ur1e8j+GK3M6dKs/ydp
 0z4aPg0O2z/uTO0gU7JZUPEcHg6ZqWkAwcQblk/PAqc8CH8q1IoB7XAisayQNDUqTPTHFI1Q80u
 xF6D1ch2jPxMK3PaeJF3FUy3oDSSRmz2RPQdlbaNSCV5YGSMnbqIROrbsCOoOURJhn+/a9WofgP
 1kYKAZFsrPxMFmaamNaS5y0Ps0jvpn7eu4pNHE9Tk50yQRS6kE8dN1E0/VZR+kTPFTD0F1kv3RJ
 isj3KKrp76cnvaImh9KXBbcZRXccO/4NGZRLoCiLeTRlMdkCCgo5C9Be8deHlOxN5PBG8WhVCwZ
 FX17fG17btMJ6nDxYgDRpsKSiZ6pMnJcqzOC2dZJFYeZfrk7n3XAfwyge1adQ2pgT0DZ/ypDnHT
 TO3n8M33GKF1DVVSgMQ==
X-Proofpoint-ORIG-GUID: _vW8xQUOGGQCv5-laFiWY-2syNpNgDfC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+vwCTEi0GnQI
 xnw2Cps8guADlt5ic20tAV/rTUKnuWHdkD25ehQhiz9Tw139Dvird8DnpCGkt77W8RFb4HOBD9q
 4H9i07CfWhde3tPRysdJyy5uwG1PIm0=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae490e9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

Dependencies
------------
[1] https://lore.kernel.org/all/20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com/ -- Kaanapali CAMSS driver and bindings

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[4] phy: qcom-mipi-csi2: Add Hawi support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (5):
[3] dt-bindings: media: Add CAMSS device for Hawi and Maili
[5] media: qcom: camss: Add support for Hawi

---
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
Hangxiang Ma (4):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      phy: qcom-mipi-csi2: Add Hawi support
      media: qcom: camss: Add support for Hawi

Nihal Kumar Gupta (1):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 314 ++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 229 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 14 files changed, 1329 insertions(+)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: aa51e15c5698d3425e979c810ff54968178a364b
prerequisite-patch-id: 5faef8cef855ce6fa00e2c7f10f125431ede40a4
prerequisite-patch-id: ae577f411cccd0e6cdfcfd05ea6cbfc3e87eca37
prerequisite-patch-id: 56eff00251984e6b3da63327eec1efcdb8194ef1
prerequisite-patch-id: 768be92ac0d44493176dfdcaddd24256719a3761
prerequisite-patch-id: 9908a408d5259107a6f00780d7147cddb625b02d
prerequisite-patch-id: ac9c23e579f4c3078a07d3e45373bc63729cf992
prerequisite-patch-id: d22bf3220b43f8f0bc29d0445edb7deaeb7e57b4
prerequisite-patch-id: fb4e676ec517317515f02fe4a2a482a64942c165

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


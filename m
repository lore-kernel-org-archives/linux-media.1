Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09EC457E5D
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533515; cv=none; b=ckjs1SJA6LztDRxylG5uidF6pvu+nTi+P0nz79vcYJ4/4ycHSvbV3YHz0m48yzCtl6FA+tJR9FRuLJJUdOP+3wrfOgwxxQh9y1+DnwAv9vy1YZDUYxLVzRPCkOKf25dZSQIEwOFbwSTF7zpTxWEoPStr7PzDo9cYvfsOej+OE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533515; c=relaxed/simple;
	bh=dChm9VOA+VD/Rg/cZCdywnhal/7ZxoZLcoaTrSokokk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D8tKYlEZJdEeKfqST1c7mf20+7T/gEw9Fid4tFRwxmMYR3KQMfs4QTc3MctVDwPbLAcjxQERId5MAK52dcxtjpMfHsS7AX68pifhcu4Y/wzI84GxeyAGZrnA8X5DxgeEpRFVq4JyNCG167eqXDcpRWJ15Hnsy/R705AfdzvHWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoIhEb7N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQPrxeLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoIhEb7N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQPrxeLA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HMZB1089425
	for <linux-media@vger.kernel.org>; Fri, 9 Oct 2026 08:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OGfdOS5UK7/UzF/cCS7Hsr
	vQSu/ecExyfLjubj6ULfA=; b=RoIhEb7NCJwa6PSN0icknXA5cRsqPi4e6mPv+y
	+X+p21w1LjCsLFrt1cSAplHeWMJF+QJoXahWC5IrUTtJ7yePZwnbMwJ2B05vpZYq
	1Ntrb5qBXtzH30vR0pzP3XfK/GgIA1osFngASq6g2kbGS0jboaxI1m2mQgk2I4L3
	p4VV/ULkL7vMnZzAql38dhyLgv2nx9rx/ehpENnyIJf9kxMvmVJ2drSOD5facJOs
	vcAagp0U/UTfN8Yrxe/XbqZcaowHzM4hmNNzBHZD71EmQxvnJVYzn5WbtA4riIyX
	PXroxsjKHNWi4jVOPPyB0Z7Km6qwvQzIm1LOtpVMb7niJezw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvawu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 08:11:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso781621785a.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533508; x=1792138308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OGfdOS5UK7/UzF/cCS7HsrvQSu/ecExyfLjubj6ULfA=;
        b=CQPrxeLAwZyxDR+s8hSMjIbr4SoShy+SUFOHKvmGq67nQou1nxDv8dfDi8oj5pVtt5
         dBq9FndQ0Rx884hxY8cxeEtSEMyZfU8FB9yRGLMNuD4Csnut9fMXcrmHnfpmcVjUCVTb
         TA8fQuhPPV4fAVg6Gtg9kQM2xZvw32iC6T/Vy85wEhi9QSHKQ3IVd9fkUT8t/IdZJvR4
         ph2VMW7J1eg5yvJpLG13p3h7VpEhBkXot1GPDPDGGtc+PPYQI4SxfDe0fjzI/GJG2d69
         4eoGnYE0cZqirh4zl618A7s0hILY72Wrn23bFG+HGgJksQC9aQE3im3yVERfmr1o7VS3
         DwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533508; x=1792138308;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGfdOS5UK7/UzF/cCS7HsrvQSu/ecExyfLjubj6ULfA=;
        b=JXRn/9SbJDUV+IEhGc/dLD3utYIZA/ZnY2gOGbY9NWfWN6phrfPY6BWcg7utOglniu
         qZIXeztDi0DW9anQp70KYq5hNy2275L2lNbDWvKzeYx2VRVh+mRSgoNOgyJ2CE49RBi8
         AS8DLcmVROxkCEbwf7Dtb8H0nHR5j2kMgL+PfUr+8gb97VvSkTZ1/ywlKIvUtLGbbr4Y
         L2OT6EpZfD3kfU8j0iWkJoJooiEesSL9bdqh7/dneIMv6sORMjE1hZAoNqry4yNhVVoL
         gzdBtFh3hEnO/GLMwonLN9ZhQAEtRtmgCvEd9O6jYGQRoM8fdsiFTazooTpm+9Si4Oub
         oxjg==
X-Gm-Message-State: AFuF++lQPQ9crmDMPN4eW2HO//W4TlOpRWFKMs2RmA74zek6TnoHJMZc
	IfWBd3UZ4w9GMDtDOtYUznCxjSlEQqLZXrCO8ivbmA0y3Es6DnbTaT76ckm1qePQ0fVw7XIFB1V
	YYWQvPpFB+9WIvFTaSELsIJQMVM1qLtvCwSR78lZZgzLTZWxokYvra9FersexS1ZVSA==
X-Gm-Gg: AYBFou2w4o/76a5qJq+oaYc+SsxrLngKMBh1lpHv5H0CH3zmgF9gTZIcuBxvKinoy1t
	bpRZSsQwGWxfxV3NkO9cQQFhwtOKCWRn7HzFlS37jEJHOPode9KYNLa82JwQG600DVsZJc30WEo
	9TARcQlauA9eQNUUJcvMdLEliXPl5pbKRFWU1uR5IpWZc4Z8+QwKuQdpW1ug1d+56tE3DTUc2DL
	kLwolRE44WJ+3OaXXxyS+YZoXZk1CKouYuXRLMBtf4bWlcfHaL17oazlCePBDmTwWc2BVpeYUZM
	Wzb9JPtn3qdmXP2lyoAWkiPrRMo9mH44Dui40JCu6GOejw/LJnKeVR9s4xCok1zfIDEbVJpgBk4
	BaICAvM5OdYIZo6iRibIjLLKZdLGUxrM2viEVg9axzMNlXrTJq8775Eaf3giM7N++zLAh
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr142744385a.45.1791533507746;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93ebd24cda0mr142742685a.45.1791533507245;
        Fri, 09 Oct 2026 01:11:47 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm130780685a.18.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:46 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/3] media: camss: add support for purwa platform
Date: Fri, 09 Oct 2026 16:11:19 +0800
Message-Id: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKehyGoC/3XN0QqCMBQG4FeRXTfZGVNnV71HRMx5zEGmbmqF+
 O5Ni0SomwP/fzjfGYlDa9CRfTASi4Nxpr75EO0Cokt1uyA1uc+EMx4zwVLa9PauzlpVzlGRRIl
 MMpkgCOIvGouFeSza8fTOFtveo91alsZ1tX0uHweY2w8ObIMPQBlFzHUR52kuEQ+1c2Hbq6uuq
 yr0g8zcwFciAtgS3BPcL6TKUuCx/kOILwGMyS0hPJHpAiAruI4j9oOYpukFyILKW0gBAAA=
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791533502; l=1793;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=dChm9VOA+VD/Rg/cZCdywnhal/7ZxoZLcoaTrSokokk=;
 b=vowzy00V+SLNjzf+x4+zMTFrE+EGQpOHhliyvfzobgjVd84IKThh4I13jiyhXMPDmrhIRiycS
 ZeY4bFs1tCqDU4gkpo7AFI2vP/VtZdO7Rz36zQxt8W3m76Vi5VPkWPW
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: sDq30fHUU306PGR7YYLfOSJdh4Qht7KB
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8a1c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U4S9WEnYRaEk29xky1oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX7wkFtB1tCJME
 rnRqFlfPRP3341AS75w8kKFiLdtnHFvnAXTKQLw+oZJjK6x9IkHHa3Rxo5m+WbtzUOm5MkphZ6Y
 Net9ziHlLPEUJCVpcUQAO7ZryKZPJLsWsbNfPuluJxgz8KqzqlbUktTSpg2TGLl98ZwQczD3jXc
 dnSbfx7BinwrsqbRAy9+FhuBGSmWrIpLJeRzJ0/qAAA8ntcHXFvCNyUkLrM76eRxkEFMQmYZicH
 +kp0GUQ2YIlfD0YH9B68/YMONs613V3+dE+Wdh8/SPkpEodKCppsBPuJTlzl0svnKD878LmS1Cn
 LQJSKWvUtCrXLYwSu0DmzHYtue16mBGN7jbC7eW8EeyCH5gArQb5pt45i2JqkyWTxJYG9/faRjJ
 ltTCTWLMmYo2NjamkzGcTmwq9l/7gNnK6yEwBeTmlCceTa7SG56eA0qEPV4aoU5liDsA9qclw2b
 X4H+F+H8GGMaPkt4ZlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX0MTamnyKcNXC
 Vg5POB7+4+9DKWPEyC/BqCZEKBNRByUTEYQfvZ5G1/QsOZAmmQdQN/+u58cFtIC6WrOAefRUTan
 XTdcF9doY9IoKsgffI+NHgMiTUbRRdk=
X-Proofpoint-GUID: sDq30fHUU306PGR7YYLfOSJdh4Qht7KB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor.

---
Changes in v5:
- Set line_num of IFE0 to 3. -- Bryan
- Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
  resources and use it for X1P42100. -- Bryan
- Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com

Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  20 +-
 drivers/media/platform/qcom/camss/camss.c          | 215 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 481 insertions(+), 18 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


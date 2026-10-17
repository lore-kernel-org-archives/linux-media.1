Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1879F3DAAC6
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210668; cv=none; b=ewHBz/DUj0orxB2dheyv6JyI6Gu5uqR1y/qmRncbF5YIDoFGUMvo9zNvbuzkFavL4de9Ll77v6q1/cyDzc/GnpfvgsJsyGCe6az3raIuNTWJ4x9imMx1qh/6Y09WM/tk2i65VEdf5ZQJrF+a/T9armoYEr0YIzRCq1YokmfA5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210668; c=relaxed/simple;
	bh=ruE5tx1HkuW+fOzQ6tZ9eszUs2dG5Y7xPl/O9+fbxXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hgIQAnh7gI13JOVb0uv6CY4xwOpvZSYMEdQ0GnAri8eksCH8A4f0p1cuDXPtO+9ysxD5pKqy9IVdSLR50l/8u4k9Ljg3wiXKlIRxHngajOw0hwTd/BB8khcScLtPobP4Ysr2p/BpuI2qlrFfcurgO4wGp1Zd7FGlcDSSfmOepKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTaDpyC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUSshdEE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTaDpyC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUSshdEE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H4BhEC3682106
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8vaJk7pZN0E
	kiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=; b=fTaDpyC0+DVNUcByVNZNwDaZMHM
	n60Iu6gzXawN2L4tmd9KQ6SLblaNZOCPrUHOsVW7gbCupgZmzvCfcAHwBB0tX3dC
	89daQ4ECOJhAfjevDZ1ZCDKKdiJHCaJS8lJizflFWlgBIYa0JQbtDISm7HyVz088
	U41khwJ03wdjwwrDbqOSTbRspKipaITmaNFPAtynjrycoyUUn1qv8LAC3NbkJlMT
	G6W9SLCOnrl68n1+qFTRTcfd8ijMs6E4AW5kuzU+e+JHj5zGIpNInwpNYcZr8E6N
	WxsTAIWhPuvS/HlfDMNS9LTXhkc0/1Wve5zSvoVdYknE175f+jALo1sd8zA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se00bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1369511eec.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210663; x=1792815463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=RUSshdEEhyle3UGXGZWHAK8NEQHs0NUtO2MU23kpxgbyV4KIithgNPi5e61Y6q+wjr
         eLEr2wFeYgqzQwXIEiOI66rAIf9AvURupsCroLHHp/Uc+15//G+grE3wl1p9+szVjqoj
         rmyYWPQGpYgIU92lOVOKXuS5uR4cTfE1z6/nHYGeEqHK5kDgKlQjMUa/NGp8WrRrBpV4
         dRYJN7EUSTsvVZTs+uxx+KB7ChLndAgYrgYmMMi9vAABJLyx76V8HjhRlQlL7fQ14shO
         xq3eVPbaWkGq9XSeqiJzBnzMG+jZ+2bcP31H3MwUlv8HpK2+S4js4oMWAJ8SP96OaNkx
         b3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210663; x=1792815463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=XSpkod7K8s/iMQchzQjehPLjXfycCq8FqqkVgTh8uZfNNFt+YpmiqnTFS5av1G1vEr
         oUGA5l7ZRHqgk13MHxDmP3fz5dwcYg86ULt0Dr/AUZSlUlz0YK6G/gcTlhi+RbHuHcdq
         Y6gbLqXCOcuWo1Vx+pD0XtwnBa8Q+EDiqFxAHYW+726faV9BPKyxmodfuv2ulpo71gQU
         TtWFVIp0PF6Wm1ogVFKke6mX+6j4SBt3xFTgVor+i3z8Ln15DEK22KaEwA99Ta7L3xko
         jMwkLQj2IqJZP8BTLLDKWLn9tsoebdA6Y8WvNLAMAvmqecbQH3h+LmbBIcXdi7cnWSka
         HACg==
X-Forwarded-Encrypted: i=1; AKwUvBz9Pm6AKzBZaEZpugBpbyYH9p1IzuGivFdEAUvt8j8NE6zr34Zxn0sHYUgFzOtk0dfur6HaRIY8Pw0ReQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFjWtMQ7+GvDrYHHz8RjkeqQuUWyxMjdAkh77POhg9s0kV6xcq
	975ixzy/CFEvQeSxGyutI7lfBOSxMsvvvxSme4ulHcHFuX+sTbIUO66o4tgOwsoUy5fHrA5+6Nu
	c1ayrcxGRsKvsA2as9S50bzHLQDrDOC60ykeOP26mty+DmIvbrg1DoxkcymiUKAa1bA==
X-Gm-Gg: AYBFou24oJjfE/Rw+wGwDeqirR3EL/2QgcgZH9WPWDyQSSFHqeJi7YuDtpA0cK5SZsF
	LPRWghwtaOpwEmRW4Ug4PaWZRKfaYHTfp2VAZzDkKFK1iD6mZbIFWW9aMpH+qlvFj7Lagv3JZMf
	dyYi/Q2yNtToiiLCNoeFQMaDij1oXAJ2AY9jjVMtzXy46Hh6tlgDncDtWu94qpxyCmalNS0FiLc
	Z7Cdye+kU9B2hn7kR/3Wn0fEQHkgW+e8s96pEKT9cB0CLmW4aLArr0f63dpv7rphyZORgjDwNUh
	3bsQbICRMlQFbECt5ZxJqP/w5eaAIWmGzlWh1gB5NDorZ1hEOV+bQMhLwD39lJZ23Go7TxXX/3V
	jnwRbF8rNgv2RXjgnhZKLIy09k5sdi6zvJyacU3NzBoC1srGctc1crw==
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360216eec.31.1792210662939;
        Fri, 16 Oct 2026 21:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360129eec.31.1792210661476;
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 3/3] phy: qcom-mipi-csi2: Add sc7280 C-PHY support
Date: Fri, 16 Oct 2026 21:17:33 -0700
Message-Id: <20261017041733.3946816-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lleoWQoTwK92zHIn0wg90sevYLCnfs4H
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad2f6e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MGGm1cd-6uVm1nftqCMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: lleoWQoTwK92zHIn0wg90sevYLCnfs4H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX4w6hjHfoUU36
 2B1kuzKu0/2g3+3UFKbfoWz6ttUTykKU8e0uMiyxmkyiPdHwpbRLJ0rpg6Qu7F9XRJWG9Tpax2T
 N3MpbEqjZ4GAw5mdxm3ZF/x+P7lbAi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfXx+e6FO78QSeO
 QNJEiU/e7Rqd8mz9qpNED4o/MYUZ8ErakCYaNQ/4uCjultqoee3Ubj6Fr6Ju3c1WEKInhBIXpHE
 c71SyyD2bp5+BNEkudxdKuiD/eGwsiObW+TPQKqFPDl0nu5LdA7YVovUxW5XL/M14XUJ/tw+ceo
 sBQy0EsDpjRV6uYtUQAKmyNLcRoRiBJuQLY9G3gcuhCwUGWbcZ91MzQYmhZOXwYXEYY2VgV+tFZ
 gW4NS9gKglqoCeUEKtskw/iVSTzfFr0iMLMFYef5y5fPgXkvRNQad+LHxUd8nh8LU2OE8wWM3Sp
 aE+GD6iuf8nSbnTJN9y/lEt+b1d+m0wzHId79fZ3yK7ZZAyvRT/RujSbj8GVFKYx3jfWXRAQWTW
 StDIg7oWYAwJDPOS2X+MjdxrOMGzexkWUl1/qdORPStyCsK4qVISx+PHGhkF/MkZpnJuADIcjkl
 1vyDFkG6Z/eIcItouGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

Extend the SC7280 CSIPHY provider with C-PHY mode, so the
same qcom,sc7280-csi2-phy provider can drive a sensor in either D-PHY
or C-PHY mode, selected by the devicetree bus-type property in the
same way SA8775P/QCS8300 already do. No dt-bindings change is needed.
The existing qcom,sc7280-csi2-phy schema's bus-type enum already 
documents both MEDIA_BUS_TYPE_CSI2_DPHY and MEDIA_BUS_TYPE_CSI2_CPHY.

The legacy in-tree CAMSS driver (camss-csiphy-3ph-1-0.c) has a
dedicated lane_regs_sm8250_3ph[] C-PHY init sequence for its
CAMSS_7280/CAMSS_8250 case.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 114 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   2 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 117 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
index f388997390b1..9b921bec4696 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
@@ -5,6 +5,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/time64.h>
@@ -445,3 +446,116 @@ const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p = {
 	.datarate_regs = datarate_regs_sa8775p_cphy,
 	.num_datarate_regs = ARRAY_SIZE(datarate_regs_sa8775p_cphy),
 };
+
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280_cphy[] = {
+	{.reg_addr = 0x0990, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0990, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x098c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0168, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0104, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x010c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0108, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0114, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0150, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0188, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x018c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0190, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0118, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x011c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0120, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0124, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0128, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x012c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0160, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0984, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0980, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09ac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09b0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0a90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0368, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0304, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x030c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0308, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0314, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0350, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0388, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x038c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0390, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0318, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x031c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0320, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0324, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0328, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x032c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0360, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0aac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0ab0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0b90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0568, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0504, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x050c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0508, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0514, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0550, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0588, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x058c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0590, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0518, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x051c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0520, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0524, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0528, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x052c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0560, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bb0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280 = {
+	.init_seq = lane_regs_sc7280_cphy,
+	.lane_array_size = ARRAY_SIZE(lane_regs_sc7280_cphy),
+	.common_regs_offset = 0x800,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 41664a593f91..ebddddb14efc 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -627,6 +627,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
 		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
 		.common_regs_offset = 0x800,
 	},
+	.ops_cphy = &phy_qcom_mipi_csi2_ops_3ph_cphy,
+	.reg_info_cphy = &mipi_csi2_3ph_cphy_regs_sc7280,
 	.supply_names = (const char **)sc7280_supplies,
 	.num_supplies = ARRAY_SIZE(sc7280_supplies),
 	.clk_names = (const char **)sc7280_clks,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index af8426af2ae3..2d33e7267e1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -125,6 +125,7 @@ extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 extern const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy;
 extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p;
+extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280;
 
 void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy);
 void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy);
-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF53D7A0F
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210662; cv=none; b=C4prsTGPCRRp9bg+dr2mUTu4vAneKc+maGEN+dw+Q0FTr1BURXgI7OV/tRG1twnhJxMGNeu1aJi94UWPJcXAa7OjwGRjyNRYn0H459LpdgsPaNXrnC/QYw8eztFQ+OHpP/dfJI6FEdpTU2/4IuvFy2Jblt6jsyzB7GJV57mRp3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210662; c=relaxed/simple;
	bh=Zz8H7LWd8X7zK4/404T4PQqLh7JqrFJUhH4vjYg7WPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oncwfdc+kQAFmZrRVTAQ9zs+aZhEUrIjolviclJHNoEOA6JQP6gmnmwcKQRFwyDDmOBK2aiM+cy2XaXXqLTVRmtkAA6nInhUYdXXro1HhOMM7oCuArb+jTaU0DVSJHJWEy399HnJHnqrCMYUiVQO6kBuJN1kYuSB89DXuU+hEeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjQbIuQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ab5FZHji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjQbIuQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ab5FZHji"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30URZ3938372
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5
	Vc88bYSc=; b=HjQbIuQmwXQHOpymfxOtwCVbLj+EHY7y++oS6fnAF5hQBZyfkZe
	v8gAWRcl6EXtDLxWbiEL0wv4wX9IR58OPqLVVpMG/GX8BQyL8JdaGar7LyEdM7eS
	A+PkS8wqlBneFKxARiJdThObsm/05yRlNS6U+Ps+kKGxXM6eabg3MrGSpCZIVFBn
	qNvXOn72oAjMDFPd4EHKEl1mc/pSs1av5rUUHVmqXe1WvKcLtP14r20IetCa4or6
	MVBit35MhYvOCfaKTxzS4JXe6PWyP7y90pRQUJ79JsqTXlhc8lGpQ+lqhWgCenB+
	esxXCCIaT6BTaUBnhzPoTfn1HHVnyI4eu/w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrdmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so622696eec.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210657; x=1792815457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=ab5FZHjittTfs48RHL4VFh9zmMbFiHhHWV9EZ6TRlQXlbHESWRpw6UapzXudF61tph
         NivKDcGR6C8DsoCui+FlDMN+d5VlQE5qWvo0aLWwbNcI5GwaydPY8p9MqbtvIwme16Yj
         tqdEZTTE34Kfc4RFZCx1IbRthEaB0Sw0EwIT0U+9squSH3nJxiADRrUFIT1gs7fmUk9Z
         fO0zb3wB40E0JaDsZAGz0M9ovP6oytCpflobx9174SFf4W6i6oh5xSuX+fDGk/BGG2vG
         F0iCWgvRRE0RB2m1T1EZ8Xs4yBAAt1kWFaCdzCJE3lxOqQ6lB5QBvTWzkYeBqo5TNzw5
         Qt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210657; x=1792815457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSmiR6WIktoEKYIAAbkgPtODO5dJ/wTfMi5Vc88bYSc=;
        b=mQjIAX6bgHLH57bdZKZQJLI/+OGSefxbw09/zoDCOAtnvhIr2OJf0gzdyi3FM9dwHB
         FUYXhUuaKMzKv9LTK/poRA1j4jnMXDxUeYGY1LX9FXSo3l9AFCErLqOtI+jG8pHoolfj
         CTziFzBECwsps4xXViGj7jXAXxiYXy0eIAdbq2S7i2o12sY6IXASGqI145BI6uUR0qnD
         b+9EaIEZ/N4xjQPCfir75YS3W5/+EVw8vFBC8ugiY1rmOnPJMjayrzqBgpicXkcpvylf
         yxRIXWzA05Tu7Y5ZhlFqJuXuhBlwRzv3h1GF8vQQJE4jtRP5dpvlaTuEiY57wDPLbLWB
         cx/A==
X-Forwarded-Encrypted: i=1; AKwUvBxAEmCY0r7prvWFI14Ot5t7T6liWqO7mKbXBrzSra52WKqzWsxPiphWfr1q1PSsmXvmpZvPm/8/4vKHLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJISJpFcN/H+L1fwraoZJOw8ZeAqpt3LIlazh0tciTGS5m53k/E
	TTAATVbT8qfGmKam1M/3OiZk65U7CwDRTgtXhkfXT5AWBQ9lb1MEhkLL9apJXfzmhHpPJelmAlF
	7WVNsCpEaHEg58TrCdVjRglQuhSaGKaD/PJez9TGdyNNYSv9lrZNoTJdb2EFMUKizvByxUhKOdg
	==
X-Gm-Gg: AYBFou1buqFLnytY+03b6UuE6YxGBJDNToPdKnuF0OQxz7myiaGc/3DvOp4me56FekB
	BDG3S4MspQDiW2tF3oL+mxX9d3BfVUCvYHoG9HNwFyDoqbkgw6m9ZjUnrIXaQ6iaI2yUtY+VpNr
	PA4kEIw5vYXeOqKWMrhH4kUdjoa0iDwJ1yNXi+DJ4KJFLpmr1p3jYP6JYGkRpUtNL8fGtnggUcQ
	v/yfAW5hlv0vbhthY42fAGcFjIlLnAc57ZTJFWt3qumCpNM/6bRY9TnCuNWUwUO/H6u1ddHE17g
	l0/G1J3Llc7BlUAbzI8PQ/6LQ9S04GDjOUE7max/bLkx8LqlnjYsvEy/5N2UsSIFpEE7ELZSODz
	vrnhKg2JPuiAA9XE+z1nfONqdurl2TopK1aS8Yi+Pjwm0bmpRTbb0Ng==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385554eec.3.1792210656386;
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr2385521eec.3.1792210655817;
        Fri, 16 Oct 2026 21:17:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:34 -0700 (PDT)
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
Subject: [PATCH 0/3] phy: core, qcom-mipi-csi2: add generic MIPI C-PHY support
Date: Fri, 16 Oct 2026 21:17:30 -0700
Message-Id: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad2f6e1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UyFj12KqJ2bFa5q0Gy0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: AQ3gc__-pLvobuAX9gmXfSfJy4qD40mH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX4kzGteDDH076
 SvPeAKhno81XBhz/ASf63p4rRnAxHYdQGMiJhAUI1OUM+Cgajr5iI0BADGu1yHCmBeBhpakIBcl
 3UzwNvoIrzLINpNFK5QcNhHtAE5G5e4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX7h8roLICMEU8
 Y3f6pLbeB0ogEx2gu0dwLzy3aFSFuIvtOidsfcJJ2GCHUoTaHSpIOO7JYMPHTORn3m+Cca+VAI6
 vwedjEOn9CE75VT+sLBzRwuDr5aovgBe55+Tbvany+Zbc+6DNZyevcxpoXqzuoIW3/YUOrxEpuX
 MAfxMp4dKTKYJB7kQrbssx6ioaQ1vQNyuEmCeAozeaLOWtvJH7YWZjQS8xjIQxJJDi7c1M9ch79
 b7MvgUeUI16N2coGUV2IVbwoJESwdGLvHvqXlIfR7o1cE+lvXZsV5bFetpCd3fWECr8tkgSfWsW
 agFaeSpH66uWYcBwbrcSN6lO/geOnMg/qLYsidF7RtP4MOd+3Mq9MpIRc/w6LCfP8myjkXX80SE
 aGTm5vH9NPHAF6J/5zatZNGYPnlghM1H57WqjZoJwppxAtjU7I3Nj+ShEdGSh0tyfMFXbP9UQ41
 uoZ+/RbxN8KJ79s46Kw==
X-Proofpoint-ORIG-GUID: AQ3gc__-pLvobuAX9gmXfSfJy4qD40mH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170016

This series adds C-PHY (3-phase) support to the generic PHY framework
and to the Qualcomm MIPI CSI2 PHY driver, mirroring the existing MIPI
D-PHY generic configuration API.

Patch 1 adds the core API: PHY_MODE_MIPI_CPHY, struct
phy_configure_opts_mipi_cphy, and the
phy_mipi_cphy_get_default_config()/_for_hsclk()/config_validate()
helpers, following the MIPI Alliance C-PHY v1.0 timing spec. It has
no functional effect on its own, since no provider selects
GENERIC_PHY_MIPI_CPHY yet.

Patch 2 wires C-PHY mode into the qcom-mipi-csi2 driver for SA8775P:
the PHY mode is now derived from the devicetree endpoint's bus-type
property at probe time (D-PHY by default, C-PHY if
MEDIA_BUS_TYPE_CSI2_CPHY), phy_qcom_mipi_csi2_set_mode() validates a
consumer's phy_set_mode() call against that DT-derived mode, and the
configure/power_on/power_off/lanes_enable/lanes_disable paths dispatch
to the new C-PHY 3-phase hw ops accordingly.

Patch 3 extends the same C-PHY mode selection to SC7280, porting the
legacy in-tree driver's SM8250/SC7280 C-PHY lane-register sequence.

No dt-bindings changes are needed for either SoC: the existing
qcom,sa8775p-csi2-phy / qcom,sc7280-csi2-phy schemas already document
both D-PHY and C-PHY bus-type values.

Depends-on: https://lore.kernel.org/all/20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com/

Jigarkumar Zala (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support
  
Anusha Arun Nandi (3):
  phy: core: add generic MIPI C-PHY configuration API
  phy: qcom-mipi-csi2: Add sa8775p C-PHY support
  phy: qcom-mipi-csi2: Add sc7280 C-PHY support

 drivers/phy/Kconfig                           |   9 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-core-mipi-cphy.c              | 129 ++++
 drivers/phy/qualcomm/Kconfig                  |   1 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 561 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   8 +-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 ++++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  31 +
 include/linux/phy/phy-mipi-cphy.h             | 177 ++++++
 include/linux/phy/phy.h                       |   5 +
 11 files changed, 1029 insertions(+), 29 deletions(-)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

-- 
2.34.1


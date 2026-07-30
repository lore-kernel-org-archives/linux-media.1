Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944D2EEE76;
	Thu, 30 Jul 2026 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.183.30.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379201; cv=none; b=Up4ASaPM3mcgEJnmzw6M6m1tfjwDaGEla8zxF2/S/1xZWuqxZMCKdl5K1cHR29vuzyRN6R9JGa3Z1GnW0lgvXLIO/WvLkgmQuxLHWabb+vq0OWKY0cMvfxTahjNCepXnpP1yj4hFu1w/dPNDojxipZ8aBEGS1++UuElR6KvdZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379201; c=relaxed/simple;
	bh=Vr1rL4I1TbVCKqlG90DBUEIoJyhybuV0PH7pWSj4r60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPB0nyl3rUGwGlgrMZYUJ8H1J/Nuq4utiBtGG0vPtqQi/Lr0JTtO59t0jhFXqenDfZpHfhYtNYEehqH/5lsI+ZLcSaMlP/0NBKHZZV0ildp7SWJli0Zsd0/r/21QUzc+O7o0Wy6zQ+mpCY0/I0E9rf9iXjv1nPCfsv9A+5l01JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=S1/AYywU; arc=none smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="S1/AYywU"
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0iJY32410860;
	Thu, 30 Jul 2026 02:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=6QhiE74b3iRQceMyeBZZcqJ9ADt/ztrTQ1Q+wgH0A5
	A=; b=S1/AYywUiy2eMowSSPN5DfT3j6I6vhC0bk5WzUL89im6z8hDexClXmcrf+
	UximyEuRsb+LliqHjv2zElb8vYw9v6Sc6JWLGZk7u2B0yWzF8tUnojkrhKO5tt7n
	jGN6nz0rwZvlpu6oqCm7kf1ayxAtt8kXzRd2CmC0RQkui015Cxbxc10fJE5AP8Xk
	wY/VyTD1/SXQCXW5nOVcMxIN7S/Hd0ZA7a3l2LhRs9G0v+veLRBTXQx1J/GGrIof
	B7rNAFKdLI5d7zYvxrjBbsvL5O9Ra72NNqTfCTBIVlhBEOeAzDJbSwi7SmAjXf6h
	wZ4v2snFXAeVX1YExN6nR9jjl0ug==
Received: from usculxsnt01v.am.sony.com (usculxsnt01v.am.sony.com [160.33.194.232])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fmnagw2xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 02:15:46 +0000 (GMT)
Received: from pps.filterd (USCULXSNT01v.am.sony.com [127.0.0.1])
	by USCULXSNT01v.am.sony.com (8.18.1.7/8.18.1.7) with ESMTP id 66U1N2FX019661;
	Thu, 30 Jul 2026 02:15:45 GMT
Received: from sgppsba01v.s.gdce.sony.com.sg ([146.215.113.218])
	by USCULXSNT01v.am.sony.com (PPS) with ESMTPS id 4fmmdd37xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 02:15:45 +0000 (GMT)
Received: from pps.filterd (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 66U0jOmR009147;
	Thu, 30 Jul 2026 02:15:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4fprhxbxjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jul 2026 02:15:42 +0000 (GMT)
Received: from SGPPSBA01v.s.gdce.sony.com.sg (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66U2FfVL002867;
	Thu, 30 Jul 2026 02:15:42 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4fprhxbxjn-1;
	Thu, 30 Jul 2026 02:15:41 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH 0/2] Add bindings and driver for Sony IMX908
Date: Thu, 30 Jul 2026 11:15:23 +0900
Message-ID: <20260730021525.166811-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sony-BusinessRelay-GUID: Q9nkGs2S8rjW_VAO_GU8FULp49CSiSg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: W11nRE3IggHd-XxdeQ9iQ7RCPz--PFV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Authority-Analysis: v=2.4 cv=dfywG3Xe c=1 sm=1 tr=0 ts=6a6ab3d2 cx=c_pps
 a=+By/qi0JbgTNrI/GZhIcbg==:117 a=+By/qi0JbgTNrI/GZhIcbg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=dNm3KQjjYUbhztXjLiFs:22 a=aTAPx9apeGqCGgnlAmkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxMiBTYWx0ZWRfX5zTXhQGa9zuq
 e8Y+vf2d4oXghv81Sl1t8hah7z3ZP8vshrLAPwN9+PvFwkESp/Hx4gF+64KE3LfCr/3aDAQ4Ogt
 RZrKa7WPKt3shPL7nCli2d3mrD4WtIKnxVfRK2YoYNPRdJX4+ISFvb/ZA0tz1LOQZEnREn4PKet
 M44IjofTX0fXSBEq6+tG/QU7X8xhL8E+C1Ty83r/4lc09YGsQscJa4TgqYp1Yc+O+ji/gTbKuXx
 vpm5NQa1sOFjPSKgJya2fQuXPPHIsNOeKDh2yiQIr2ZD0OxFg1oxAvINrXxE5j7iwgIs+PwHdKf
 +UdTCEeWKMxZRSyulwPZkOgIkyTudo7Bo+CRG1XoawQRrIEYMdp7fo7eUq/pkaebHVTu1gTFpUg
 eiSydRkPy3wwcxCFUWula0mnB0IXHrd+DZ7dm89MqSl5WQASD7w9Bg7VvkIgfmSbPmKcS/zpCvF
 w/HZdX8xE7O4y+8eAKA==
X-Proofpoint-GUID: yycRivaqoY7ejhsPoWGWVVfFEaL7sZeA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxMiBTYWx0ZWRfXzozGW9Px/TaZ
 s4FTgskkG6tntiFQrBMovDHELlRNG4dPWBBBgan0nRULP5ssf5zR2on0NEZAsh1Ahc7/9PP2QRu
 LJRvUXr2rcmng4pwN0M6ZEpz690+XvWsexYyRPp7BxXI3K6YUWO8
X-Proofpoint-ORIG-GUID: yycRivaqoY7ejhsPoWGWVVfFEaL7sZeA
X-Sony-Outbound-GUID: yycRivaqoY7ejhsPoWGWVVfFEaL7sZeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01

Hi,

This series adds device tree bindings and a V4L2 sub-device driver
for the Sony IMX908 image sensor.

The IMX908 is an 8.39 MP CMOS image sensor with a MIPI CSI-2 output
interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking
controls, window cropping and test pattern generation.

HDR modes and RAW16 output are not currently supported.

Comments and feedback are welcome.

Lachlan Michael (2):
  media: dt-bindings: imx908: Add Sony IMX908 sensor bindings
  media: i2c: Add Sony IMX908 image sensor driver

 .../bindings/media/i2c/sony,imx908.yaml       |  107 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx908.c                    | 1593 +++++++++++++++++
 5 files changed, 1719 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1833CAA55
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886667; cv=none; b=UHFAgpy0Jr/eTRbwmvh0FfF+k9BcX7XhqBA5n0xY49wJeIZJbICohR5TkqtWwFe+q8Gl3n9QBJCFAbxn75s9thAoWaEEe9+9qUl2claVeHBKeTywcazC+p0lK//0Tt6Je/gRdplyHQr9Jp6/rZdZO923Xq3WdbuZ9BKwLCQ76q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886667; c=relaxed/simple;
	bh=MusEzA6Tbm7QPLHQgNq/sdYr/HqG+ldJbcZOX+ZFMls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aa640IkgxQgIrgL4dj+2adWfp69jQ4fVjoZVaslE/uUGZcLI7OAx547FKGN5eDVobuu/BSwFu8yStp7VmWZeqDb1CNmJHC6Vd1JwLGtXfrvbSOT7evuCDHy1EKSr/PPOoWXH88boAMDFe/AISYblWZUcqux8JZ5n/eHslIPLYbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ2NZjxd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FswbgiHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ2NZjxd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FswbgiHI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDqH2137571
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ya2dp6P8A4hCcKys9HHGd1
	o2qSjgYVuexNm3siuRfgc=; b=KQ2NZjxdd9ZatFTq2cL5oCaOzYV6btWr9UulcO
	3ltej+cAt94agA+9CmciKKLRk6jRfno3IyagmPr+30rmcLdAJkoKGwOb1slkCPgV
	Lr2Ui4S1O7sV2MiS0HSuordUIP7vwvvTeCRZcBZuIAUKt5l3HcG6JeW3WgJ87Gs2
	TyZIrVgaVSNL2RZaJqy4pO/O3ANcAQDNqTjFTJZ/GWxCv387XvJ8qgjGdgqvOMEs
	CS94K1heuOt+FAxypOwDNLJ/QemXXjXq+hIc8V9L3PXosAbV0AI+zc3er9nouhVB
	/X2TWDVIw9zbr4SUlIpJg5KPV5AtemtSSd1cIplAhq8dkqWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1b7gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so45720085a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886664; x=1785491464; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ya2dp6P8A4hCcKys9HHGd1o2qSjgYVuexNm3siuRfgc=;
        b=FswbgiHIOf9HIk7oAFrwyfw90sf181sSEvnoMaS4jobuXreRMfjwoddxko0V0gEF49
         V5hHFrD4zKR+XY7lkv4+l7O4yV8C3ZkzSYPfXjb/+WqUa8SW0YDHzG5Alf0mI5gW7EqO
         IfJbp9qQ/XGbgqQapb2jXibkNFYY39y4/cd0WZgRTkYwAKMO1d0rJLjsiDtzWX/hWXrp
         kjEjmo83I8TylTDY34rb7N4ZZ6gMbFWiyrYePbqlh9Ba5Vf1FCHkawJYExl0C8mXX/d0
         pymcPQqeyDY0/L7zY9MkFaHUiONu1OjEU/30BoPWaedo8riafiPiIeKsrJ0Tlf1TJmbW
         fOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886664; x=1785491464;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ya2dp6P8A4hCcKys9HHGd1o2qSjgYVuexNm3siuRfgc=;
        b=Tyso1y/H2TYH22+iDg4bEBfLt7ma9xcCBW4ECrYTOtqYBW9LGJNcapzKtOHGbO61Vo
         Js42CvEcg78yei9dOch3JQ0PepUBUakytQug/ks5yyAmGwsc3ZbYapDccgULr1vsmnZA
         qBAc48X9/7e5ROhcMAVH4SJT+GHqZwXt1E2pW4XUEUpZq/IW/fyp7WEWnKaPog2NanHT
         oTaD2G2Mhv0y1kO0dvdwLsogyxXZQYcWiKF/3faRoZAnJdfAzorJpBepM7oU5J+xIiyq
         Y1oOfmTjO6GwI7l+mJO3pcscdvjhjxHNPC1dbINIY+lEKl5oxKadSXonVlh8NjtRqHLY
         t9cg==
X-Gm-Message-State: AOJu0YwGC0Gg0Ey4dYJHdsYxI4+w3WQy6rCdEKnL1bn0JwJG3yS24iD+
	C8GVOx3qQS2k2eo5izXLQFt+WMGDmxsFqh1iE9bGFqMx+qSD9jXaV2sauURgzro+L1RmpcAUfkL
	OKMViPRwQKq2nwYCiGaJokVcFhb0iwVntwDq70Jak+hItu553ZlXN1pm6MH7lYh4+DATokqHrMM
	NR1mQ=
X-Gm-Gg: AR+sD10GVvX+Zl+OwqJBCh6D5aSWkBzgKL2cTjjlqew7pO0qDbEKke6i0WjX77eWIAY
	ixli63w0TvlTTpvBbsaItWbAclPhiZfFIZE4WDLqctqhcpS2mzwszedMEz1RDBxVn9vVTDd0LY1
	vxrYmOF0JH5hg+z90q+nowoK4ObTC6BfxSavMfCAdKxkQpWEI+Gblle9iOXEPyznT4NGStXopvd
	MBQux6F1kC+hJrTu5k2BUm6A0ncaYjST3vKk3EVmwJu/vrzsdu7jVN0BR7HrBYz8Qn1SOQowql1
	xwt1CksQjcinnsS6d3Zs8CBZDNNDKb3SuIjZTJH01MBnQw4qeR4G0WSNSAmrufs9U5nmi63cO2L
	Csd4FhUoJLla4G+S88lYU54qSqyFa1iE7+aYf2d7IUH7kRJPxaopBKwyY3sokSdU3+hwN
X-Received: by 2002:a05:620a:414a:b0:92e:c118:18bc with SMTP id af79cd13be357-93103b6bc8cmr692806485a.91.1784886664203;
        Fri, 24 Jul 2026 02:51:04 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:92e:c118:18bc with SMTP id af79cd13be357-93103b6bc8cmr692804385a.91.1784886663701;
        Fri, 24 Jul 2026 02:51:03 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a7fffsm620261585a.11.2026.07.24.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:51:03 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Fri, 24 Jul 2026 17:50:36 +0800
Message-Id: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGw1Y2oC/zXMQQ7CIBCF4as0s5YGkBZx5T1MFxSoRS0oo0TT9
 O5ik24m+Scv3wzokncIx2qG5LJHH0MJvqvAjDpcHPG2NHDKWypZS/DWXENDeif2vDdKaXWAMn4
 kN/jPCp270qPHV0zf1c3s/90IuRGZEUqsbhm1crBCiVNErJ9vfTdxmupyoFuW5QdQLYuzowAAA
 A==
X-Change-ID: 20260716-sk5jn5-be432bc99a98
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784886657; l=1542;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=MusEzA6Tbm7QPLHQgNq/sdYr/HqG+ldJbcZOX+ZFMls=;
 b=0HrqPvb4cGiuOovTNf0GasH/jgSO1wj3Y3OvwF4QD7rJdfB5QZchQv77S3CkXABnlNifUt6pQ
 7domsFZRP+ODH5Kb2ILXMd/g+q/LHK2H2xL5rk6AG3MBZoH67vD+uMS
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: Y8kbx4BMw5eL-iM1qXqUZTUXtYaqPOLa
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a633589 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GrB2XQy3GJ6Uwl-dXtMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfXxTtQCGIsurG9
 SqyOq7lJCn5boG3BpI5OlQ1OtU+PKACFvupwjFpBm+DCfDbJ19ggz0NAHdMzKF5UEkZaetb7ZhO
 ao6tc1UpS41DUbgY47oJ/mDA7F9bALRo0El2Q5K1O1goElLhj+eIxN/24poaSKcVBEVLUBV2hVK
 CHInDKxh4W2Px1i4Oy6M4UwByy7+LEv3Ttc1FOgwnqEzuoDYfrKG3lT8tT9EuPNl5ksr65zit/O
 v9DXdPHewRWoM+3uZCh4kooLf/DO5EilrMAtRb2NJr9k985BX9W9Gh/aBcq2h1rjPeF8l4RhRIk
 /oPlQ5j6N9s1xl6TzwUxfPqhJmTHLDuBgRTkvqaIdv9eKODwGbqzih79UIdmiBbyiFc2SRZfPkp
 JKPLoRD1lpAg9fxnbvL/YWYl0TedGcAC4Sy82xKf0bVS/Ye4udmLwZJRxdH/9oVY72XFbvtqgkL
 3wYWLeX3o9fmSLgdKcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX4fggEhl+kHiv
 B9ZnvrXKWiLG7SzBVDEwQorSFLT0ph3jQLcJyWZyh7GFCtaLikQab2xJHRO+lnox+mRQvwhpOpq
 OUOWi7f95Qy7VPXxm5X2qFz0mPmByVw=
X-Proofpoint-GUID: Y8kbx4BMw5eL-iM1qXqUZTUXtYaqPOLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240089

This series adds support for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
MIPI CSI-2 image sensor.

This is implemented as a separate driver rather than extending the existing
s5kjn1 driver. Although both sensors belong to the same family, they are
different parts with different register maps and power supplies.
Combining support for both devices in a single driver would result in very
little shared code while introducing separate initialization and control
paths, so keeping them as independent drivers is cleaner.

Tested on the Qualcomm Hawi qrd board.

---
Changes in v2:
- dt-bindings: drop the "T:" MAINTAINERS entry -- Krzysztof
- Rename vdda2 -> vddio1p2; fix supply descriptions (vddio = 1.8 V VDD18,
vddio1p2 = 1.2 V VDDIO12) -- wenmeng
- Link to v1: https://lore.kernel.org/r/20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver

 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  113 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5kjn5.c                         | 2835 ++++++++++++++++++++
 5 files changed, 2967 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


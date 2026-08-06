Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29426982C
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988229; cv=none; b=GBUFTqWUgPbdolcJaWFr1vN7sN2SOZDbnkUMeAH6rhwFZt+ly7Ix57RmaUE3ndQ+PXoT4R6W0xihq1liuoH15gntS32vNrOWWOZiCJI3aEFPzScHVqZGuG2ezZX2aFKWaWXP5qzFYhkYiC6x9eFUDMe0kWu6saKuh521E7w7Rug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988229; c=relaxed/simple;
	bh=KKzdQC2hSOJlLlKOjoebl8Db9rvSaZppdx4BlLAmVZg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=neOz8PAS26zhlElJhrU5Qdte0NisI+RGHuAE86sm1pWCWyGTUWhsbIIo2aget6GspIa+QuLqAobwTlSxNzppOcSbnyJvO/GGX0x7pofe1uGnHKSBwfSrORTxo2A4B7GUuN2tI7sN4+KxHRM5KZDtUmhg2F3wsjbfFCXqepwA0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEX/WuN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDzW73uj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEX/WuN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDzW73uj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NcICw269752
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 03:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DroUy899f8UZcEHvH5hCZ0
	9xwNLqFHtAI/BTIz7Ayzk=; b=JEX/WuN4DTBnlo1Sx8BZNWD3GQua7inGEeZkTc
	0JLG+8bYlMQx/D+WgHFiDMU2vID7SXF1zDJVJLbk/N0/BnCIQgf8KC8IlaNmYjEc
	cFGJxf7F3qFQkwzECy3YyMG5w8VTdDalQhjOF0wtFVlf+tOV8b/J3wvXOsPzXbOU
	RJnbhm83DR8VRnatT55QNL9JU4dgV4jFx4d4U/kNMSpsl3kJyIDW3XXHvVXgJxz0
	D/8i68DaXk7wggYmd6GR4oYvPOhhR61pR2i5WPZmlFwRLQgDYPTyrJ7P/6aCmJ+C
	1QNtoAXjlxOU5tZ25RB9+IJHlL7yo4ovIac+8wptI2XzmI0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv3w6bws6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:50:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309af14fd7so169474685a.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 20:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785988226; x=1786593026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DroUy899f8UZcEHvH5hCZ09xwNLqFHtAI/BTIz7Ayzk=;
        b=LDzW73uj83KNzxb17ZZRv7unPhyOt5OGfXkvJ80ybnI5Sq1cC7xgpPpgPUTo/Rz9YZ
         KwbVs3tlzaKzcKwJ0knIJW2TLjRDoKU02ERnJdQrwbbB8KkpaaBntIwvYpLFDZgD1F4p
         gi0goxzg/7rM3HoyZeLnZFU4Xf8q3q6sT0e9IGSdOSnIkehMw/1HRUqed+E0KdI4iqG3
         sNZOErPO/RhWAc+FGAeUBaLHDVR2PW5hdY0szxFwaXoX5f/THHHCd5jy9NvJHggI9AHb
         LRxl2NDxhwn2B/x2MRHfuQboCZFgE03nZhKpwyzg+3pob/8oj8WjHJbLb6CSoq/akWTo
         CvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785988226; x=1786593026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DroUy899f8UZcEHvH5hCZ09xwNLqFHtAI/BTIz7Ayzk=;
        b=YS0j8TJXt3dS7CwPVOOGVTFMv6klSY/sOpgivyvXPlqv+SmzqfNrV6jSUyAmduCN+a
         6AoITJJsehGwPtaH+Lka+kOFxgM1rvyL3/O4lEqC7YGB7AiDZyZ0yir06/ZR325leBGt
         ZC2vWIxg2VwFTtwy63WDY9VLWKaLAa08bl3qyTtQXp0lwZ2fqUBcRCJ/uQXLSEpTttLA
         CuJN25WaXL/uQp+816XH9NG6+I0/rFXIRAEjHZhi7Gww0SGwMY3X0UXhnd8bnHk4DK7q
         dndNkLG0egwC01vgbfdJaP/nIRvMmV0PQqLmM3f2o7FQ7twWGCn1Jr+CpYfLXf1cgbHj
         XRHA==
X-Gm-Message-State: AOJu0YxyeHb6IlWPd7xvR0dEIwKqlj0X7b6XeAe80JlgRJRcCXGkfd1l
	F26MEsx071A2TD20bs86bf6PUQCySNBP2sMCCUlvmtK2cyewYrxPwKYtizU6tK4eWqktQBmPX1x
	NemkTXYF9wdevXVxgHCAcJvFTUOWs8MS5e99bgjgSZk8y8hqsMwsj6nEVJ5ZH9yTBY5IGi3UCB9
	lo
X-Gm-Gg: AR+sD10r4TFbTvJ7Uz+R+4yBjik8uOcPZBRc89eXjAEu4OuJH1mFcaT+7dyKsnTJQTA
	v7ed4aJ8FMm66bCAVkyYxIGLebQ3ruV+8n6rB6BFwvtSnmPqujP/INaBrirfPWcvJIlXj/F8E++
	qGFP8MXloErnnXGoSimtqiKAiqde38/7+EIX6vWAos7P2Axzre0zbs/e65oug1XcDjgCLHb8EQB
	CLD8B3E4wMpQDmyfhxRzm0JcXv2QGykCWlSPNIp0TAHRnoZoiKZA3nEwON591NHOgLayyz6enfr
	Ks/deL5QoJw6ovNzBP8JqOobjTYqCZUIz+qi2mdEvpngWt/4WOrGQGc69AlgyEKgj2XWs2dUdE+
	aS9vahX+XhHXBflaIUsEr/J9hZPsGK4o7W61HaI7+XeR0EHYZx9kyTNwAvyQk7AW7NetP
X-Received: by 2002:ac8:588e:0:b0:527:7794:6115 with SMTP id d75a77b69052e-52ce6159c4bmr115503621cf.29.1785988226224;
        Wed, 05 Aug 2026 20:50:26 -0700 (PDT)
X-Received: by 2002:ac8:588e:0:b0:527:7794:6115 with SMTP id d75a77b69052e-52ce6159c4bmr115503381cf.29.1785988225734;
        Wed, 05 Aug 2026 20:50:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbccc9sm41945806d6.14.2026.08.05.20.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 20:50:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Thu, 06 Aug 2026 11:50:01 +0800
Message-Id: <20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGoEdGoC/22MQQ6CMBBFr2K6tqQdCqWuvIdxUeggVaHaaqMh3
 N1CgnHhZpI3+e+NJKC3GMhuMxKP0QbrhgT5dkOaTg8npNYkJsCgZJKXNFyK81DQGkUOdaOUVhV
 J45vH1r6W0OGYuLPh4fx76UY+f9eEXBORU0aNLjkzsjVCib0LIbs/9bVxfZ+lQ+ZShB8bxNeGZ
 FeSm7xWGlDIP/Y0TR84VW4K4QAAAA==
X-Change-ID: 20260716-sk5jn5-be432bc99a98
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785988221; l=2658;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=KKzdQC2hSOJlLlKOjoebl8Db9rvSaZppdx4BlLAmVZg=;
 b=tHZXceqaqHglYr/g6jiVobKIDn3Kfk6k9xBZPpbdP2qvVBrdE709lHd7e1AMf3qY7nKMHxxQj
 fTnG701pDhfD0DwM0FbMR4FndHZjP8C9qBy2Uu7xdS3ammMvDDZ14ow
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: etsTdxycM5OvaG9R0_em4oCWHT6RoJAP
X-Proofpoint-ORIG-GUID: etsTdxycM5OvaG9R0_em4oCWHT6RoJAP
X-Authority-Analysis: v=2.4 cv=a48AM0SF c=1 sm=1 tr=0 ts=6a740483 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zxErxWrYDRBdf5X_hk0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAyNSBTYWx0ZWRfX8SIMJgQvakZW
 Og0leSxl3OemgW3d9uWtX4pNlyT/EQWvMTwpq48WIpx28wVjjeGCrleWveyOGAwPqlmF9mpvWv9
 bSzsOuu9W+ts7DZedgzlpqB6QtA13AU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAyNSBTYWx0ZWRfX0ZjNFHjm50d+
 bYy35wqyhvYg2mYDLUO1AOLCASQ5VcEoI1qi7SrPHSUUUg4CfkkZnbDxIJ7ij1Yz1QbLlfsOyHg
 2V8keiJZluai+nnHgVk2/RBfHb4EvCAGIIGhebHmX9pnjhQkRruiJF9+gBAUiTF64QVGY1fnqDC
 +cv8+cEp8soT6XyPOaCu5pUbzsI7WPoRVPDy0JIcBtHiOzteOWv/jNp03KQBcQNoouutw1c8kh0
 Nc2TJPxYZLGiY0zHR0Y8oZUUU3wW2TqMfwrggmepmE561mNVDOLX0+69hEhZ3jqj3sdUAj0yjBM
 dAnfd3L71Djag6j5S/RxyIr13N+DtTSYD+LKJI/DiIEWo8isV0jDsyI1/+Gb5FR3/eV8O1TQGM9
 lowDht7OUCcA3J3UDxysC1cfNGetS7iLmn3GAqHh7eR6hI8rV4g6uZ34vJoSe1aMjOGA3H1M5vF
 zKzYjMCo+Z1v7SA7/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060025

This series adds support for the Samsung S5KJN5, a 50 MP 10-bit RAW MIPI
CSI-2 image sensor.

This is implemented as a separate driver rather than extending the existing
s5kjn1 driver. Although both sensors belong to the same family, they are
different parts with different register maps and power supplies.
Combining support for both devices in a single driver would result in very
little shared code while introducing separate initialization and control
paths, so keeping them as independent drivers is cleaner.

Power Supplies:
| Power Rail | S5KJN5 | S5KJN1 |
|------------|--------|--------|
| VDDD       | 1.0 V  | 1.0 V  |
| VDDA       | 2.2 V  | 2.8 V  |
| VDDIO      | 1.8 V  | 1.8 V  |
| VDDIO1p2   | 1.2 V  | -      |
| VDDM       | 1.0 V  | -      |

Tested on the Qualcomm Hawi qrd board.

---
Changes in v3:
- Add vddm-supply to the regulator list.
- Drop GBRG from Kconfig, file header and MODULE_DESCRIPTION. -- Vladimir
- Compute pixel_rate at runtime from the link frequency instead of
  storing it in the mode. -- Vladimir
- Split the init sequence into two tables around the 5 ms delay and
  drop the .delay_us field/handling. -- Vladimir
- Remove unused v4l2_ctrl pointers and the unused <media/v4l2-device.h>.
  -- Vladimir
- Move all control flag setting to the end of s5kjn5_init_controls(). -- Vladimir
- Fix s_ctrl() to apply controls when CONFIG_PM is disabled 
  (pm_runtime_get_if_active() returns -EINVAL).
- Use S5KJN5_CHIP_ID in the init sequence; reword the clock-rate error;
  minor style fixes (reverse x-mas tree, ret init).
- Link to v2: https://lore.kernel.org/r/20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com

Changes in v2:
- dt-bindings: drop the "T:" MAINTAINERS entry -- Krzysztof
- Rename vdda2 -> vddio1p2; fix supply descriptions (vddio = 1.8 V VDD18,
  vddio1p2 = 1.2 V VDDIO12) -- Wenmeng
- Link to v1: https://lore.kernel.org/r/20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver

 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  117 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5kjn5.c                         | 2848 ++++++++++++++++++++
 5 files changed, 2984 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


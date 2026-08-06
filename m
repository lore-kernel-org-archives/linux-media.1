Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE543E0C4A;
	Thu,  6 Aug 2026 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000276; cv=none; b=CXXSW6fi5cJEV3ILV0nUjdSDcbCuV0d4KHzuGiCAzSBtp/b0tsjKAlK96ilKPvUrUjBiUXhpIdDTZ8LfgwI1f2UguMJiht9tiiRZeevRSadjECQyg5jNwP1qaFGyFbbuGGCpa5KDgqndvoSUr4Z6WJ9pT9rm8mhSMA1FGhlcMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000276; c=relaxed/simple;
	bh=dk+3v8dWcuNlUdWSwqIP1q33MjcHUAXELw0DXetCP7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdVuOjYKwnHpwAad0/3VW4mFU48kPIkMauEMGdoO4tRYlyHtQI3oxlKzVNNDQ1bR5y0X9jQzDVSEykTvC6KmBsldiiH3xYSc3niH7YmGdwhAhR9m47MlzhFqd1EqFYzEg0lQ60dEUl04tGpnv4bDj0nJqFRDGh0KEdhCjyajWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ABNydFL5; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ABNydFL5"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6764ifXW3974500;
	Thu, 6 Aug 2026 07:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=HpjZXgnUd+6E5vX5nnFJmpOr09F7Z7vsCy2VgoPmRM
	g=; b=ABNydFL5EaeIne+EslJKhSJPvzb7X2jf9L/q9O4DOSGCBK0g3YJlH1fFae
	aWr0vauiAwvdSp26QjqanzsDlox/KkkAUB3qKwKdOPeNjAduaK0fOmzKHujQr556
	tcmiwowJ3C22ivn7ou42X8HtgpdxBwKjCA4hKl29BfqBzEIvCQQjSGkqzaWMSQ//
	NB8evPwa3J0/4Q3TwMu3M9sHioynu9RquPhive8Id8K+WQAhVWMjwuUOTeDbD5ZJ
	+ZjHE12BBJJmbC/mOMtujRooyaPiHp+uhSzGtmQqWkUO8Fan6gZeHatAsDS2ax86
	RkoedGgbN2SsubgyYrwhzEZT1mQA==
Received: from sgppsea01v.sg.gdce.sony.com.sg ([121.100.43.225])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs70d5qkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 06 Aug 2026 07:11:02 +0000 (GMT)
Received: from pps.filterd (SGPPSEA01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA01v.sg.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 6766AevW000477;
	Thu, 6 Aug 2026 07:10:59 GMT
Received: from sgppsba01v.s.gdce.sony.com.sg ([146.215.113.218])
	by SGPPSEA01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4fs9vhbgj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 07:10:59 +0000 (GMT)
Received: from pps.filterd (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (8.18.1.7/8.18.1.7) with ESMTP id 6765ZQEu017477;
	Thu, 6 Aug 2026 07:10:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4fs9vgkaba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 06 Aug 2026 07:10:59 +0000 (GMT)
Received: from SGPPSBA01v.s.gdce.sony.com.sg (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67678jCr025361;
	Thu, 6 Aug 2026 07:10:59 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4fs9vgkab5-1;
	Thu, 06 Aug 2026 07:10:59 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v2 0/2] Add bindings and driver for Sony IMX908
Date: Thu,  6 Aug 2026 16:09:32 +0900
Message-ID: <20260806070934.21764-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Sony-BusinessRelay-GUID: 0NaJw7mB7WFYFaQihzsMTP_bFhc7jpoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: r87ecKgMMWnzJp4FwMbKJ9rn_WrqH15d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Authority-Analysis: v=2.4 cv=Y7bIdBeN c=1 sm=1 tr=0 ts=6a743386 cx=c_pps
 a=XNW8778QP6juiAqijDMnrw==:117 a=XNW8778QP6juiAqijDMnrw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=lmptg-Pxpg44AF-n8Qp9:22 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8
 a=RjAUJtUeRIcSoJALJA8A:9
X-Proofpoint-GUID: XU8xWAhX6SQubhQUTVH9w1ibwGfDnseq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MyBTYWx0ZWRfXyTsmPuD9bpjG
 GMYPOVHuh5YPJ+iImPeXpf7x3tslVgR26WNfuOqizD/Fc81ffVp34HrAoEcD+8xMWrIfQLGOeH8
 aVLbyKVxhboYg6waZWlNJXS2eUtGU3aoscHEB78Oa5o7x9Qz9Peb
X-Proofpoint-ORIG-GUID: XU8xWAhX6SQubhQUTVH9w1ibwGfDnseq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MyBTYWx0ZWRfX5XjiQgtngMy9
 i3ulzP/mTip81xetxXiGQEpqnHzgyJQQi/61sIvr/a/LqugznIAsTRjtcZYFKxzrQaS4krOpK1c
 fCar1GlPiEiVI7kZc9deYrPTQyJ+Nj1oSbj/JtxTlLrh5aW6HbXZ9rj2+RqzUxYi0rhWVZPwp7z
 jmqSH+vW5qCXoHUM52B6z6InAyTfZ5L8UXHVO0LCOf7pWReHB7L4MKGtt2Kq3Q59k32am6xO9b4
 WsvU6zc6dFcRRdO1bPAiGKW4ANrIwb9rx+ApkPvLKaVSJ7rPOR42DL477RGwfD9nX9ST1gVsAHs
 t/Nx1E6nCALmeNYTkKO+yiSJorMCJYuwyqecibw50L9IEI9Jwbp7ufuV7sNOeFmM4nNHvXVYxJa
 eTod3t+M+l2bvohNjSRg8RlzwXIlV5qNcjmsEJaUW/jz5SCHWZN+0ALCgETG3vZNnF3jXOSZH+T
 0OdaIZq+vEmUeokurZQ==
X-Sony-Outbound-GUID: XU8xWAhX6SQubhQUTVH9w1ibwGfDnseq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01

This series adds device tree bindings and a V4L2 sub-device driver for
the Sony IMX908 image sensor.

The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
output interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking controls,
window cropping and test pattern generation.

HDR modes and RAW16 output are not currently supported.

The driver has been tested with libcamera on Raspberry Pi 5 based
hardware.

Changes in v2:

PATCH 1:
- Reword subject to drop the redundant "bindings" suffix.
- Reference video-interfaces.yaml for the endpoint and switch to
  unevaluatedProperties, fixing the remote-endpoint check.
- Drop "link-frequencies: true".
- MAINTAINERS: drop the L: line.
- MAINTAINERS: move the driver F: line to patch 2.

PATCH 2:
- Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),
  read-only.
- Compute HMAX from both the array and MIPI link floors.
- Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
  mode.
- Drop struct imx908_mode; cache hmax/vmax directly.
- Change the link-frequency table to s64.
- Fix the probe error-unwind ordering.
- Be silent on success (chip ID print is now dev_dbg).
- Drop redundant comments.
- Kconfig: fix a "module will be called" typo.

Link to v1: https://lore.kernel.org/r/20260730021525.166811-1-lachlan.michael@sony.com

Lachlan Michael (2):
  media: dt-bindings: imx908: Add Sony IMX908 sensor
  media: i2c: Add Sony IMX908 image sensor driver

 .../bindings/media/i2c/sony,imx908.yaml       |  105 ++
 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx908.c                    | 1501 +++++++++++++++++
 5 files changed, 1624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3


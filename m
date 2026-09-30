Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A645D93F
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755701; cv=none; b=dV1WUEjMkhM8cDYju6AWnIy4UjILIo9U/c9MSbO7Le/GcCD4mxVqvHwbx95WDxjsJ/SBWwsvSkGtz0qgQ9p47ncWhDlUWWrykMy7dCJ2yCABV6EAsarAoBRaORr7JkWa/tlzm6CWK2SFKOhjFfka1bUkjIDg+SIrEIVMkQaGY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755701; c=relaxed/simple;
	bh=7505qukM/9pBXkNc/wI7vLT9EomSNHzFj2uvuJ0Yc1c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dTO49bwF93bsxCtD0sSf0MzZpbfpBeKIp6WvS0gcI1DIk83fx8ahHlo5UIgVpkd17fkSHHEPiMcatOYEGHWRX+q5GbYqjr7sK9mWaBOXHkkSn3TyKmQhCcXynOAG/58XJEpyJeIp7N96pQ2eAE8qeiZ6LdO/ENNlpvRag0obmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PH7tHlrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIrfQaOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PH7tHlrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIrfQaOw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dQx52119066
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tA5J6KGWTuXlANf4tN9bZQ
	CXacwDMDc9ioL0bRmT/NA=; b=PH7tHlrJCH07i2M0xC52QCgkyNfmVn8EtZA35w
	wBtMGyohXxSYNV4mpJF6QZ9HOWLN2NfoI20oukLBJB6eERvLOUVfNcyLo/PKxj09
	sIGuNaYwH4il2Tb3G7C40B2j8Rb3d//EmRkM02RX44Dev6rlJTZeXxxJo28wJ7rK
	HiPBmDC+iQcx1eT/651HXMnmhINVFbv5DvWu9tb53ZdDL2EmsA7Vm8OGZ6NIwgrv
	33axGWgCJ3b5lvPcvusr9vBOFm3Vs34u/GyhTCgE3+pgW45XXp2uo52K19r7NrX/
	wEtaHW1CEDGloRjiQQs7vjk9/4WXkNLTrGwKTALSmAVZJxGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhehp0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cab33cb20so30810585a.2
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755698; x=1791360498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tA5J6KGWTuXlANf4tN9bZQCXacwDMDc9ioL0bRmT/NA=;
        b=CIrfQaOwlpA/jRuQFTqyJnVmhaOUv/e+crx9FMOKaliyGizPAxi+pDrMMfSNtHPorL
         85vWqFE+WOQfOra+1z2o7tVO3Ixoc8URt6svDsP/JyAoeJeQuxVGDPPZMOlYQVh1xx8e
         EIjyJXa7k0sZFHQ40uxoibZrMyGZShd5+swiCCJlz3PvjMXX84KC5uH8TynDWDXKElK5
         7xdApGhcTadskZurmMIp/wMvF/K8D9qJo4shZBfYlNwO7jQ7S3b4rM22KHpRIjpmJlUE
         RxfMYmqT713T7lN853GYNqFaqvagQMxAIQlSv904CKYllWzmWocGjlJ1OtWNQZp972Ao
         br4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755698; x=1791360498;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tA5J6KGWTuXlANf4tN9bZQCXacwDMDc9ioL0bRmT/NA=;
        b=Kn3KkSbG2OQFhoI7U30iTctRSA9HYjBpkrsi3V1oYOar918NlknGHSQwBDcogocoq2
         Pb73LaJqXP8vZxv/+aIFJZQBXyaw/T/OaC15UbkQzmDgLQroabD6cE0e71LN7f1kKEHt
         +BUkd6x1dSaPg/qIy5tZfYuq5SEiiFRWhjosHQVm+TPORwohBREUdJisY7hvjtjMaJUc
         XSzMbkO3ngIm0C09Q0JK7C/zl+eUt46r6DWBIle9Fd7c+HNelAAotn84Hbsbv01yfwZC
         OkrHAs7XaI4PWk6k6BsyK4it9eIYrgF2Kre6YXwAW4g3CfyVGlDzjqS8CduLroIn9F1F
         9LKg==
X-Gm-Message-State: AFuF++lEYJ/RYq7uL97dWtbD4b9i0vwfho1VLhbu57SPSz1EcWGm1M1u
	1AwobVSxA2oHI6xAAXHSYsEaWT2VNglY7RTrmiayCWoavDs30ty0wsrXxjLS5VVDORv9ryv/WOP
	XYemTlGFjl/fo3kFcDGCaRUwqrXENApGEsuz888tMWY/fQAUIClAckhEDHSzamTFRRg==
X-Gm-Gg: AYBFou2iPjFoyX/it+UWhqxM851FuekjfV3a3I48wMSF1NA9NcZYc8nJiucv8Xq3epb
	qPAyeg5HIMuf9FRepGfKm44uly/NNb6BMVS1T0UuA2YlusCeM0qRDbvVTLYovCnEN3STer7Iomf
	Xmgz2a8HPCQfgdSw8cJwQH3k06j7poyp6r32MAxPjgBMi3I03gLq6ReJPKxOOhZMFku69H2xCw4
	4YtIRmHzEXzoBWAdzkV5uhQpBTvzhRPRjE/dHcl5JrvpIWLqz8ZlBk0lLubr26BY/1HzKqmfHcU
	+EtFWRK937SwSVHlqzJyOYVZYOgR4H9lWxL5bZHZgPIXWgnhHc+eK8sxbI5bkGz2VxVbChWLrYk
	9bT/P9egEsP2kavLXX//T0/ZFzfL/sdeD8iwO23L9jeJyKFTRxlmBcX57kDdBkSBcWVyC
X-Received: by 2002:a05:620a:470f:b0:93c:8f50:8c69 with SMTP id af79cd13be357-93ca9790307mr82624285a.46.1790755697816;
        Wed, 30 Sep 2026 01:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:93c:8f50:8c69 with SMTP id af79cd13be357-93ca9790307mr82619985a.46.1790755697019;
        Wed, 30 Sep 2026 01:08:17 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca833347csm62238585a.43.2026.09.30.01.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:08:16 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Wed, 30 Sep 2026 16:08:04 +0800
Message-Id: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXDvGoC/3XOy07DMBAF0F+pvMaVX/GjK/4DsRjbE2qgCcRgg
 ar8O9NKTbogsjTStXzu+MwqTgUrO+zObMJWahkHCvZhx9IRhhfkJVNmSigrnLS8vnWvQ8cjGq1
 iCgGCZ/T4Y8K+/FyLnp4pH0v9Gqffa2+Tl9tbhbtVNMkFz2ClyK7PJpjHsdb95ze8p/F02tNgl
 6am7rQyi1akvZNZxwAKjdvQetVeLN9vmrSIGpJEyL2HDW1WHeS625DW3qI3qY8q6g3d3WnlF92
 RlgFA0LEe4z96nuc/E6LesJsBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790755692; l=4022;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=7505qukM/9pBXkNc/wI7vLT9EomSNHzFj2uvuJ0Yc1c=;
 b=6Xv1swV7ZGutZx/m1cDtAUWFbUhaI4HUuVMft2+Wo4Q6FU3302v/RwIwEtH1es0oTg+vAr8QN
 iVtE+LhEMpzDx9p7NwxtNTbhefwTv2pl682awdyTy7dEHYUbVjNBrpA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: DRX5J7AcGB5fNXalKHyXm_C4Za9bDZBI
X-Proofpoint-ORIG-GUID: DRX5J7AcGB5fNXalKHyXm_C4Za9bDZBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX6yPzHT2YxLWO
 8evu+4hsSUTghi17yiGVmQRpW2AtaAmHSv7oJwNsSIDz6TnNlgNW2+8bKGGP8chK1aJoqNQkBx7
 ggELKKGZ4O6/jDd1AAjxA/gr3oGYi4Kl/ZFLIfa89vCSrgTAiP1xRrkzCG5kyLsPITCYh2KgvSH
 MWyq+tPmK048b1srKWnYyrs+vdAwcBSRHeRxRh8kLvmKodtWNhPMkWokuMd0b4FoqaVJTLzwEJe
 V2SuTId9hxMIJT/DWlGMd9tj9uUIfbXqIP3bfIbZqMvr5nK1cTpyvM5O5VnEka0kwPMx6ZG2Dt7
 7PJPSyLAQHiMK8hnObRm6xG/e68BuXxKWb8ldmSUXHVkCDWXCfnMAdnSUn+zDy+/RHva8X/P0Qp
 KAK7dEOjtrhGKxNMVqIHSGEJRDlCpdhT3KWYc5iyhUtZGWDwwBbX44B69DhLVbJ2G06ON+ogKLY
 7y2d/Jsl4nMdmjeCPDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX4vz2GshvyDSb
 9QfPpg0XOUYOpVFgj6E+Dgf4VsqeDd5WkQHbqt2TaRe+8iE3SnNKEJaUP6uuzq3/s4K9nuEvkG7
 ethFCSgW6/mQHeSJmT8/l+Mo5fNPyy8=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcc372 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_Jm3pi-UkWrk6VzsO0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300032

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
Changes in v6:
- Use named register macros in the mode table. -- Sakari
- Link to v5: https://lore.kernel.org/r/20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com

Changes in v5:
- Fix build against linux-next: s5kjn5_set_fmt() and s5kjn5_get_selection()
  now take the const struct v4l2_subdev_client_info *ci parameter. -- Nihal
- Rebased on next-20260925
- Link to v4: https://lore.kernel.org/r/20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com

Changes in v4:
- Removed AGAIN/DGAIN _DEFAULT and _STEP macros, inlined min/step=1.
- Removed S5KJN5_NUM_SUPPLIES, use ARRAY_SIZE(s5kjn5_supply_names).
- Reordered struct s5kjn5_init_op to save padding.
- power_on(): removed goto, single error path handled inline.
- s_ctrl(): checked __v4l2_ctrl_modify_range() return; removed the two
obvious comments.
- init_controls(): moved v4l2_fwnode_device_parse() before the handler
init; return hdlr->error directly.
- Removed the redundant single-subdev .link_validate media entity op.
- dev_info() -> dev_dbg() for the detection message.
- Added blank lines before the probe() error labels.
- Added get_selection (CROP / CROP_DEFAULT / CROP_BOUNDS / NATIVE_SIZE)
reporting the full 8192x6144 pixel array, per the libcamera sensor
driver requirements.
- Link to v3: https://lore.kernel.org/r/20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com

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
 drivers/media/i2c/s5kjn5.c                         | 2897 ++++++++++++++++++++
 5 files changed, 3033 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


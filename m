Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482A38424F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227160; cv=none; b=p+JV1Aa+8dhmBTnfL7d5UXzqz8W/H0oWdbK44h4rcG2qgH/7inpm0kiAfpgTiS/A+2DgNLqhs1F/4dhAS9Ec19uwjiADlYmsXwk+g8NkryL5SjGnGbIbU+AY3GLshEKoij0YD5lg8yayCf7R3mvFat5sB297lENcgM1s2veDzaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227160; c=relaxed/simple;
	bh=YsDQ9UyujMqQ9yq5kha/OUvFLqYeshQwry1s49+8/kg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KEi9/61LcDCRWcIGgUhLOX2Bazx8QQp9l5xC+M85i0lk7ITxmhZmwrksuSlcHmDfSDtBcQU0bn/JvAAAaaix3lJJq4ZkmFCar3AHQpcNjUiFtuLy/S/1uv+haRPG/83ZZm5IjtYo9ulQpVcxYI1dDJh/8w66dw4ciQpURrWL3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcNrstch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHCRz9gV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcNrstch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHCRz9gV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Eer2359070
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Geju2M3KFhtxZVo+CNv0nI50xGvHWwQoVCj
	QzGXfkVY=; b=RcNrstchccvxEyhYYPfAJYYGyYyq1He/yvhNGG0aHU+P4LZI2je
	Zvz333m/Qm0r8nbuusNpKWRHL9LjYg/ETI9xxwiF18iuG0GR2LFXqWSZDKN4byUf
	21SYvOk3XaylxIGUFUGwaXAlHFc+Nd8X+xxUmL5xXMYPz5GU832x0f8v93wuDyIf
	i5dTdlqc73y7fWUcd9dPV/uETzwIQxm8uqvTmuh2gdINYNnQthlcqEw8POS9Md0D
	y5DRg4irnLvHU8b8qD2isvClQmu8G2mdDVrNN+9AsznSTKzWKiUcmwH88YLIvLD5
	akfUjWGfQ9H1GSlNV68H5IaiJFMWhASFopw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0xkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:25:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso46750601cf.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227156; x=1785831956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Geju2M3KFhtxZVo+CNv0nI50xGvHWwQoVCjQzGXfkVY=;
        b=cHCRz9gVuhZFUSG65/UI9KRYR7wcn9+BEebXl0bqfmk54GASP4tFn3HXEUfR+U/rMP
         SpfRSunUEp13EYjwGqisNEDlUPKfPExDg/UUJaq9iiBce7r59c3U9+IRskF2r+P+VrU4
         WjuHz/WMjjdrl9A/qN3Z/gfRhIU4FoAk/NPrO81nJjdE38NGHXoUbNm/krq90oyfBr32
         6Pc9sYoACxetK0Vr2/IB+B0V16WF6N71OmYKB4oXzQwlAKBIKG5MsxvbgxNZo4xay4kb
         ogIijMEy8rGKoWlxcDlwJZBQD8N+nH+JwQLngLcwTDs3W3WVHskU5rlCs9dWED83JOBC
         FlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227156; x=1785831956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Geju2M3KFhtxZVo+CNv0nI50xGvHWwQoVCjQzGXfkVY=;
        b=KQ+b0OjIaesEFrSkC3aK7sptjo9zkZAn+WOLcTAO7LgeJIewzqivv0nvIsaaTyChjp
         BapPo9No/cPw8MI0jXh2e7VGsUd3J9YRZ4aPZJ94Xgm+u861rTV/A2xUB91vltsZcfKW
         3KxMDU5I8j8+rbtLYzQC0kQNDDSYIRl+ar3+qUKCur4oj9WIiklOHSHNRmEsxrJKE4Fz
         GDpUvZrzH3pF95UfBiXZXrXOo6B+l8V/plxLO1NcWKgGcu33LDPTjzAwET9VhhSn8sY6
         dj0NTiL4lCAL8mdgFnXJ7gm0H2icUzRd8YDRuLxRsNKYpO0ZlDoFvquVRhJrJRsPLcXc
         1hAQ==
X-Gm-Message-State: AOJu0Yw3qo7YPVQhLloyDcuWR+GDhceTaZfPvWYBRTDG6bBpje51+VS3
	dC8UzPdlJ72cOturPUoECfrkYpBdzL9Hl9tk+c/UHD0GLOX9KnKLpkImftW6vGqnGyz4GNUrJnq
	caxmdDPi9Xdzc4csMXtf+hOXFIAQUTl9rPm3ZMn6C4pOAB7bIWnGl97EQuiEKrENZYAYA/Ayjx0
	kS
X-Gm-Gg: AR+sD10zw//3ksS9vMDWvDV85Y1YRqotpHYypj/XtQFXZYDR5b3hwnAQajjX6udQoX6
	c6pTHpQaw5S3qkYPfVWQCIH7KquvzBGHVBqd2wcpy2lVhRrvmjGgcmVurvhpZooIM23OP/t8S5J
	mUEzjQ8RUjQWGtsyQK7aw2Xgu2gh4Yvi3LYr30jsFRMCwS8cNjdHuKEwRhPijXKM6qHJbbmPTIN
	hdTQevV/Npb+dqZZ76aUUfAq1c/8p3TVNiGvywJv8lVAZAXvzfrHWqslC18FZ7PoqyJp1AinGcF
	aHazBO4Oms2PjsAjmGMXb1HBD4f9vJsrLwmND5uhZFbz9Xq5yj//d4rycEHLWMyuNl1931Npoyo
	JWhL1GI2mJ7eDDgIfJv6yoP53
X-Received: by 2002:a05:622a:a888:b0:51a:8c97:9383 with SMTP id d75a77b69052e-529d7106561mr11253161cf.58.1785227156308;
        Tue, 28 Jul 2026 01:25:56 -0700 (PDT)
X-Received: by 2002:a05:622a:a888:b0:51a:8c97:9383 with SMTP id d75a77b69052e-529d7106561mr11252781cf.58.1785227155620;
        Tue, 28 Jul 2026 01:25:55 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3585484a12.15.2026.07.28.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:25:54 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Tue, 28 Jul 2026 11:25:45 +0300
Message-Id: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a686795 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=D6Y118-8ZNlIt46vW8QA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfX9WdwKw6nYqfD
 yYvqQDcecIn9FSc7e/ewvzAoFkCgMYnRoJqp7+OMaoo4aDtyNNKmMozuSiLuGFHxKEJZ5P1BPiR
 L8uFqFykP7Vr2steSwF8XRIBzABhzOA=
X-Proofpoint-ORIG-GUID: kB6r1StWVZBamjG8srGD3uCnbl2jRQsh
X-Proofpoint-GUID: kB6r1StWVZBamjG8srGD3uCnbl2jRQsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MSBTYWx0ZWRfXzkTWUR/HCt8G
 mPdkbifZGQTZAkbEFih5EhQI8q4cOLpjV5nAWPEpxKqTch8VOOcRS5wUizOB//ADkZHYMcP/RxQ
 Sk+9LGcvIDjABcPRChmLyz5azX8d0OCGTd+i6QfAyjeFLJcKkpLswKp+ZDD/KMVsejXsgUGVe1K
 5F15rw8AyQjJYxkdcRfsDSQtRck5dHvl78q3fB3Lo+2DXa8+J97gx8HlUsXWPZogYeyRbAzqr2X
 e9RhwrYlC+sc6i2+KbD2y5XlQEieAM4wLDv5P6p/iQnhP8ITl0G02fxmxe5vuYUsxortq35MFPl
 GQMhUD6g3eNC0PcOGW2VHpN5nsUywFJfi7V2ZQslR4ROPIsYZGCNSr07tXLnhPM3v8JX5ZM/ntt
 a+EIWpCo2Dw7MNal6KdLWgVromZFNOrflh+41CCPLBqAM2cPlZahD3cyzO0yRU6zq0lrYcRMbz6
 bCMGc+wSf6bWzxI5m1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280071

This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

The JPEG encoder is a standalone hardware IP within the camera subsystem.
It is modelled as a peer node of CAMSS directly under the SoC bus, with all
resources self-described in its own device tree node (power-domains, clocks,
interconnects, iommus). This follows the consensus reached in the v4 review
thread (Bryan O'Donoghue, Konrad Dybcio, Gjorgji Rosikopulos).

Supported compatibles:
- qcom,sm8250-jpeg-enc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/power-domains)
- PM managed via power-domains (TITAN_TOP_GDSC) and OPP framework

Note on CAMNOC AXI clock (cnoc_axi): this clock is shared across camera IP
clients. In downstream a dedicated CPAS driver aggregates AHB/AXI clock votes
from all camera IP clients. No equivalent exists upstream. The OPP table
ensures cnoc_axi is at the correct frequency when JPEG runs standalone.

Functional validation:
- tested with v4l2-ctl and GStreamer (v4l2jpegenc)
- V4L2 compliance test (v4l2-compliance) passed

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels
- cnoc_axi clock voting is not aggregated (see note above)

Changes since v4:

  Architecture:
  - Dropped patch 1/5 (devm_of_platform_populate in camss.c) entirely.
    JPEG is now a peer node of CAMSS, not a child node. (bod)
  - Dropped patch 2/5 (camss binding unevaluatedProperties). (krzk, bod)
  - Moved jpeg-encoder DTS node from camss@ to soc@ level. (bod)

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Renamed binding file from qcom,jpeg-encoder.yaml to
    qcom,sm8250-jpeg-enc.yaml to match compatible string convention.
  - Renamed compatible from qcom,sm8250-jenc to qcom,sm8250-jpeg-enc
    for readability. (Bjorn Andersson)
  - Added power-domains property and required entry. (bod)
  - Added iommus description with SID value 0x2040 for SM8250. (bod)
  - Dropped soc{} wrapper from example; node is directly under soc. (Dmitry)
  - Added Gjorgji Rosikopulos as co-maintainer.
  - Patch order corrected: binding before driver before DTS. (krzk)

  Driver (media: qcom: jpeg):
  - Removed <linux/mod_devicetable.h> include. (Uwe Kleine-Koenig)
  - Removed dev_dbg calls from OPP clock selection path. (Dmitry)
  - Removed camss_dev field and pm_runtime_resume_and_get(camss_dev);
    PM is now managed independently via power-domains. (Dmitry)
  - Removed incorrect device_link_add() to parent; not needed in peer
    node model.
  - Moved file-local defines out of qcom_jenc_defs.h to their respective
    .c files. (Dmitry)
  - Fixed dev_pm_opp_put() placement: called before rc check. (Dmitry)
  - Replaced _DEFINE_DEV_PM_OPS() with SYSTEM_SLEEP_PM_OPS() +
    RUNTIME_PM_OPS() macros, consistent with other media drivers. (Frank Li)
  - Fixed Kconfig source order to alphabetical. (krzk)
  - Updated compatible string in driver match table to qcom,sm8250-jpeg-enc.

  DTS (arm64: dts: qcom: sm8250):
  - Added status = "disabled" to jpeg-encoder node.
  - Used 0x0 instead of bare 0 for zero cells in reg property. (Dmitry)
  - Dropped opp-peak-kBps and opp-avg-kBps from OPP table; no upstream
    aggregation mechanism available yet.

Changes since v3:

  CAMSS binding (dt-bindings: media: qcom,sm8250-camss):
  - Added as new patch 2/5; allows #address-cells, #size-cells, ranges,
    and child nodes using unevaluatedProperties: false.

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Dropped soc and camss wrapper nodes from example. (Dmitry)
  - Removed opp-level from all OPP table entries. (Dmitry)

  CAMSS (media: qcom: camss):
  - Replaced patch 1/4 with Bryan O'Donoghue's original upstream commit.

  Driver (media: qcom: jpeg):
  - Cleaned up driver patch commit. (bod)

  DTS (arm64: dts: qcom: sm8250):
  - Restored camss interconnect-names to original values.

Changes since v2:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - IOMMU stream IDs documented in binding description. (bod)
  - Dropped "Properties documented:" section from commit message. (krzk)
  - Dropped clocks minItems constraint. (krzk)
  - Renamed clock-names to match hardware signal names. (krzk)
  - Renamed interconnect-names to reflect path topology. (krzk, Dmitry)

  DTS (arm64: dts: qcom: sm8250):
  - Removed cell-index; use lowercase hex. (Dmitry)
  - Moved jpeg-encoder node into the camss block as a child node. (bod)

  Driver (media: qcom: jpeg):
  - Sort obj-y entries alphabetically in qcom/Makefile. (krzk)
  - Use devm_mutex_init() instead of mutex_init(). (Frank Li)

Changes since v1:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Removed qcm6490 and sm8550 compatible strings; SM8250 only.
  - Fixed clock-names block in the binding example.
  - Dropped reg-names: with a single reg entry it is unnecessary.
  - Removed description literal block scalar (|).
  - Dropped _clk suffix from clock-names.
  - Added iommus description in the properties section.

  Driver (media: qcom: jpeg):
  - Migrated to devm_clk_bulk_get_all().
  - Migrated to the OPP framework for clock rate management.
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
  arm64: dts: qcom: sm8250: Add JPEG encoder node

 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  |  154 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   74 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |   23 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  284 +++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  108 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  331 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1629 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   15 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   19 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  410 +++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1163 ++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   23 +
 include/media/jpeg.h                          |   33 +
 include/uapi/linux/v4l2-controls.h            |   21 +
 20 files changed, 4484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C213750CF
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423931; cv=none; b=HAcQKDw5QAZSAyGqBdGwByi+Ae7Sse4qQi96JswxE6NsHJiRqe3UzQ6NPuhVDcv2ca/elhQKTaW1Q/Jdx9Q8ULJByrBM4i0AAioMbFlnql2oLM8v+LU2vUSERsSJfxnNMjEPZZGoyy6AbtbV+BvzpzVUFbeiCtoq6FHnWClMn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423931; c=relaxed/simple;
	bh=ix+RjGMTFu/RsD1GKAUl8ke3Cvt8fbFhsPIgvsxo5rg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kEtpoz8W7f9y/LY/ENJi2LkRyQ4F30qDDUe+C8qBEfVqoEZRotHNk0Tv9GBC/Impd0J92538FiQjQqcgu41iOrgZ8pqUBTc3m5BBSJkfqsmGmbIjNr49IAxGoiV8mX5ctmp1C4XsoKYcG91Tj0imXt9sTESqpVSs4XkDykGEYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWMKhKNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8uSb6o+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWMKhKNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8uSb6o+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEdN4l1110077
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HmVjUb4JTfmUvkHsT8y3djVv3OXH8nRRMGe
	kIVJn1wo=; b=TWMKhKNb6HapA0mQnqxM8UuNlKBWkQZ66xInyzD8u1/vzhOpIIx
	3uEux8H+kH5YuBmKEl1cDkRiyoSPT+H6C/EuTVsJlucWWUri6Uo+v/6hUmFLs81l
	ggT90SMXXr40CvptNaDl6oZJ7mYUAauyz1/E5ZDqOWNesWDYDlnzGo3kB2lmwHKG
	aJ305RmLeJjbhRXBfEHUN+hXvJEPJ664iUfVULBFA0cJAxPLfB1NQDGDWxOi40lO
	XP5iicITj9Qc3IspGERjFYBb55VZg11Xm8EqXyI5H+WHcfiuK8Ax91Gjf6IAOobU
	VR3UxZCie4kuAgQzE2PAamxt1Ir0cSeuiuA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmr4ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:05:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73986bb438eso2056834137.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423928; x=1786028728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmVjUb4JTfmUvkHsT8y3djVv3OXH8nRRMGekIVJn1wo=;
        b=C8uSb6o+s3i7fzhfllPoSzdR6gUEfyEd1/aZDwB7AqtyMKZttVJg2gz2QM7bX968az
         XWQJagQvfwU02wVWTXODnalJCXTwlIIDdA8aUlG4IsJWXQZGkRVhYAD4YRtlMCnbeeEC
         2Paqyp1V3UfUPtKKhlyRPh3ykqS/BZz16flvK2ksSkgt96kjfoDSRvEJLsx/s/aSMpx2
         i9FMABlSrLxoTLf1lJwSCZBNnqL2yZ3imS75iKVHTkcViNHl9pmhZROWAm3v6Sgl/khI
         eDxMMfvJH824fokzTOjovgdqDKCKhj6QOPcu8Yl5acVhd9nNsymyBP9LGsBWOLS3LZv0
         AO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423928; x=1786028728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmVjUb4JTfmUvkHsT8y3djVv3OXH8nRRMGekIVJn1wo=;
        b=F5OXabDwptcwvTRHVqVHspsMOQ0zHXxDg8vnm2gndcOpifbhvx72HPg9KQj9+lucTR
         Z7mHGEbELtTVfMoj+9DFzkPDPUkzNBmrv3HePHi0+4nET2l4TWK4YQRVbOK1bv7cj+kU
         XHPsrbfpt72CtTARB6VcI+OtNZoDC572Gjv1bucInSW2/CpRw2SpXlJ8fJQLbxoni832
         2qSd8TOF9tp9fvge86LxlnnjXYINDuLf8wP95mZBu9UGHnq1YajhjMRetX/p0SwKTUY9
         SJzCzQ5LrMD5UMCE46zN+L2NhspyYK8fMj6SHZ8rltvEiIscEJ5IpCD/f+Akhh0g2fPi
         Nulw==
X-Gm-Message-State: AOJu0YxwkhYmnoZ51WxjmyAB/IM1GvXvwbZGgGbpFxdefAxHPs3zu7TS
	JYgWdP7g7YjNj8+33Pr1Crk5jBFTITT5+efLFls2J4d5sBPQAZ0jDA3MsD8hh5DZYS3W3C8h/0l
	ladNMgaQhLiaR373r6mxbG+/wRTWaisHlaIV8UPjfJAohY2H/MXirtcwXFnmqBt10IaWsCodyZp
	9O
X-Gm-Gg: AR+sD1315fjMG8s0Firwne0XwWKW5knBhZtfxiibW6roNPIQldY5178YNlMMyISUR5G
	vu4Zt/OCJJp0W9kRVTuXTz+Z1H6ZcONBkQLIpqy2C3u0KEdqG15Ru2Yj9eVwLNFRbu3KuV/qDqi
	dSoq0XsLfoCLAbf/HEqueE/ncQsoonTkAsPP714helZh/u72ozWz4hTCG0irj+rzjW81+OoyrOx
	xGfEdkyxzbdKr8nHrWp+j84hKTl+jliBj5mo9fRCksq0xjqzZCxqlRjpe8Q2clPaWF+z12hjIHE
	8vfXYtXtUXx2ne5DpAgilGxEjpk4aGumtqgXUf/Abt/D40UifuFe1ce7TExHDwMZL+X7+Wpnf1v
	6lIEtqHgRxz0SSV42jdnRZRoV
X-Received: by 2002:a05:6102:26c5:b0:729:1a8d:b2d9 with SMTP id ada2fe7eead31-757507909f5mr1159605137.22.1785423927482;
        Thu, 30 Jul 2026 08:05:27 -0700 (PDT)
X-Received: by 2002:a05:6102:26c5:b0:729:1a8d:b2d9 with SMTP id ada2fe7eead31-757507909f5mr1159562137.22.1785423926828;
        Thu, 30 Jul 2026 08:05:26 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2417sm75211166b.59.2026.07.30.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:05:26 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Thu, 30 Jul 2026 18:05:21 +0300
Message-Id: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b6838 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=fvEfv-lMOMBzJYUFIVYA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: L2y6EHvvMPzUg5LbX-4CPJiWFudbp27_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX0YFJooHrDF0g
 HD3zJhDFInmJnCSGbNNp4m3Lmz8CWl04gfRBU+BmqsudOY8sdUJAwtQeSTgyFCoSY4r5JDoRu6Q
 OZLrbxu0uS6cBpRefO+UeiYNKfE0NCkYxVVoAAfCudgvYZoIvOggJJX5DJ62RBRX4M+MzTUj3Tr
 fOuh8SBLXY7Yx/0Q58l87Vqp243Ov+lGu69D2wIK1BCGdH21259es0vHQyY5S5MjarDvYxn9qFx
 siifPK715EhlrcJJa8+82ElDdTBPJwmT06ixLiHazej33tmVbPZraBuJB5PiPIF4z0IL/YxvixQ
 gwkRoRE5/GJM8+nadAdOFgK656Vz/eiZAYS2/npnmYEwwnBgfJ4syJXb5YMOafhzrUXWhEX1aQD
 ZBJravQ8kpOPcwuRe+lsUXvR/VoVlXiNHFfmMVpsZBWTB1/kOceRmegrZrvcs8NV7x8oYfNjhOF
 66tqk45Sxog3L+hO5mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfXzb/UD5h0tzhM
 R74eSBvSsa8g5HkbYuJudRrG1KV439G1si9vjpomV8WNe2UtHVOV6yedWHaq2oxBDZkC+wuGNe7
 WbbJ6VDnsaJKk2ioBsF7GcStwnxcjnU=
X-Proofpoint-ORIG-GUID: L2y6EHvvMPzUg5LbX-4CPJiWFudbp27_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300114

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
- PM managed via power-domains (TITAN_TOP_GDSC, MMCX, MX) and OPP framework

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

Changes since v5:

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path. The JPEG encoder uses only the SF CAMNOC port; the HF port is for
    real-time capture pipelines. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names property with entries "titan_top", "mmcx", "mx".
  - Added power-domain-names to the required list.

  DTS (arm64: dts: qcom: sm8250):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path from jpeg-encoder node. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names = "titan_top", "mmcx", "mx".

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

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
  arm64: dts: qcom: sm8250: Add JPEG encoder node

 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  |  156 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   72 +
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


base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
-- 
2.34.1


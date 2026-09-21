Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340894B95B3
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005003; cv=none; b=RzDtr206bv+ZKw0opPxLytZy9mrLmTJaymuXhhBDKyAaiIzR7hrPZwyXINApNsw9eXTOReeA5uLILW+ZzVM70t0fqGTPWWcBtrkWF6Z+bhd7N2MstgSii/3Miyu06Z117jIvkRXTB/Kfw+i3Kwp1axFY3fqOUTavp1chrig7vtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005003; c=relaxed/simple;
	bh=pcJWdhjz84cb6DXHdIKPuJPdK4g6F6/0ine2qUOM6b0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u2ahxwTtbKhxHlblQgUzHTEdpBmSHF6ZZO+0+scO+TOcL2/jJQ+nQBvzoKrRp4dAKwQ7ZuES6fC8Hppp7DCPMo8xGhYzo2yIh+SHjr3pJ1B79cShzBOfS9mNIYvjdpPFietechySNibvxEBh8WUtcUOaP8WzL1sn10set5se3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0VewGoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK1VPLhF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0VewGoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fK1VPLhF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAGB11016724
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6eOzpNQWLNSzIBAK86KLVL
	PNxvEFnxQq1ocX5x6ZRRU=; b=c0VewGojvwJUArzHUt++u5DuPdgjRroK8CV6tS
	sF0bieTelkvtOcmNZfRTtlXPcefTz/4gXMShjGMME/rqu42BkZuHHIhTXErAYFYR
	etU35E4hAMLEBl0QRzUBgrKeSLOalSAARQI+bdCFNK+Jvf+a81RP+KG/kSZ2LFEU
	b/3QoiKwUYQGkYT+ZNLcreJoONJLzv+t0LTjkdxymSWRUKk+6UzUjFR/sG6n36Be
	/EwsY4qQInwSZ66gjudF93uv0KrAyxzkuLohhiKkfXS+jYYD3nF+vyroG/PwaYOy
	023itQSA4OonS453l3el0z5vmnz1MirPDalG3div+5mHLm7Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxqa2qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso293217241.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790004998; x=1790609798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6eOzpNQWLNSzIBAK86KLVLPNxvEFnxQq1ocX5x6ZRRU=;
        b=fK1VPLhFAXgf1OF3dfqBvOszIsqpjImEnGe+kBQvP1oU1nmKwtXlGcogLAmiTzmhlw
         yCVW9x4FUb1cR+FAnMt4byNWVIV+lp2pMfmnbj85NgtDQUNIs0odaquGIYpUKGGd/pQZ
         R2AN7//alGzNyIUCRuqUmWKQ2Vh23+zFVbroLgHZsUjhBAn22i+G7U96TJlzK2B82VuI
         xoyDGSU8/gunw6hi263D/BqLMoTQecGjmf2cOxZJKi5lhdOihEL6XpUidY9lYf77Fmel
         chkpaqJp3uq5t38A/7bsn1r+Bx7tMm7u8Y0OuoNU7alh8ZFe5Np2P0cnckmZEbJjht8I
         8QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004998; x=1790609798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6eOzpNQWLNSzIBAK86KLVLPNxvEFnxQq1ocX5x6ZRRU=;
        b=TSbgBJAEbOZRz3/YPsIkqyNC9xvC/uV8AJkRThcHGRoiTCAOv3ejfe3TCM6TNAznyW
         jcnkHsFLF1YKm5t2nVPUkQiAOeiHvhCARzE3bdiF+7AnOq9BzTwkskhmSUedWXI7mNxn
         CrTy8gV2WoAm7VY6gjZnGtanApjJr7zTCqPLII5vltrBv1cteVkLwoMBs1PWOMldPwJ7
         LrJ4wLHR8JH692nVpZIyzbfKAOpLynd8cWL+IEbvZKXKzz4BosCZLw+Tf63r/uhed1My
         BpzSDIoux7mN+wbkHr5TJpl1/MNEsDcjGdj6kgBFreoQm4qWzSNaUCYYkg7j6fR9efKx
         jMlA==
X-Gm-Message-State: AFuF++k9rQq2/AC6R224O+nhe3trxexnS246nJskV0xN+7O2B1kvy/Id
	wAyuwMGXCFzHDMV0O9hcD0k+TTXH9gXayoo5QD98NNdvbKMFLBNZ4hAKbqPv6KuLqagBLb5OWpM
	fOs4V9QX9WSxaMYBAf+nkPjOs+M5uxosHY/B7MNQbqbFIp0bdjsCinZ+NeipcBXoheA==
X-Gm-Gg: AYBFou1hdzVV0w5pcMb7EUtz0vRg/H/wyxTTmQUH8NxmJAqt643ZrIqWx7UqZwVHJjd
	QpcZiZQRGytvjAFlAAOdSU1sy0jrnZ6kwYJhz8XayFvAQtvQp09CEzZye9q08MvHLhBq5OvHWeD
	PbeaiEKDH3WwogaDhp6IykvIlapXRgmvJc6lFENJmfys0Nupf6TL8sCqcqW07eC7e1JD+Ho6SsG
	n4WHnJeuwSW6z/t4gfM9efD6uCcVpPMtZ2jwjpQkUvOkdAjWLj6oOnaVd0BrujpmkOdBd+l0fkG
	qoFNO5v8rwJcvlt5TxBvJwyLko04qtkt7YsKR67pmI9TFd0tg1M4LXPtvMwscxuAOO9PDo6bUyF
	kYJjntlfVFoul2CZ7pTgBHrLUIcpRPfjnjN8eaBgcyggGXZe6SHIwKbKgM+ZT57hCxBdlkcMNWM
	7Eh/OFTr/zGGjrvnhD28O2GkzNsnBd5Htjb7nOnnKV+aznLFAG3TY=
X-Received: by 2002:a05:6102:5e8e:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7a55b44ae85mr4699987137.8.1790004998040;
        Mon, 21 Sep 2026 08:36:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8e:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7a55b44ae85mr4699912137.8.1790004997324;
        Mon, 21 Sep 2026 08:36:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/9] media: qcom: camss: CAMSS Offline Processing Engine
 support
Date: Mon, 21 Sep 2026 17:36:20 +0200
Message-Id: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPROsWoC/3XQy26DMBAF0F+JvK6Rxw8MWfU/qi78oliCmNoJa
 hXx7x3SBREtm5HuYs5czZ2UkGMo5Hy6kxzmWGK6YGheTsT15vIRaPSYCWe8ZpJr6sxYCo1lomk
 KVFqlVdcFx4MnuDPl0MWvh/f2jrnLaaTXPgezKYIL4KrhsuIANSgKdEjRVVO6DSZeXlMp1efND
 C6NY4VjdftYril/P2rOYtV/LcWaXaNZUEatBaYU1xKv/fXWYrPcEA1sj0hEFHCmDRPQ+uYAUU8
 Il3tEIRI0M152RrQuHCD1hrRs/+C5RqS2LSjbOgUCDhD9hOBLd4hGRGsLwqPghf8HWZblB3dg7
 WoNAgAA
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VwEO-PFGlTEhDgESMMYL69KQ8cP0mmU5
X-Proofpoint-ORIG-GUID: VwEO-PFGlTEhDgESMMYL69KQ8cP0mmU5
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab14f07 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=B25icdsSMqDT0xbHnQgA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXzIUDc6RKSBJ6
 bmYqS84P5VCHQGSNAV8aaQt4QWCNWYJzf8ffDSaNYo2ne24DhFC6/5MYK7eFvlVow5reK6aHiae
 Jb35O+q+RS5NaKy8sBjQW8nCPmo9xPRWWh2RoZwam9jcp5vectbsAXv234R1c+oUWE9JzCNo+bj
 lG6R6tEYRGE9cAjgAFa11Id2eMjrlLPrQGGCxgEvotrCsbQ8VGnitnwi3vscJy+sXlL81K4lbh8
 mEdfqTMq438zxQWMGRhUujuJjqaGYX3/6dLFALSLpCQIXEue0RsTuWcLn5KoVHpc6fj+F/4lUwK
 fLbKHpyvJEOBc+75k/S+IfyhsSov/iq6aQsaUSuRCqkBH9MkUxrU7FdD3FLmT2GWkj5g/H02vzS
 JG41sXeppnCQz9Jrjo23XOCAgkWLcgI69YYugj+tvTkN24IK2m5sUeFVa61YtQHN9VkmKHnWWJ4
 kpH77fehc0YPSiEftsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX4HtF2Ek5ApFT
 E/2/gW/VGQeHd/vTEcCwcESSPyKUSqcqppDt6BRCLHwRVqaNk1u091oCXODzOgEgx11cStuP2Jn
 mqQSRFac5d0FNKa5ZDSgbF+lxF5BNfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media-pipeline open. This keeps the implementation
simple while ensuring the design is ready for forthcoming multi-context
support at the V4L2/media framework level.

The OPE is a standalone device, independent from the CAMSS device. It
manages its own clocks and power domains (CAMSS GDSC and CX), and does
not require any change to the core CAMSS driver.

Graph:
ope_input ----+
              +--> ope_proc --> ope_disp --> ope_disp_output
ope_params ---+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

libcamera: Hans has been leading the userspace work and has submitted
OPE ISP support to libcamera. An implementation is available at:
https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress-test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160 -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  ope_input                       /dev/video10      output    video
  ope_params                      /dev/video11      output    meta
  ope_disp_output                 /dev/video12      capture   video
  ope_proc                        /dev/v4l-subdev13  -        subdev
  ope_disp                        /dev/v4l-subdev14  -        subdev

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video12  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

---
Changes in v8:
- uapi: Drop the OPE-specific infix from the shared parameter. (Bryan)
- uapi: Describe the gamma LUT behaviour as a property of the block
  rather than of Agatti OPE. (Bryan)
- Documentation: Fix the description of the block enable semantics.
- Documentation: Fix the userspace example. Zero each block before
  filling it in rather than OR-ing flags into uninitialised memory.
- dt-bindings: restore the blank line before the reg property
- ope: Keep the OPE interrupt disabled until probe is complete (IRQF_NO_AUTOEN)
- ope: Rework the scheduler state, drop prev_ctx and ctx->first_start
- defconfig: Reword commit message to explicitely mention Qualcomm
- Link to v7: https://lore.kernel.org/r/20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com

Changes in v7:
- Tie the driver context lifetime to the v4l2_device refcount
- Free the MC pipeline from the v4l2_device release callback
- Reorder unbind teardown
- Refuse to start jobs or start streaming once the device is disconnected
- Fix a permanent scheduler stall
- Complete the job when a cancel reset times out
- Make the reset-done interrupt terminal (no ctx/job rescheduling)
- Drain the ready queues with the scheduler held off
- Invalidate the gamma LUT cache when a context is destroyed
- Factor the reset-and-wait sequence into ope_hw_reset_sync()
- OPE node enabled by default, this is a pure SoC level feature
- Link to v6: https://lore.kernel.org/r/20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com

Changes in v6:
- uapi: Rename include/uapi/linux/camss-ope-config.h to
  qcom-camss-config.h and make the parameter enum/format generic.
  (Hans, Gjorgji, Bryan).
- videodev2.h: Drop "offline" from the V4L2_META_FMT_QCOM_ISP_PARAMS
  comment as the format is generic to CAMSS ISP, not offline-only
  (Gjorgji).
- ope: Add gamma correction (CLC_GLUT) support: new
  CAMSS_PARAMS_OPE_GAMMA block, camss_params_ope_gamma struct with
  per-channel 256-entry LUTs, and double-banked LUT upload/programming
  in the driver.
- ope: Remove stale .wait_prepare/.wait_finish vb2 ops, which were
  removed upstream and caused a build failure (Nihal).
- doc: Add Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
  describing V4L2_META_FMT_QCOM_ISP_PARAMS, the OPE processing pipeline
  (block order and input/output formats) and the uAPI data types.
- Copy the params buffer into a kernel-only scratch buffer before
  validating/parsing it.
- Add locking around ope->ctx_list
- Fuard a NULL/out-of-range stripe pointer
- MAINTAINERS: Add the new metafmt-qcom-isp.rst doc and
  qcom-camss-config.h uapi header to the CAMSS entry.
- Link to v5: https://lore.kernel.org/r/20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com

Changes in v5:
- Make params definition ope specific (Bryan)
- Add pipeline/params helpers to ope driver/subdir.
- driver: fix COLOR_CORRECT base (0xa00, was 0x400) (Bryan).
- driver: fix DEMO INTERP_COEFF lambda masks (G [7:0], RB [23:16]).
- driver: map pipeline blocks individually, dump per-block HW_VERSION (Bryan).
- driver: disp subdev is pass-through, mirror sink format to source
  and make source read-only.
- dt-bindings/dts: map the CDM register block and rename node to isp@5c42000 (Bryan).
- Link to v4: https://lore.kernel.org/r/20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com

Changes in v4:
- Made OPE a standalone device again, sibling of CAMSS rather than
  a child node, following maintainer feedback (Bryan)
- Aligned params with ones suggested by Bryan (when possible) (Bryan)
- Correct usage of subdevice states for configuration (Hans)
- Removed the bufq and scheduling helpers (now in ope driver) (Bryan)
- Moved generic pipeline and params helpers to camms 'core'
- Fixed Green hue with some downscaling factors (reported by Hans)
- Fixed ope_enum_fmt_vid_cap (Hans)
- don't hardcode DT assigned-clock-rates for AXI (Konrad)
- Link to v3: https://lore.kernel.org/all/20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com

Changes in v3:
- Simplified camss_init_pm_clks()- no clk_get, no rate setting;
- Added Assigned clock rate in devicetree for CAMSS AXI clock
- Add Kernel Doc for camss-isp-bufq exported functions
- Added description explaining the 2-cell for CAMSS bus
- Reworked OPE media topology with intermediate ope_disp subdev
- Support for crop and compose in ope_proc sink/source
- Fixed Write Engine violation with some scaling config
- Fixed input/output custom-stride issue (Hans)
- Split uapi header (camss-config.h) into its own dedicated commit
- Patch reordering to respect dependency in regards to ABI/dt-bindings introduction
- Link to v2: https://lore.kernel.org/r/20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Loic Poulain (6):
      media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      media: uapi: Add CAMSS ISP configuration definition
      media: Documentation: uapi: Add qcom-camss ISP params documentation
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

Nihal Kumar Gupta (3):
      dt-bindings: media: qcom,qcm2290-camss-ope: Document shikra compatible
      arm64: dts: qcom: shikra: Add OPE node
      arm64: defconfig: Enable Qualcomm CAMSS OPE driver

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  155 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   |  150 +
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   77 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   77 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/media/platform/qcom/camss/Kconfig          |    2 +
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/ope/Kconfig      |   16 +
 drivers/media/platform/qcom/camss/ope/Makefile     |    9 +
 drivers/media/platform/qcom/camss/ope/core.c       | 3706 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  412 +++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5238 insertions(+)
---
base-commit: 1e15e15a1225e9349fd87fb3f285ecafab73b3fe
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5936826B
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179237; cv=none; b=bQ7womehEBTniw7c/HeyafLI6488cQIYh3cSDr3toK8Op44onP4zVhV7gpEJfaKQTudgPqsGUenzHIdet6FId3erIcQp0H2UmjoifZWDwTmrN0gX17HCMpxte6lpFAjE8v5eMVlQ1b0i/8Xw5SF3SEzkZivONgwmzPp8mfOoAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179237; c=relaxed/simple;
	bh=p9J/2V1tggqNybg8SZwARC9tUvk8rUhitOpMpYKS1Rs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tPKZh028P4QS7jc7P8PVLygOhkoQ0parlkhpdCJNhjQZvbQw/zwKnSvveeNzGWNUB3fzh49bhkQOA0SeY5UmJ1SMjdadbTWI3QDezL4kwuXNYeW2P7UD7AWJfFF90bIo8Xm4bUespU6MpViWGQU4wo8NhSE8jleINI+96eyLM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/TUgfKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrNx8nh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/TUgfKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrNx8nh/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSwE2443264
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vuq7fVCe/0u0opzXGFiddm
	mkAukBxySKUDFQ1bjzy60=; b=e/TUgfKEh4S5JM1By3v2WB9YTLcdqbDhBWBVGF
	97BnM9JIIXJC793yTLomRy+AJjjMhmaQSxKOO3m0NfXwUSpMY2KSi7hdWl50bTCe
	SfJzpJYE66I6v+647BgMwHoJrLEbWXuIgSp7drMJT5KgaCTGGIB7nm0BbWKs6L+K
	YdFURr1HGHlgMGx2glQtB7HLLOTZnv0TrEVWVWilv/HPsCeFnpkiMXJoRWVdjMvy
	krN2m+aKLl7lyzUAX5QmMqmOZR0D5fw6xZDxzW/voQvJ0whujBo9xxF0JX7/aYkE
	D5Nboa+9PjUvqlv91xBKBbcFKYefKBgEOvoZAjppKpyWgHHA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hq19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-985230fb3a3so51806241.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179233; x=1790784033; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vuq7fVCe/0u0opzXGFiddmmkAukBxySKUDFQ1bjzy60=;
        b=QrNx8nh/eRBBaXiePmj5W0ANjgneW+OhfHhhzBl7S9gvhEwkemeA+e+B2/yLqiYvBZ
         2sEuayx9fdtwwKQ1PEf5RL5bYumwI1VySXw9SV5vv1zQAcp1aW/DjDxNrjMtjAz9yxKR
         n9QhG9M5YnQYy5GTH2VDJT2ZBoqpdX9ykw8AlRLZKKL8BlDY1iiD0O5qMwEJpiO5VO5Q
         FSw2BFZKaZ6YIrxdzufB0Th8GzgfbqOPka6xhvT18pJJiKn9anxrjLtHYAdqpu06d1V4
         kiZ96Ux6kmy72YdDib4jEOa0+5bFcVobBgKXiaG66ErnPZZr73rIRnUdmg28MUPQSC5D
         iMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179233; x=1790784033;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vuq7fVCe/0u0opzXGFiddmmkAukBxySKUDFQ1bjzy60=;
        b=QgmhzpnDI4LxOU4BdQiIFRw8Has9mMNERIybD2+z0dA72WbtH5+BlfHryWfTreSDG0
         0WXfB/uhBXd/hsF7XXvwgAF55ClEVK4BJ/ymwkpTUlqg2vVVl2+RfTLvlT5mSsXN6kXV
         CPVKTusQlDMazhYt+wJyL4jbO6r1tokruc8vU4jgKSWjEvDD5wQ32jqSWhYixAUQ76m0
         hVSu8WFA5kb/MHo6ZOwA4t5N+dUDj4nEa6uaqcpZVc27bjTbTmNHV07ri9X3OMERCRb4
         1iXbTwbeeDnTgZLfK6St1fDHE9tZHDa3eI6E4IJv2JEnaUeXhIeaoFl9zax/+gXyOrbg
         c5xw==
X-Gm-Message-State: AFuF++lbKlckShodIFqrdsbZ0bL4ddGE7JU1u+K40h5Nk/MVEePgA8Qk
	v4qCV1MP2BzMG2I0YUncgSOt23/5VgFDg5bXRbB1A6CnUxjVTapSWl7BhBKsiuD3sZVAVhhc7CU
	GY4BYgsdfss4yx0G2mg8iXfdfUHE9qj2750ctsIR3odgvBfLJIwiEdxMeH+U6AkaCuA==
X-Gm-Gg: AYBFou2c7shIicZ6vVHU7mKY22HUJA3qBlDZLHulZ3JlyrCirOJyPDR7NNwfs0jPpvZ
	vE4Ktpm8ylNimXIBzEY8k79NJDMPbx+rn634jVYnhWedUaSqQSCGI2SlFuZDftq0tKf2MeI+afx
	hnKDIXgBj5kAJV8WXqwm8+jfNzJnaRUA2QfF1Ushu8Thgr/COxcs1ykR4FbTnsaU5aGSIK4WfPx
	H5TrMNoco8pdz+V7rmyrUfwsV0tyq69k9rlISFQV0XKtm3cplkZQ5EGL1AzAad3BKObUfjLdzEK
	NkUl5XB6/FWAAM1QCz0jPpJh5O+7iWFuBRW+V+XR/8lu6N/pQngmnA4VzzbSQLJZXTjcIvTIqvA
	JPqVHBpF+BNeZIR2OTUbed9kN+U18KVU1iSBwxpkS+1OrkZRKWAXo5cDzGKwQ0UwGTBxckVenWe
	BYchd7vPdS4h2k2XZrP81o+0sTzfarU5HPbn333U2thCz2pKAyX5ZleHgnBRcuYA==
X-Received: by 2002:a05:6102:c8d:b0:7a1:f980:e933 with SMTP id ada2fe7eead31-7ac1b618e50mr2814233137.15.1790179233236;
        Wed, 23 Sep 2026 09:00:33 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:7a1:f980:e933 with SMTP id ada2fe7eead31-7ac1b618e50mr2814042137.15.1790179229693;
        Wed, 23 Sep 2026 09:00:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v9 0/9] media: qcom: camss: CAMSS Offline Processing Engine
 support
Date: Wed, 23 Sep 2026 18:00:21 +0200
Message-Id: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJX3s2oC/3XQTW6EMAwF4KuMWDcozg8Js+o9qi5CEkokIDSZQ
 a1G3L1mugDRsrH0Fv785EeRfQo+F9fLo0h+DjnEEUP9cilsZ8YPT4LDXDDKKiqYItYMOZOQJxI
 nT0QjlWxbb5l3Be5Mybfh6+m9vWNuUxzIrUvebApnHJjUTJQMoAJJgPQx2HKK996E8TXmXH7eT
 W/jMJQ4VrcL+RbT97PmzFf915JUHxrNnFDSNEClZErgtb/eWmwWG6KAHhGBiARGlaEcaqdPELl
 DmDgiEhGvqHGiNby2/gSpNqSmxwfPFSJVU4NsaiuBwwmidgi+9IAoRJRqgDsUHHcniN4hDI6IR
 sQ5sLoy3GpD/0GWZfkBzYDZlVICAAA=
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
X-Proofpoint-ORIG-GUID: a0tly1raekmGz4E9QERwfgXKCKf0wMFr
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3f7a2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7qzBkRZv_swLJ3S8KTgA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX8E23/LZ2+1sd
 46RIuo0vlzSh7rp9X9YfLWkjH4tHp6v4QLAx0JD4GxPHPfYu2CJ6NbGLvdD0VslQPJ5AEmUWVak
 /amo2HgJSaSVz+pNvpAFcUkWCaOK1olq3DwZ4IV2+H/xb49+Kq+B1Ka5/LtdxrKZ2X6/v5+PZTp
 rTWrXMplTYtPeBcDX1D1fS78APpp4VYxQMFkkQfmrvcPWXBGKSLLvg/rUzFTo4P1BaDWt/f9hDs
 rwjfl6TbVMJgswPw7OfFwFe+sQG9InHfn0UIgKCwBzyVo0+L0gG8r0qFrGBjgrwU1MwnhK2ObAw
 KCbejQsVWRPCh3KW1vq12Ap8mlE73pGVg7UZY7jl088gAIxgcnGjnio2dxShDV1SDY3DkvWLClz
 vrPdfGa0iM7BNvPP9jbFiqaZhVIl2lV4upgqkDzz+iBJrZcYU348LW2mOHLhNMFOPd/8wZBzY9N
 Ay4I25U6U3MG4G+eACA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX3oBuh6C6CPv9
 pVZYUF7DH8mySq8hZFq0SFFMah75fUkhjyTVuo1zppKUqp9YnqYlkFwEQYWKEF+y+zWL0ZeapyY
 olwYhO+DOkSaZFqR6I9C5ZLR8DU7BA0=
X-Proofpoint-GUID: a0tly1raekmGz4E9QERwfgXKCKf0wMFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

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
Changes in v9:
- ope: Release the vb2 queues owned by a file handle on close, so
  buffers are not leaked when userspace exits without STREAMOFF.
- ope: Clear vq->owner and the queue private data on teardown.
- ope: Align the crop rectangle to the input packing unit (at least a
  Bayer pair) and the compose rectangle to the output chroma
  subsampling, so 10-bit MIPI unpacking and the UV plane stay valid.
- ope: Factor the duplicated format lookups into ope_fmt_from_mbus_code().
- Documentation: Fix the userspace example.
- Link to v8: https://lore.kernel.org/r/20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com

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
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   |  147 +
 MAINTAINERS                                        |    2 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   77 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   77 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/media/platform/qcom/camss/Kconfig          |    2 +
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/ope/Kconfig      |   16 +
 drivers/media/platform/qcom/camss/ope/Makefile     |    9 +
 drivers/media/platform/qcom/camss/ope/core.c       | 3782 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  414 +++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5313 insertions(+)
---
base-commit: 1e15e15a1225e9349fd87fb3f285ecafab73b3fe
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


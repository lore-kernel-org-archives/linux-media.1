Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768177;
	b=xwqw/rq/v2R3xqetEflumnr1H4VZeBSFHybQOb8+xZP7PglMeiTKTekaLrio2mhKcqNy
	 59kKhjhF72jYSYXCmUpbDvwDTkTEie3895g3brjYz9ZSyovViqeKymltLT5cURKnJOw7Y
	 q8rNbFKSesfPqslBBdEkZpds1p/6rjImLPJ0q1Nqy0Z2t+Q3XL9XOMzgcCR0R/48/+5L5
	 nr8bUOGf32qfNGnZGsP+0PgXXxtCBYSy/RDZJGSV33znluQYBI17pgY3ZN2h/paOyXTA0
	 7gAlKLaNMR5cwM6GrcqalcOHmpw33KT/gYO5k+gaiWzv/PFg25OLJB0JVf14AS1rqNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
	b=FynPJbTbZHat6oeNnryy8CJhcivAmUcp6JYJ/xlpFH0yxbhheCvngDJLFhY1HPKVz+Lu
	 UcBVv1VSIJ9dIUAuxXbUnZ14qTiLvcSxx7baMWKD+pY6lH+VVLH8mJngCxIb42Pxo0dRn
	 HqwGx1PQ3nv3DQT6CHj/RMr6ZoFDjbKpF4eA3yYF253f5V7GZjoNtZD/w5TE6F2GrhgPi
	 HG46fwdCjHlpSGhHeop6bZi2ZVaz9r0k2dS1P27qFPYvBA1D4VkxPft0nqGl7vwCNRw1t
	 r4HTz2nhdv68qW8fc28mBlT1NgblyhyE69LLYw0qz2VUH1jkMnsWf8OD5UdG1GwEnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1fBSC6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eqr5Tl2Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBE606A321
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCBE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1fBSC6l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eqr5Tl2Q
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6T4c2676070
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0KPRZuQc5dfgGeGt/q9UkE
	/A0p5K/7gyw/B+1f7Fj/4=; b=P1fBSC6lT+FORSGySrK8RsbvG9jUQnpgBKkykD
	cnqj8yO+M7S3vEIspFnTW8Lv2IuPGS4wT2WVWlEpGQLojbDMQpB+ZnkgUZN4oXZ7
	pKlWnlE8PsQ3Xg5Q+idMw4PBUNwtcdryTXkMd0sgCW1m7WV9HJS/yLanOnjbWjZB
	opTehQQsZMfbKPKE0YfkUD3QUHDeFvz3vnBlTf7tlxOdsFW6y1qOdqihT0iDeJT9
	QY22XFtFXXWwZ1Bwt75Be80czygCLOZ+y4qb6PTV3aWXoBhgB1XF1eopzzICJUVl
	qjj3G0y3HZHd2iK31l4ypgWya1SMnM4wrWS2DDyMuHb+UVDA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvnyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso789557241.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768175; x=1793372975; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
        b=Eqr5Tl2QpkMvySoskIJZBMTTR0QrO93hzZ4jrUVSK5pzzOqS6TBFdrVjUfh4eNVuDl
         6SBDKix1Ey0jnsTa6WFlZt78dYljEayp5/f+FI2G52M0FGMlFZlDPA6fS2G/b3MhwNWN
         b0UypNbiVcmQikpB3JfVDQN31S7VH0OdFz78dT5q5NLtBStTJnEOQe+UDZHNLT0JldH7
         akuiCVoZhsQ4k81qIwZTd6onyR50xVqqT1GpclslbmHUk9SYshhyh5dwJMRnMp79JR0+
         rh9PtiWnb2SdhyZglj43tTFRRFRGiWuKcsuVrmVuO6a18QYGHIMXQfDevTbMKnjaZFNY
         2UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768175; x=1793372975;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KPRZuQc5dfgGeGt/q9UkE/A0p5K/7gyw/B+1f7Fj/4=;
        b=o334sr1Hs73ST0BXIXoeW8l0azhfWD0Tfmcia/zejmTtrciVIqj6NKclo0we1hVTaE
         1j8A90v/lax6/Z9c+MSx+Xvg77FPk8Ey9Gy+d/2eDX+jwNUUp87AwzSguHUGVpDTyEBW
         EOplCM4mIad0Qcyc9Uq4gTOg/MeYowJtoCWFya+bXO6ecdKoXRbx9FdIdzDkPi33OBIX
         3rlu6khwF1K+YhVqvmT3h0TOeHl/HzYZQjRBDegKuqlchf0Iy2EULS+yDJMqerJxdhkM
         0B0OxTiULMj2iRZr/u6AR4DXBBY1zMdZZKGxhX0e15zedyeFca1U1Vrh+gtCDwP7OcoB
         RADw==
X-Gm-Message-State: AFq9FYINyFv4a8Os5zawQmUnmsVRmnwSMGrSryvZbxxTpVB0tkTTm6iN
	YG5CW0tCIcy/KO+oqPlHo0fwGc6MlG8+IUbd7r8QmF0cGWOE37TuG9aTZdhQyXKrZT+My/z9qH9
	ENKTDbSXIttFWKj1D5Hv7oVhnIaBAVtkPPctaV0I69VriFlM8BE5fp+zxtt8aUQsKBg==
X-Gm-Gg: AYBFou0VvYNhrELdGrif+XeEEWHZViqdcSdk/KQg7jKE8805TGi3XYuTKQDYrEpbrOI
	d/Bef+r/4HDfXcR4SH34jnsS7WyRIc6G5HXpzOuEg5HLd+eucUzDrEOMi91WZK9i+2ddO+kMAOu
	s/k1uHIMdkjdQIKw+M+yqkdxDf36k1NZVeZxa7/snIr0oyDgQcgQbUYDrLylv61V4AX2TWS3Ivh
	kR41V9UQfh6rxKSTObjyMSkTyPEqE5bCY1p8c2MiwqcnusuY2cPd8TY/Mdr69KXvl6GJ0fMBCtv
	Szj2u88h4YbY3KTqLQ8yTjtpuy6ehNlXmg1ms+CBS3gLRqnK2MIXTsGvtRFjeT1kGbgwaAk0EfE
	JrZDcSxDLKwa4xFWR734kVIg/R1P0C/2zvWCyr4E3qAqjgoxLhg7L2w0GrVv/t/gN575onjcTBi
	ngnRBHNz2Mzf46b61kKxq4j8zEjXr8Or1Qd0SLVMyG8sx2BWivOjs=
X-Received: by 2002:a05:6102:1625:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7ccc33488damr1083675137.23.1792768174408;
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7ccc33488damr1083638137.23.1792768173796;
        Fri, 23 Oct 2026 08:09:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v11 0/9] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Fri, 23 Oct 2026 17:09:11 +0200
Message-Id: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJd422oC/3XRzW7DIAwH8Fepch4RNhDITnuPaQe+siI1JQttt
 Knqu8/tDo3ockEyEj/+ti9NiXOKpXndXZo5LqmkfKQC4GXX+L09fkaWAl00yLHjEjXzdiyFpTK
 xPEUmndJqGKLHGBp6M81xSN938P2D6mHOIzvt52gfikABqAzKFgE6UAzYISffTvl8sOn4lktpv
 8724PM4tnTc3H0qpzz/3HMu4qb/WYqbKtEiGGfOAVcKtaTfnr1bsEU+EA28RiQhCpBrywX0wWw
 gaoWgrBFFSNTcBjlY0fu4gXQPpOf1gJeOkM71oFzvFQjYQPQKoZFWiCZEawcikBBE2EDMCkGoE
 UNICOBNZ4U3lm8g/RoRNdITQoBWwYNxZms7wNfKUz+0MM6wQ5QAXEjv/mGu1+svhyafbd8CAAA
 =
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9RV+vEnz21Go
 J2X+P9DNrXnXt3/kysUNtcezn0ZHS0/HvK55bgsvcbwIvZjQltJItgkrRIwn2+VRk+g35IYUolR
 ZHIkNRlpZ+jbGVUjmOWneG19oYEfxXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXyShgfymV1rTn
 uQ8vPVXWWFZveake3MxXCfc6iA8kJAAAG38XXz+0+MJHkXRcxL0mX92BtGXkcl+4b350mJsBRcp
 FP79f/7LYO8txslMbXxdGumpa1UeXgxj01tMFKaYrs7b5HKkpTOWeIx/92unReMD1bLf/mRyxAH
 QyLZkjOJY+PmKFwo1HVlbqHjZn+k0/U3kZLcqAaQ9IrHYyZD3336Hqal5AC9dSBK0MSyiA0125p
 WKvH2PafW+wndj91wYG0P+e3pWSb5khV0UPSv426SkNmF4NJdAhk8JyEAXNmRdEQzlO+KCy9Ivs
 pjnj65iWXhwiLjxtvK1usyomSPPORhMl6Ec9HTohsqBSc0ku0y/seE+c/01Vcl1SJ8+MfBk/4n2
 4kEAaW0yt6/mxoAAu8pNAa+z41yJqXdAKTi4QlNvPnq8u5NrNvmdewYu+Rnsu/jV9MGYtcv88Iw
 CQI0EW/yF5PZ1P9rEOQ==
X-Proofpoint-GUID: QoPBq5t47nHoVIkF_O9GCBvNNwM8igmF
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb78af cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jEnBGcp_S-U7jcHEVloA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QoPBq5t47nHoVIkF_O9GCBvNNwM8igmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

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
Changes in v11:
- Rework scheduler pause/resume
- ope_sched_cancel(): synchronize_irq() unconditionally
- Add reset_mutex to serialise reset register programming
- Re-run __ope_irq_init() on RST_DONE, a SW reset wipes the IRQ masks
- vb2_queue_error() every queue in ope_unregister() so blocked fds wake
- Take a device reference for ope's lifetime (ope outlives the binding)
- Collapse the three per-queue rdy_spinlocks into one queues_lock
- Use div_u64() in DS_Q21()/DS_OUTPUT_PIX(); fixes the 32-bit build
- ope_run_job(): publish hw_ctx/hw_running before programming the
  hardware, take a typed ctx, drop the redundant resets on error paths
- ope_release(): take ctx->vbq_lock instead of vdev->lock
- Drop ope_adjust_power() from ope_s_parm()
- Adapt to the renamed v4l2-isp API (v4l2_isp_buffer)
- Expand the locking documentation
- params: switch wb_gain coefficients to s16
- Link to v10: https://lore.kernel.org/r/20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com

Changes in v10:
- ope: Split the input line evenly across stripes instead of filling
  each one to the maximum. (sashiko)
- ope: Reject VIDIOC_SUBDEV_S_FMT and VIDIOC_SUBDEV_S_SELECTION on the
  active state with -EBUSY while a context is streaming. (sashiko)
- ope: Validate the geometry when generating the stripes.
- ope: Register the media device only once every entity and link
  exists, so userspace cannot observe a partial graph. (sashiko)
- ope: Add the missing MEDIA_CONTROLLER dependency. (sashiko)
- Link to v9: https://lore.kernel.org/r/20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com

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
 drivers/media/platform/qcom/camss/ope/Kconfig      |   17 +
 drivers/media/platform/qcom/camss/ope/Makefile     |    9 +
 drivers/media/platform/qcom/camss/ope/core.c       | 3932 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/ope/params.c     |   78 +
 drivers/media/platform/qcom/camss/ope/params.h     |   95 +
 drivers/media/platform/qcom/camss/ope/pipeline.c   |  405 ++
 drivers/media/platform/qcom/camss/ope/pipeline.h   |  239 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/qcom-camss-config.h             |  212 ++
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 5455 insertions(+)
---
base-commit: 80a4307704c4cdbe5be734fe4531910486c941e2
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


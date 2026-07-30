Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36943F8D3
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423378; cv=none; b=PnQbQKbkF/S37P9ItpxUrroNoxFzjMy8+qp78cabomfI+Qy6GH/Ova77/d7VdssHzOqZbgIkv6KO8BP5rz52QM+s0SPdJjhLaQBdZXV07h4y4K0OGspQWcqLch5ugi7aN5HaWdN4Qx2pFJ7E0Pl3jg3doV+bVYQX5gpaUc0RRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423378; c=relaxed/simple;
	bh=i15v7NfA0G8LeL3ceoHb0AHZBBYXSLVi9w5fDNayDw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nBxPG60/GGmDdhkAkpNRrxoAqU3REDQA87WTAHL/czrjkuTGV81wRx3fo/9HDGHMY3B2VfdmIBe/AJ0uedMjSLCk8c5BbXgwBe6YuxK88l3w1gpBDZzJJPS2Qhgxd7CeBg0qV4IYGO/SGAIVZTmeTZfn8oSKp/ShwEYUm830QVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVr/+qXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gb38Xq1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVr/+qXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gb38Xq1w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDeY3S1228885
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YVZUhyoBEN4fRFwvQshCw5
	QZvFSf3IlNlL4R2vxJ3Sk=; b=VVr/+qXi7KTq51V4HBUpaEL4CWldZf/LLWdVuG
	FQMVlp2wPkQ74QnBlg+Y89NZ4oyiOOgHCM399XBcaYvd87qPSZTpccsnPeVtwl5R
	QrKzYOqPFOIioYDCg/mjZeh8P+EtHKx7nqsnAbhFpQz+kAbB2lgni5hMcVY3bPgv
	GQjBitiEENAh5Mi+rWL4E9ih6Onf7agkXoR0fkr7v9RGnsXVjbAfmvs1Bb/HXoFh
	+10ex3pRrQcyAoZZQFmdjMEqwmbE/FfJglGJZfg0gtQW8oR2d3PZEPTi4HnplzJH
	dOCCdkMksE9vjM0KeEquqVAy1LxODgplBkat9PlVr66gqVGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3gbyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:56:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so200856a91.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423374; x=1786028174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVZUhyoBEN4fRFwvQshCw5QZvFSf3IlNlL4R2vxJ3Sk=;
        b=gb38Xq1weHoG3B8zO/BYis3ANcq5IINACJm7G5PmSHCsCEG7gF/HHIO72FIkGMLv0A
         9OCMEYayQW5DaerdsYSNDRKWn10AZGMb4U0vpaFvNBOckhXWk2Ahj11QGxctu23+bANz
         +XloclovjgSUSX+vUVXCgoDOQkGUMHkj82sMFKFK4xIgGm/aB/JvjErl2o1z22HfRzDJ
         dFxkrNWhhsuM3UZPCI0dJZKW+sbUs6mzakTLS9N/dJY3WhQDv48QupcZjq6dloNlsDWS
         Ryz+xJAydWA9Kuty0nNI+sOmyRoEhY5etrtT81g4WVmFukGq+aeX2sAsx6PmJpyVIQd0
         JaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423374; x=1786028174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YVZUhyoBEN4fRFwvQshCw5QZvFSf3IlNlL4R2vxJ3Sk=;
        b=CBzPVnaHLvtkYFVO3gMxDZq9YVuTsd85mPZQnJ2Ak+SQj6Jmcqq1xNJvfzmhT0egki
         nZoVKWgcgLhvl0Ni+iNL2hlndDogJAqKKxJN2Z7cg3e41WhnCM1D8qaeC/YR3K/sRTTB
         RwXNp0/4WDBozF5NtkwOhQ4e3lULm8mBRZZXD/Ywn9wbcs60R4bTPMLjuBFUgqdqvKsL
         GwVFQUIpWX4KQUmCL+w57ZJ/wBz9gtriOqO5tOQvMhxiGngeyJe48dFGf0g2bmRoKsj0
         ajFcvIbz55ykW9M1Bk/rMje/LjyqBuiDyQwJgGykpcY4ALu9lCjbkq93Piy4M08P6Yy1
         bXAg==
X-Gm-Message-State: AOJu0YziNEi58Q1zqw245UWosEF89Pq2J8/hTZSEITCfyzc5qse+EaRK
	bzBHL7zGkuMHyRARoG1THjZSWjNHJhnkUs06iS5ByavsfM8OREGUuKJrenqm8Yn1yUR4dU5IRLC
	VnUK1uFemfIM++668FGUZUPGsXZm3yPode87if7XuE7MIgxpiBUkUyR2wQMVLzlfPgg==
X-Gm-Gg: AR+sD115puW2XkOB9h+RNNin1Jzb1Vlxby/5if4wNaF/CF+rVplNgWM+n3eEoThbC3i
	qesdOJP41dA43P40079VFrZXtpOpndtslm1MfRzGEFeKXqYvUqWSZGTLYuq+cF5jq6qp+qyym3f
	MpW00xRrhwCMFfjR35vmBt8eyXoP+z2gy58Py4pF1mbuHOysVqXxmQgJitfHTpokS8FCW2oPrPn
	frFTYCuSL9C+ozBMPi0AQhdHzEUNr9bejZ93khTha0ra1/DgwDa2EqjsLyim/+ILOcxMXCZ5zYX
	XyI9KY220i08oRhSKOGisDfCo5Cfl1Z3v5BAVYqJlNjWl4A7SyjYMbfagOeCi0P+xaAUv4GXCP2
	+JdYDSTg7MahbcpkbT5eHDN0M/RScVfQ=
X-Received: by 2002:a17:90b:3c8d:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-38fa7e3bcc2mr396540a91.17.1785423374271;
        Thu, 30 Jul 2026 07:56:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-38fa7e3bcc2mr395451a91.17.1785423342801;
        Thu, 30 Jul 2026 07:55:42 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm1236775a91.17.2026.07.30.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:55:42 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH 0/2] media: iris: add vbv delay support
Date: Thu, 30 Jul 2026 20:25:25 +0530
Message-Id: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1la2oC/x3MQQqAIBBA0avErBNMpaKrRIjlWANhoSCFePek5
 Vv8nyFiIIwwNRkCJop0+YqubWA7jN+Rka0GwUXPB8kZBYo6rUlbPM3LpJJWOCP5qATU6A7o6Pm
 H81LKB5EsBwRgAAAA
X-Change-ID: 20260730-iris_vbv_delay-343d2fa30842
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785423339; l=2393;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=i15v7NfA0G8LeL3ceoHb0AHZBBYXSLVi9w5fDNayDw8=;
 b=qwwwCqdUu5sUP/qT03eOGkXPKPimJJsfDcs1Y1p1fLBPFEe/dx52w0YRUd5CTyYrxjQOrfWf+
 X+GJzpIxYi4DNmm0D5lkiparjLnnkWYdSq9Q9BYYOOSSLGYQxjnYdBn
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX43hK6blqOUXh
 C07BFWnZreAL13SSdFikUmr6L98RWf8uY3Mj6P6ZWuMDToJR/OjQKjbl3C5UL8zdXiDT8qrh+V1
 34kRJLOrADPk2fLtfu2/WUV0a/8zaIO4GjwFOSTMplt/bVQt6iPPwJiRW7R+D5KHwFF+jygJZz+
 m6RP/uLm1BNjfnJBP0PRzx1DEKhzmGURZpHwRBnZYL42svOn2hjtiyeFp93zlS+DChG0IH80ZEl
 j7OZqfslhUrHaUUJ0K9dP1owfvMMH/j2e/mvdmwS+zC0G2lvmfQnuveEA+K2N5dSqDPQKyiEm8t
 OmXcHXbKGUahqiyGpwQqQrvPG1OgvANWhrPuTpfaBluxBbLeY4o9j86bcFj9keuVpttOdwEGLUf
 DFH/fFcTbHgsX1tiyG8g0hvHw2GGJRHkBeeyd37cGJoptjou6nmyZzBO6DV56VWBD1NiA4EtpRw
 dlNSJcqUAe9P0a6laBg==
X-Proofpoint-GUID: Jo7-HfSVB4n_VbcyV2JNQTEw2l1BnPIb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXzuCnQcLuMak5
 dMXmQ/0HiRd0IUWcwbF3m82QYwcwrkdd6sSrI8sMDcwWbZbC6HtswL+21eFf6onvbJKSbrFTmO1
 eHHLutLrdqts/pfq+z9vum7a4xhKwWY=
X-Proofpoint-ORIG-GUID: Jo7-HfSVB4n_VbcyV2JNQTEw2l1BnPIb
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b660f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aUd6qWveWT22gvq2jjMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300113

This series adds VBV_DELAY (V4L2_CID_MPEG_VIDEO_VBV_DELAY) support
for Qualcomm iris encoder sessions, allowing users to configure the
initial VBV (Video Buffer Verifier) delay for CBR-encoded streams.
This is useful for latency-sensitive encoding use cases (e.g.
low-latency streaming) where the client needs explicit control over
the encoder's buffering delay.

Patch 1 is a prerequisite for patch 2. The PIPE capability (control
over the number of VPP hardware pipes used for a session) was
previously only wired up for decoder sessions. Achieving low VBV delay
values (34-100 ms) requires the encoder to be constrained to a single
VPP pipe, so patch 1 enables the PIPE capability on the encoder path as
well, which patch 2 then relies on to force single-pipe operation when
VBV delay falls in that low-latency range.

Patch 2 adds the VBV_DELAY capability: it registers HFI_PROP_VBV_DELAY,
wires up the V4L2_CID_MPEG_VIDEO_VBV_DELAY control for the gen2
encoder, and only applies the property when rate control is set to CBR
since VBV delay is only meaningful for constant-bitrate encoding.
It adds vbv_delay support for iris HFI Gen2 based targets (qcs8300,
sm8550, sm8650, sm8750, x1p42100). Support for HFI Gen1 targets will
be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 \
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
initial_delay_for_vbv_control=300;" ! filesink location=/opt/test_enc.h264

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: iris: enable pipe for hfi gen2 encoder
      media: iris: add support for vbv delay

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 47 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 19 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260730-iris_vbv_delay-343d2fa30842

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>


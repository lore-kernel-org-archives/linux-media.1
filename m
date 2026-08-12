Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451CA32B10A
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564901; cv=none; b=h2RULvZ+WA7H0rRLnFoGHorZx2NJKSmfn3ifQ11plP5Zo7B6Ij2pTTpe+XnEEhFoJpfAusCpLYrHjAmwp3xYUOmWVIpKEPFSjNhvo+vjF3CSiuvQ0K1J4/3mWt0JkjdTCgjbYRawb9HSTigGvJ8HO+Tk9dokm6eNzn8SWnY7uuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564901; c=relaxed/simple;
	bh=sBVU1vPwdqmVJbT5lEmy2hLjCPRTfUjf3ue9MRRCoO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sB9dVkYZ6dLHeYivFln/Wf8B17D+RJLN1oipRzU1+ejundypvJ/qlKloGp2mXSHeEGi7VWYZgvdLec4y33UdzFhnDicwkmfsP+qbgABId1layvRBSZlcAuclzUeC5JmC96ji8/y5V4bzzG+LvqG7TIWkm8smRcpkIB3CtfavLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewJlTjoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7tSY4qE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewJlTjoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7tSY4qE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8hcv1497885
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtHg0f0ys0fkjSOy8XnEbykJPJwUG/MtK+n1p9jWvGE=; b=ewJlTjoPPZPEpxQH
	tRrsAV1Cloe/xAwQ4gnVmyOeAQy3L9hsbEfcEMTamRn8inpmJQAbshvHDlLj5/3J
	AMhsUkPcQaClG7zINsQTWzqEv4VvpeoDVihOzjN2Ir6Gb7bRYlUrMP3AYYYeJI4h
	aFV/CTcXWoN7n5ZjXIkDOYqvH7SCAba73mferqQL0e3SYBWhyKmSQD2irs46xhQw
	sUcZ9fazXppvEFBLbNOs87M5ZdGZQHsIOLZnmz5BVVbIYLqOL5uytjujKxZGMZ4S
	s1D87hKCAtXWjZgmlGq4u75fZezQApmISdicz0kooV/7fHjro8oKTjImWl62uLN5
	xzgHsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nutax1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283fa0656dso3314771cf.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564898; x=1787169698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtHg0f0ys0fkjSOy8XnEbykJPJwUG/MtK+n1p9jWvGE=;
        b=I7tSY4qEpDwgTAJjLcHSfolMQU343MrnAJH4Uh+MvUC06flPn8uf/cqlNnBn4IZsJs
         ZDqHaQLxhYpsa6bgBKbBKkuYWYzJ2ctar07e4KwtpegWsdlviVIpnQsvtYZM0vAYi0Es
         gtiih2Ez/Mmo3PNgh25Zn/8Lhl/iejitMfheHmUqAehldjNbuivvVx+6L5E5Luc8OjlH
         3xU0Xu+HEExs2y3czIyN9cSzZ9tsf5x+WiHO7huGf8DOK6j4KA/qWkLl+IrvEXIKNH0H
         NSp8UwzM2aT69Nvm9FOXEoipKATIDSfBI1aKpGxX+40fRWPdA92vG+6ewSHzE0CwVjjz
         PfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564898; x=1787169698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtHg0f0ys0fkjSOy8XnEbykJPJwUG/MtK+n1p9jWvGE=;
        b=oq0IIveZ5MaEhtqcatW/O7TyZl9Gs1jaF1Rl/u3yTX0Zx87qlXSfqJDx6UlvB92J5c
         vYKRExrectnlE+QOFjQhicRl5KWyI9A0iDN25CYE0GzjBnYTtpnU+++uvc7hSEWl+zs1
         /8Ce05L//Wit59LME/2MMDYJPuC2M+tz+EGBTl3OBb/NFDaUVcySh+9oO7/hBtzjzxg2
         DfQ+qI3IKCwKp53cUOCZUzcQyP4HqUbhH1TZyURYKvwzWUafXigqvh20XhVQECptDgzB
         ZZwbPRDzAJn67OBlWI1hi7/NfzVGiziqVFXZakBw6L3AbV8lLsL4LrGeFpbcLt486DVy
         29vQ==
X-Gm-Message-State: AOJu0YwV3zpt3lpcZ0VRW1QsUeQA+epPpCgt2xsvMlBz8PKMraVPuxXQ
	xfEhOHB9xCHFt5dTNbOayRT5tkYhUf84SN23Dmh0dgHFd/2QmtOcACpYSNWwiAz4OaufWncSBDb
	Ci4scXf/ikmoII/wMFSrHUqvBWVqDuqZ3BdWUvRmlD9O4zHI68tsB35gkM2NoLgSbmw==
X-Gm-Gg: AR+sD11KifNzICpacPdZgY50ZdO2GGooCfmu9qtxIqE8+IAVdrAVWUYyv4sB7W3BjBo
	1bdlveuC0BwJrhWHkCDqHHZk/p03NVnefKKfnz3A4EhdMe4j/Qb9TBlf8h8iaU6IszHQ2qveFHg
	bWIMqpPmo3NqfdW+1E43N5Tghfl1MhU0D9ikuuVKTkSJP/2eAYOTQFqR/jYrdKQdf7SlK8r6AUE
	xSbD6rgxr+S7Ltv0lbZ1JWIMOp8d8aOd54O5qXjS9jtFYGoX1+MDOhDdC0WPwWO51YyAqc2iEbm
	hbyFs1q4pnCGCHlbiVliUVxzH59t1+05elBNvDjzD1mSxL1Qir/0vnuKbQ90cxDuy5s9rZUSmTr
	I8fKo3SHcPvkYpYQ09u8wsawmGYQS1oPhdF9EEaPJwDxQG1aZ0QycXGyKoi7L5SQJueCVzi8RBW
	5Mdd1Dx4kLNH6M
X-Received: by 2002:a05:622a:110a:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d74b47156mr1266951cf.10.1786564897474;
        Wed, 12 Aug 2026 13:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52d74b47156mr1266161cf.10.1786564896922;
        Wed, 12 Aug 2026 13:01:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:01:24 +0300
Subject: [PATCH 2/3] media: venus: hfi_parser: size a raw format property
 by its own entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-venus-8996-v1-2-6615f82a63b8@oss.qualcomm.com>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3671;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sBVU1vPwdqmVJbT5lEmy2hLjCPRTfUjf3ue9MRRCoO8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqfNEWZMXyMjow2pbuu3jtP6gpQcK6WuPwR2/ah
 kCfGu/BS+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanzRFgAKCRCLPIo+Aiko
 1Xd4B/9rNwKPqtpf4P8m6h42ck8yx+Gndg3jB+SNUc2bYsKYbE+OL4B2+cQ7edv+J/1doXwxZes
 jg80RAfi2uV8Fts2u0EDzloYBhAILcls3I5DyAXYjjzS5nUyeh7OKLFlfIEiWl33RsS1SocKhW2
 o6d2P8XtdtHZKBK4nwP2VuLMvxZPNvREdIoExZORm9B8+wugVq5tMogf5atwy+irfQZ4Hnwdabu
 7Aqs0vAq9ZC3g2GIhYE0/Kv1yYFwbgiNh1V6p2vIpEwKjCcSU4+w5FtMonBOj8P4Ok7CJ4YOZc0
 C7EyZSll+Ir6JFYPIkPDtKo4xik/ZjUKNYP52fmtMSgH+AJe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX7xwlgCOdaxvr
 NwcvMNdM/BVspGGN/FsIO1rlGPv1Cyv8Es8v74R1JQXRmTTufRalK8z0j+uokl2VHOmAOC5MCBY
 GYLLM3eKfUxhAIuCt6ya/GOEagNdE6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfXyBNRt0aYfuTh
 owtU2dujRrrpzQDQtImwS1pooe/yDKzxiVr3uNCzGkt6uKLWa0tec8L4VNajz2OWhXRvtpbr8KM
 3WTE6YiQBpaBjsGRncOcwDK68L3ib4ZdgiaHo0AbjXA3RbQPIISvBmpeHkjFZ5g6uMBPB+NTrQh
 AoGjUa5yrhAspgkaa09uECgMYCY6yZmNcvgBsPpVPugsYMe76OA3eXn384EoF0gs0/FPMqlEuAZ
 wTk0VUA+kGBkga6IPQ7wnipzYL5iKFn0AVX+nMqLzdkdgLq1wr6lVJ/97GEP38oORfTaZkaaMjp
 7k4l03VAl/Q2MOtkXR4hcKIjZ2jmXUchPDTDv0pGQNvcd0JZ7naI6IMJ9TYSGImGebvfH2arVcS
 BvD/UjeAP3ShT8EHlr5UMGBi4fYL05ksQVM6i6yFaOQOERyn83Xb/sMdSHaij44/6q+fGfIzrfy
 D9XAGIbxkdg+I3+bdJA==
X-Proofpoint-ORIG-GUID: CCAw_Z4tqIKx_wq3yz3hOMpVYBaX0ves
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7cd123 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cOiMibB1P2E-5jhLw68A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: CCAw_Z4tqIKx_wq3yz3hOMpVYBaX0ves
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120160

parse_raw_formats() walks the format entries one at a time, each of
which is as long as its own plane count makes it, but then computes the
length of the whole property as if every entry had as many planes as the
last one it looked at.  The result is only correct when all the entries
agree, and there is nothing in the interface that says they must.

On MSM8996 they do not, and the parser walks off into the middle of the
message as a result.  The raw format property of the HEVC decoder is 120
bytes long and the walk claims 152, so hfi_parser() resumes 28 bytes
past the end of it, skipping the codec mask that follows and landing
inside the property after that.  It resynchronises eventually, because
an unrecognized word is skipped one at a time, but everything it jumped
over is lost.

What is lost matters: the property skipped that way is the capability
set of the codec mask 0x7002, which is to say the frame size, macroblock
and frame rate limits of H.264, VP8, VP9 and HEVC decoding, all four of
them described in one block.  Those decoders end up holding a bitrate
and nothing else, so frame_width_min() and friends return zero and
VIDIOC_ENUM_FRAMESIZES advertises a stepwise range of 0x0 to 0x0 with a
step of 0.

Userspace cannot negotiate against that.  GStreamer builds the sink caps
of its V4L2 decoders from the enumerated frame sizes, an empty integer
range collapses them to EMPTY, and no pad is found to be compatible with
the parser feeding the decoder, so a pipeline as simple as

  filesrc ! parsebin ! v4l2vp9dec ! videoconvert ! fakesink

fails to link and the stream stops with "not-linked" before a single
buffer is queued.  Hardware decoding is unavailable on the board for
every codec in that block.

An earlier overshoot loses a raw format property too, leaving the
decoders with two of the five formats the firmware describes and HEVC
with four of seven.

Accumulate the length of the entries as they are walked, the way the
downstream driver does, rather than extrapolating from the last one.

Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 3413b91b0b7e..f79c368647d7 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -171,7 +171,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	u32 entries = fmt->format_entries;
 	unsigned int i = 0;
 	u32 num_planes = 0;
-	u32 size;
+	u32 size = 2 * sizeof(u32);
 
 	while (entries) {
 		num_planes = pinfo->num_planes;
@@ -183,9 +183,10 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		if (i >= MAX_FMT_ENTRIES)
 			return -EINVAL;
 
-		if (pinfo->num_planes > MAX_PLANES)
+		if (num_planes > MAX_PLANES)
 			break;
 
+		size += sizeof(*constr) * num_planes + 2 * sizeof(u32);
 		pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
 			2 * sizeof(u32);
 		entries--;
@@ -193,8 +194,6 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_raw_fmts, rawfmts, i);
-	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
-		+ 2 * sizeof(u32);
 
 	return size;
 }

-- 
2.47.3


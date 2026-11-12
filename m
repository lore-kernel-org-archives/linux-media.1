Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500137;
	b=NyzerY7oMLhOhPpjMex71i6+nWcbJU/hyNNtBJ7KP96DgCxy2AK4NAG2znLdSJYV4GOo
	 47JwoFKNyejs2RKfcH2e/g0x5LCZGE+LLv2Bgib3qkYvDmNon3yX/32XDbpyHtl8hrjTh
	 B6gARr0bNFT/UpkvEhkjwCl/idzEjY/O5aip90N9lo1cj5a3M7l8U/OJjNJzo6KVUv/cW
	 GRA67fEOe9i18L1mBfBkmYMD8naEKGrLpDk9uf0IlqBX60hjzVGJtNYkJt0KQPJ+KKoNW
	 fA2+8kq3DOXM96zCh6IvmbjNObLfTXZKrgcv1Mr45tQN86PYfYRGWYDRa1tYAUyc9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
	b=J5ClZebgdCdNUb/Bc88xP9Iz9CkT+Vg8KyBOuQiweFTYfli/957ejtbxpaJBQe+c7DSb
	 D+gWSaMAzBRRS6U9pggkSqbS+upePUU8zZiwmVpG27oGJQ88/Och4QG258JfC3+qSVnuk
	 zVQiK8a4sqmENx3+iWosCaWZrUfsJu0SqSC6jKD1ZmY+f8RodkDm2WJ4Wozm15KEonkpC
	 0VUhmFED+RzLATYNEjA7jCxdoONVkpxGqnq1topBSe3GJaQ4pFzx/vaqvxkN5jY4kZZHX
	 oUjKxefimsjHPyA+qcFaAsUWR+oxFZ0xYJFiIR9OPfHWphxyIaOAZa4cRxr+twIR7Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZgpyJ/j9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3D606A8BF
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F3D606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgpyJ/j9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZUFj3841240
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=; b=Han4b3j1QL3ItFZa
	H3qFmKDcFOQ69n7RLBQxuWcIFSoboWfJAl2S2sk+DuQBCQqQygcHsrfKRdneCV6V
	w/V32eqG2JX2X+gv5hPhEdA0dsU+i5yOImLzhihcKIjhBW4YeySA1oW7BidYc5Gh
	elaYhqFZvXjvtBK51BH2BtsU1SMU8P260MGrmYp4R5pjJDccMFSw/cKmwI1UhiS4
	BZBeDgprwqQyn0sPjGJZpAFN7oRR+QJLOCZ1hMRJiiIszcCtZ0FyIYECJ6EtjKk4
	ujh+3SH9m1BCnyyfLaIMoCXDuANxuywY8f+DkhG+Pvq7CTI40BepaiiH7s0kAglJ
	cHAMFw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19u61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so2977664137.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500135; x=1795104935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=ZgpyJ/j9FkBenDESjwRBIAm1j+23w6nru3lSoCD+nBGlgXWPw1IYf045rFj8dAg+8C
         gUnXVREyCUDxLuMpdxJrmy5koKgiPRgmUowOODAC4rLn3gCOlvzMnRTQ9vxGaaIFfiAt
         ilHR9yKDdZ0KrpGd5QST1NRXdfwlXuPRCS3go+UDmH+nmrcLuFUgTEHvhCCRJjSn0wc3
         U54xCheNnuqsnbBesWcPtuc8Y8QCWd0H3ayQ+xM1WZjW00tRVWvhbcAMeqi2IbILOKW8
         oUDIFN046eXrnnu/1I8Pr9r2si8VsoLeYmOpaKPLahr0nJ8P+KqRuxtdO15tbUdouaPL
         CkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500135; x=1795104935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=qwGsUsTsoEHisZ1chZLll/6dJliaTQszED0DRi9z/SQBISmnG04TuUFuVVGrK4p0FS
         GaPa1CuqOtoN1dEZ7FdxC7G3Tdipa5XIJHIzT14gpxWMAzyzGU/43SO/DzIV/aLuV+T6
         jDTSY+tU/iNM5hsP5LDL6Sa8kFpTHzt6hG34YLOv7wWMpL8LS53SaHjhZy6/DYic17fo
         YUenlQPdALe++++nmkXZTxBJrGchnbST+xeP1MwwTLgb14HHdtRg72gBz/qdyF5g0tsb
         dawUrU3/P1ABpw8d93nCdwRLVmQqV3U3FgR9PSaOLL5Nzs6K996maEd8LSaN9gvOLB8d
         eQpA==
X-Forwarded-Encrypted: i=1; AL+hErFBietw6h9LW5jp46NX5DkzFWusgLJtonG+uiR/1obbKUg0a0W6lXDi+9gb/D7hwwEJr1GQyBJCKsvz4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/heqExAKpjW1ProwyUSX4L/WKrUYXFwAFvkfVYfFcE7pYItyuj
	CSy+/A2myToVq8A1xc+cL0ERTMrqLiq8jxo3DkH7Pn66Aab1CKujF9LhAUx0nw8eNBOyF7pZMD1
	WNP5Z5N8f287fR8mj1fuK3tljOQteWCF7YMomMFNdXOQDp5z2QEiVYKtSy7UyZ5eVsQ==
X-Gm-Gg: AYBFou3A9BqMLrAh9Bg3FaIWI3vvOB5uyzevbYlsdKBEz3+cxIPYQkt2CBueDS2NUWq
	mUtlFmO2GZy+itqFIT9cSWtDszZcdmhPJ4jUnBeGpUapvq6B7WgGnQvJ1Fs7QVivcMi88SH/rD4
	I8PDovsBR5o4ckd0zcPgcFdsIpt4fE268VfN0TfeJu+cis2zPjvS39o7V6HOfYyjq7Tf4tQeAPR
	i0A28+K8xo2ZmuPsRBcytBoW1AZ0kbn1CyYPGGpq8BaFob3Z8g7izkuF/S8mXiR5pVaw/Yc7dpi
	dvRUkSZG0fFz+dYK1FKXmU0BPiwn5jyaILMLiGuYKzoSjeSIjGkihEA5adFbUmCD6TMcaBTDbjE
	zqV8BoFLpSekr156PanM1ZwThIgV9bNWlpBKWE90EapXFW5UOH9jvx9hIlo5yfuvqNmGp8EyBWL
	IjUI6I09exozZb9d4A1Woeibazi4xetD9Vr/rUgRnQWwKjpAnEKwwfJ16XLntfZoechZ896PiSz
	0qaei9cGAHt2QA7Po4Dc6vMrZw=
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905694137.28.1794500135413;
        Thu, 12 Nov 2026 08:15:35 -0800 (PST)
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905646137.28.1794500134460;
        Thu, 12 Nov 2026 08:15:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:15:29 +0100
Subject: [PATCH 2/2] media: qcom: iris: venc: reject encoder crop
 rectangles larger than the source
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
Message-Id: <20261112-iris-fixes-v1-2-22b759c3c285@oss.qualcomm.com>
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
In-Reply-To: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfXxKLbUMfohWkq
 a3RC00dJAYHX1cL9teK7GDDC0UbHK2XyHoUmn5rhzc0NBtDdQbAwHisiYXz/t1XyW+3GyL/7/No
 Wjsffq2+zTYsSk3HPSF52Hw8WwS/wOl1uYKSB1bqX25AQBm6OMsier+57pnva4e7oE1P2YDei6t
 dP5uC9JOkJBLyzrlsT1mxni8+UXu+yCo4H8oh42qtVPJhvg3ncyk+xnRijQiU0gqxlp524+g9Jn
 NAxXRL3RQsBd5cYnYm99ymSUaQw3R8yNHfdmHRg2vylS3aQbDm7wgf6u+vE5tVxXTjRUfziX081
 u6sdA7xICvnMft8r+NemgxPWjRDBlk7ndtSibKWpvqrESXgXogL0svZFyLxH1Qsh2PYbak9fapV
 yzZDwC+JLqjSelhVokMTUqfPVhobKTAPjBjBzAKTZP2Q5amBPD+YAFjMgjJPsvNMQ3iGCQCe32e
 ZbXw1qKy0+072GV23Jw==
X-Proofpoint-GUID: 0h9Xf3YA1lxuBL-HibUiWsi2LiSPTPYX
X-Proofpoint-ORIG-GUID: 0h9Xf3YA1lxuBL-HibUiWsi2LiSPTPYX
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5e628 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3rA8L1DBDF8j2ObvkVYA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX9JlyjzvLb/FH
 hX2yPq4CPZrquQHRbR2gwYjq1YXOMdPcfMDhP7aVNbiuf6n3szTp5+Bj2HU+ob+QQBDO8AviFkd
 I8YtDY1svM2LwzATlYAVvlm3ZwNcjIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

iris_venc_s_selection() bounded the V4L2_SEL_TGT_CROP rectangle by
inst->fmt_src, the padded buffer geometry, instead of the visible
resolution in enc_raw_width and enc_raw_height. fmt_src is rounded up, so
userspace could set a crop larger than the frame it submits.

iris_hfi_gen2_set_crop_offsets() then underflows

	bottom_offset = inst->enc_raw_height - inst->crop.height;

and the encode fails silently. All ioctls succeed and the EOS event is
delivered, but the encoder produces no data and nothing is logged.

Bound the rectangle by enc_raw_* instead.

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --set-selection-output=target=crop,width=1280,height=730 \
      --stream-mmap --stream-out-mmap --stream-count=30 \
      --stream-to=out.h264

Before, 1280x730 is accepted because fmt_src is 1280x736, and out.h264 is
0 bytes. After:

  VIDIOC_S_SELECTION: failed: Invalid argument

Rectangles within the source, like 1280x704 and 640x360, are still
accepted.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index b367367ac2ccf874a00606b8b1352fed37b37a57..1af692d10bcf77060fa95c6c3906e9067d167d84 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -380,8 +380,8 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		s->r.left = 0;
 		s->r.top = 0;
 
-		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
-		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+		if (s->r.width > inst->enc_raw_width ||
+		    s->r.height > inst->enc_raw_height)
 			return -EINVAL;
 
 		inst->crop.left = s->r.left;

-- 
2.34.1


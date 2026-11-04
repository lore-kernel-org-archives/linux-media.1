Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810200;
	b=CJqkLGcXkybBamZfzPU+M+BsksjEKKUCx6vdPrLUhy5GGQKuhy06coFUzv+rlLueWWj3
	 FplxtQm2Oqqdrl+UENKGvAL1a+VHvgB80MKf1VbBuPFAf05WOxcq9OsnlcLUnWfwMzq2R
	 svgYV6RVp/l3pH3RMQmKHEfLi9UaXYDZB3WCFgwPkhRhsRO+OtIqdXjACgo0t33Mk/nLT
	 0YOqOhVeL2tCGbhRkc2TWnv0hPGCsS2SdWTIlqa0ZSHpt+rheL0IrHTUFf3w/bKdBzd9K
	 Nbip92rWAJCuVE2iQcM7vSGR1qhTy0AnaXDjsq/c/hssXxEyEBTR+KWJ0XcsPVS8/YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PCyKNjNXkfC6vJ8k7pznUeniVUo6Eq98jGCiiKVtI8s=;
	b=JoWod7iSP22yUQeWVkQsbxZ73iAsf3/cnwC/xWpjJRZx9LqqVDjDP0z+Vw49Sg3P3ocl
	 eryhCsZxTeqv3ZDAFFe+SsWXNrw9Dg4zR43mmtbPGinTp8PT2/YvIvqGJN9TNR7WDs5uL
	 GWK2t8F/IVW50+rYbYdYKGtN6Bvt3+hTTwoKSpfW/QG5MLgXdN/PA4OqjU6aNddsaa8gE
	 JFrFrPLgNFAEE81GCKbSTwDHqqw3g9dh/YcIfkjBELU3RmqgB5KiDvNXhGrgHsIWXvy5S
	 PT0goqghlc66n9XLw2RJTmtcaUIxAEsG9Tc/y3yTXiM6+CAfvBGCYF3eBCxzlB6tg1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KVmyxOoY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUEfxXD8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE26082BED
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CE26082BED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KVmyxOoY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUEfxXD8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FioKS1292188
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCyKNjNXkfC6vJ8k7pznUeniVUo6Eq98jGCiiKVtI8s=; b=KVmyxOoYa5okzUM5
	QqSLWDrlRg2WLD5SvdtbZ4FL/aTjlYMj3MrI+TjsSCrfMk13Et7P4padU0BPkfCZ
	Xg4U3DwQRmeMDNvJf910KvKQCBKxpfm/2HVS9e3VgGz1Azf+vrJ0+V7bKhDricq0
	jwnGKaumJnC7Tj8RXIth5VNxZps9lK3vxjUTvZxgCDLeOmzL8wRQm8Ak6LoMih7Q
	5zD8lzHOFIGlhb0nrCQFC/1ADGjIw5oJHRjshd5/eJ/9sKykY39+cHSo+a2hzel3
	JkcsxooIZq+9x9pjXXBeZVIsxhXV3CxHIz74HjSrZr/RHl/c+oY3g8tiCaHJwqmK
	KEotRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hxca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso391926185a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810198; x=1794414998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCyKNjNXkfC6vJ8k7pznUeniVUo6Eq98jGCiiKVtI8s=;
        b=VUEfxXD8QrQFsS5kPmFw2h8w31W0C4Gsu0DHhmPpw2eOqdP47EcyIFKBXgfZ8DwDxO
         EgFjWlXgx1EoZ3QLW7//ZAU49sBdl+wAWCBQoTmZ+2hyOTOjXmMziGIFhzD7vPD7CuMe
         HiQKZspmS4h6rCEtFspXtQC3GFfUkH+Zxr+VQTxDDsS0Es+0CA6Qp+KpI0MtsRJbZGDH
         W52NamtlgXkDhPzZz3cPc+D7QD1bpL2MpQ1tFLFuCKQePkEQUjfxn1lVo3mr+s1NWHhj
         jhqs40Z/XVBGpRhQg1M7Rp8WxOGxX4GzesjHRAPzoIHCqMlqhfk2qK4sWjmUZ9MS/fqc
         J4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810198; x=1794414998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCyKNjNXkfC6vJ8k7pznUeniVUo6Eq98jGCiiKVtI8s=;
        b=zEDCCEDTJmHH0j50dh6nAFUxBN5wJrXBgshw98PQYEh8mwHDuTHh2II2zafV9S4cce
         xcYCstGhlm8TotuR1jAxnTZXw3G4yURZDkxFiqEvMh3p8mgUxZs7/Sl7nP563u9Cl45o
         EmsLFdLCcUs8Dxwf08vjAYG2pnt/+5W+xTeZeDSdy9/yEsEFnRjFaCend6b4CmjsgZSl
         oQabTBa21YaBl9Tg4IXitdD6k+mMQVcLiyn4eue5SVOIoZAnRBZGGD5Gc2Wm7T+OtKCB
         Mw7tubJu7H1d5H9IIugkCygg6e7thz0/vQa4urKyUtKvx4BWockyrjyBwGm4WZ2+xVka
         7vEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC7pDE50GEpR0ss5HlIhFu0zEUeoWPq9wlv5gxTAuyRhuLFusYZQu0G/WZHevijz6HJthK4PGhkpt9JA==@vger.kernel.org
X-Gm-Message-State: APuU4Z85ZDVutwDlyqK5/ThC2Lb0uz3Lqgx7WmtjqafCu0+79I4cSWM7
	fKVX7MGo9lsdrcs+ao4OIUjpTet/5HNNqJJLJXCQ9YbGPNXC6N2KmnTYpd3sVs7SKKYo0/BpoKB
	o0bzi3IIGKaLaCA0uZmcOEgf+5hMDdUiAE52mNP7D+njtD8JTxHFF27Ul9z9iRyAtZw==
X-Gm-Gg: AYBFou133W4wyOYry3UXwRaVGQS4L/Yy9PGhdkSrmhuXzTpLP7XqkxP/UXjKMOKepTB
	P48KerVmbuLSjTmvBMYD+Cn0nD5Flmcx0I0a3xP177riWguzwXWMYOoBO/rsxQAIPstLUVxfvO0
	qlosEG2wM79W9tbh/MLMDQnc0M8ujN2yge+DEpKBWqAGpszuHMWO+he67HCPfS2l6DbaKZ9UwPY
	UHHBJuudZuOdgJxztVFLVzeAHMMUW9NcFXsgz5dO85z4T3Jcktin1tHuFSXRdp3IbLtCUnEpmyP
	undeiYU1CsMwLLToqeUDnhA6yOr/B+6sJ7dIko7RrFawZfEJNldVGv3T8ryZ2mTNIMJdi+Vs7RS
	5AVJN89e72GuuvELAORbfYd1t/Rm80TGEHm3fxuvojsKRQr4+jFhwyF1FB/FGvPnWxqjTmYQyhh
	ZHI7iTZSMSwq84/3mvNXMXcHw7JLxDj/3Jv5RQPlIbWJHzifKNeoTpDhVMd2uEdg==
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr1022744885a.37.1793810198429;
        Wed, 04 Nov 2026 08:36:38 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr1022738585a.37.1793810197934;
        Wed, 04 Nov 2026 08:36:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:10 +0200
Subject: [PATCH 6/7] media: venus: report the QC10C data stride
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
Message-Id: <20261104-ubwc-format-docs-v1-6-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LLOKk1PZHMHbARwKPBiaX438vRakCex3LyDXd5CzP5Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618Hm+3JHCmDS8u8qZblVd37BJ0x5xxPEFCaZ
 5lHf2oTUQmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfBwAKCRCLPIo+Aiko
 1ScwB/kBqkQMDyv22eW/LRrim5v1nMIo5n/TiIcDqwMPDTe9ThQDcJrVGvheq1kCkI+n/MV+XId
 UlANsjeeLygcFql217+g32OWD5Xv7t0P34ePgYkfgzj2+TEMQK97ZeQ+JR3UDNJOlxQgIaSTxsk
 DyIYnl15R7a0RZtFDzFxrqhmh8QRdr7QqeAGMuYNd9avQqNsHNLw2k8ANO3tWu1guplMQLhWzE2
 Y170gFyTcyfQ9bGF8hu59eWQfaM+ZC94qIWix4CoP9MKhDPKtBJTITsBrOr6z1HY5bz5dJ67V5V
 wG8tqcixLYZ2KaxhY4Nh70HqmMvobjeU3ZVCZpvZbpEo453N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _BRZ0NtXqQy1pqzAlXNcS2CGKqT8rUas
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX4P2bSTnhUVMt
 SfGaVqWJGVCeZ2va6IW7UPTERrAQDJAW+bEfqAn/vP06s47XZwfMZE7SDWLjHaPnk1r3MeK818A
 nglPUH3PsITJ5oTj36kp2txlO1erYYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXwCL2qA4EyCar
 9hDR3kRXQqAwrJ8DwKPLRMugmeWkaZ3OITKf1qmVO9E7HOydnNTPetK4Fx0nxbMLpHBLZw1X0/g
 ef1jYdcSBGL8qBx1G7a3/k0hpQCjh68WVx+Mv3EWnF+A5T+XJrwmFLXb87Ajm+IArfFgkLWpJ2N
 /TNc2ZYR1zye7nspf/+wB8SJx5J+mU4SqUAZT4UWO/86bbl2E3jRB89UJQEIZwmjY48FWqF1vtb
 aK+vqC7eGZtadoqEdSJWE4aCbdrbeFx0d1XLKMqVl7eZSptXm/1rFC/JcjQQ2O5fV+h6feDZ61r
 Y+7+ARm86ZAEmmFF/8KqdPFgmpcQ2V7h0MU72JSg2CiqsTlQjhCMlSJmq102snR8MC4m5wFl+KK
 d4/WAvO6mc/Ycmwthh2fjI6JWrXO7DGFIk32aAIgsZ8ZwTSwm2aEfDHAaHovCFE7k3OfhByjW/k
 3smrjYemBmmPx4KGMFA==
X-Proofpoint-GUID: _BRZ0NtXqQy1pqzAlXNcS2CGKqT8rUas
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb5f17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lvl4w2d8MLr2OEpUskUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

For QC10C capture buffers the decoder reports bytesperline as the width
aligned to 128, as for 8-bit formats. QC10C packs three 10-bit samples
in 32 bits and pads each line to 256 bytes per 192 pixels, so the
reported value is too small: a 1920 pixel line takes 2560 bytes, not
1920. Userspace using bytesperline to import the frame into DRM gets a
wrong pitch.

Report the stride the buffer actually has, as computed for the
buffer size and as Iris already does. The downstream msm_vidc driver
reports VENUS_Y_STRIDE(), which for NV12_BPP10_UBWC is the same
ALIGN(ALIGN(width, 192) * 4 / 3, 256).

Fixes: cef92b14e653 ("media: venus: Add a handling of QC10C compressed format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..9de0c9bc2919 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -227,7 +227,10 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 			stride *= 2;
 
 		pfmt[0].sizeimage = szimage;
-		pfmt[0].bytesperline = ALIGN(stride, 128);
+		if (pixmp->pixelformat == V4L2_PIX_FMT_QC10C)
+			pfmt[0].bytesperline = DIV_ROUND_UP(pixmp->width, 192) * 256;
+		else
+			pfmt[0].bytesperline = ALIGN(stride, 128);
 	} else {
 		pfmt[0].sizeimage = clamp_t(u32, pfmt[0].sizeimage, 0, SZ_8M);
 		pfmt[0].sizeimage = max(pfmt[0].sizeimage, szimage);

-- 
2.47.3


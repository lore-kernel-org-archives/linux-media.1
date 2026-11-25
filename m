Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597271;
	b=JxJZuCmH6kjUywh/LhZADd8+41klOKz+BALxqK/QtJxRGvodcMVU30CTRmjJ5QhQmPGn
	 2UEDuWrBFTfAoIf6N5rs9OWz4YdZmxmvCBqM/hA3CPvrtJjDxsDU3CR+Zdbb7wCcxM+LJ
	 LuFIn5jWYqu/7EqkNnct+eCO65qC2kjWoQUBCvSdnZA5rMAtPmHm3MYRrwpsC2UoxfSWL
	 d64WeE1bntinWxf2hBVh9o54qAMhwtmPNUc38l+VV+eNwTc5qIbM7u7AaJnLldCvq2SGr
	 mkMeKMKI6NJkuDNZybVm1aZmjFf10+zveRRj4DV0AlogZeb/ag5nrBwyJaIb7v1ZrHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
	b=F19cpKDZELn6LRQXPxiaoVadMcv3jGvNad/LSuwlLgG2y2kR0W3Pyw494/wAnI1qGtke
	 uLlhZtbykbILom6wSE/o5rxLNZFBLHGVBkrhJ6WM2DjnGlywx0UwcRAByaeAz4zLXPq+5
	 /cRBT2Ke/qsZF95/kOCNPGnAKog5spWEVUiCOlEKTJLT05AkYzPd1nQIEmPfj3upzV5F1
	 RyQJki0UMxGBy+mDMIJwkVV2R41j1gNWZettEdF2XoA5vTOw2FicdBKsk1+CqzErYSTPY
	 //vc1qtOkNYYBwoCq/Fjc9RoHispK4d9RHxZnACG4GoNh9CJiHBDCeSBkuZUq+yT/OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTeakWP5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSi3IEmQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92486606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92486606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTeakWP5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSi3IEmQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Y9b2629373
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=; b=fTeakWP5KilBgsyo
	J9Kjs8DqJVco9O+MIsxMaEU2KcXohMAyrGpV50tRJMCKr6j/vbCQxZ2YFJwElEY+
	0nrJ6NdlIDsFzgsAdePFxVI0KJ0aqErCicJ9uIfN/gFZJ2xfjHEEis5VQm8Dw8Nh
	0wERmjZEHi5E0fBah9M4OpUenQx5ZB3QThdh+E+NdlkK4Jc88+vGF3JoacJpnMHM
	RD4ojEsd7G/FYo1I+4JtUZ2TDYaJ1tpRPr7j9u/2oqi9wrifCkFLco7b/o0ycPlf
	niWAuqs2qPGqDeaM08XlXuUpAL9+dbkb6S3z8r4O0OdMkvmxzVIkVoCTy4h34M65
	AlLNAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb8tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:01:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so957128485a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597269; x=1796202069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
        b=hSi3IEmQtTXfq9mCLyDxmW5j4v4M3cVH0GR6VXGpjAMpN57M2bXyB1VJs4s/KSoTUp
         SOZIR7UtEdFXSp1Zyrqi0pJYzzPqD0Dtz8SDxZRw7tE8dL341Hu3bKCJJXhlE0ACaf0+
         J+WkRos3pSK6rgWZDAiCw8Nju3NWn5EZ7SDGi6zVr6PsratPS1WK/Rw2Om1+dKNioWP1
         dELc7aA+x8vcjUO7Jd+HfnSgpflEBIXO9Quz+NrY05UcO/ItEUiLNbfVS4DOwxBoT1zN
         PF8mqE4STdypdmIrbyeRA5b7gIFyHQMV3hG6frviBnwYPglGjhz+T8CP8GGnE3mLC1gV
         111Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597269; x=1796202069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEYCHONLfjiDlaQnUG/xCKXVK/LoPfBJywqJSXoNvis=;
        b=HH1WW3oZ+lxT+Y/b3cLLfJ2Whi/EZqswjO2pSR027YOgoa7/aYfkj+SRwMcp3TyU0o
         EzcvAbOiqiDDo3YSg/X+UF15PZQOKNuuXZkB7bkfrCjoKfXAEDM+ItZ4RjAMWT6/s7m4
         iIAQoNclXOw7PGuvfaZ6istfGpp1IRELT/NDdlcJNbUILr1ttb+P/XNu/x+RD9adi8X5
         5zs3jgv04ziUh6cwr9DSkpk+G65/mtEpb2Y3kOA6Pc31ArDS/r9tk+42ZPV4S3ipvCif
         EHukq4LUHwvY20TExMXL1DdjWVTvH15ceXmoZ4cSWIn65BG8Qd/2mm7wEa7GTAgctypq
         sCJA==
X-Gm-Message-State: APuU4Z8wryieRD2PfBaCUr5bQ5JCZIEnNRVypN7/BioDjcPM9894JLgS
	hJ5uI1FteaRX2XMhU5DYtkDVXdq5Knl2owXyTSCaQxhke1QG92hE7AuFW37qOkEOPFUe3w9YHvD
	ecmUFM4D8EzTEQd3GpCo2UC6hVvRRFJIh0E0xiLeVR4v7YbrOYudKMGM6rbb148WAaQ==
X-Gm-Gg: AZFdTZfSqz2Sz6Pmae3p3eSo0rs2EJno0qeibeWNC+PZGeLbfXwK4x06au0InIa4MHF
	lHEsctw3mu4vGSG9yE8HABtZmMbijG44TPO/a4PkMsq5IlHA9Df9Xez3Vf0X4xeSoZ4kVfM8Qog
	GKkbLmby4DHbKr2cwpCRd90wlz7brms1oYTcC9iuO9hRtDZ4y7qUBo7M3dRHOfmK14Kp58GFXg6
	AxfZU6xoBTVCYvfTA4UrSmj7LmiARkLB+UA5cjurz8HQ4qGmtyun0hLOFmM48ggqC5nFYHlGdoA
	8jdHTHmoSZedoF1Ci8pXlfBSSEusrKbYtkiblCSy6aIucPtzBrg3OX57gIrpX/y7LWsgdkmAPn8
	Ma4E+94fqTlx75ttoDYGU4mRGF2NGVNHcp8ydUBo5p3neBJj9fTr7IdP+PVTgOV9chSCJWefz5D
	ajc0PPfEwyLRJHoA==
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id af79cd13be357-949ba95e8e4mr3024913885a.23.1795597268732;
        Wed, 25 Nov 2026 01:01:08 -0800 (PST)
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id af79cd13be357-949ba95e8e4mr3024908485a.23.1795597268240;
        Wed, 25 Nov 2026 01:01:08 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm606266235e9.6.2026.11.25.01.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:01:07 -0800 (PST)
Message-ID: <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:01:06 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXyKSQDeznok1O
 O2PGoV4JWdSimgLllrzDQSPLDT5X8E/X6Y+7Pdw+D6mjqjnmtH1k7tJi4bk/8PpyKiDGp/uKji/
 GmYgpClunsJTG3beVANgmNyrysFI/tY=
X-Proofpoint-ORIG-GUID: RYuLETizm-q7Vy6fXV-D7av_jcVoIsNf
X-Proofpoint-GUID: RYuLETizm-q7Vy6fXV-D7av_jcVoIsNf
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06a3d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mMDk5lcDQkvegnXiA_gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXw/LdsV7HGrLl
 qbyRjd7jWESAegY3nvCfeUgA2sMXpFEvgvN83/10Nn7AQVWNPdcAZVX1HGPnxE8fa0abKaGwXBs
 xVpCfepte3kfdkK/uWOJ4ljkbaOIuWE+AdM4pI9FTpFWyRVFq7oP5aAffJtl+l2nq1ZyvNnOq5K
 GMML6l1lTPFZNeMNODcdUd6fJ/ooeJ1R8DKxsVJX2NB5GMz0pcvCD5JpDohZqtGHupi3vtmc0WZ
 nSAdbUDH0gvyUdO8B9kBwmjzRQ57w/TqQeK4fZNsxxUnFhRyyRzE6LlsXHWly7CdtDDC0iQwV+W
 h98jawpf8d9tT091QfXaDWSyvJEKWqxlc0JG0LXlROD/y/qZG8JLjXjIBAI3KC5s4g5eu8Xp3dl
 dGF6wdClTP6E0NEfsmuhLGhnFWM6GVCKzEWInI+t9UyNIjjmXtBz5uVNCule0Salxkk8BZQR8aO
 rktT+hHxBWPCOt9MXrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035

Hi Loic,

On 11/23/2026 7:16 PM, Loic Poulain wrote:
> The CAMSS CSID latches the ARM architected counter on every start of
> frame. This series exposes that time to userspace, both through the
> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> 
> Until now both were taken when the interrupt was handled, or worse, when
> the frame had finished being written out to memory, which is about a
> frame period late. The hardware value is free of interrupt latency and
> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> with other timestamped data such as IMU samples.


Directly comparable with CLOCK_MONOTONIC, does this means
that csid timestamp is in monotonic time domain? 
In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we need
to provide timestamp in that domain or convert in the driver.

~Gjorgji

> 
> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> having the core take it. Patch 2 passes the SOF time down to the common
> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> uses the same time to stamp the captured buffers.
> 
> Patches 4 and 5 are picked from the timestamp support Bryan shared
> earlier, with patch 5 adapted to use the conversion helper added in
> patch 2 rather than its own.
> 
> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Bryan O'Donoghue (2):
>       media: camss: Define timestamp registers for csid-gen2
>       media: camss: csid-gen2: Report the hardware SOF timestamp
> 
> Loic Poulain (4):
>       media: v4l2-event: Allow drivers to provide the event timestamp
>       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>       media: qcom: camss: csid-340: Report the hardware SOF timestamp
>       media: qcom: camss: Timestamp buffers at start of frame
> 
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid.c     | 81 +++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
>  include/media/v4l2-event.h                         |  9 ++-
>  11 files changed, 205 insertions(+), 19 deletions(-)
> ---
> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> change-id: 20261123-camss-hw-ts-e0297adb69d9
> 
> Best regards,


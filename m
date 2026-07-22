Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B689B313535
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727703; cv=none; b=bfUcjfc72ihpsYcMGw3t8M+Bg+P0kicnc7UlfIMFyWbPz3YzsGNdKAQj+zEuggOthQL3VxZEfFhbtIUM0J3k5HMGUXDIZhHkcjUqUp2zq1rMT4z21IH8LW5ZkHcoqvSPno5AbhAC3J6DzMWQMmABIxF07G7+7fUTdf+yncwSMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727703; c=relaxed/simple;
	bh=1I3Ya57Jw7nC8dTkZ57I80npZ1pXxx8s0G5LnsEpI9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fOWTTlO/RfmB0MJU+Seu9kaZtEN9DXmUwO+2QkEgihgD5ChVMu66dgAtHF40a9JZsYD5h/y5br1gQy45Bh/+NU3OcBPAK9gUXXsfa0agOu7UxJop9bSa2rjjIR+ueT4bHEmONDY7iR6eBOFl3+UYYMNaSnwQnwncgeFW0Jl9qVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIeieQ6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9slaEvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIeieQ6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9slaEvb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWuBe1027945
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DH2P/DqJm3/zCfvft53MKq
	hoC/JZ8NvOWDJy0dkATfg=; b=gIeieQ6Rur/T9XLzy8DhgEDrKr7VcgRNpb3NTl
	VyiqB03R1LsjR4ndK37Wm/Wnv7YRer6I0woP8nxm5JwBjkzPV3+w2ZKDyqmxW13k
	mQutbfgqbrFLEwjyGn7Qcutfn/hgbllhsi8q5ymK+hQVcSjZAB6ltt+uwFCORkGt
	tJXRN4z7L6kYBoQ9YB4bkANhjbAVvmcYUXOb8c9rZv9G0KKGFmq980yXmOszulqW
	duPzuBdMEJc9yE3ZIdBUCkOvu0ZpSfKvOAy3SOU13pS8N+5/7X+S3GeNfNDKYSE8
	kxt27CEGf/pH8op4ZVATFitTtMFJ6pPAQTouEaiCY4VJG/uw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7998r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so22496201a91.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727698; x=1785332498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DH2P/DqJm3/zCfvft53MKqhoC/JZ8NvOWDJy0dkATfg=;
        b=O9slaEvb48hAxbFQYn5/jKz3n0TRy1Or2KNFjUBel6AmJJKxMvGOOlAykkBG9jvFbI
         B8O3PS+6fgbcrOJtlgI+pZvXcxICxMoj1GdmnKX6e3UBcYN5MQLkGxCBkTbaQBN3t2lK
         +qAByQNd5i23Voljk1+2Ult9yy7S/9j8+rX9tNCyYmKGfy5PPNS8UD133xFfvW7uIeX4
         zSZjIqrT+h/GVSGG2XX2bhly2u3O5dIc/Prto9EiEtAnNExcEIRIocaanSfvpyB51Y07
         uJxIjfKF2+dMAwSbHlRQsi4pVUPAAIMUxmu8U33552a/kVGqNeGuW8Fg/CrD5jYOqrZY
         f6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727698; x=1785332498;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DH2P/DqJm3/zCfvft53MKqhoC/JZ8NvOWDJy0dkATfg=;
        b=HvM8325Lr0vP1KYYeOHkJeutuEMxhFMxWuO9ykKjYl57yxNTw91MRT8RxKKopUGo3x
         EAoQ0+GNADl0UkdwKAehEgtWpmOqP5DaPBujox5TYhPalvRXpy1RGpTl6jyHp0usC1T8
         i0def1RGABKQyaPfRuwMHrHGg+xOY9eQOK8hP8L68JuaEzjcthSIULRp3tdoytYHBnh+
         KKopQypVGj88mW3XePDeFKtkWsPjj+1P+L0TsjqOWiNwWIV/9GFwZ4u03HYOjSPyN0vh
         c1LmiOlF9Y+9JAWKCoTeCs4IX0lkkDxNYwumXCS1m9ocR+Y+lxbPeJAeFBXQIhvxJ7xS
         4UlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Ja6T9iKiLLuDr4sTW1GFcIhxCBYLhnw4rCY/N5lfZ1X00Fgt4jDH1UEdZSVPZELgsjaQb8ME49NTQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMq7Ae/4sFSWWjIv+CWVkkm0iDLVlAdur+1auvAqU4uDt0xUF
	uyh9hWzBhPauWMXJk6jLOIiF9utbEThimn8wXTD4KK5J992ULcfyfILpFeFtq1eMUAltzTdSQ89
	IdnCe/kjFhqbL67wMW0u0c2YYIV98yqETcVOimA5lt7U4J5cIfnmrWzL1UAl1cLNbtBwhW5p7Ng
	==
X-Gm-Gg: AR+sD11a3ALUp8UhZix2DvOLTZMe3bDffMrOgaJEe8Celm0smpy2RzWCzM/rX8+jfKB
	QwRnHrfGVhW9AajRkKhct8kbbcyHDwqS147VJTzH6CIXev5ExIA8Xek4uwiJ/SK3ywgFM1irUHX
	mkmB2zWH/zbd6igxJImxc6+ITdD78MofMGlF/4+l8p3uNfESQ0HwSGj3emnJ9NRkZ8clD2fnJmL
	EddXl2ZZ5kZd0TNtqHuStGRs4r6ytI9HWKjmP60e6f3Mawr88ZOJGCv6kxVSL0CMGRl8dqI9rG4
	75OQ3MjKkjwcdF+jaq+tA5mC1MNV5cjU37NhNKweLNvoD3/hEz8QdY29ecQyEmq5ORIXLYnUwZ8
	FevoJ3XCnhB6paP8h8GnE6UNRntYPV2MjGX0=
X-Received: by 2002:a17:903:380f:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cf348456ecmr246161585ad.12.1784727697732;
        Wed, 22 Jul 2026 06:41:37 -0700 (PDT)
X-Received: by 2002:a17:903:380f:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cf348456ecmr246161155ad.12.1784727697145;
        Wed, 22 Jul 2026 06:41:37 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:36 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v5 0/4] media: qcom: Add support for the iris codec on
 shikra
Date: Wed, 22 Jul 2026 19:11:17 +0530
Message-Id: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7IYGoC/22P0WqEMBREf0Xy3Cwx0cRIKfsfy1JicrOG1tXN1
 dCy+O+N2rf2ZWAG7rkzT4IQAyBpiyeJkAKG8Z5N/VIQ25v7DWhw2RPOuGSKlxT78BHNe5oW6oW
 y3jImTWdIPpgi+PC1wy7Xw0d4LJk5HyEZANHszLZ4PZBl84ukLuBkLb1NS9YkKaOSKyaA1eCZP
 4+Ip8diPu04DKcsb9vLziDQLQlzWwgPrOm00tILCb4SynRa8AaUcyXU3nMnpWSCbOX6gPMYv/f
 hqdrb/bcxVVsPZ2vTaK07Jf70INd1XX8A/0+n2UgBAAA=
X-Change-ID: 20260721-shikra_vpu-f37cfc006aba
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=18922;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=1I3Ya57Jw7nC8dTkZ57I80npZ1pXxx8s0G5LnsEpI9Q=;
 b=F5XYO3wjQiJXK1FMQxSKiWQiSA+h0mgDkyR3B07TdQ0U3HIqLcrAPV6IrgBbExXCZVdn7I6Nq
 sOWZvpuJl5ADH4nc5yn5YH/KGYy5xfvWAT/Ip54QgtNYu9avS94SB/e
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60c893 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qN6Yp6djP9geWh5Cp54A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZHD-yZM-PpYP3VzSH5BlFYkywWbfHORA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX8greB9RosNvU
 EEqK1De64WfkfCLyiiBVMPOVWLrkXp0nfqdmwmBEG4tnei2n1i+odAUX9aFV8A1k/PBOR3o1l96
 W+SQGlTPLKquLlrOUtax7gmyinU2oLQ4mJtaM5I95kR+H1gCNH6otsgkixOo5Lr5k3/xV9hNfZx
 IY0OFKoVTqf50D2g6ZSjS9EbE2+DKX94UcB8p7Xy8Tyc1OfQ+fUBadge8BeHppmvQJ03gqSHpt1
 8OfWIRaLyo2p6J2Vdq3c3gyFxAPIwx5nX9v+MmmPDPnry05nBvVBDBnhYKF5W058/IMQZbZF5Bp
 hIvoqnmo7qfNi0kRst9253LBMM0uG+1g3YvGZTDSzjsn+BmSA1QvtnR/RMypIgca4HSl+JgkYok
 Ff0gmpaPxD+gM65f4hci4ko7jlSHbKQDtRR+R/IfMZqaU0MD2zZhSAFsnzIXtcZZM56Fe2k7j7A
 ZO8nB+dUQ9g9wweNJUw==
X-Proofpoint-GUID: ZHD-yZM-PpYP3VzSH5BlFYkywWbfHORA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX3KJQJ1/NWfXX
 4spl0+jF8AHf38ABAab/RdP4cvaj22l74qU9ka5WsnqESzELHL1crGfyk/GWzP0ZurT3tsPndlj
 GAiMlpHEspz9MLTWsumdrBg/wACA80Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

The shikra platform uses AR50_LITE IP core as video en/decoder codec 
block (the same as agatti platform). Extend iris driver to support this
platform. This has been tested on the Qualcomm shikra boards, shikra-cqm-evk,
shikra-cqs-evk and shikra-iqs-evk boards with HFI Gen2 firmware.

v4l2-compliance results:

v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 41 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance -d /dev/video0 -s5 
--stream-from=./data/resource/simple_AVC_720p_10fps_90frames.264

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Fluster results for HFI Gen2 firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
        - BA3_SVA_C
- Interlaced content is not supported yet.
        - CABREF3_Sand_D
        - CAFI1_SVA_C
        - CAMA1_Sony_C
        - CAMA1_TOSHIBA_B
        - CAMA3_Sand_E
        - CAMACI3_Sony_C
        - CAMANL1_TOSHIBA_B
        - CAMANL2_TOSHIBA_B
        - CAMANL3_Sand_E
        - CAMASL3_Sony_B
        - CAMP_MOT_MBAFF_L30
        - CAMP_MOT_MBAFF_L31
        - CANLMA2_Sony_C
        - CANLMA3_Sony_C
        - CAPA1_TOSHIBA_B
        - CAPAMA3_Sand_F
        - CVCANLMA2_Sony_C
        - CVFI1_SVA_C
        - CVFI1_Sony_D
        - CVFI2_SVA_C
        - CVFI2_Sony_H
        - CVMA1_Sony_D
        - CVMA1_TOSHIBA_B
        - CVMANL1_TOSHIBA_B
        - CVMANL2_TOSHIBA_B
        - CVMAPAQP3_Sony_E
        - CVMAQP2_Sony_G
        - CVMAQP3_Sony_D
        - CVMP_MOT_FLD_L30_B
        - CVMP_MOT_FRM_L31
        - CVNLFI1_Sony_C
        - CVNLFI2_Sony_H
        - CVPA1_TOSHIBA_B
        - FI1_Sony_E
        - MR6_BT_B
        - MR7_BT_B
        - MR8_BT_B
        - MR9_BT_B
        - Sharp_MP_Field_1_B
        - Sharp_MP_Field_2_B
        - Sharp_MP_Field_3_B
        - Sharp_MP_PAFF_1r2
        - Sharp_MP_PAFF_2r
        - cabac_mot_fld0_full
        - cabac_mot_mbaff0_full
        - cabac_mot_picaff0_full
        - cama1_vtc_c
        - cama2_vtc_b
        - cama3_vtc_b
        - cavlc_mot_fld0_full_B
        - cavlc_mot_mbaff0_full_B
        - cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not 
supported by hardware).
        - FM1_BT_B
        - FM1_FT_E
        - FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
        - SP1_BT_A
        - sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
113/147
The failing test case:
- Unsupported level
        - AMP_D_Hisilicon_3
        - AMP_E_Hisilicon_3
        - AMP_F_Hisilicon_3
        - DELTAQP_A_BRCM_4
        - IPRED_A_docomo_2
        - IPRED_C_Mitsubishi_3
        - LS_A_Orange_2
        - LS_B_Orange_4
        - PPS_A_qualcomm_7
        - RAP_B_Bossen_2
        - RPS_F_docomo_2
        - SAO_G_Canon_3
        - SDH_A_Orange_4
- 10bit content - not supported in this generation of video IP
        - DBLK_A_MAIN10_VIXS_4
        - INITQP_B_Main10_Sony_1
        - TSUNEQBD_A_MAIN10_Technicolor_2
        -  WPP_A_ericsson_MAIN10_2
        -  WPP_B_ericsson_MAIN10_2
        - WPP_C_ericsson_MAIN10_2
        - WPP_D_ericsson_MAIN10_2
        - WPP_E_ericsson_MAIN10_2
        - WPP_F_ericsson_MAIN10_2
        - WP_A_MAIN10_Toshiba_3
        - WP_MAIN10_B_Toshiba_3
- Unsupported resolution
        - AMP_A_Samsung_7
        - AMP_B_Samsung_7
        - PICSIZE_A_Bossen_1
        - PICSIZE_B_Bossen_1
        - PICSIZE_C_Bossen_1
        - PICSIZE_D_Bossen_1
        - TUSIZE_A_Samsung_1
        - WPP_D_ericsson_MAIN_2
- CRC mismatch
        - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
        - VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
The failing test case:
- Unsupported resolution
        - vp90-2-02-size-08x08.webm
        - vp90-2-02-size-08x10.webm
        - vp90-2-02-size-08x16.webm
        - vp90-2-02-size-08x18.webm
        - vp90-2-02-size-08x32.webm
        - vp90-2-02-size-08x34.webm
        - vp90-2-02-size-08x64.webm
        - vp90-2-02-size-08x66.webm
        - vp90-2-02-size-10x08.webm
        - vp90-2-02-size-10x10.webm
        - vp90-2-02-size-10x16.webm
        - vp90-2-02-size-10x18.webm
        - vp90-2-02-size-10x32.webm
        - vp90-2-02-size-10x34.webm
        - vp90-2-02-size-10x64.webm
        - vp90-2-02-size-10x66.webm
        - vp90-2-02-size-16x08.webm
        - vp90-2-02-size-16x10.webm
        - vp90-2-02-size-16x16.webm
        - vp90-2-02-size-16x18.webm
        - vp90-2-02-size-16x32.webm
        - vp90-2-02-size-16x34.webm
        - vp90-2-02-size-16x64.webm
        - vp90-2-02-size-16x66.webm
        - vp90-2-02-size-18x08.webm
        - vp90-2-02-size-18x10.webm
        - vp90-2-02-size-18x16.webm
        - vp90-2-02-size-18x18.webm
        - vp90-2-02-size-18x32.webm
        - vp90-2-02-size-18x34.webm
        - vp90-2-02-size-18x64.webm
        - vp90-2-02-size-18x66.webm
        - vp90-2-02-size-32x08.webm
        - vp90-2-02-size-32x10.webm
        - vp90-2-02-size-32x16.webm
        - vp90-2-02-size-32x18.webm
        - vp90-2-02-size-32x32.webm
        - vp90-2-02-size-32x34.webm
        - vp90-2-02-size-32x64.webm
        - vp90-2-02-size-32x66.webm
        - vp90-2-02-size-34x08.webm
        - vp90-2-02-size-34x10.webm
        - vp90-2-02-size-34x16.webm
        - vp90-2-02-size-34x18.webm
        - vp90-2-02-size-34x32.webm
        - vp90-2-02-size-34x34.webm
        - vp90-2-02-size-34x64.webm
        - vp90-2-02-size-34x66.webm
        - vp90-2-02-size-64x08.webm
        - vp90-2-02-size-64x10.webm
        - vp90-2-02-size-64x16.webm
        - vp90-2-02-size-64x18.webm
        - vp90-2-02-size-64x32.webm
        - vp90-2-02-size-64x34.webm
        - vp90-2-02-size-64x64.webm
        - vp90-2-02-size-64x66.webm
        - vp90-2-02-size-66x08.webm
        - vp90-2-02-size-66x10.webm
        - vp90-2-02-size-66x16.webm
        - vp90-2-02-size-66x18.webm
        - vp90-2-02-size-66x32.webm
        - vp90-2-02-size-66x34.webm
        - vp90-2-02-size-66x64.webm
        - vp90-2-02-size-66x66.webm
        - vp90-2-08-tile_1x8.webm
        - vp90-2-08-tile_1x8_frame_parallel.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-2-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-2.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4.webm
        - vp90-2-14-resize-fp-tiles-1-16.webm
        - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm
        - vp90-2-14-resize-fp-tiles-1-8.webm
        - vp90-2-14-resize-fp-tiles-16-1.webm
        - vp90-2-14-resize-fp-tiles-16-2.webm
        - vp90-2-14-resize-fp-tiles-16-4.webm
        - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm
        - vp90-2-14-resize-fp-tiles-16-8.webm
        - vp90-2-14-resize-fp-tiles-2-16.webm
        - vp90-2-14-resize-fp-tiles-2-8.webm
        - vp90-2-14-resize-fp-tiles-4-16.webm
        - vp90-2-14-resize-fp-tiles-4-8.webm
        - vp90-2-14-resize-fp-tiles-8-1.webm
        - vp90-2-14-resize-fp-tiles-8-16.webm
        - vp90-2-14-resize-fp-tiles-8-2.webm
        - vp90-2-14-resize-fp-tiles-8-4.webm
- Unsupported format
        - vp91-2-04-yuv422.webm
        - vp91-2-04-yuv444.webm
- CRC mismatch
        - vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
        - vp90-2-18-resize.ivf
        - vp90-2-21-resize_inter_320x180_5_1-2.webm
        - vp90-2-21-resize_inter_320x180_7_1-2.webm
        - vp90-2-21-resize_inter_320x240_5_1-2.webm
        - p90-2-21-resize_inter_320x240_7_1-2.webm
- Unsupported stream
        - vp90-2-16-intra-only.webm

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v5:
- Moved the common schema changes as separate patch (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com

Changes in v4:
- Added handling for 600MB (Bryan)
- Link to v3: https://lore.kernel.org/r/20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com

Changes in v3:
- Fix the compat name (Bryan, Dmitry)
- Link to v2: https://lore.kernel.org/r/20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com

Changes in v2:
- Move the if/then schema at the end (Krzysztof)
- Fixed the order of compat (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com

---
Vikash Garodia (4):
      dt-bindings: media: qcom,venus-common: Add IOMMU IOVA reservation region
      dt-bindings: media: qcom,qcm2290-venus: document shikra venus compatible
      arm64: dts: qcom: shikra: Add Iris video codec node
      arm64: dts: qcom: shikra-evk: Enable Iris core

 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 +++++---
 .../bindings/media/qcom,venus-common.yaml          |  5 +-
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |  6 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 71 ++++++++++++++++++++++
 4 files changed, 100 insertions(+), 8 deletions(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260721-shikra_vpu-f37cfc006aba
prerequisite-message-id: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
prerequisite-patch-id: 6858ed1e274262616eda5e8138290025d8abda1a
prerequisite-patch-id: 23b24fb512c882a045ed8339b22269bfc2c5d02c
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: b4d934b7494892e273bedcad87fd422e09932b12
prerequisite-patch-id: 2f989fe8a34276dca1c97832663c736cb7d10786
prerequisite-patch-id: e7a1bab5625cb4ae230614069399a0d0b2373350
prerequisite-patch-id: b59fd05f9b62bda86079c9d86538b80289110862
prerequisite-patch-id: 71691d8b40e36cdbff6a52c3999ea8bb2c164d70
prerequisite-patch-id: b2868bc50d74afd13c8a0d0fd62301fa9546a211
prerequisite-patch-id: f83f24719ac475317507af09bf08b4a69b02d429
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: 4d46b63b5c30f86a941f41fccc5cdc4f60383bca
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: ad0c7612d91347317d038355e9e9b093169f1521

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


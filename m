Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1918AE3
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793195; cv=none; b=WErAmRpHjXYtbvW/duCLnnstvHkX0tscYasUOZ/03hK8kHAvY9h+O+LzOnWgtenU91p/IShtjVUsLOXuMjSKI0EGGBT6Ojna4LlhlYaGQelTAaQpQ85kx2ZndyDeRpS+eKKh2hIp/Hb9czSXNPjDgalDh537fj+rxgjTQkJzZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793195; c=relaxed/simple;
	bh=C4OrE2C+slhR2qzXPwipQWWnaPltMvJyS9s53vrdd98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FfgaVaQsDTTVRAccudpMB2il4PvBMgYox0AtiLcVDObEgUnL5LpZQxtrSuJD7jXABP/ngN9t5D44ZLTBNpqdVB39xvr9BzWVGXWExAx0CbPZQjY+KPH8PHJIQEtKyQ1D2K8UqIlRKtr0yeIr8atqnKFOscqTnw9hzziYeJvRzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KL5/Ifw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQQvltMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KL5/Ifw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQQvltMp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J4disA1411244
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q/hEEadGY4EQVPFwY+zg18
	L+T4g9QM3bJc7z1/VboOg=; b=KL5/Ifw7FzELaPIuAQS7O2RzgVyIQUeICZbVtH
	zTDKdmxLce7Y9+Hlhg+bwNZ2nru8vpaS+eF8BFoAnsghHd8SjBXq36jtNi+0CJvI
	Yp5xkou0JsHrum/cxxfH5hPC7TMPc2lfQp/5rW6mnxugvvkaCBIwaD1t4lTdgtUa
	6MDVbFQ3C7XFpkEFyve5wkU2s0ut+dvZreo3q8uQn7CulBQ/Lx+dHerbsixCEZq8
	aT9qwOzjjSZczMkA02DXUcTyyDR34iBhlOY7OrvGUJ2U3Laf1h9gajSLOMAzCB+H
	tTEBx+A0WzMvnIEXEBr7jSxWh7Nn3o7CqgIiBoHOJUmlAlpQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk00c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1369802a12.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793190; x=1790397990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/hEEadGY4EQVPFwY+zg18L+T4g9QM3bJc7z1/VboOg=;
        b=ZQQvltMpEB+4ACtt34y4P3wonz138WuEtTqwwnT/UMNczJJiwDz1Y/C8/NlMHOO3Vx
         xdAhDHjdAihU6FnShiuGeiPhjm0CqStwaXiDgPy4iYoU75sWx29yYIbg3KdOSBq6J5bX
         w9OWLTDl4EzSFd/rWPwJqOYi09wqSBNapfwV9u7nT3hAMm60f0AbOu5qdHeRNCbKnuRq
         EOOXI+F4PKMQNujGSaKjccBeF8msnYiz6tOOS/04XzgfUfZjtwn9DnB0PIzcwT7T0AaE
         WHzZVSbuWsmSWZV/Ap4A16j7frPZPtADHVwQathrX45cxfSIabskv3zR+rJ/j9tgmcos
         WtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793190; x=1790397990;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q/hEEadGY4EQVPFwY+zg18L+T4g9QM3bJc7z1/VboOg=;
        b=yirQrMX1ZK7BhJSC3plVT5LbJahagLc8f3G3fmoZVdkkyElfTgGcqEJH0wroZ6Bs9B
         XTwaTyxGo3L4FPZKzj4x0ydwu2kux7CdB+N6LXD4eUbwrEUIcy1WNdeQPkmCgKdaui1i
         c+MA3UgtvqIWxwdvnI0JMCJZzZ6x/FNN0D9HQb/ofnr1T7EuENySuu5/o89+0kkyAH8m
         xNmef6Wl7VV/N0bfkP7mCOli6HSKjzkA+4KHWU0EiWNrnA7uCDCSZyu40/FxCxh8Xfk+
         6SWShrs2c7ytW/seWC/+sUNCwfjozJR88JFk+B5adHl1LDkos846n1SvVFT4PlA/C6WD
         05ug==
X-Gm-Message-State: AFuF++mVoRkBVqIP/tOh/8ZZDs8rdekAaPBWgzJV3+kx/Nah4qp7mXum
	31Y2zzyRxrXMNd3SAQmPNSDm0yM9Hb/OoDgYV/uxAmkmHwNz06A8Qk3SVeXCxnM6VtElPYL9o5j
	ZxNWqBa2dAC6plxQf9I5yVmxGn41ENsyDHRzESd+GrSbcHi6DszQIL9yy4FttFrrvFw==
X-Gm-Gg: AYBFou1vqYt7aRPK/ZnicKQiiPxWXnD1l38cFjSCVw4Rh/BTw53UNWbKNQCeAHytSbd
	toRwqEBq7n6+lu90EwYgODwjnH7zOKTDg+amwi7WjeU1ou7EAhKyNCQhsjcw0lioBnk4oMQvM+Y
	C0yYscd0+V6Y1FMdGQ8qOAo9TGEDskvmy7ZbaDrmIJnYHQMvY1QNqBVaj5uLqPvDmcg5QQyqSFv
	ssqkijv9NxYEI1T3G0vLJIEM8yxbjeI9YLQHaEpE6TqW1TMPI1vUFqSw5UIfAlodwodIkP9pqtZ
	Na+KaJrmdVSITbIUwM9miWMins175BGX1GCOtew+n0i7HQasqshXH8d6TcFL8C7Ix4WDfAUwJ1m
	J896b1JZ/ji2XofVUbGCKrDD6QHT7owp+
X-Received: by 2002:a17:90b:37cf:b0:3a0:25f0:d89d with SMTP id 98e67ed59e1d1-3a025f0ddd3mr448700a91.52.1789793190117;
        Fri, 18 Sep 2026 21:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:37cf:b0:3a0:25f0:d89d with SMTP id 98e67ed59e1d1-3a025f0ddd3mr448671a91.52.1789793189541;
        Fri, 18 Sep 2026 21:46:29 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/4] media: iris: Add support for nord platform
Date: Sat, 19 Sep 2026 10:14:54 +0530
Message-Id: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkTrmoC/52Ry2rDMBBFf8VoXRmNrGcopf9RQtDLjkpsJ5JtW
 kL+vbLTZRYhWgyMuDr3zuiKckgxZLSrriiFJeY4DqWBtwq5oxm6gKMvPaKECqJB4WFMHscUM5b
 EgnQehJESFf05hTb+bKyv/b3Ps/0ObloB/4oULnMxme4y1IeczWayq97vHqQBRgTImjEoBwPOx
 zB0Jc1Yd/P4OeZcX2ZzcmPf16V8rOQHnPJ0y+rTgv2EF8AEB8odkY1rwYqnQYQRBQJ0zXUjCH0
 9kCLQSEZqaDgnWrwOYng5z4dYZGtdzKH8lD/FocMLK1Nqq4lkpszJ4HmoxN3pt59T2dS2KuKUd
 cVLMvoYYk0OeL2J065qWsoob7nl1lrvtQZntPOtL6PSIJRXSnOtFdrfbn80Hy1zdQIAAA==
X-Change-ID: 20260918-nord-iris-70b17cd16a77
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=17515;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=C4OrE2C+slhR2qzXPwipQWWnaPltMvJyS9s53vrdd98=;
 b=U2QRaXUq++xr3QeYAJoTGk3RO5uP/166/YpC1a0dCZZH3QgYhVitV/D0KMeYH639eXBvuo+Uf
 tgOLMYozoiZDphopadl0+pKMqlg+JtBEQQBrh6Th6eEHrP002MRI7Aq
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aae13a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mI4aUcGMY0OTypOOqssA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXxH7YJaN4wD/W
 UxdTWTWUx5T5fGjHyhXApvU5XCan+q6/zsP4LZ46XLyYgXG6iiUSLY4FCAE8H500A7YT+D70MtI
 K1ROFMFI+BXwkrw34ZnBrt4fQfKueNqIMb70fe9aGsSagHsOZC5LumkDYBIO/hhZUM+9Uvxqj15
 b+sfxpDnD8K/FG6wA7QuSCzz05eKXRvCgJTMTOUBcUjB+c3HD5NKTXZT0I9aEdfU38fbgHdgnCh
 PUhKD9MEHF61DZZiSnzQ+zFaMu7xFNdGBUXEXyPCf6NGFxkoTGlmL2IRoLK7FiTKDvrE6Lof2WH
 Qjg3wXf4XTZDY1ZZzDAk43xwOqpyi2DZHlyuJdRHUYXuLAe3iGzgFAwbFZx3o7tQfPLYN//oRQl
 Mve/ca/b/XC47RZHqtw68jkoKz4to7PU1vpWMk9H6MUnRau+ba3g/1DqA39hqs3ntHtG5G384Jf
 8S1OV7sU22seh1z7u7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXxMSwySpeU7vj
 w6EzD4RSSc4WbjCluf+2aQ4tR+YpNOPxXCEulWf1AYzOrKCuz3MuAE+7A3Tp+yJGxQ0FztTZSwq
 +CtcIhKlsDa0oqTJ6sRazvGkSwDHu78=
X-Proofpoint-ORIG-GUID: q70NAB5NpawUlcF5GlZOJgpVH71f5ZHe
X-Proofpoint-GUID: q70NAB5NpawUlcF5GlZOJgpVH71f5ZHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The nord platform integrates the Qualcomm iris video codec hardware,
which is compatible with the glymur based iris implementation.

This series reuses the glymur DT schema to accommodate nord iris
support and adds the required iris device tree node to the relevant
nord device tree.

Test results:
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format

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
        Standard Controls: 12 Private Controls: 0

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
        test Scaling: OK

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
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
        Standard Controls: 64 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster test report for Nord:

77/135 while testing JVT-AVC_V1 with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
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
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
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
- CVMP_MOT_FRM_L31_B
3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C
2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b
1 test case failed due to unsupported profile.
- BA3_SVA_C

140/147 testcases passed while testing JCT-VC-HEVC_V1 with
GStreamer-H.265-V4L2-Gst1.0.

1 testcase failed due to unsupported bitstream:
- TSUNEQBD_A_MAIN10_Technicolor_2

4 testcases failed due to unsupported resolution:
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2

2 testcases failed due to CRC mismatch:
- VPSSPSPPS_A_MainConcept_1
- RAP_A_docomo_6

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0.

64 testcases failed due to unsupported resolution.
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

2 testcases failed due to unsupported format:
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm

2 testcases failed due to unsupported resolution after DRC:
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm

1 testcase failed with CRC mismatch:
- vp90-2-22-svc_1280x720_3.ivf

1 testcase failed due to unsupported stream:
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (4):
      dt-bindings: media: qcom,nord-iris: Add nord video codec
      arm64: dts: qcom: nord: Add iris video node
      arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
      arm64: dts: qcom: nord-rrd: Enable iris video codec node

 .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
 4 files changed, 131 insertions(+), 1 deletion(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260918-nord-iris-70b17cd16a77
prerequisite-message-id: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: 15b7e40d16abb923052d14832a468b832822e02c
prerequisite-patch-id: a127e821eb3382d30c05fbcf8f3fb520263cbbc5
prerequisite-patch-id: 2d52b8db1dca030ceb064f13dc912eb5478b7d63
prerequisite-patch-id: d21f937c2939a84117e7f4e1473875412914f9a6
prerequisite-patch-id: 97b755b1bb9cf6e3bd0b402bcec890161cad6868
prerequisite-patch-id: 97f41c3ba82d7a7b866b35e7aced283e8d0f699e
prerequisite-message-id: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
prerequisite-patch-id: f8fbc6150e3c9173a58c51b21aa361b4bf427ff6
prerequisite-patch-id: 914292456c91f83f83d078d3ed589e87ec1961ff
prerequisite-patch-id: 8b04289460ffc81d540c383255e644eef8e7cf6b
prerequisite-patch-id: bd8d5373421d6979f63ca6782dce3cfc8f7b8878
prerequisite-patch-id: 5dcb5f0b6e62d524634f4876b33c0ef3482150ad
prerequisite-patch-id: 4ec69028284b5b4f1d727d600ac81f9c91eed63e
prerequisite-patch-id: 91d92d9d408bc5722e5eaa7f615269e64e459bd9
prerequisite-patch-id: c7b1e7672798e47c66d645c14bec824b2eebed9a
prerequisite-patch-id: 008c9c85a07687ae136b5cc62ad8aa2ea22fc2af
prerequisite-patch-id: c90b7b7096decd328219c71689e95ffa4127e841
prerequisite-patch-id: 112cc818078b668c3a08b8011a22cdaa3c965cf7
prerequisite-patch-id: ae16d3341438d6d49a5d575f0e8d67465cee5d41
prerequisite-patch-id: 521ccda14a5f47e8c231912e82ed32a4653e8805
prerequisite-patch-id: a22fdd503289f80720b26f8244185226e0417115
prerequisite-patch-id: a3dba98903fd87c5893422fbae7c376a77d44c30
prerequisite-patch-id: 86e23f75f4b0f169e537ab6430cc33a2a4ad43a8
prerequisite-patch-id: f93d80383550a3b1475356ddb725f3d6c2d25634
prerequisite-message-id: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: d3621342d373b4e41ca0d0b9eb4648bf0187cf7b
prerequisite-patch-id: e8b7e40ce305132672ca5d10063c1b20bfcc8361
prerequisite-patch-id: 2d02f5f60554a49da2d030e507bb9a27ad99f092
prerequisite-patch-id: 7c326dff78934f41e92cf662989b1d11fa670387
prerequisite-patch-id: 7ad3809e9f6fe6fd47b95a7fd1dfc27fc290f457
prerequisite-patch-id: cbaf2c4a49ef854d3f908de5d8871e9d49ce4a99
prerequisite-message-id: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: 654ba807f2ca53a3b580f4990c28fa35fa7fc4fa
prerequisite-patch-id: c9f7632f7f31b1fe6e40c2df354d6047553ed967
prerequisite-patch-id: 95df9bbc25e2f96c3bc8090543bceed0a31527a2
prerequisite-patch-id: cb3907b10983b3a473cb01fbfde657114e468523
prerequisite-message-id: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


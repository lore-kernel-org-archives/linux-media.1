Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577096;
	b=dRN0DXVseyqOxD9uLGgfnanPIQ0A069Viup7PqsK+NrrDNaoCNtnhGoN1ot6R/6aa2hT
	 uk+5JdjZQnhsEJYYWr6fjeTASleedb3eelsULHphiDpzVdu0LxLWRHMHFH1r2135eDEh2
	 qUdnLeUc0y6aHCsNJ7GnyAElp7mREHb0nywVL3kmy1k1Oxh9c5xmDuBTdXjFGJTsYblyq
	 d2uHtphbQIeCpnO7bYYfN69FNIuqZ0YSx8YN05/cT8p+aNhceq2QXXTzHzek9WLfRCNVv
	 RwDWt30UBqsqkyxqcHB0xacxdUCshgmbZRoRGN2ekDUx/blKXYowY4IWUqr62yVTtgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0nyNvRPyvRlCibHwspR4g76SunM75HIc6k9JPpTvtAg=;
	b=u5SHZeUtqi1Bk+cSky0vs3h0mM00jOkR/7qTj/+HvMBju1afts2wS4A9R6x3baJD9pg0
	 k0M/1uyY+HDeyrIsXlyuYKt5Oxt+LDirVG9a6bQNuXB6yt33TWN15T61Wxw9+yJwATApJ
	 ZYEEB3go+x5rxDB0TxrU03PNsevcal+K82VGc8/5X4LbsFSg/ls2TFw6LDz3Wmn8q0FUC
	 s+kE3JNf0sU2ja3x1k0b9mFbH9l9ty/gpB5N0UBOIw4tZguT3Ju4ytI9EFurLTQlhebwh
	 OQJe2Eb2IKI2evcSbIdgo54SPZahjofkvpcGiUHmGw0uUOrFCOVEifh4PH8P/9ZCZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fBVszIZh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ29X0yW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2B7606A32E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2B7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fBVszIZh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ29X0yW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2Asd72109319
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0nyNvRPyvRlCibHwspR4g7
	6SunM75HIc6k9JPpTvtAg=; b=fBVszIZhwzoWTtoqlPc6Y2hu9EWxZw74d6yJfi
	qMbTYOiL41xN/K28QOojoditj37lfO6VOeGHr3FIcWDaExMnAfXEkDgLf8L346q0
	rucekM/TGof2CuDpMsi26mgMBCmAyc04C6s4dpK4DA0G8zPYg0eUxzbhdkeqxFnx
	yfw3hLqS6poc7/z/oM34AIAKpXsaLx3U7sKG/HijPlItpH9kwMG0iTS8pD2etFZQ
	zGsf6ozC5gXSweWCrKN/s5V+v4DRRmAZyr7E/qXFasQ2a9U0378PcCmIqxir9Iax
	d2+osL45mVETqzDO2mLYNEq0TtGsIO9nOEOKqLCZd4QFfs2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd9yt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:24:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso110443b3a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577094; x=1796181894; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0nyNvRPyvRlCibHwspR4g76SunM75HIc6k9JPpTvtAg=;
        b=jQ29X0yW3ZuowRceDghYS0dZUH+SpRTG2XquHoYjpV+Z2fvCHh90xUBgpfbyB4Ny/L
         6TUF8nbaHhbrYGc+2s8rxcu/t845HFKaxVMxXV89TJx9pAc9QZhwkogKi2VGUrFL3O/C
         l++ywGhxA4VekzMk67weWy4CDspR17+nD9lTEQz4GZzWyXKwTvurKrB5trmIJ2mOwqQS
         Zkd3GhucerRpUEk+nvm6ojNTQgPlCRyo8iAZcRhRRVQQTNOcmfOzg239myuSaZfq5hNx
         Y0UmKMUlMo3w2SAI5LsjagSLqpACiS/AAdAZtIzNw0qy+pFmWQAtMsYdhZrLV2PClKlG
         zy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577094; x=1796181894;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0nyNvRPyvRlCibHwspR4g76SunM75HIc6k9JPpTvtAg=;
        b=lUUJquisXzlvho/XKvzBOMlQR9MH4UB9ErK9VEjjLY1JeqX63IRjMg4WgCpbv3pQP/
         X+kwkXEbyAQdSA2gFfIELioALgWktgJp4modWN6gSmClpcOu1Wr69KEOOfVQXEhx3y8f
         KDn0t8JjlevvpPD2RkCC4ggahcAj51MT/O6mFC18iLYfi64BHcgqBFb8T7zGY0CC5lws
         M6+ImVZ9NFkVDINjF3Ml6CItr3uyaIH05k3BewBe3KUQGqxdB7tGN7Aud1pK29tPWeCQ
         moGyq+LqtUFuN51/2j+KIoMt8VJPL0mmSDHeboNqer1UvvvyCBktjPoOCkj7z26xLuz/
         Pj1w==
X-Forwarded-Encrypted: i=1; AL+hErEastOmVAi7xBD5zOXChCtonv/r69JO2EZWxv718jGbXjIsSUCCtru1GtDQj2W2f15GRlRpGbYgpVja+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TgQ+fHrfV/4n7oBEm4kbp7sbZegMrgY8RdE9W1vN/6I4SFzgh
	PuIWbDuOQ5Vq2CfNHjpDrIWQO6sU+qBdbNF+rYO1hDM1IhvCrvZUmyo74UvIqzZ/d7ORHOHsh+O
	rFRrzy7PZpfXt1mehRINHXX2Z6q4gKqAQyUbqubrEKT66mwvX5OX42M5pqFCqqEMw8w==
X-Gm-Gg: AZFdTZd4ECJ+lpYsC7EBJDJ4q9UhFusGFAcAaHWXYCIJgoFMNIT8NWjGcFSHez7zGOP
	En43knzF1eqJELWOa4JXwMMAXgqn5+jq8qVyVMLTnsaqc4y3w3DXMJZVm2YBgFFGcc4fefrfuBO
	EAn+5d/kSDDVKZGgVNjIDwchqNpEYzvjWqtdNSKenX7+ePFJL0NjT7pP3Pc0QjmTpSPElh6fwxO
	yGqy56/zDNsT0ZaKXsFVpKqjiBXjsitjyS4nXI4OjrDMiM3McyvjDDxXG7iVcIFwr/JIGmRbjeo
	eeAjxpEku0jVHY6IE/bCnWp8b3/PqZbKNU7+0EzzczyDAZfVgaEfKUzo0ilaOFYh6gX6K7AoIHR
	4EQdkJh29F+FvNv6LJZE7p93rfsVfWLagKiMApzsEuEjPUYodc4bDT68G7xj4anYJ3J268hYs+p
	QHlpA2d00=
X-Received: by 2002:a05:6a00:4605:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8c87d22886dmr17405145b3a.52.1795577093441;
        Tue, 24 Nov 2026 19:24:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4605:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8c87d22886dmr17405114b3a.52.1795577092853;
        Tue, 24 Nov 2026 19:24:52 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:24:52 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v12 0/9] media: iris: Add support for glymur platform
Date: Wed, 25 Nov 2026 08:54:07 +0530
Message-Id: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANhUBmsC/42P3W7CMAyFX6XK9YzyQ+sGTdPeY0IoqV0WRFtIS
 LUJ8e5LgUsudmPLR8ffsa8icQycxKa6ishzSGEay6D0WyW6bzfuGQIVQWipG2kVwv74O+QIjUa
 Sa2ulZCmK+RS5Dz930tf2MafsD9xdlu2nI/I5l4jLwyYGTsndEzbV+xKglJbgiHZhGoa8i0t+g
 rkFCWTlum0sGo/mc0ppdc7u2BXbqpSPhf+CpiyEGBKUR+jIkEcfRoLZFF6tad2gU8ZK/DevXDe
 f8vO6MM1udyeHcQ8zFqiuHaLSprT+NdS7xLAo4bKpDFHboZUOPUqNzhPVTcumIV9zq/vescMOU
 Wxvtz/KAMejqgEAAA==
X-Change-ID: 20260917-glymur-627d049900e0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=24418;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=t0muWNYT0GAoeGfhSC0ZbrIyBEWAEOValMPYMvANHcI=;
 b=IDpx1mI9Ce9R42H0biV1Nvc4Aiv0FW8UaOX5U3kAFmWGvraRfwPNaKMpPQIcBt46tDjbX0QgI
 uWlBqjQqwh3CZU/e8wE6e1r1zCtcel241N06q2w5xalPwH+h8Ko9PbS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX5h4Fs4qJ1l7a
 hjFM3Ubmvq3vZPq8j6zUN5KrQGXY0Fzt8UVDnhLtHrm8J7qD1f42cUuooB/Pww4VWPYiHqcalDY
 KdUTrjeAELloGF8/ffcUF+HEGFWdXR4=
X-Proofpoint-ORIG-GUID: GjgdwRYOiNTw4jBz-8wd0JrQwYwHmGYH
X-Proofpoint-GUID: GjgdwRYOiNTw4jBz-8wd0JrQwYwHmGYH
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b065506 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=mrPm6b2eORdxlkHJHlwA:9 a=hlxqA-UbdR87cjVc:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXxmaaWvTSKCse
 LqH8p42HLU9U206IKhFJ/nWVHZaNoxF1KuC9yNOZjQzKjUHOE2OIrTHNKdDYOvf1AsnWQt7Ks65
 3/1CtmeYBBIjbL94nHdP+KBh9DT1et5waXWj8FBLsCNwRlQl9m74wAb4OrWRBYhytEBJ8yIQGtB
 tRuEa27Ok1/5ZlIomlJ7Lrf4pbLMiGIGsldGWzaDIsEuZx3nvJ6kuavF9bE3pu5017Y8VMa+YLo
 0paZSznVDAFN4LKG6NzVVDD0KiuA+bevmYvPmUbMAKrGfNsbJmbkAp/O6fiUSco5M0BnxERzoUx
 zUBvq5hYD3W5mrxpXYrp0xbJNH2/jyQcsWJmo1xmf7TIMt65hOmEGH5rsSxEErv+Tnec4ndfiJH
 wyWazE+tdPFdc1bLdqbm6E1PPQBfLNQi04Cnj9I9E1tyxwz85E4u5gjIAfIEbSm3dIv5kQaXr/m
 Vt2jExMLeuKN8UJyznw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

Glymur is a new generation video codec that supports dual hardware cores
along with additional power domains and clocks.
This series adds platform specific support in the iris driver to handle
the extra cores, power domains, and clock requirements introduced by
glymur. Add support for firmware loading through context bank firmware
device.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
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

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.1.0
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
        Standard Controls: 43 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster test report:

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
GStreamer-H.265-V4L2-Gst1.0
1 test case failed due to unsupported bitstream.
- TSUNEQBD_A_MAIN10_Technicolor_2
4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2
2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Refer the below link for the
discussion happened for earlier platform.
https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/
- RAP_A_docomo_6
This was discussed on bug report
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be dropped in
the firmware or driver. Discussion ongoing with video firmware team on a
way to handle such case. This issue is not specific to this platform, and
its there on other platforms also.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
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
2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm
2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm
1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
This VP9 bitstream contains 20 superframes, and each superframe consists
of three subframes in the following order:
• 180p subframe
• 360p subframe
• 720p subframe
Each superframe is submitted to the driver and firmware as a single input
buffer, with one common timestamp attached to it. For every such input
buffer, the hardware decoder produces three corresponding output buffers,
one for each resolution (180p, 360p, and 720p), and all three output
buffers carry the same timestamp. When these output buffers are returned
to the client (GStreamer, in this case), the first buffer returned is
displayed, while the remaining two buffers are dropped due to having
identical timestamps. As a result, only one frame per superframe is
rendered. Here the expectation of the test result is with 720p, last
decoded frame in each super frame.
Discussion ongoing with firmware team and gst maintainer on how to handle
this case. This is not specific to glymur, and its there for the other
platforms also.
1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v12:
- Rebased the series and resolved merge conflicts.
- Renamed the power-domain names with the "iris" prefix.
- Added a core bridge reset before moving the vcodec to hardware mode.
- Updated the commit descriptions for patches #2 and #6.
- Removed properties from the required list that are already available in the inherited
  common schema.
- Moved the core load check to the end to ensure that core_id is unset in failure case.
- Link to v11: https://patch.msgid.link/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com

Changes in v11:
- Rebased on v4 sub node series (Dmitry)
- Dropped the patches which are added into sub node series.
- Added poll wait timeout logic during poweroff vcodec (Sashiko)
- Link to v10: https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com

Changes in v10:
- Dropped reviewed-by tag for dt-binding patch (Krzysztof)
- Updated commit description (Bryan)
- Updated firmware name (Dmitry)
- Removed comment in dt node (Konrad)
- Fixed sashiko-bot reported issues some which are seems valid.
- Link to v9: https://patch.msgid.link/20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com

Changes in v9:
- Dropped iris VPU bus patches (iris-vpu-bus support and its iommu_buses
registration)
- The below listed patches are added, those patches are derived from the provided
link and updated the code based on review comments:
Link: https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com/
- media: iris: Add hooks to initialize and tear down context banks
- media: iris: Add helper to create a context bank device
- media: iris: Add helper to select relevant context bank device
- media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
- media: iris: Add hooks for pixel and non-pixel context banks
- Replaced the iommus and iommu-map properties with pixel, non-pixel and
firmware context bank subnodes in dt-bindings and dtsi
- Updated the vcodec poweroff sequence with proper polling logic.
- Renamed the PAS API usage to the new qcom_pas_* API (qcom_scm_pas_* -> qcom_pas_*)
- Updated the reg address in dt node to 8 hex digits with a leading zero (Konrad)
- Link to v8: https://lore.kernel.org/r/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com

Changes in v8:
- Extracted register addresses to separate variables in power sequence (Dmitry)
- Fixed sashiko-bot reported issues some which are seems valid.
- Link to v7: https://lore.kernel.org/r/20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com

Changes in v7:
- Replaced enum-indexed clock and power domain tables with per-block structures (Dmitry)
- Combined venus common schema update patch and glymur video binding patch (Krzysztof)
- Updated CPU_CS_SCIACMDARG3 write value as zero specific to glymur platform (Dmitry)
- Updated the clock and reset names (Dmitry)
- Link to v6: https://lore.kernel.org/r/20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com

Changes in v6:
- Rename function names in iris_vpu_bus (Dmitry)
- Update the venus-common schema (Dmitry, Krzysztof)
- Add dual core related functions into platform specific vpu ops (Dmitry)
- Update power domain enum names (Vikash)
- Remove unused macro
- Link to v5: https://lore.kernel.org/r/20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com/

Changes in v5:
- Remove clocks, clock-names, power-domains from the required list in
venus-common schema (Krzysztof)
- Update core selection logic (Vikash)
- Add macros for power status bits instead of magical values (Vikash)
- Add new config for iris vpu bus instead of using the iris driver
config.
- Re-arrage the patches (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com

Changes in v4:
- Update existing venus common binding.
- Update glymur DT binding required properties.
- Patches are rebased and resolved merge conflicts.
- Link to v3: https://lore.kernel.org/r/20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com

Changes in v3:
- Drop generic dma context bus and moved to iris vpu bus (Greg)
- Update commit message for platform data patch (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com

Changes in v2:
- Update the clock and reset names in DT binding (Krzysztof)
- Update firmware device names (Mukesh, Konrad)
- Update the selection of core for dual core platforms
- Add new generic dma context bus instead of own iris vpu bus (Dmitry)
- Add patch to get power domain type to look up pd_devs index
- Update glymur platform data (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com

---
Mukesh Ojha (1):
      media: iris: Enable Secure PAS support with IOMMU managed by Linux

Vishnu Reddy (8):
      dt-bindings: media: qcom,glymur-iris: Add glymur video codec
      media: iris: Replace enum-indexed clock and power domain tables with per-block structures
      media: iris: Add power sequence for glymur
      media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup registers hook
      media: iris: Add support to select core for dual core platforms
      media: iris: Add platform data for glymur
      arm64: dts: qcom: glymur: Add iris video node
      arm64: dts: qcom: glymur-crd: Enable iris video codec node

 .../bindings/media/qcom,glymur-iris.yaml           | 215 ++++++++++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
 .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
 .../bindings/media/qcom,venus-common.yaml          |  11 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  10 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 120 +++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_common.c     |  10 +
 drivers/media/platform/qcom/iris/iris_common.h     |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  32 ++-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  66 +++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  47 ++---
 .../platform/qcom/iris/iris_platform_glymur.c      |  79 ++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  15 ++
 .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  26 ++-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  26 ++-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  29 ++-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  70 +++++--
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  37 ++--
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 ++-
 drivers/media/platform/qcom/iris/iris_power.c      |  28 ++-
 drivers/media/platform/qcom/iris/iris_probe.c      | 153 ++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++----
 drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  58 ++++--
 drivers/media/platform/qcom/iris/iris_utils.h      |   3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  10 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 225 ++++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 ++-----------
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c |  70 +------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 102 +---------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  13 ++
 40 files changed, 1277 insertions(+), 525 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260917-glymur-627d049900e0
prerequisite-message-id: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
prerequisite-patch-id: 99bdcac6ebf8b12961e5288bad65e7cd62888f91
prerequisite-patch-id: 5ea5af6f15d0c88dab1b192d74ef4cd938e69227
prerequisite-patch-id: 792dd9c2022019b38a169cb1e6ab84d87316b833
prerequisite-patch-id: cda71b749bf72bc68adae87d8a34bbbb9aecc5f7
prerequisite-message-id: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
prerequisite-patch-id: ea985fc3b351931adea7940855e5219be3a2bed0
prerequisite-patch-id: 5b6c27159dcaa5c06b59ed92ad39824e002a9f93
prerequisite-patch-id: d9bd004033c1a7b4f02f5fc1390a5e21ee6b38c7
prerequisite-patch-id: a2ea5644cca938dfb766227030f1200fe9e08cdc
prerequisite-message-id: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: dfda0feb821780a590738c201122de76d537e599
prerequisite-patch-id: b8676ee747123905b4a1818b6e6c41df0ab2b103
prerequisite-patch-id: 54d5a2f9c8c8e18e9bdf0e60035324c4966182fc
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: f6d197d4cffc20ab304ee3c206dd8061d37af192
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


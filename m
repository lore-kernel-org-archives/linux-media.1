Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387956;
	b=sHxNZJwW0MSx7NFnZ6bac+ffCgLgGtZndeyVLkdjCeXTeeqZPkesl78dXPoHdB/IkJTb
	 iC78XA7fkpX4Y42N7HAu1bK+Ms2JExycnDwz/WxXTDINM2cW9RToxVWVagW59n6Qq2ATy
	 vl/yluSOKg2PzKeinnmeQCqL7sz7yLYVQaAujFdMJ9VV15Fv2DyaCLoYXt8mv2HgPu2zQ
	 g1UPTY1ZRXIq1L74UTMlmvhUYd4LiVpplmWGav3kF1+sGqyowK9g67MZPbFmuYvfVugzl
	 NqfysWD+sugsJEjCLw43eWnWb8JSWKRjnb7WwnJwBTPW0BNsotc07V3AmEgnzLSwlTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6tNaRTlQhtagN9ATdJGn+dy+DRH69mokAHtAJWySBto=;
	b=XA8O3JF5ZPiVdHtUYyQj1JfAb9+Soa4FVvwC4wfTpn/zp2iTd/NSI/y75odQFtlOvbEC
	 wQ0ki6w5stdHoXx842RLMa1JVmFIpLmQv4xqa8X/13FGbb5yFQJf3KV9U7pm+sW6TRDG3
	 A9Le8bVJxcfpuZwvUjptVp8xknGWJC5qJEEkDpUxbgRtRLjGuUO8TA6HJw+kTb1/XoWQo
	 OLmBACEl0MD2Rh5xX0smzfETk1KKg5auRx6gA7cbFjf6QvyS07FVYJKWZ4udL7IgpaHs0
	 +ifwy9EfsnBoQSLX++gBy0SO5NKJJYJZl7o5EEl7hOyfweRStyZXopuk6EHRUrAZBww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBhWkviA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z0Cz1Fe4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E0606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780E0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBhWkviA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z0Cz1Fe4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOqX1590039
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6tNaRTlQhtagN9ATdJGn+d
	y+DRH69mokAHtAJWySBto=; b=WBhWkviAF0rSOQc2+96Ex06+/L+nd/Ty29AUcQ
	z+6INBjLNQIX87OFOrR3cKS53X++j7X2LwPY+JEt2fLI99clyUcKCjRKf0+8w53x
	IC2DU4w6NMeIHFdqXbLmWSx8aSl90cTfiXC0mgIEicvIcp+bxEkwwRgpJ61uz1Yk
	7BlWSTao/7JxLYVZdPNLu0dOAQ5Cf9opkhyWZHBglTlCDFpQpmoy5hYu9TcIM82H
	svArs3HE09/qn37KMcb5ex90A6VPtWheLEDriwO7V38jMIh+BIj/ApPktL083Lof
	ncWIHT1ORux1bhBQc/nsfxMeo9trvhYq5YOu6srT7ozEjLdQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm8e5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:05:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso1209859eec.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387955; x=1794992755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6tNaRTlQhtagN9ATdJGn+dy+DRH69mokAHtAJWySBto=;
        b=Z0Cz1Fe4h5p3vq33CwEvEMP/tU4mt2JAbyd7znWMbUdhpMM/UlafBrymiZXns7C8Wk
         nKCTvFaVGjK/g9AQ4Y6Xu+NGUazHZp0nELcGW5MzEOD9M0sK6HqCyRu/GAtMhIDDKfUo
         T9Alf3mFZk2hRvc8x34hzIyb1OuIvdSgZOs/vFYjnRKX1s/zjzqQGLk51wtwqKIpu16F
         /o5vzOU9j1zNg3vGM8di5QmlY8s+l5Pn9jp/5qQWCjCvTiXOlIQbjjtErOpC/zkA3XYw
         xOOFDAfK+QQOkPBo1elLLoDhgYpUJHDxzYYIUlDOOu0Jd0nmuytC7LybrMHTGm9exM5V
         W47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387955; x=1794992755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6tNaRTlQhtagN9ATdJGn+dy+DRH69mokAHtAJWySBto=;
        b=axiMyb3n/Ho8tM/QUbP5eHvSN7K4NDQxzoc6zlfhHS8FfyR82fSwUHnuvxlta+lil0
         2PPEnhwCpqZ6kNykQPuXyyh0dK+QzUSehNLOd6zfj1+bX8y/ccA8Al7tHRlvzEcn4T7A
         yoARPehf0fyAUMgrEQayN+nxh4mitTQ0FTWyKy3RcaNhXDn0XOKvZ9pT4a4iycZ7kdLw
         s/tKpAsqNSr33CDwx6s4ZlJ8+2GSTTo40RZjB2MJ4YFt6iKrGlalxBL3it+pKB2E1v4h
         h363/vmK9Mump0Q51C0y1KxJEskFZdcQglfyag2WtNubiy8SzgrDbhG6+mnjr9yVjvZn
         eMiQ==
X-Forwarded-Encrypted: i=1; AL+hErEr87YNJ+wQifMZCVC8Sn9aA8/38CSHgqS0uISQnaDedc8bF4ZOGPxmrf7aT1IcHBhCmwgOjuM9IUOFbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VmjSuYBOdvuxajiJPBN/68DOElh2EPzh2473FC8o9BV5sftxV
	renH+toIHv63xD9gAWJKNT6N6VlhyT4aoW8PZVLXX+zcMrnSVhlz90BnOopkc/Gm041MKWDaRV4
	uyTTeDv5WmpkOyCZRnYmEkM43msiAASx7QJUalSNGqGQHsikQrsje5VtUrQkoAT9tYQ==
X-Gm-Gg: AYBFou2U6rw/9C4J6bU3Y607d83izd1VWW1mamcaPbInsMyxnQ7M1vmITrBiMsqVYaV
	bMihjTEtMURcgfnxxm9OrPZBa4CuMM2TqCc1Eoxm410A0MkGQ/f2M3xQYxQIVHeJjoCp1a0d7ok
	Wp6HQBr4F8/GrsYRdtUmAREeX79wbmODLkS27QuTNt+X3CHKv912qhGDvfdEvIzFpIYHfv6HJyr
	xJrVeS9p+paSzHuyGpQLrruZhaZPLtTTaWOMwDSseqx7oM8sgNHyx3q84vXwbP2Wmc9gUWvPGTH
	2E0tnFu3gV+X6NQsFU1d6z3/Wu2gkREKux1NAHQ8et+7pq+ZQ+ZwPzuCItCdrn4F1+s/dHzIsks
	fE+0gyiE35DJdS3rQPtw+cy0Sf/poHDLewu2Ss1r2925WanneetXZFG7UTB1IBccsBdE7P27z2d
	4BXk3/IQ==
X-Received: by 2002:a05:7023:d0d:b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b3c034acd9mr1967599c88.42.1794387954929;
        Wed, 11 Nov 2026 01:05:54 -0800 (PST)
X-Received: by 2002:a05:7023:d0d:b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b3c034acd9mr1967555c88.42.1794387954095;
        Wed, 11 Nov 2026 01:05:54 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm16915277c88.11.2026.11.11.01.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:05:53 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
Date: Wed, 11 Nov 2026 14:35:13 +0530
Message-Id: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMkv9GoC/3WNywqDMBBFf0Vm3UgSfNSu+h/FRaKTmqJGMyoV8
 d8bLV12M3CYc+/dgNBbJLhFG3hcLFnXB5CXCKpG9U9ktg4MkstMcJ4wY9+stqR0G15+ZKQMtis
 TqZYmF/LKuYYQHjwG8yx+lF+mWb+wmo62w2gsTc6v5/IiDu83kv8bWQTjLEnzJDOFKmSNd0cUj
 7NqK9d1cThQ7vv+AXt+7ZLVAAAA
X-Change-ID: 20261004-fix-disable-irq-safely-15b2f712800b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Joonhoe Kim <26rote@gmail.com>, Birk Skyum <birk.skyum@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794387948; l=2331;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=RJLA/B8vERsCEECkiEYsGsg+UkPdUdj8qywWgY13ar8=;
 b=0Jl55PFZ4C3O4LFvNjVV0FTA56cdv5MeL7kOoTf/Ojuri9vYEvO6tYPR6L1tZAAa7Gfix+Jux
 s6EnPDaThPaDtng2JNv40d3qRbGXKTz+C7R3RpPtp8ZE/8gUBR/h/U3
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 48g33Oq0FV-ZcTRWSwGfC2a6O3dENBlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX/NZ1k5N+CJzX
 h1aFkE4dntuoIFED6OXHjOt/PUDqzdc3/sx/HlXBRJbm79CuYGWmEukiqPdKpz7yKFii+xEyG9a
 BW8m+i52m79HVjVpzvMChHLkajyFQYbab6MY3sTsZaTpk/BateFal6U+E6eU5bws5rXzSl73NPz
 RaYP1kWycG1b/+hoUtrgt6TqTzMAOlfr4m9L+WtOLBKaW3Txmq6t3X3/tolUIqY8XJDkbIoudxM
 zXzS8qFR7y0yy/OS9XizgZ9ECHl8l2QIpu0bFUKZqekkscOfZ5amUAKCrUZHOK7QxNocrzlYTMR
 /4cEOV6iqhNzIIv/JclQrvH9zDPEAGzx2F7i3k5FvzSMGRluMR3wfTkyOB8S89i2YyYF0OY9fCm
 vUUmtW6khW9Hjq36ABMpKmimFKUA2d+zqqbjoBP7KpsGxPt7nesY85EPHWTAK2As1JDuyTLZh0T
 MqTBMs59ta2A9jabhBg==
X-Proofpoint-ORIG-GUID: 48g33Oq0FV-ZcTRWSwGfC2a6O3dENBlI
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af42ff3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dB-pHhy3aynsDHbeDQ0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfXxhEWSD3fMDG/
 bjcucC9AmtBNTBH5SMt9jLZHzSro6Z21T4OzyKibg46oC9AHeA3ZLfl6HOdw++a2MFwGmj0aLbm
 Jz8exZ0+mI0c4c9Y2mSrlbdEdUqidzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
power-off") changed the VPU power-off sequence to use disable_irq()
instead of disable_irq_nosync(). This was intended to wait for any
queued threaded IRQ handler to finish before gating VPU power.

However, iris_vpu_power_off() is called with core->lock held, and the
threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock as
its first action. If the handler is queued when power-off begins,
disable_irq() blocks waiting for the handler, while the handler blocks
waiting for core->lock. This results in a deadlock.

This series reverts the commit that introduced the deadlock and
reintroduces the hardware protection safely.

The fix drops core->lock before calling disable_irq(), allowing the
pending ISR to acquire the lock and run to completion. To prevent race
conditions from concurrent power-off callers during this unlocked
window, an irq_disabling flag and a waitqueue are introduced to
serialize operations. Finally, disable_irq() is called before the
hardware is powered down, ensuring a safe hardware state.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Added new patch to handle the irq depth
- Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com

---
Vishnu Reddy (3):
      Revert "media: qcom: iris: use disable_irq() during power-off"
      media: qcom: iris: Wait for threaded IRQ completion during power-off
      media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt

 drivers/media/platform/qcom/iris/iris_core.c       | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_core.h       |  7 +++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  6 +++++-
 drivers/media/platform/qcom/iris/iris_probe.c      |  9 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c  | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 19 ++++++++++++++++---
 7 files changed, 56 insertions(+), 13 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261004-fix-disable-irq-safely-15b2f712800b

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


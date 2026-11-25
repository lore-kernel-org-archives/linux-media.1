Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601971;
	b=ndxw0aBJpZ3S9vTayMMnMufRiX5vU+04ExY3FlHC9kv1MnG5G5jBWtnrv2yuPyeE7Kc7
	 nzDmVS0dJrt68k+C+irUcYvp7Jbfgg92XeqRDHTVrrL+R11zhcNTBst+MsYdudVAD4ujx
	 nn6IZRPq2xHLC7WWzowc6hcYJ3H5YNYsSYqIb2UrnNgF6PUxbiOBBQTQUe9QuKoVmwyBr
	 l/XBkRJTQpedD6kJQ9xQxJ6u6/9+TilUTmfEuOt2tp1iNrtZqLR8vZg7gY+IA6ly4men+
	 uiwJpjZjCbi9w1vCpD6HBUf5QhX2Q96nrzpByJzkjNVDaroOdQVdGpPYQM5+COv67DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
	b=mnjfetxHf5X4fbGuZun+LA0BDssO7UsX60agM5NBz2rqt5nvdBW/Xw8Skk0t9Fh7Ea+C
	 L2hPbIMMDjSmZO22Lcmy7FtAn/soqFxEG3YgIcxX2+P52jfu/t7vRnayJWE0hNFGZuRDB
	 QbehYtmdiOfGvLHP4K5W3hB2Wz7ilihNokF/OMRDd0ZrcUfr9VH9TwrigItP1kP9YM5KV
	 dtD0GlVf9AybyKIdKnv+QA6ubGnnjLE+Khc465JnNt3IvUm54F7nVlKusnw/Lhm8i6WY+
	 ecG34LbOoKT7+3sbur+wRrnwHvm9QVMrxLVG+yOjYSyMkJ4GM3pamiEeEjIBwWy92mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JdFiu/l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0E606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdFiu/l/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mfol796867
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WZGUso68U+c8DwdxktvXee
	eB4ezc2TpH+kTAsRQbmiw=; b=JdFiu/l/wCkJ7RgexJTeWZ6HIcQMnNCIlAbFAa
	ihXoBo8QxeG4xbygsKGBFY8CoZoN1mFtNxBYuEJ/6k/U6CvwwmvObwsoTUfdhYL8
	GxTNmLMCZg+g6gLc6mLUtOaJ7FP4gtG8VRAHD46n4tOYktjKO00kPLiAYzZPGVDE
	YX7fWB0eM7wf1mRKnmhZjupPakLJaOVnUFwH6g2/nvfQWld9o+qdzs2G/Lver0pz
	I0Vkd1/02NSkLvIC5j7srFNZ6lNcAXCM6kf0oKGSZOy6zDvJI4DEJxT2DfXEIdfE
	naWLmhSuCndVkJ4X5+lic+sc3XdBI5gpx4gxvmOuHHpTW7wg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt5g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213c7a506fso42415446d6.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601969; x=1796206769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=YbVoxoX3ZTByEkHEh808rDrviK57//aPuLYLODimonB+pVvH8RvPKKMbOTPOOmeOzy
         R5OQt6Lb6UTJA7u8Jf54Yn4JSC+b6VX585Z1SNDUy6iwtQUvHlDKmsP9EoWI+D4FzSJM
         RKJ1PeI3MaWSCFvZtnMb/nWRNIQBJ0CMwuETHG33DcD6OlEGCACOqKPeCqEnDrsIJWaw
         EXRNr886q01r8cW3eNaJXcJDO5tG5Fd0JEg3kYZKSnuRYcByaX5tFvEay5rFJSn9FUko
         xFGyFfzWy7cR45rtfxiXp/dzyS+/WQXK5E7jA7EzwQdnloCRA0KBh5gSq1VxTkETctQB
         TleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601969; x=1796206769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=p1u1MxHugOusXwyN5AtWbt9LWopusd/a4rNbarVpXBf4aNLme0AQna0oYXv2WTEsMF
         RN0BLDIt7t+NS3vEt7J+CKcLLNNO9RDixsrVhRIMpzAqfWAV51BzoyV340Quu8bk0CKQ
         Dcx0XyBnAKP6dqS7AePTEbo6xpgn4AzyDy4AUw0Ho5EyaQ/hfdPzFLLYciMTXm2WLetI
         kD0IVrOy1uFfzhiE0m0XQgrAYHb0TVyTTx0BAMBg/Bqjzy6AjyeRi2CpnEC1fOZFcSJZ
         4xHsgvh/cCf2eUPr5g+ajgNr5hmStIaMHiOjurPxwFhp8rLxcKSv9O4AQ0YiMn4RCF5X
         d9KA==
X-Gm-Message-State: APuU4Z/dQpNnMH90jqy7KCHYdqg7mf6OAVvog5mkWsDx0q7uRo1i5312
	LNoN1dINrhlYBv0Yeudu2J2pqxov/NI72Yn+gG/kgPZuWA99NL9iTG++TeNo0UYwMzr55ZIjtkj
	FgdQst6BB+tn067yjX6HWBtf6e43HvUz/xa50XWMy0QqDdX22CN6zxxH4cDNLILcOTg==
X-Gm-Gg: AZFdTZdFXqlmcs3EtMjM7ncMZ7jdLVyucjk0E8O51gngkAvc1G+UwOUe4t+OXTk3UU/
	y6MbF+SrZG1piiy6cRI/aVzTgjfiOMOi/Lz2cRrdA/8NEJx5Sja3l42KwrZ4KX4AeSJOm1EMAjq
	wvhuFif302n+TfQbkSpUJO8g9hkpYYnvqHtSdJvBe8lNlZ0INydrvPv7hFGMOc3QFFYik1XWeT/
	jEjWU3OY2aVvGcI+ompSUBLyOdsQFXrQ+kZWZMpEJdffcn/GjoYzUDafjIYzfIdIjV1YE3klB61
	YrO86s3Ou6OPCjcchx6J0u5MVzlyV4w1blrsaagVmvIJNx+hjp/mN/ucI0q7M6f2EJ99eTxJnx5
	GsPTy152jbYchkqVvo6izCDJpvUD4ApXqMDzsDa2kNbiOzkK2dYATKJ/Dky9GF1qQilt8HFRojD
	36Rq2tjMNkubFTUHA+UCt6q9VDVSgXcylsnOLmG1pvfzz9vkrg71dRylJdqBU/yr6u8eRNNDLS6
	3qmKkd0ogqTgZ77nYp9Bq8Bm3yz
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015218885a.59.1795601968619;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015216885a.59.1795601968109;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: qcom: camss: Report the hardware SOF
 timestamp
Date: Wed, 25 Nov 2026 11:19:24 +0100
Message-Id: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACy2BmsC/22MwQ7CIBAFf6XZs9sAJjR48j9MDxRQSKQo26Km4
 d/Fnr28ZF4yswG5HBzBqdsguxIopLmBOHRgvJ5vDoNtDIIJybk4otGRCP0LF0LHhBq0naSyCpr
 xyO4a3nvtMjb2gZaUP3u88N/7v1M4MhwmKazV0g5anRNR/1z13aQY+zYw1lq/Mnw9ua0AAAA=
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX9bIxpYlc34dV
 Iu5N05mhOW6ASZO+CFJpsRnk4hZgeLgcr01s3VNyHuCSfrc//53T9K/oEW3LN2kNgKVkHYjy8am
 ufl++ENwr1UM8DHWoHzMpTiQ2QSk9E2+XoEXJ3QzwHvAE2LW7c54wSvLE4qz7D63Jk2Tn2ijIfw
 ndlD+R2FhLe+8p/e6DDP3FWm/sixPA54r899KEszUQj5F3XI2d7mURatPzTBiYqHIs6s5t9eek8
 t7TfcLadq2ZvPjYfjUoPpzhL3mPyy6uDdZn8DbZF9AMqk57l3cbeYjiv8n/fhEQS3ABOOmqUSZF
 sPaz6pWYA8lbSyEDXz6xRV0At+tzkDS4xzZ9L9dEEIQ5B3rhFqbZ/3SHQyroJpe/KHtmoVDCPop
 OeFPKohcy33aX4RXXAgQ1KEQz/vjHODzjMm+ORkwhsLlY/AJyWc1kJGvlZDVHnpvC2J0nTecshH
 B9eTR2KwMK+3Pb0PR0A==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b631 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0dbMMC3Z-gWnjGpt8oMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GE6LF1MGaywIqzBYZ6zNc28VPojXyW5V
X-Proofpoint-ORIG-GUID: GE6LF1MGaywIqzBYZ6zNc28VPojXyW5V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX513EVOvAENgl
 sNeBeJt4Tgijf9bRqBX7ZFxqPVzYRfaWyEO8OE6J5WcsckuG75/MvS4/fBgrtOgy/y9orHXOdFw
 CZeqH4YVu/Bx0SOGozOOfdig+5Dn/1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series exposes that time to userspace, both through the
V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.

Until now both were taken when the interrupt was handled, or worse, when
the frame had finished being written out to memory, which is about a
frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
having the core take it. Patch 2 adds a CSID operation for reading the
counter latched at SOF, converts it to CLOCK_MONOTONIC and puts it in
the event. Patches 3 to 5 implement that operation on csid-340 and
csid-gen2. Patch 6 uses the same time to stamp the captured buffers and
patch 7 reports the new source to userspace.

Patches 4 and 5 are picked from the timestamp support Bryan shared
earlier, with patch 5 adapted to the operation added in patch 2 rather
than doing its own conversion.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Patch 2: read the latched counter through a new csid_hw_ops operation
  and do the conversion once in the CSID core, instead of passing the
  time into csid_sof_event() and open coding the register read in every
  CSI decoder (Bryan).
- New patch 7: report the timestamp source as V4L2_BUF_FLAG_TSTAMP_SRC_SOE
  on the SoCs that can track SOF, rather than leaving the queue
  advertising V4L2_BUF_FLAG_TSTAMP_SRC_EOF.
- Link to v1: https://lore.kernel.org/r/20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com

---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (5):
      media: v4l2-event: Allow drivers to provide the event timestamp
      media: qcom: camss: csid: Add an operation to read the SOF timestamp
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame
      media: qcom: camss: Tell userspace we're using start-of-frame timestamps

 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++-
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 31 +++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 94 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 19 +++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  8 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss-video.c    |  2 +
 drivers/media/platform/qcom/camss/camss.c          | 12 +++
 drivers/media/platform/qcom/camss/camss.h          |  1 +
 drivers/media/v4l2-core/v4l2-event.c               | 20 ++++-
 include/media/v4l2-event.h                         |  9 ++-
 12 files changed, 228 insertions(+), 13 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454212;
	b=w8RorwK1eHnjcMK73oNQ21lAZwKzFZFK9Y+4VJHG/cvog1rlCoj/NBFUyO/T7i2o1mpl
	 xPVZnwYVLuGdbKMJccTUCKjC9r8+F4iTntu3QOizqMYbJJ5ibAwSIWWKArWHLlSv/xTAD
	 Q90AJjng1Ml2a8wJLurq//qLyLV+FHUHhWtY38i80Qj3RFud+VFsmGnzw5fefpu6UZkl8
	 +85cpBdl9GqzTOf7k57Re+y+6nIulrC4WLPlf3LmyIGY/Tux4NEJRpFVKXOjBpqCT2LeB
	 NYzWA0ttEl+twgORhsA9UW+toVs6PUFhYH0nHvXakvp7v6u/CNhvBrD8Fo3FZcGJWfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
	b=SVQ9lfNB6fzAE18ZibrCkfXllhId2x4dEoRqsb7kPZGAZFtagSwkH7p3WAPkrSBc1dOp
	 cPXSv62QyKKCtrEenfuy/456oC9oMP8V7gdU7wHT+EC0rCkuB3v95HfjHbYEzCyJDHPtb
	 3Q+HH3Gfv06J1nM0pxAeT9HbACoEm+7mn+itMekAEPUDC7DQVCB2DZ0o+oEX0V1xQ8VVG
	 XKKGy1SpZRuHzR0B+Hgc0z8sv2vg59pvROYdb8lx84XO/NboLL0YRx84g4rtvD94IQbzl
	 om3KiAHXiZ+CjjyKRNlDpqVL/ZBTG+7z/DLsGSrP7NP5O4iUwxhZwwXKBaLtlIdQ7cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbcXwr9h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CL4rHZlq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17A606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F17A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbcXwr9h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CL4rHZlq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGHxYj236102
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tLR8dXf8lJo1xTN0YDjhYR
	yI1Bduab222wL0snOjzMA=; b=fbcXwr9hZHK7U6sdschgttKHSMM7TSQMORJVwH
	tnl0EYUmMRHy1a5ZpUgiZzFkI7GZ5PdeKFcJvsON7U6FAUNBr/P4C+naeNu5xhMW
	EY3jbLyoceEETPilKqP5V2z/38HpaQpSEgizzGWAP9OxevKKY9ok4akTFBGBzABU
	fSVKCTbUPOSryEwTJBdyGILr6MyRYRFvkY1lFdXioB8lCE/6P/NwbjRPiPIl23bv
	5SYFP3xVPY3jHwTH1eN+H7Ko8okajf0lmrt3krf+//x3b5KPmzqkLAhOp6ZyMSHz
	TqYEARgxmruv5EaV/T5s8PYMG/I2a7EkgST3nN3tl0WLrKRg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsjr4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e109028b4so2112333241.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454210; x=1796059010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
        b=CL4rHZlqYjbWXOSy2J5Ezt25RVL3mrzDuz+5nrn96yxJycMeS6Sfmu5xi/3I5XbxYD
         +uTPRGQuVCQDlJWvkqJ21dHSrKNcy3w7bfZk6QShzOk2772sRqiKwuPxjw3PPfTcrdqH
         hAPb95/k41snxAnTUdIHguiq0bCmMZUECxjTqS6ba7n6ASHvpu7f5jAxtS9xlGeSLFjO
         8bVQ7oTUxuV1FU3UZJrwMUevnIkKByGi5H3He7QypSLPNQOk1LtEk98aHzgi2m5Sfq0C
         xYkvbX/KO/Zmk/U/O0m7cC6UEveCJpveq3iwq2QsrDhG3wAIibdNUGEc8KPLWwQIJ+yQ
         t7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454210; x=1796059010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tLR8dXf8lJo1xTN0YDjhYRyI1Bduab222wL0snOjzMA=;
        b=emn/UgQ7T3dQ1WSWMENp8XEMy3w4ISmNpUPcJx2mD98hZXYd5v0moi4p3c/l0z5PoJ
         T8Zf+t4u2pk/7WMd2nQOin5qamc7/RWCCAkYSqcwCVQVc4cH5L81ZienlJCMW4f0khya
         gHs0/M5/Q1rcEi0fNvGpIdBSr7NR8WOX4yZChGmE27KUWXRSxQg1uCklt5AyCwd/4Ovq
         C8mfvlS64bN/ncHdrurJKVPsOOysh0+XNivg+eUD3kIxevKZFRkYmuXs0W/jyqW3X2en
         CfHuvXGn7tpKOfNUEtsEBbkuWe0rKzNyV/mX8lMrmtxSdpPxUn9+VL5dz6w7QIZOjYlP
         xOXA==
X-Gm-Message-State: APuU4Z+f6qlyCaPQ6WAxxpjXwlOoW9aamYb2k5zldqWAtUnvG5qzO7F8
	nHmBGQ81nI5HdEpeIpKSofJ4sNInvIb7xo8ZycK0ZBN2dQcmE8D7pDN6RJ5S23HsQcKmbQQfMwz
	hsy57jkvUjWSYkpyTL+26ERuKTMphgrXKLP5y3WJQnqf5nMbHiKvyEoyqA6BKguto716EPRo7Ay
	0R
X-Gm-Gg: AZFdTZf/b5c8UfZuY1p6ZiWYGkV3YbsWEupAnxOUKg/2Uc+tImFTJLEe3e8XSairey6
	18wb/stcpTnmsz+a52V5j7EI0nEej3H7IbKMCmGJTHdL2i2M+UP02UDtEbpBxjiQcbLjkXSWPKe
	OweoiclHm8GglRv7AKixmlkEMojpBF1WgHkFuArp04XPX/P0B18sUspdzhlb4SRaW16+Vqp55N7
	vAzzzWqno1W4XNdGT0UYTo2Mr6gzVt8ZDjINRXtXNfFpbih4nzk/fUPEcQRfc8W3pgK4aRNMTA1
	CVKowJN+5X71cJ0z29l92cZNb6b2mGURKd+dacK/TB9Fp+v6qJWK2XMP1W+g3cbYaj/3AhUIPxP
	tPIyEJOt7BB9PR96kv2c88GiT8ZjOQ85i6DZCQe8dBH9RMNpdMNZEf9yv38PBXkzNbHxwttzg+L
	b/Utzl7d2kBSIW0nqKOAnngn4kmCMrEG4bC51xCd5iSMfk1oM7FOmzShVw2eX5qeYHQ0wQ5VuF2
	oDdLluUPKucuU/a3tdLgu3rP/NA
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr6545181e0c.8.1795454209783;
        Mon, 23 Nov 2026 09:16:49 -0800 (PST)
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr6545118e0c.8.1795454209260;
        Mon, 23 Nov 2026 09:16:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
Date: Mon, 23 Nov 2026 18:16:46 +0100
Message-Id: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP50BGsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3eTE3OJi3Yxy3ZJi3VQDI0vzxJQkM8sUSyWgjoKi1LTMCrBp0bG
 1tQAQ9EZSXQAAAA==
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b047502 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HwQ_xm_euLMt8bhlPuMA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: WD5S5RndScpz0zbzrRXexak4nxn4JZXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX6xSUGhRUsSvS
 i/h2POXHCIILp5WFmrn/IyiTTO+FRWb9i6ehYMCW1V4tI5bnHQGJR4Xaz1dTlnpNpxm3MVAHYiu
 MVlYZl2lqYnW2Nk28zWQhoJQm1P51e+VfwtnSwDwhvu7TQ2LPUKHJESZAK585RWg2y7ebORx9yF
 0V2jMeKtNTLNDplBR/wWay0E5ns8Pq3auxaznERKTwwyhHpZUVGMq/bstIhATuj5ZNCOqWCA4/k
 AomLDFJQRly25NAp8ndLrznZcYP0fxlDKswhZg4afB2BYPqMAOfXj+0h93mREvydfp97qzFqm8a
 JB4sQCUHyQDApC0QSS7PhcmbXbYeS7wSlHa7Yd60Xz2lHvD5TfhnFseB2B7q8HObSt6mQSmstyF
 Lp+Rr53p15lrvWEUJtOu5ZT9nqYQ//LReGZuMIAqXsY8MZtYO/3Ji6qxzpwfxg0dBGrsEOi7qHr
 /6tqNe94TLrXS7l+8Bg==
X-Proofpoint-GUID: WD5S5RndScpz0zbzrRXexak4nxn4JZXK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXwbiMg9KYgZ9z
 yH5cO8kfzvMG6PCgnxebsilb4axLKBbyc2VSdqH5HGcgGPwYyPqdxoIQARVC7+2ZBrafQOZj1ZF
 aBq5nLxJ/WFDu/d6YKKTkMy5KLGzIMA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series exposes that time to userspace, both through the
V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.

Until now both were taken when the interrupt was handled, or worse, when
the frame had finished being written out to memory, which is about a
frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
having the core take it. Patch 2 passes the SOF time down to the common
CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
uses the same time to stamp the captured buffers.

Patches 4 and 5 are picked from the timestamp support Bryan shared
earlier, with patch 5 adapted to use the conversion helper added in
patch 2 rather than its own.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (4):
      media: v4l2-event: Allow drivers to provide the event timestamp
      media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame

 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
 drivers/media/platform/qcom/camss/camss-csid.c     | 81 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
 include/media/v4l2-event.h                         |  9 ++-
 11 files changed, 205 insertions(+), 19 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


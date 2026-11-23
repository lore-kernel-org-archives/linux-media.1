Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454214;
	b=stg719v9izxqSBuaqYugWWgiRG2GoVBcsZdVurH0UROUQAeMEqaENUbWb7JHWuBZGf3c
	 GqNsxSGrjNLwNhbavsZC/41z1xVZoFrDGBe5WbHBX1p7yHz0MeeeLFiz7/MnGAyFTyMFI
	 LWvqgyPepTcCqw2YuLz0RpXDOP2KMI3ldylB2ZPYusgQcL7TnlZdNYZcv+lJvLemF+6rZ
	 T104bU/eaMvI8tP/APBwXiOing/qe5jpNzZ5dyGwgQf2MADhDUwqj+PeBiFo/OHcjpZ1l
	 5fppxcx543ZYGlPYZcU8n/FP3xms/YKMvrDFQknQKPJkocVdRj/pjlI7vtFT6+3F3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
	b=OZtDzDAyYgQKZWv7a7loSOI6lxpTpC3QLmq759QeSebYg8mufGY7BxlLNeecxchnR5Ru
	 fIk5xfJRgpA5ZezEFlbVMFZWiYDzdCACZ2TyB6PcRwrRMBfHjWZBzXt5NjdkBStCHAxWO
	 TF0RBb//depKhlmUnhFj2+Wg7TiEuhxbom2t66ZG+R9b9MMAdpTl8wxWGbq2wRVhMh4gT
	 5v1YSlmOSRXg9UDYPhIZW7lwXEpUFu99JF/YJmTlJtWjUO4kpHTfOFhFgFdoX1iLLZPDz
	 QWfYUyKObPoevUysm84qvyOROocipXWz7a4VsGbIFmdIMLkZ9K6K9uuy2nOIfFXvFAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/f6FSTg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35565606A684
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35565606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQiyde2k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/f6FSTg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH85E847566
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=; b=NQiyde2kCDEtNgHB
	7+/wVFhO5O/nlMet77e7dUX8xXXcitJ3ZaCrVGoYs/3V0LxbLMY06s6ozdwvmFxf
	ZvNV+4Yo/FjA+COStUU3/Dyy/AIUJdI/B/0W37cyPcqPuOP0P62ur4QCqgw0Z+CM
	q7Gy0CQWEloJjx+Fv1Kt0JcJcd9Qc3NjwVkdfINqH0cm/+tu8t+3+uohSsNJu2YO
	OjFTC79M7BvrwQLHWyuZtmsuLTK37NZdRzabPGg6bNSKqnxBS9aea5lXByyXDR3F
	wXWRYIwvBVKFXPE6VDzFTjJXdJdkcGlOHLVlJLym4QwwEBgILtBHFZ/nTvDAK+5U
	5teSdQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742j5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so979750241.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454213; x=1796059013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=d/f6FSTg0Ml8/ZZZW8h0QhqaeqpWcNyWzy3bjTEhrnTHaxSndrikvRYAhLhw+9/LGY
         yh0qMiFAGYEEU+xKER9/YTgHgcQl7A5arY4RQbrYhq+WAdU/N21fCWhfA29z/aSx9Idl
         hjypJEROWoT8Zl3HyGieH3LNK/CRljVSvFpvIk/GbTDXe8gAPyUAYLdYXscwFj5/dzP1
         G5nPZqehGNfUOz1igqQAuXZLrn9PsKiHA76vBxk36+ekOQLnyy2viwEzDSJ7iLaRUL6g
         Uh89nZQNj5VWjkq6ptOwpcSET/0zgfRCC9frhID1bnXhauF+2g07hYKo4z2yg2pPEIdV
         zaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454213; x=1796059013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/NZY3qsHwd8iMIG9HWG8Np1DQxfQyFmtLuR8iyOMu8=;
        b=uB4AOGccIfSTtnbi/6hAgTKmILf9mZYH0XXhj8RWxwprU1FhuAzeLYiF5S6WOweXHt
         LQO5BaxL6zDyfoe32y+12BBssUlTwEWbFDxsI6suxqZh3AkLCXElTKjdWGD8Ks3zNeEy
         hqfppQclyuQhuS989fu+jNu0UjSy8AezY3hgLEphL3mfy4R1Rxsybh6DIv6vBu43d2ly
         N5MGuWYLQpYIWUCMLMgFFAi6QnIq54/mo5C7mc4sCPWHqA7ZDcVAJ+V/anL5983IDiKT
         XIyAA8+ysfzaJgYjN26hD+H7PwAevP/ughKCJvRDnqJp6CIy85A0IHHEbyVSGEAwwdNp
         RbFA==
X-Gm-Message-State: APuU4Z8i5llu1oYhOqHpdOPxx02DrHVsU/G4RgESslsUhCc2zK3QyjZK
	2gKOQ9+nkh7BDiX9t8O/h5ymAn+dKL+vfAUVWUnHB7ETC+BCRBMbzN2E6xm5f0JZ4/tjmAF8oFZ
	7iehHPn44zLnYH4OWIk1rzyQ7k4uCFcYearcWvDDB/jYcWQPO0cwPPLqB8SJpNnwd7g==
X-Gm-Gg: AZFdTZcokOcC7TjjsFFwLB9qD06oG/bmgrOQV+k+Uw91UvEKlIrciX7bNYHMi+SSXJh
	p/aCkvdTZypqPdcSvpu7PJw4dKLr+GOrxNpzDrzudi1zqaUvoXbFlmETK9paJRsqjYThthL1CS7
	xGXXhIHuznJ1wG0n+3VHnTX21e2hRHI+k/pn1JBosOyDV1WXTuHuxXsKHWDCaVRNV/sJdYtyOBQ
	0ou0b6RmUheQfVomirOfGPUBrrqhCI67Xd1BWMRHyDcJoK7zzDhyzgxYUvqiFnR91sJ1y7JmnXV
	lKf+WO9+aZOgPXrD6du7KdSWGKIUkil+QowMM2AEazxLuZ0/yyFhsFLCJFhRvMrVG+UwxhXlZE0
	y0Y6xYV/ujv4JRFMt481py1nulY+ZZ+fC89lhIx/2DP/5Ql98q4xlyEgss1RnKrJPCt6MZq8cs3
	FfUTqLfDMPJpGOdwZyIosGsYdpjzmdnYpib8PlJTkNruMgWIInYiRPvJO71ss+D1rNTiPBDNBkJ
	SwN2sJ0frjPD6t7DKX9VRf/CGPW
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575958e0c.3.1795454212468;
        Mon, 23 Nov 2026 09:16:52 -0800 (PST)
X-Received: by 2002:a05:6122:1350:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ee8adf6a05mr5575892e0c.3.1795454211924;
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:48 +0100
Subject: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
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
Message-Id: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: -1X8V1SUxSf4sSN9-4F28jVFaLGCuC9c
X-Proofpoint-ORIG-GUID: -1X8V1SUxSf4sSN9-4F28jVFaLGCuC9c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX31o79lLOMurq
 ls5NkMpP/JNGl479VitLxscjrSv1S+g8r7QYxhu9llyYU2YrpXr/cODsTUvkRXRAN9Db7lqJ/Fx
 qKRpeQ5KNLNK4ixGQRUGmqriucjiwLA=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b047505 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=doqduI5V5cNHhblwjzwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX5ZOkX3vSwDCX
 SADDY5vaCipk7f1qzUXX/RO6mNU90mnOepbENhOFvfU4oFWOASHp41suhQ5i+live+StxOjumGL
 +3HQXzWbJFqO94sRL41rhc3GWrIZWSy+P386DSjigcLPRS9ko5RL8eg2jt+QYxKg3qU7vJdtxx6
 TJPPWckC6OgmmsYWEbK9Ju3v0V3RjuHMEXf4u149xcW3u9smO7BmUQcRFsOlG9Duoaz0RG/BLPQ
 Rl4FllR+Or/8PW3oec+z2aA0KaoLbhv5A0XcLXHSWB1c0WIJRmM7G+sLHzlAh12jQxYZb3IB2Ri
 45TI8iQHBYt7rOb+yc+f6ILc0e5PbZ0A2BcPFKERVekDvROGXzUmfXEIrIVHTpGjn3tgXX+Ly16
 WFs2iY8jPjMU6J/X8lfJMlbBHxxKJUT2NANUvekV5z9aYL2QXp7631KYRzTpldtmgHABImbxb2/
 YAnKj7aVZZLo1oluaFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

csid_sof_event() queues the frame sync event with no notion of when the
start-of-frame it reports actually happened, leaving the V4L2 core to
timestamp it at the moment the event is queued. Some CSID revisions latch
that time in hardware and can do considerably better, so take it as a
parameter and let it reach the event.

Every caller passes 0 for now, which keeps the existing behaviour of
timestamping at queue time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c  | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid.c      | 5 ++++-
 drivers/media/platform/qcom/camss/camss-csid.h      | 4 +++-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d33f21930ee56d714f41911cc077..5eef5f8846fbfec5afa1152f73a098fecd717fdf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -207,7 +207,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		iface_val |= status;
 
 		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 	}
 
 	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5f5e2271945d97764c62b630da6c..8ac83d469dc39d45a37c9be815d41bbab12909b0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -411,7 +411,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
-			csid_sof_event(csid, i);
+			csid_sof_event(csid, i, 0);
 
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..72f329c2bb1ddeec96f33c21198104157c14a73c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -387,7 +387,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78be5cf64691c351149b0a8fa68c3d..fa9af117f3e68237f1dd27a48bfc339152c63f94 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -304,7 +304,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
 			if (val & INFO_INPUT_SOF_IRQ)
-				csid_sof_event(csid, i);
+				csid_sof_event(csid, i, 0);
 
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..bb89fe26ec2342487c3ba6357d37b6f188476d1e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1370,12 +1370,15 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
-void csid_sof_event(struct csid_device *csid, unsigned int id)
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 {
+	struct timespec64 sof = ns_to_timespec64(ts);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
+		.timestamp.tv_sec = sof.tv_sec,
+		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
 	if (atomic_read(&csid->frame_sync_users))
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..1fde67d16867a24be2a4f8940ed2d2a60f523ee6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -265,10 +265,12 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
  * @csid: CSID device
  * @id: CSID src-stream ID
+ * @ts: CLOCK_MONOTONIC time of the SOF in nanoseconds, 0 if unknown, in which
+ *	case the time the event is queued is used instead
  *
  *  Called from the CSID interrupt handler on SOF of the path driving the event.
  */
-void csid_sof_event(struct csid_device *csid, unsigned int id);
+void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts);
 
 /*
  * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.

-- 
2.34.1


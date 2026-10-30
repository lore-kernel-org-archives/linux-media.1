Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391591;
	b=CArt7KFJxbmjMGB+eScpYuFfC76Ee+OPW0C+jnmnAlj8CuTHuZik97Jx3tOr3+0S3D67
	 eDWlZY8heuj/JzoM+8yNkc8JGa3EOjJorTWqmcTRv5nqOEYGHIENRXzMpNAG4a3u529x0
	 j1rhIEw8a6VYuAe3M/OLzY45RxxixdncuRnc+hU8tCzXpe3/+/KGAs69w1WVLWexwNL0+
	 qLTWkbsztoET6lbKXgIJWojhDp2TDmCz3Cwp88nq8/FxXktAQWYViESCwnfMFzz0GmbsY
	 i8qhGB/8W8ViWkUGlgJYAN70CHarTgbEl7HQvPlElWutnAdAPN0vCxBXbT1XaeLhRCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
	b=Z4WFVM0H6Wahoih5RgHpSEORbvgbnrlBlS7gm92EaczUM1CnuENeirXLGZSIaSLE1qBU
	 NZMi3EKleQBl/mdsDtYCUUnvqQXM4We7DMoGLcW2At0wSAjQMOgBli2rXRGtWwX9f7TWh
	 odssfCBLHQjEnbmeSwpeL64uKSXE1ruqcOaorHK0uUX17/o9jmvkXnNSwyLbUqbaoUsvs
	 xT/dalbjyWxfyRHLZK9ZeXyBQ6UcEnpX8hqFZ3UzPeVtPl+JbP68TSI2RxRELfOIcj6e3
	 Zwhr4QwPPsOIvZXX07aPuINvjdhIPWjlN4uD6EpQ3ZBGm/b/PMYy1bUna39UWkVkFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkAnpcqH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6BB606A31C
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkAnpcqH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIcewo4118711
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2kPCKs/RDRmqxYkAxTLufS
	Jm8JbuEsv1KYBJrRSxuuM=; b=Phw7tl0qbHAoMn2kPxpTmKvydreYwgw3+m+fcZ
	ybZV3NGFNM9zmBMopNsSXRGLe3Cn+E/dSouR8S6FL69jUMi8eEk5lR0fw8xdU3V0
	ZA7tGEwTqqlR1HwVQgHX6pS+KV8jZREu/1g6TJ3PNFgayjgyeNyaKmniomr7ztlO
	LoncEcUGJhygPoLnAP9kBJ4KAn0bCx6qoYPMXHGXP9wrMSyY8yqsy+hKFOKKUzHB
	n9A0aO6+I1YYw2VITCfi+sSKqFkIitV9vqos3VvmrF3FH3X9qE24XBkeQ1GRSKwP
	5VkhEqrOu9WliLE3eRGC2TP/Y/h5+8Q5syJ9B3Xvc468uA/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0pu89s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so1436720eec.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391588; x=1793996388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=hkAnpcqHxLgx/ra7LAJkcBfPoKPLcCyr1BQhHGfG0rmkEtSu/WQxii3o9xI6bj5J9P
         BZTOEB9uidKcdmnqiHxiRNjhMUnhZebgwOKO0A4xISkgIQMiKL9d237M94PHsO3vwR4P
         T9hJWlU3D+5LxwzEW63dSv09hOUsKKxjKYscS66A+BMmMIZq8QwvxP/bTGR/XFv+9fXQ
         +rMBxHtAQOTFHTAsfO2+8+cSs1j7APo6Fwu6tZIVU3BjKG+SQnH7QAqzDu3pCJ7JRLm/
         Y7BR4Bo4SCK1Czi5VMUhMGvGqrx4iNo52UlWIETjo/B0c75oWUwQYfI5At/wFLHwT2g5
         N9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391588; x=1793996388;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=B+WnCZhRMGu80uwXYb2Dz55rckpHTo+0YebmOwMe2iTe/U4nFo7OMwhhEQXI0kyQyh
         3t9kbkOhYaoYP6J+ixrCnRK8CMuCBdBA6y7M0T21X6Ywv77YKL9aeMB/U21/z8earzCT
         qdDTLPcd7QgTX2rxPtpHPKO4BfoJ2DoRyY565ocHnpoZvGD7ynahL7AsbwTIp1jXyvFf
         NOLvzC0kNG4OhJPlsVe44JCH4coETuvpA6jahxcLjhC7Kjh+zOnaZIjZb8qxZG9NUcpX
         gBqpinZDwZ/m8vbaLo/s5bUteY/5jABm6w/LQJjc/l9HQUuu+OIIy7Wre/XnzmFRhBT2
         1zUg==
X-Gm-Message-State: AFq9FYLk7Oz9tcp/xLvudq6PTp4rxaQMmVab5t+CrXpxLTE3ZAPACY/T
	+cR612QAEQQNdVUBGgq7oDK2nI6YomyGE/aPb5tZ7aAVktVV3r3QIMeyFrcAqAa/YqVVh4XFDvp
	rZiWetpYsBfXF58YrzUZ+NE9QSC9y5yeaH/dN5WOY5AtBsUsRoH17esgYx8RAKTM6yA==
X-Gm-Gg: AYBFou0ln7pHA1pTFLQTlZphvilRFdlECjDKnBsTADoJNTUBCrF/Bytb/XnSFNDkZUg
	WCny+O3vnh2ZhQu+bTaNCDwPyy9kHSNYanjKRNeuJaebK/7IWIMI4bszeTfB7xexTw/GveNmKfK
	cC/MqExZ09mCC5VbgMN+XTmK+0sAaGCsleHUf4VUUWC7S9N6UpAPyx7e3uqDtqY/fdpPLkqwLyI
	jnX2Ik0URdregdKYk30V+/S1dB9abAmgGimvgi4ovIQah0b9hGxaugcLWBQmxi/Z4JUfYYcW4J8
	fms9vZwLMGbyCEUP9N19EeeWdF4P5omh8+A+XRrJ2AvRUg+Rbxp9prhB8y8lLoiksFUVKREkeG6
	h/XeihO9ACE2bvx/LzqsyuR0LhcbPXq9T9Tkdko5jjvBorxKDrZtoH0QLflvNW9sHMLBSkqBGWU
	ESpiNmvA==
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314844eec.15.1793391588374;
        Fri, 30 Oct 2026 13:19:48 -0700 (PDT)
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314808eec.15.1793391587769;
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Fix issues exposed during decoder seek
Date: Sat, 31 Oct 2026 01:49:08 +0530
Message-Id: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALz75GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2ND3bTMiviU1OT44tTUbF2jtERLI1Mz4yQTS1MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQDdVyLWcAAAAA==
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1148;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aBpCigvip3vzlaPahoVHpAyPFq0Wo97KNuqvQOgjQfk=;
 b=WAWWtyA7FK3dH+XMZfC4EzKghm7UFBxlf22+Btw+plZW7u+k8PJUulRWyGCo6s2xX4m3Dic2j
 BzCSCVu7mB6Dz9sgXn5B9YyIHZBBkcf9CBiVVM6qIbz5nnYdpfgqd3L
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: n3jmvM5gv4-ZGLDpmYJPxOQV80Cs1ahY
X-Proofpoint-GUID: n3jmvM5gv4-ZGLDpmYJPxOQV80Cs1ahY
X-Authority-Analysis: v=2.4 cv=O92sLx9W c=1 sm=1 tr=0 ts=6ae4fbe5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX7mb5TCJHq7co
 D0Y/ECvWa76zDuXNkxaMPC/cbBQYYpNPY4sxPIfYR2xiAEQVZtTHIvPILUrnJBJVCdPWw1dMWp8
 IgGyqjrDc4ZgZk3grKpygraDta4pQzmOmuzsDmCj93ifK5euzYZ62BoMh15bCxrVtcNMERYxdkm
 UXD8+tHhfUNnzYPiBWszNJiAbZQ0Rg+u2sXntIWKVX5UEtV6uV3fkT0hCFpnw+tbQ2rOlnS0Cbw
 1z0XCk33LcpsequBEcCguTvx1ucqjcQZNy5M7ZX6cirDjf3VCXOg6uMqs7ANCO8rAsj4nJQNK4/
 VlYZW1zR+V5bXVvc0u/FzXblByvevV7W8gGov79vqc4uhGK5s2EVPSsdPHqeSI5ic1B4rx8DcCu
 mAF+VTCN1HKj3R6TEwg5+7myWUHftar1QBOguzyft+QQQ1AJVxIfqhIn/NpTDjNYGminMDWy+rr
 9nxzvS3McfOR1YF08/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfXyudmuEnTOurL
 WkjhjjxFzA4iFp7vIFT+5ESDcz8m2ZF/E0zPr8OQBnVG3CURMImmMG4qpMu/B8+/wB75Mihektz
 e8P2wJCYf2cQvE9BDHBzp74voAC1Q34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300080

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         |  2 --
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  5 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


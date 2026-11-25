Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585261;
	b=UTwMLpB3AF+unYP1dd6gUvVmdYMlidwqZyomchrpSAWQ1VIsoMS2F2tKKbZnmDNXvK+c
	 3fqnqvL0gTkxU1cSgv/eyDWS65g6wZtiXWTItfZD4rAHyqgQ0B0z19mQxhnUraCdabiY5
	 Rmj//KX+UqilOJ+mDk1a/fdAY+NHvQn3biyv1/PUms2zCZHbgGESiCEpQzXIjAFhOBGeR
	 jwX1q4SEO0fv1GIfGI8ejm0NxrF/mV02Bsu18SIPVJ+N/cxBezN/WVYFzIegilI9k2nh8
	 Y5eiHuxZbbuLYj3S49qeeFJEF+iv+JneEiE9C/zXAfkJGQl0inoInMsVM6EDqzioRXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
	b=E9cGO8VFwGPoonSrv/NEy2g1HReZtX+khoFjY2csalClvkZWyH6bg3/+Pe4KXVCBRGIS
	 6DvbyoY8+SRE11YAgJxjcTeYx/M7jIlSsP840yRkFLzzgyy9UU4Twd11g2xzdl/H3rii5
	 ZI3+qskvOtyWz8LxGP8OxB7zVwE0SD6s4udyUTBLdgimZGmXm45goq00GL6VnuAgbiaFf
	 ddGI+iFBDP+G0NclrLh8GJP+v3TMq01Q5D/QxOg+yNMHRELUATpVxEPlatFBhmNmumg1y
	 oBsxLydBfMhYq20sP7F/LtceD4MDhl7wtvQQrugqi4IFhNRNfiVmUAwQcwODoeXxKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OizZMCOi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E31606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OizZMCOi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2AxYc1342559
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IWzejzyPNKYwR7KBxWNQzT
	DTG+DrUsU5m4+6TEwipV8=; b=PelQBFxsHMPm0jVPzKeOVLfmIjQrQS61hch6Yq
	Z7YflDt+c6m+H69p9HCzzPbUCAt5UWWcM9foFyQaJfKntQ8HO01P7oPRGEQ5p4bV
	PKrVTjYB9E5PvzkHrEWHWIWZUt6w7JcuTUUtSRZF3GKWBb3apTBXG1Bkjmo/OZG9
	Bhz3gXjQK9hLZm+psso/+A2xsWiLSt3gLbHF4XHwvYSljz5WXZ+vy+N22+qAlj05
	sGYMdOFfYnATyB6VcpB5Lmhiw12UsBcIiJm0d+yTndG64l/7u7a6c+SvL2MZu030
	TpwcOXSj0QTORa8LLdybm2Khe0NIEmCQWEE/qaw02rfjsBQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu68te6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:41:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4467506a91.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585259; x=1796190059; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=OizZMCOiekLWZGP/3Fw0c8GLyeE0juRTB4liNjf9mT6s8NMxgriPZOO/N9Bo3j6S/p
         Rna0OG5izy1lg7gtuCYVJ29TbXFmDUGeHosg8qCtP18ojAl92J9WzKjYgWKDQ5H6SliB
         RrwXDnUZTii2rQ9d5evgKpVN+BOLKtXR40ngDgq7H1F+LDbaMPq6uwxl7msIHyvkM2f8
         oNRorOpmqiT/jPrlXFf3ipYCmfPdqYm//FyTIYdIqCmTFy/vxocSZ8J5Due7qwm1FA8c
         f4genoHlvF/Ro3xMOVnD8RtG8t4vBYBhxk8JPzQo1Q3dVrOngNHyT7Bn+fXX4MQSxc3k
         XqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585259; x=1796190059;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=xmEiyXff/w0ahBofk24DkSAYQgz/saZ8VX7sSRKXMQHcmmJktWq0cgZD3ee9OaPShf
         fcDvd32WUIvhUgbWVnoEpgfyYC0oiECTKweWszeEIhc40ApKXLigDKKTs3QlzBW+ejmG
         4ztFdkXxPD3pmmZvpbQ8MrRNnhU/iYwL4DnAKBfJnI0ap9EhiaqHM1dz/FK0P8zFGVRx
         9hCH9M5TcINmF/Un7IgoAu6R0Rjr0Q9CkAuEUwhDmbLs7ffu4BbnrocUfwG6KSzQzO9y
         RMm4DuorZXLMSfyrQEDGc//AlklCCcuT7tfI+I1RzySHLjSrSkCtskhTGWC2civRCKmB
         OofQ==
X-Gm-Message-State: APuU4Z+cNL/yV9SAAzmcUPnw4Zv9DE1O+OXnodMPZjN2fIUsNHwvY1UI
	kirBmr52D1pWCw6WtlQdH6ouA33Y1w5H+3BPWqUynZ2l0RQz1fIe7M9MIW3e66PAYcyAfSFJbo0
	7QbcGk8vu8dkGbaJEQlecUerSWJI+d25PRoqO6qcLMtCwLVmsWWmXGaDlW/M7P8+GOA==
X-Gm-Gg: AZFdTZcqgfduwkc8t0QTgrLN3EBM5wBuqvzS0bIUVb2o2fD773ggKJs5uAZdApYHYJS
	5dHj6E2FByQTcIDljIwwvqyoyCa6zffssKUoCBvWtc33AFNu0T0Owvxi5Mq+djtA5Yf6LfopOwb
	dZqXa11qTmVrT8Yhy/ZJuQ+Lw6Kb9aY2g216IakqA9/y7aSkssEf0Xj1z+8lYu1N8Wk1SkqjYqj
	ih8taHlBwnWOzZr2kDRU6MzIw4G1Om2hKnifMJ9pS5mY978NwJhAVzLa5wbGol1tWJ1imJ7wUAJ
	uhQv6Ow8ytxk/UXlSvj2hYdCMmyKO1TzQC8lv85pcWGZir1lVEeQt2SNbqDYa+gFfmMKEtRY70W
	1VYu1ICDmwRxPPWUo4J/ud783dWbezrtw1dIuC24CDhdwT8Ebb+78N/b26tDBeZkKE9B/n0MZfN
	Qb6+jUKLk=
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040184a91.25.1795585259600;
        Tue, 24 Nov 2026 21:40:59 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040158a91.25.1795585258996;
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: iris: Fix issues exposed during decoder seek
Date: Wed, 25 Nov 2026 11:10:22 +0530
Message-Id: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMd0BmsC/3XNTQ6CMBAF4KuYri3pD6C48h7GEChTqQrVDjQaw
 t1tcWFidDPJy7z5ZiIIzgCS3WoiDrxBY/sQ5HpFVFv1J6CmCZkIJnLOJKfaPMoGVIkAFyp0VYg
 sl3VaZCSc3ByE/cIdju+MY30GNUQjNlqDg3XP5Z/nsfeH9pwyqjQ0mimRbwD2FjG5j9VV2a5Lw
 iDxgxcfg3P2ZYhgCM6arUq1krz+Yczz/ALmo1MGBQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=1626;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2+EGv3Dw3R5Ib5DU2qEGLXEeWvVqzP+A3VmzdwAXxgM=;
 b=PCZKBNddRv7BpXZ8ccxWSOVBequD4bYshmluZJ305PfekzAESPiv3PccdlmBmClQSEm510zDh
 RH9O96QmuaPDr+yDaMuIW6oTkDAoetWoIgitIE7ELA3faZesFprXI49
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: PAqB5Um0lNS_RQMRP-zm9v61vK_1a2Ie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX+Ik6Uee8p20u
 xOYKs+tSW6Yy2l+qY66Ar/lCSDHuIOM2YBa4XrQ7CV3r4YdID61adBMVMzM3UMQaGnYnbpPTDFS
 xNTngfz6SX0RLgbdxCWh1tfjdaBA6uM=
X-Proofpoint-GUID: PAqB5Um0lNS_RQMRP-zm9v61vK_1a2Ie
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b0674ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX0vo+htMRiazB
 ZHXYvtrJXbAAUebfQIv5SsQEIKtxQphk6HxyNLTifMqe6tm0HgG4L2uEJwfvGN/KjH7PPCLzQKe
 exOFp3PvJpBnc3y+lLRw1wwfGcuhRFlif0iQAddU7uv6324Y8fPbYlwoiDBmWYZ815IwK9S0Gwv
 SQGdV5Y6VxUm54l3WFKJr/AIz9K31JrdmCD19hNhhWkIZdjJZ4V3CoB3OVb2+vyKxvhDjNGQh3R
 P4fTLjaiezf4Pyc34NktRHLgxwgVoMhBzKAVQsY99Xwogv0uq/56Fyy9dTx1MvItumLMxTYcV7p
 JJy8/ET+1PS44O9Tu8ueALyglHWy+NLMi+XjPNmAc1zJSXahSahwhehV8x6bQvmWKBStwdNFVnI
 9cthOamTauk3YUzbI5BRlUeQfChsWcw7QNIUY2R99l3kNNhjiLXP2gbDs6s8/M+lenk6rnwZH3S
 tFLpfcXv0LVnAJBxkhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Updated commit descriptions (Bryan)
- Dropped HFI_PROP_TIER from the AV1 input config params
- Link to v2: https://patch.msgid.link/20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com

Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 11 -----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 22 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


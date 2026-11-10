Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304695;
	b=uKAH+argedjEq8yz8CpXc6J8aXLqeB/JZnlyYrCu2BqV4jjzSPNdu2JMYS88s0r619UE
	 6xk7fnO4PIplmYjTyyexn3kx4c+fXJrHxE3UFJ+SjQ51ssol60XcSnGWdZ0a70OzgJ24P
	 TbBUYClqSbA5NDLQb0mQemuuRDM6qkDSC5PCEKtO9jypMcJ/j2Y0Mtyzvvy3bcFGsPu/1
	 l7IyW9FXFWW4Esag+KmR/TUgOcAoDvytblOwzaxZ9XjSalUReji8zXRMdQ+a9wBZkRn5p
	 /mvrQ+YU6ub9EDUj5bK/o5gHlzaixblvS7IlU72CZfMXoGnYfDfc8wHyAbacpnhWQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
	b=CjcMnx2bACT0ueGoD62FI1ap1QIaBg1K0txw+CaIX36I4RZm3E2CofG4/iB10/JEuFBD
	 qa3bSzRgFa3pt2uzI/MDvg70whBqhcnjQk7D7mcZcB4iUzjQWijtIC7sb8Q8dMwMBmdfS
	 vgSqpixf83Xwl1ROjhJFpric2zJ6Z1HZsOC2ksvR4rpI72zAapfEpUYeIRW9HotQM5MFz
	 yMtKRh/uOFVRBIwtF+FJsr51hTLMLMHkLcA4KwKJNPthfyowavjcaG73rtlPhGhZOO0Hy
	 XQsk+pXezzgp0gWB1Av7BSkPfP1JeUfNyqy9ke1GwaCOvCEVOctgKoDX8TzCV6HwGPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BA606A333
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643BA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lAme2433884
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=st+FkmjgxRkO2p5uixOrBU
	L2Qow9wwEX9/ybZqtET0c=; b=RaHFHGUn5JcunHYUUobWtAI3ki0W6U5NK0DwIm
	0MI0WtYdI/A5FEwVWqOHRMBT/xsdu+r2z12mlZ2WvzzXjMShZ14Cryd0kEj0pgZn
	eRkUhEbrHJfd1YvXYZyQxHiNaA+d6HKgofBS3P5eoEv2DiB599+K9Qq/gadW7Zzs
	9ccAT9ZTLYPh8sYTNBoS2A+12rpMxUk2jU8HpnjYzuHelRfHIsIT/VVfHMOXnuUz
	zYrSrsTsNfUvnYwhiuGWLYnctuQh68t3307hEnsgguttJMtm0wahzX7L1bqsJQDj
	lzBbmMSozRDLVZ5A1IkI5rAuwUNQBJ+oT6I3f4OdQPOphEbw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848rcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1792114c88.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304693; x=1794909493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=Mhs05U7TVFnffqRWKGhCr4j8nfECnDRZ0hXvEpSiooyuVm56xL9AtoxV57E7wdZW4i
         rUqJVqO1s5Q0oxUePUHF/pryuCkvoTuBeBY9WEs2VWeQT6al95+5Zo4jbr9NlTok7AjM
         8G0hOHHN24PEiGQPkSp4NVpI35levKn/t+VPtqGe/l8qrgv85pWlxUxmnqr/l0HGZgfR
         ciYLY/0MoWaVDygt48sFJqM44cc5cy+BrknIYryoZTw0yMfK8LLCIzcfvrQuzF3ltuCX
         ebisP8YDNj3G79YU1HLi39Sgjm7zSn2IuSPV9uXmcisOPovs9FLUKRPV1CXVCvBGXM+t
         mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304693; x=1794909493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=uXdpHAmFqP07YhvJaZcHXEtogGX6E+W++12iVr2wNLazY2d+ENaYs9QU+KYcHi3mOA
         LVet4QDHNwl39KHVBRTyKr0E8Tit50CqFnNVkP/eOzZuaNyQysnpFUStMuucz3hnpEqz
         j1l2cz85FkwoNh+4IlZJ48DM5qoIMV+2DUnuma4CN+EPrMlLNhgwwebHynE+phFatlja
         oeucE/t9r0kfhUx5D0Nkrz5MPbgDNLylTwd2+eVl/uMrbPAJT1+thGgwgTqfChN/opNW
         UNxVnC21i2Acce/Ztpq8Xp6FMvMiXG52hZ7pGo80y3NDBTO/+0iBJY3yOlKRG86fnfOq
         oV6A==
X-Gm-Message-State: APuU4Z9OeQGBDffJvmXL4w2TxvWssNn3YzIzuPHlTW2+Of4SenwQT+MI
	JDhQ8cVwgFjXC2oQFlfD7WPV1dE5C5e7KuS/0s/WoNuTJh/uHrJOOfVvEpsNO9fyuZb1tBfvmTz
	fD8QDzQZf67MHIOSXhiIFQ2GojCIDd5/4+cZpUJsz5K2kSyOUOqKEJXswrfpGwYh1uw==
X-Gm-Gg: AYBFou1LK2bR0+Hkza7iSxMf25v9iQqtd0JuPFncpkzQeB23m6ysFyFH25cg6FgXDIk
	A4vIyEGDDTQ/Ai4tc2ENUqhLqyE5rs5RMscV3tJNRM26zh9HKPYMjgLLmZXvJejtAhQ3BblMJCr
	WQWySvW+7S+seFQd/TrSbcHPSI5KhYicfSu6a8uZL9NCaVjm4FXs0Vj57hRRe/XgP12zyoP8nYV
	YlzuSRScB9jwENYOfIq1gGTrSnyL4IekqNltC2gzXYWB8bPzNJbsk3yKTr/EGH9JnC9bJrcaqCA
	zte4u73y8h4VI46MAz33SZjeJOv+vfgKSifGm68J5tpmYhh9fjMQEP/IQpAU92l/UYFuR2XT69j
	ERD4D9lEN221n8qyMN/BAe16ZL+eck76PLC0jqgfG4EXvkWu/T9s/jH8DVTsOKzs88cAHzNn2Do
	zfG6C1rA==
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008461c88.13.1794304693040;
        Tue, 10 Nov 2026 01:58:13 -0800 (PST)
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008418c88.13.1794304692520;
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Fix issues exposed during decoder seek
Date: Tue, 10 Nov 2026 15:27:12 +0530
Message-Id: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHjq8moC/3WNQQ6CMBBFr0JmbUlbBIMr7mEIgXYqVaHagUZDu
 LsF124mefn/v1mA0FskOCcLeAyWrBsjyEMCqm/HKzKrI4PkshA8E8zYd6NRNYR4Z9K0pcyLrDu
 WOcTJ02PMd92l/jHN3Q3VtDm2Rm9pcv6z/wti6/1RB8E4Uwa14UoWJ8TKEaWvuX0oNwxpPFCv6
 /oFlu3qs8EAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1413;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OoTEOWQbdE3NB0Daasfn0CVEElbzqxziQTEV4sVvvLk=;
 b=g/hV9z9s2R8N3SVEnJu74ymiGkSDFaugKOJVWe6P9etdbWT85UnQ5WMFuiHquXDkIevC8lWdG
 oiww5YXr4oECgEGH45EtFxB5CLSteZYvc/b5XnBYT5rdcW2ED4SzDhs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXyX+WUJebkhfv
 OxN8Y357zFeLgitX7IjJkjR30wbCHs3kknQMQRVTZLQ0ENaMUPUwwqoMIh9HXwits5DOkdiopOm
 2NTbu153Sw1kx860VQ9CLAstoVhnud9D2dusumgAz7pvibWFXp4k06Q4GyC15INY3Qfp5cRlO2S
 QCKc1Cx2zNmBOEFXzGQ9Qhatc2HvUvkGnWZCveh/BF34/+V8ora5lTcu707fW2Df+rJZ/LzdClm
 Aie82UyVEPRfQ5Pm0NTctb3O6TdwDZLsnuFQN50AAo2A/ky4RGC5agjDdlT97zg3uRC23ZyN4fX
 3l3935Sb/qv4i/178vDNPRoFYlGOBCSmsh/RhK7zToCFuojXjSpjfiizhTfydDJ95O8J4u0VcAf
 84FKsPDjYck4bKDvzvFNRs1qwqevOAkZsDEmS9xurKZ7TztPeJg98ScM2bpsaYnO2K/q4k0zyzG
 /A8kq9c9Ju3fezgWfXw==
X-Proofpoint-GUID: WOvl4gbqGITkZHZH7vX6KBKrqtwQ7V6d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXzq44k5QMDr4E
 yw0s62A1fZsg/ckRj9Wx3DvqaHNngQhuyOhXf5rwC0Ni6wYrHBopAltEBvOFLsx2FK9H42SR0hX
 mhQS+IqVgAF20TPXjALkfh5bIPqUK1M=
X-Proofpoint-ORIG-GUID: WOvl4gbqGITkZHZH7vX6KBKrqtwQ7V6d
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2eab6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 21 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595926;
	b=CE9jrjW2p7t4eTJQ6OO3eiEH8hZgZjLZzn+hhUNAH71gVvCXjuSWuI4NF2/eEuhtxjBQ
	 5jj1IjwqlBNm/Zvr3dZ3gRefekwADEGJhcm0vsSj7Zrux+YfR+Ion8DYbsNVB8ysKfbxU
	 zJ4T5BKjh6AUzcB7k8cfw8lGzdnb/Tu6YrugT6BSyMJXdeBvRDKUBKk5ktoioBn4Xc8V6
	 eg+YXIy8oRowxdGVc6lHw5XqhUw+OxSJwyALFUeCUPtDfGIu4cOeD5kTxqqB0oL0n5XZs
	 jxBuJJtnM4ZsemjwjDFm3Np13kNGEOxDMrWB25Nw5FtCBVjjD4H9CgPChfNe+9kVSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
	b=ULxR7VBh6J5ye///OLB8pVMiIbsakVzSbv6cXThfAw1K1UqxOIKDFbjVcF/iAsKk1UE6
	 mMc85SY9n4/DLPN6s/ghj97DzuSta9mbBHBSLporb1IYBy0jH8pcK4589arfr2uKXbKei
	 ZAOtYS1SNJ6uR1lJSp4B8Pei2QAXcBol2CoWA0gv+lSXpOqYNaS32LFgj4UheRzoMnh4s
	 34j3fgX/xEY5u+5zWGyN9V7i47vAYZSlXT0iwK9eeDSwN+1YJn0rLHVzDqzCNF4dmgcT7
	 rYI3iLdBr7wIta3SzWrkmvZp/Bs7reQ507huKUP5r78hPX9zW7poC0+da3cdzZWAywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AB606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68h6w057279
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j8mb2yiioJKUWf4gPuStEb
	cGreiM6hFgxHOginPRN80=; b=caXQmvYz1IOPnu/ubLHpLEKDPxrBbYPRqzACyL
	XyXZOtGsSAvRXe1HrEJ0I/evg1zWzykQ0GmNg2qC9H/VQGHEkCC7hnvxOI2hU2A/
	uGNl5uqLWnUgK7f4Dpg+3G2t0Cw7mzDV0i9ZcP9oYC9HhaT0MjCYMvTfniNyrdhg
	NRiPFfzy7omlGG1MX25kfNTxYPGCUhqhRPLwJMqMmiJKvmed1dOxzI9hbT4HV2XL
	xJRLRuAVMkcX4CnOE1GpdSlQ41PWmDOEz+YCSQ+jKyqQKgn6uZE2q4ITATRI0lA1
	MLW8yTm5k4i0FQdQS18PSFN+dYb9pk3VXiwdDKAWdNaixe1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfam84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so1063912185a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595924; x=1796200724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=gGtwPxSryZ+NJMJHehmslPBusIW4t1mJ2Fli0neciUIZoF79XnPfBg4nfuc2EWQ0pv
         dpIVamq/TQbprBog7FPkQcSXmT538NWCC8gOo12z3qcCWt9TqPXns61/gKeYwfw4JPqE
         lStu2nI7CTbF8xUnUFC3IbNVmSCtlDe536Nxs0r4O5yqFPdX/bCxt3iFrDP6a6Wp0UAm
         io0tmQ9PcdQbAhUDoHukokl8B4ldQLeF65c/YEaA1ECs4ffTsDqZ5idVYNCUZmFhF1/w
         30XFVWhVFWqb6AmD23YHe0j9/FLE+u292jQnxSR0L2OYQx8hieOlTAxAEe0xrI/e6UJi
         rg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595924; x=1796200724;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=sGvUYsM5SozlGjYzJ5twCFF2C1MUMhUkD5OzdDJ+jPjKHdMZBqWSHtzg6Ag9mrZYfr
         mZvDtE1nhFyhdhPgTVy+tYvVmHvui9lwupNGxKDomdRi8vE7PC0VccY3xqfxj4+cszgc
         NcTBfzE8liJkWxeJ08RizDKhPN8BAfbrSYgKtg5QdN0dC/oq1Wg9EUQbvNb8WYJFzdKX
         qqYqY+YsVC9p+pVN+6KYqf2qKHYd+SmUOBQDe7xyvwdcWco16w12603dAVYoUeT1+5HF
         XqWf3PNuy7HnPzc8IUAv84mzBm/+E4ElNCSyOoNSNuvDWK/iHU0JOXbRxeKj6xsB2ZF8
         D9Ug==
X-Gm-Message-State: APuU4Z8aJ9vZV/4y86YyN7Yr3JQkM/YsZWQr2pMeGk2inb7ApHTRdRKq
	J6C2vH3aR3QJDdj4YY8cTcSN1sEi7m0EjijMQEdksXgOfNmpC1zQhlrKZyQP3SprxIwWK8p7gTy
	01XxiueeUwxZoP7HvGebromAAo4AJNQdLAhi8UwqqQOusa1iG+4QvdXCTiB+5O2U0fhmdCTGrHa
	ZG
X-Gm-Gg: AZFdTZdTjfTi6gDuuxMEppOaCn5mi4IkqX4LpLumWVQandPhBJZqB4W7tgzITLdjIVV
	3UL7TPlU/QiAp4ppz1OunnHbfsuRY8o2DzseZBBvoZ0zKcnTXZDeaW3In2S8nyL2xYptVkWvHFm
	XY1w410+CTULtnve3OY95OrsI94EhdlgsexPNzr7VSOpsKVLNpWiaDBtQNXmFz73rPHyzONot5d
	gnXvwGTIA+xTdKJyEtha1ICi+qeRjnaFeRLelyx1oNxMSCtIlLY3bs/objtgc4kYQ3I3bqMEXmn
	cO4JfZgIbewHUFBKewWalfAIwlfFmXel+hMrW07H23oOuBBn+2/LdcoXs5LMigQ4f68KRi/nC87
	Xjh8CQN7KpJud0gTZnt5H/fOloGPxAeEbY9F0QXXiOBtHGxgzAqI/k5KrFwddfQN+Wa21Quko1V
	WdqufGyu91E/qOiQARMsfsCop9xJJZcnSOf4AZiGzSETVIqHV4Alkkgj4kxFWTFtPcG+opfJOv4
	H18Nzm7x4eE3hx5p4sH24HPVxzh
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930704085a.2.1795595924150;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930701285a.2.1795595923496;
        Wed, 25 Nov 2026 00:38:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:42 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Avoid useless RUP_DONE
 interrupts on TFE
Date: Wed, 25 Nov 2026 09:38:39 +0100
Message-Id: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI+eBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3ZK0VN20zArdzKJC3dQki7QUI0tjc0vDRCWgjoKiVKAU2LTo2Np
 aAEqRTCddAAAA
X-Change-ID: 20261124-tfe-fix-irq-eb8fd293791a
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX5BlkfFq0hwN/
 OGwX/ZWPOeqtE533JDZoZ2u1wuk8cu+teZDr4EvDVadYzaboozkkUXO3Z8VAzD/Q8YP0q4FnH7w
 NLI2fI8uOaVo3oXG0jOV8k1PJsV9ahs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX3QRKw+P2Jx/g
 mZxsoFljDCIDLD4dHC3nVD6Hu8+xxyBWqSrLwIAqoRvEzOU6NaIQ31Qtds5NiBxcnXXVPV4mZOP
 55DJij8Gd2aD+t4Sy0uvB2Be/Otawj6izUEb4LrOMfJteLEqjcQyjNg+kpEZVUf3UeT4/qM1drr
 KFYzTIFlijEYJynSdonDDpWaEu6qVtt03yhwFvjCSMFJJCm9BoXGcizwjveN0gNc/QNGckfQJzw
 7CReBUXQUp/TfZvewGAlwJPXHMkfTkuxGP7QoQ8godMtQn9d/qSnMQCNlbxywJdQJUwDOCUKXih
 X1KCujxUJIcPBh7As6mPzluY/QKzj/0Eiy34jAFEX3zN3Mtrhanv2NqN6Cea3P3xAPB1pmP9/9j
 Y2ghkYfas8KUWtZtXDmzqecES3eaI6arjb7FcNWuwOE/scuKact7BoZG7x0YWGVh2M66ZjMLq90
 G5TjfVq3b+1vb0cmfZA==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b069e94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wrLyjG2ZGaWn_AwD7_EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9qSbQVeh-3ekiaRD0DFRQPKQ2sw4vHI9
X-Proofpoint-ORIG-GUID: 9qSbQVeh-3ekiaRD0DFRQPKQ2sw4vHI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250034

On the TFE (VFE 340), every buffer queued at runtime is followed by a
register update, which makes the hardware raise a RUP_DONE interrupt on
top of the BUF_DONE one. We therefore take two interrupts per frame where
one would do.

That register update is pointless here: the TFE bus image address
register is a FIFO and not a shadow register, so the address written by
vfe_wm_update() is picked up by the hardware on its own and needs no
latching.

The first patch replaces the sequences open-coded at the three call sites
with a single helper, which calls addr_update() when the generation
provides one and falls back to reg_update() otherwise, all generations
implementing the latter. The second one implements addr_update() as a
no-op for VFE 340, which removes the per-buffer register update and gets
the TFE down to a single interrupt per frame.

Side effect:
VFE 1080 loses the register update that used to follow each address
update at runtime. __csid_addr_update() already writes the AUP mask and
then the RUP_SET trigger, so the latch should be complete without it,
but a confirmation from someone with 1080 hardware would be welcome.

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
 - Simplify commit message for 1/2
 - Collect tags

---
Loic Poulain (2):
      media: qcom: camss: Latch buffer addresses through a single helper
      media: qcom: camss: vfe-340: Skip the register update when queuing a buffer

 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 33 +++++++++++++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261124-tfe-fix-irq-eb8fd293791a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89B3E715E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600455; cv=none; b=YIs76AY+BJGVzp1eSBX9S6JEHMdnbVKGU8jpRDdiNXp9tXFFjdbl64IAPuQ3bZ5CeXAltLhvfaYqjz8wJUTWyBei4eq5o3fjbZ6ldoQr8g6qEQFX85UNAUPvWGM75IrK6BVcHwExcIpvsUSvp+nqlsEnHJHwy2ixH1Ejx5sLulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600455; c=relaxed/simple;
	bh=bVPxoi85jbZFO9af2Hg2HjePj0L5XNSg5j6catQYaJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2VLZe6fiizJCnURFg6+QznaOeC/w8DXNRnahFUlATT5qRaqfx4j/nhgFVmjERd+DzO4EN6j0mUxgJrqfrXOnuHlK4oyc9l2ca0z1rctKGfL4EUeIM+KjpHlBDvdZAUWO1P/UwAqQzcZUkPgTfmY0X0y64f4/JW1mduKo+3FJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVYP/Soi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVR/r5Q5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVYP/Soi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVR/r5Q5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCSrC4107055
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=; b=UVYP/Soi5A18CJYF
	y0YOOIM5zVWptpkmiEtjoeiT8rWrqEfAXaP71wFjAU+mJfK3K58nV4jUpxTQMqsh
	YwmDC5PlodIvdYrg+FW8YHiq7y3VDxPziXotDmRDsBUZhaOIKYnIPufkF7WWqxsg
	tZCkTh+9ojPvH7xOeHyt53CyKCMW3QbUbNEnekooqSOMS3hUzLssWYpMqIrR7FpW
	YDsLD7emYg1EvNLLG9ehCNrGAlZF2CzHGuz6/6ZCyTooFmhShvsYhpp+kXqPR15/
	uDWcj5PhE5GSW+1nli9YJsOf+xIMDr0HyHNFNeUPu/rMAHEH9Ux0Kzja/l8RthHN
	fDR9Xw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn8kg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso1203427a12.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600452; x=1785205252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=JVR/r5Q5RQUqY5kyqS1phcx/5Ls75Y8duF93i/6sjYT1DXHEa+pPmHPWiRaZhyWMHm
         uJO2eFKW8/SZsWz7/EyDGPusqrCGlHeD0lTwlA3y9PVMBcPJ5BITZUTeD7DpoJ/ciI9L
         vLaM5vnAEdOwihZZ2SuoeWHW3OCCCbpQmmu3Zgy4AXQOQ/qLifeN+dixrpOWQ8/76GAc
         OAq2+edgLCrYertkJQQE5CVBpaMHH26WRxLwF8QZXie+qYXYZNgu3z+xR3Fu2GlY523p
         hD54zdaax7pVf2yXFmB3BPOZyJ/YaIvO3/pH8Xi9wNfM/hne+6Tza9741GHQHyX28ca3
         8JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600452; x=1785205252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bP38xOel7Wb7+m5gMySSFSDl94pHOR46F+B0I+Gh0Y=;
        b=WffMB3pjOHoJZMByQFDXo194br2lazrOXUH1CQi10cVKE55C8OLyDXaPgACSuVfg/S
         x1jjzbcXptGyf7hX1iB0bH6TvB3gL4gBBKJf7hYmuLAJuFmXrH1dtfFKsLqrbM4HqtQM
         oeZk0zsNfQ1gu4DB8ZA48RKVZjKObQlKJUABX3SG5EcWSom+HSYoSVrsQEnqo1+/9EBd
         EqEupgzoCVWXncyWUarvioYAAoQtK2r0vGQAsf7jAmEU/pJOXOH0CXe/WPqI4GC7MQHV
         wXSpo67Fl9zNDIMBvO4dXWnFj4MbFqKmAosCuY/xCtEpF423xS9kXUCuNF81bUiDt/Lj
         8VEg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2h7d8XXhKxa3iD5qpRxumKSKg3UGiKJIpP1G95ER98eDgO5e7479zqh39B89quqFx0xg2xGtOHo3mGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysHg1iehCHlnlaq44gZXaQ11JYo/MjbNRGjuL27ePRIb013zkB
	ISB8TI17/WarJg8qC/FxS7VlG+dHIATAa4VTMk2vCniYhyv9ySoe3HVxukqh5fUYM6VUzLvHwxE
	tcX5r0eQYhXywtLktuVqSdMrngTORCB+bft+XCOBisORI95UmkC1+W8Ujqde5t49P+g==
X-Gm-Gg: AfdE7cmxDtsDGV4E7qVx9bIwkut1rRuPvFSZuhoGBhNeRgJu1nlYjAu8rsII4KQjEsF
	7RRlhGIE4wCvDMFsTcK5yo55hTaguWHCJeMBWzQAY4wk5lHKcbgohG90NqShACPR+/JKr0ht9gS
	CZi7VUKDLa3kyZObTYFEFx+Ul6rBqiel3h8vPRpYBPIzT65yyct982XrVfytTtDzpM1lj5I7Sru
	AFMH0tcpApCoNAfTBJi3i5fTIqrAdz7b7vFG+9oKmz0/Pw7z3z3+BJMVjr/5xh2gb6k+UUKzRrb
	v7cSbgQvaeUHrXT2uWg2il+9KTXYVRoLb4GDbbSyVwCr39DOoqKFaK7kjeVgG4ZeVIUppHH1taI
	WDpiB92JwJas4CbalOHSgSGl0RPedLQiUTw==
X-Received: by 2002:a05:6a20:da14:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c3ad973dc7mr18538262637.35.1784600451662;
        Mon, 20 Jul 2026 19:20:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:da14:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c3ad973dc7mr18538236637.35.1784600451208;
        Mon, 20 Jul 2026 19:20:51 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:35 +0530
Subject: [PATCH v4 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-iris-code-improvement-v4-2-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1345;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Uq29RriGWpbhBmOAxORGoqBD0WkHutgpBJXYyBKyE+o=;
 b=XTLDYCz/Ni0F951fPaZ23QYLoqV1QXGrdTx7wwBwLGxBNSb2Y+LYzJlzVrKFarQ0ylG0gxr6T
 SPUSSWFZLPQCrlT6KOxd8n9SSrfKriYnUkvpQdv9RhL0rKN1CJ7YOrO
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX9H1xuBRKt8+F
 41bEBrcuOKh0Iv+dmzLlx+sLh/qCRPMtLLs8O83eG1JnHqc2vwbieeOC2KaRYZ0PNXcj7/nJ5PO
 00LgifHk2Q4cOfCpOjTMnhJqvEK6xk4uvVyUn2VuMgfJWKE5xmqVnAtStye7KiQ/8Rw1zmO9tgP
 PgzvnE7cNhD2TRP9VqhG9paqTWWDR4NrV7DmN2dFZwoLG/nI3nAyKrdLYMAQhSUf0sxHTDi3bbR
 L4GB2KC7tWv/rGgDA+5sj9JnyXsuErELwg2Qcz2K2GYLjTVD5nzj+qhpYI/QCRDFt4Z3Pz3sLkd
 WnM8MK2GsbbqBgj3ch1YVchTR0uYeOn1FCedvgA8U7tV+F7ySQQXLxhIETs58iCRSnIp+YFfNmG
 ZV1VGnz8pAfaCxNjnHzH8fS6engHiUpWKM2+3AByV0732U4hGAiZxy5sgxAXA5pjjZ/puKSDHK0
 uMd+ftsZQAzfRK4TCcg==
X-Proofpoint-ORIG-GUID: _G5t5niH5qCBqbYR-fagYDGFpemHS6RW
X-Proofpoint-GUID: _G5t5niH5qCBqbYR-fagYDGFpemHS6RW
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5ed784 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iF4bBz5rOIv4ZkufqEYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX7aEgp9xt0k3D
 gFZSg1vW+qc+X8TJOox/dU78B3ksw1sHplWthMCs364B8UWpSyu8OpPL87RsLIyeG96KQYxBE2o
 tWN2J/SWkQoNSiosLdP/codcmHk7LnM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750..e991f34916ec 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
 		return -EINVAL;
 
 change_state:
-	inst->state = request_state;
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
 		inst->state, request_state);
+	inst->state = request_state;
 
 	return 0;
 }

-- 
2.34.1


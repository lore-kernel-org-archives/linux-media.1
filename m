Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411626;
	b=URZU3zlcJCQNPLfqyoR0zaic/paXc3wlerL0o7vNw86lExjCvTqXv9HhtyipUGrDICsk
	 DLRCs+7qo1FRgw+p+RCv4UJZwERcYFV3cm7ca/vwmaBle2BWJUTr/l/F7l3bDB9k4XExG
	 Ql05enIzIA/Cj9LOiOU8BZOG1IO1HOviYlM7kPjVg6WKV64UPDEFhegYS6dBmkTBGCTyr
	 y4k5vr1wqYRxGQ3J22xTL+PerKS4E6ArNBCqVAWCYp38NYPbMbNGlfVP11WHpLxpaDsJk
	 glZoP6P4G1eLnVS5MtJpjsG7YR9Gjs/553BxIRITiFQ93PAeWOrVGwiAovoXByAaTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
	b=QuqyCURA/QpULG4vhsKCE+kaYX1z1/eht1b70LLfHjRLgDs9TIu1dUiathabrTBROZts
	 cPhEVcjVgpsfgmR6QMLMs6M80k/S5UgdHxi5uohr6FAtD5kph4dRUknD029wQ26JP9fVB
	 IKGPiacllg5XjmKDTn0W+L3df1Myu4aPR4A7USpEFfOi43GpmwErZJBbnHKfyoBQ5t/bK
	 1PkHB8t1VzoCjeZ03RpKiocadgKXlbAa+XxQVbg1TZLJ25oX2HE0YmCInumhfQm2JV0NG
	 ype/DPPFd6UBs36WxeKHRqt3jiLEkDmfa4ZRt1FqmmiuADPZRTy+z3dPTo1D1a4PZ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B5D60A261A
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B5D60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0MBs2665062
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGCAfUgjVkl
	diKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=; b=cxaw0+0nJPb8xv1OcNihqrICR19
	cOUC/HQjzbHBOYXUQp8NZBtSs09TJ7g726jbczD421vHcwuFl5MM6BQca8bxpTX1
	RNz3JACOR/vBdO9XcTR2RSKWAuBMmHGWHFmi/zk1q44W6z/nWoTtIWdEoDFMFbKx
	yrr/e6iWlm+T5OZpstJVnmfbuF1cKujcnH8TVVXBG0OjfSNkP0/TXgmzmzLGmWuA
	G+0uoUWHYow3JIXCTJMMo8TYAO4Y5OxlDvJcfqPsaqpcxEZuFNd/UIgaUAT0L6+Z
	1dDfQKV9aEu+oVlGH4c83K1DkURBxKfBdXnnueftAyAKPuZPOzOjn9OdW8w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjhky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2eba20719so615740137.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411624; x=1795016424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=B1wb0lQ6kbm0/VYXqYyiLYQAv/h22dVx0igTbOy4IRvr81dGXQbxdtE80QF/gyx/F3
         gmMycscsjQvIFn24LUHWLiTr/jDQTG4vbDFo4VOtWzu7YKIOpGXiNauPY5jMAgxrdMCQ
         fmB/II50yO8knq2OGENhgoYMOwUgy/Q5lykD6GgkwxSLzq5H3BuRCpOSpiEnbGasHddz
         YHYTJ7XxNNH7uKBVNT2NexW3rnHjgeRZtmfEtcCUm2Az1cVsTNZH06O87QkgpwiBAF6N
         uqIbLkbQqULZDqcUqU+4tHgzLcKfKdQLEJwHiCdwb8E5hYOP8UL/NKqn5cZD3bkQ4Nvj
         InOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411624; x=1795016424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=vqCvAXajG+vDudjG1+IzqKKqH1nrHgXvnMUgftDRgfliGn1hb1hAfrSmbl43O9EnhD
         V03YYg229Wjdi2nwCLbG210OneDZZPiuQ9/CK/AP5muSTdzUohRdtKTmE4igoSF3E00T
         IPle35Ztbke/uFJ6qeLTOgUgXa+NEDMKPhNMgwzXb8iSw5JSrb0C87a+Pc0+SHdTHRVw
         jRZf+lRBJwPPKMha6dtlY38JdM3/WAwFWI4RRu4E3fdebQCeLxGelt25LMtMRoUpG6AQ
         aVCgInoONZtokk/FSOxgtbahO9e3H1hZjX3UN3i0pwyHo42p++7xG+/QjLHCsHLDz98V
         ZQ1A==
X-Gm-Message-State: APuU4Z+o4IpkyyEpy3ig45vBYcgn4tKfjmWkb31fkoltBTMht3GDHDG4
	j2ikXcQU7WxtwGEknTf0s/J+bTzNa9eHUKoUIzW7hkkGah8qiS/yLe6Les1qYXUBeoc1GV4xxG5
	GQnUY+ZOvG7njhKgJnGenKc+9Kp+NYQrCSC53gZsJ1bKuRIKLlpniL6KY73P5ZTsjOQ==
X-Gm-Gg: AYBFou2PLYrEjnNsjCQKc7ckazl9prBlZwHzGjFBrAaoqQ3oMWHJhl9Ii+lCyhkfN+Z
	lqVpJc3cX/d4pGjITiJMRHcrVS2wf2/JB94FrVroskV2OpxEGLYzRaF/SgODRWs57S/zlXlmq2E
	P4zvcT0wTQIrg5VsiwN9U36jl1u65PkO+/GzvvHz+r2PsaVzwlTokR+ISk1slQs3Kv8KkR3uq1k
	fBvJol11C4+FaLVYQmqLqD1kw1SNg4zIBQ78xeCRe4ak1NisjTro4gLroSh/HoTSADodukKK00W
	jh0r5O1sUwrY6E2qhu2z7cqok7egh1GM2V/XJVxlW0JWY/HXbShkgh+zaA6CEvJNFy9J/JqF1ih
	3ujjRNofSGdmn3F73BFp2zEpKle/JKYbTLluGJZQUMuPWEZtVUUkHAtMx4lQT2yMudglWGpO7Xg
	==
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923943137.4.1794411624567;
        Wed, 11 Nov 2026 07:40:24 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923924137.4.1794411623943;
        Wed, 11 Nov 2026 07:40:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3528265e9.13.2026.11.11.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:22 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:21 +0200
Message-Id: <20261111154021.654708-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com> <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af48c69 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=dxASnj8t3s5ti5x4tK4A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ojT_pMzY1gIeY5rNYFuW4Klww2j-eHzw
X-Proofpoint-GUID: ojT_pMzY1gIeY5rNYFuW4Klww2j-eHzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4KyyFPMGmAmV
 QyuV9IBPUysbmeUQgKwAsmzOcvsq/6sjWMswJtmMtO9xbPpGr+O39/l6xpdy33VPRbMB2QK6ilH
 JcKrYCBJ0TwaEwBLl9EUGoCQYrocVo8smBECcGIrmREGWQyz4Rp8mu/rn6+Ow05+3JxYuqY9JSA
 001/rJnxO8hpDf57oEh2d6nPv85Xc8lvLT6txELePk92SMaMHZfmYT/jidBtGFPio3TLLIINLVt
 RSKEl8R0EBhNe2niodm9WxaO0n13eSx7h5ghjOqQrP3k2kvpvNuZjtYoj1GRh57pDhDRqPVC3Le
 m1T1+zHRXFbVU76pdMafnBX/LguGMSNQUxCpr5jiutjE4pYjlJ8ctYZbZF1MOXuWj2BWVh59kTZ
 EP4ax8hRb2sfca6v7Tkbj+uj9pwoU1Ywg2/G415En5Vlk75BufKXgJ0Q25VR9Z+ahilRQ+co7ER
 +ZRrDlW6tG2UiqphjsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4F6hIfNRkR6h
 yNxtUCDHdGlRg/i+CKzbWbpo314/a5cbiUKPm9ImNG76PVeVyRokeE47z/X5c6+fQIFkb4i6oOy
 XibDFKqXlT1bya6j15YcFjPzjD2b7c0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:17:53PM +0200, Dmitry Baryshkov wrote:
> > +			status = "disabled";
>
> Same comment. Enable it by default.

Ok, the same as for SM8250.

> > +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +					<&rpmhpd SC7280_CX>;
> > +			power-domain-names = "titan_top", "cx";
>
> The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
> MX should be listed here (and used to cast required votes on the MX
> rail).

On SC7280 this is different from SM8250. The camcc node has no
power-domains property, and the sc7280-camcc binding does not allow
one. In camcc-sc7280.c, cam_cc_titan_top_gdsc has no parent. So
TITAN_TOP_GDSC is not a child of CX, and a vote on TITAN_TOP_GDSC does
not reach the CX rail.

I see two options:
1. Keep cx in the JPEG node.
2. Add CX as the power domain of camcc (binding and DT change), and
   then drop cx from the JPEG node.

Which one do you prefer?

About MX: Ok, I will add it.

--
Best regards,
Atanas

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413133;
	b=soRCKObikOF7sA+qLoMiTmzKxgwT+4TN+03yskbyNSItg6CUgo8iHDwGt9/cgcK/2LGF
	 d6W8dhr0bs4HE12l1sRlbpx2BMeWYE5oeJ5RzcEIagcYxZVxJ1Nxi7EbO24zDEb/qz2VV
	 kuiEzVMjTJ/YGvOnYIbLZiplqy7nLRq1a0tDqAKtvmbSJQ5ptLzEgmOekRIXtdZIIj7OM
	 QtIKZNQ+oj6dSRtPbqTDPTCHYqpzfh1XBQaT6i9w+3uqPnjBhassGTEkYd8zY0N8nxzHx
	 DvAn9xjM6fYUZzJxk28lK2h003b0YXxLvj2mNeNweKOrIcTd+P9kuSW6rItmhn0cerw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
	b=r1ODogEwMAnd7trdgMwbHVnxjAjjMWyky9dcZsZYjNkYFOYiq+slCEwVBP473We2ZnRm
	 utVgpBkgr6fsjPei1IwIEbiu0qW41x0Z9kxyKkzYHVsWa2IAwj0LZRpNXMZkRyO/fjP3U
	 SrjpiLDGQDmwgFwPaW2SRs3AeklA8MGWSpkQh2XEpM4AwZnjCbp9eqcrBOeqkg7pnQyb0
	 nxo/955rgGsxnvmzOUp1V0hl5ccM+4fLbSR9wNGB2NK9WW/IfouPtMc5PE+/1N4jE8Tpr
	 9EEISuUUVyK3l/37To0ZaLkgv32oPhwa2P5OP+bfos0Yh9QQ3V+wslW53ymOtwhot7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H7Y1innE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC4606A330
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H7Y1innE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51LbZ2924193
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=; b=CGSEUnFN6ASWTf9j
	nhtenKl5ijDt/bsnl8gO1DErbLN89LpxWx0xpUGioyMcAoOcdwiP8eeS+cUMUvbF
	xoaBzXrV/Ux4+MMITjae8hZo+DMTbj2qqg5fjCjzq2Lmh56wpch83Uusv3k8Z0AH
	NkJ3Tfo79Z9e0lzOoeHcoHdQKotkJdllFnNVrto9hEVS7zwgzx/0VyWq5UOOauy2
	ntZeB0a9EaOLevFYlBUDnzxVxQV/MiqWSCjozV9jzl+jKs2al5lsnSVDPsPB/6Y/
	Goc1OU1edWcwxlCCneCyEY5556Xvih3YruPtARxuWQZLZMxde6TRUNeq8SY+8PfY
	ZX5Y9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg524-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65070d3feso1640512a12.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413131; x=1796017931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=H7Y1innEHP1oqdxGciWuwNkf2FBvbQew6Izpde8UHvbmB8LP7xJ8tP+8MWiiPaoj/9
         I5ELGiSQJdwA5/57jlZmbwvrmSfa/cYEqdH1z70Q3R+dl9Q5plr2auQ57G/RB/4lhcgY
         KOwpFIju618IOB1ZWajAXqmjJ6DkKRd+93fF8InFxQjYitE47+B9z+Ukm0OhcRAsARxH
         hGBT51ub7pcxVCmRheK2tNdileK6FiKXIEILVxP1cyLBsv5Nt7NWLGwqXiXkWWISrCvM
         iqR93KczrLMf7S1TBc2L/couJStaLohXc7+x5OYkxxE6hflEyHxtj3ooKrMgm0XH4YeL
         aoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413131; x=1796017931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=xPbx8kTnMOjW5lAPUPvRLRpUuVgdLr7CB9iioBjO6g4e4jMihEV1LF9kD25ZcIjYoB
         QxGw3wp7xh/Tg8IMMU8zucrLoW5ToTnnvmv4hjZ3wFjD4fbSJ/SH9TC7zIZxhD6o173D
         pQjEKDSIvpHu/BmKU19LQwaLLYFY6ElSDyLJOK3V5B0zy1O72ZmgamTQ7S8KemoEB5Wh
         nJ+tyisQRoneLzMvas7pE35D2L7BUkgG26lhJdUi08RbdepgmM//kRIgOM6R6GCDHyG7
         7TUaLVUaHdssdkLtduaZDCFRq9KEj70iJdtMi5oR46hNixzYqu3wluJBTSBw5T0dGlrD
         RBpg==
X-Forwarded-Encrypted: i=1; AL+hErHkMJN6iKmoCG9Hr5YB9rOQWzLsmsCetIulkPbYo6dm4emMzSwZV21WxxwfLqxlaNF3GNeJbo1T704T+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qACRodekLMlWhRSwRl4xXDb+xEtASGL272Q1359nRwIZGA17Z
	KQp1PsBGkhea9jNXOf71Yr0pMYhlSEVBsLQhxlYh7W00K8vJ1MpwdQprIF9WO6x3z1T+v8buKJf
	9jva62KKnS/E7+KuvDXz7dHi/E7jN/7qARzl0CEX2MVNJKVeVjb3hnLnl5ELuG9P+jA==
X-Gm-Gg: AZFdTZfH3Quq0QFAXbZkzvtrqldZ+tcnvxpuA6AR2rnF0mBwSKl9m0LePwf0nq2nmMN
	BlWA9GFuJJ8W1ftFp3Kn3zCiwqF2OiN6oD/gFIUSGnHKHHg+1SPuQoKQJwlQ3IzB0x75Ig5gTqx
	OTHk9OjB5KJWA7EC9J7kXO2lYECXV8sPDubcyT42wPPvDY/WZXGMu+y2i1rghY98two+ynAoqsI
	kQe3+uvMo065HgpdcE7vS5+ZaDlVnn8YPsUDnQTXAMIaFQxLY5fLr0ruLiY9IST8YQ58iFi8H6C
	mau3yBtEleSo5/LgelyLRGQ3RQnShBFgJmBDI/ZlEExhUpuCyhWr9EmJ5RCJHRrPdORPmQ/O6cM
	nq/2yc92kq6fowOpS+ollKt4z+ACmNztQWbPBrkw1Owp+Wi+rA+2ppHe9qiewAR57XVjVk+SXpa
	lcBw==
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827565ad.28.1795413130612;
        Sun, 22 Nov 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827355ad.28.1795413129945;
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm45065075ad.18.2026.11.22.21.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Message-ID: <0c289a75-8625-4b9c-81ce-7714ce9eccc9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:22:04 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
 <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03d48b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ceModZNawzzamKazbfEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: iJ3LIkqX-sr52aAM8rbFLiiZM5jJ9csP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXw3IjuCWmckwr
 qqUpsBaKP+nQq2dKxokkGbtd1sbwC0/vyIK0M6EbILlERz3sVSZ2Oq7G5liRDLrf1wc8og0EBSg
 mPcf7OuOe+wNxdRRUFSYweTLYGhrAHWISu+am2veLjQyvT6XMyqdkiG++LSkFeIEaE36Z+jC1y9
 5ieS18WxOsWtZ/T4CoBFgSzmJg57SZqRHDlMiWwq4wTs0B2oznvLHDDd45y+owfHn3PrMqJuROB
 mgQZuXRqV33rNYXOsKJc0su2bBdOewis2x5hiYlUqxiDBgy0mJpsEjmFe+ep+IcSKl5ifmWL4GZ
 FbJCqrGQo7dqOU3nXE/1JDk5EFjB0VzHLKFlQ8ANWCWVJLJoCOSQGgYyM4cVzEpij+Dc5IUAMRj
 fp16kZFgYmHCsp67BQEgjE9iz7QB6VPI2Vtbila1x6LJ1TImR0mg6orYCmR2gPfkKfxTYG4J2mp
 ZaMX/PaWKLKzLbzaa+A==
X-Proofpoint-GUID: iJ3LIkqX-sr52aAM8rbFLiiZM5jJ9csP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX7xTXLzWZK+lm
 JjJND0ehHnq9eCsz4WW8cEYAxEmHm44jBe88dgq3PEgQ8/KcgbTp0KMH7Q7vzH8mDBLc2lTL4qD
 6W/FlXr2v5A1iOaMgiN6Oj1t11I59rs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 22-11-2026 22:36, Krzysztof Kozlowski wrote:
>> Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
>> CSI2 PHY connection. The matching Glymur driver data maps port@2 to
>> hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
>> yet.
> There is in-tree user - I clearly see camss.c. Your next patch even
> changes that user!
> 
There are no in-tree DTS users, but camss.c is already an in-tree
consumer of the documented ABI. I will drop that wording.

> This is just not correct :/
> 
> Anyway, mark it as fixes and be explicit that you target CURRENT RC. Or
> was this already a released ABI?
The binding entered in the v7.4 cycle and is present in v7.4-rc1/rc2,
but not in v7.3.

I will mark this as a current v7.4-rc fix and add the Fixes tags.

-- 
Regards,
Nihal Kumar Gupta


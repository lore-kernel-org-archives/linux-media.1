Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373811;
	b=uuoCxo1ZSE5vXGD/DnyE8AEpGkjzE6QASLAoRwkx1SLqpMhwQkOvgFEf1iGNZPxVwTRk
	 O8lYx7W4LOl1sX0sWLe90wNWhcVICI9hFAyYM4YVzx9CdInloJNeiBwL7kkyqEIbdnHw6
	 Fhi59jFODkpYhsq19plr+0MLyaiDUQO8wP/nCYN5n3j6h2A+4xo8x7O/zUpzhtwQXBxxv
	 zbIlj5c13eyTlt0q8eQO3qlWexb4+lBeiKO3ixt9xMofQyU0Uj+W4Gg8AgE1FjARgpENz
	 nwtY5LsRFcEff/m7UcaL7yIEssc5GyOBDl9gAIw7QIKFnlhSbszDPlZcz2x3cROQ99w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
	b=Pq8l62Qz2e9fEm524CAOscSJkAH4Oq8SJ3s/RPz4voo7I839zkkU0utvYlxDuyR14hnk
	 mWZ55eLs7xDeJDa0c9a/0s68p6HT5UEAD+2pXabr6D8FrcesrlqDXHbQlY3BFxKHVu0Vj
	 R6Q+a95ainJosJSnVy039ZayvR01ubkUesUVykchH6ACs1bnfKNMG0DihrWxvNWNt3mfV
	 V4z9/lVZHSIbgu0acNk6L/Fv17nnVieG+IXAlqMyo7PYfVvUtT0rFWsJKEORaHs60s/nQ
	 +A7XQauX8+cU40Ajf8x0PBzJwulPUKhbmsnkNxq6I1SAUEOfe/32wCtWXdeaq2fqWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tga9OHiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSQJdwYl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB4606A332
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 18:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBB4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tga9OHiB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSQJdwYl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUwIA2242501
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 18:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=; b=Tga9OHiBWXVl+nTY
	DKDA4ERV8awrNJTU6vWHB+B++4uCOvHAUuQgI5MRr5KNNje/krngRdL5hsw23T3+
	WTZfCAgmbhhZhQ2OOKkc599UnBpVOfoBR/grypJ6mpyAr9lm0Ea3YDbqoMvzUEqY
	6eLlzcMkV5JlrH0zsG0/fBd+kYemQNad5StvmxeEudnOTTkFQMefnlGZ7oAt5t0s
	LbSyVpVnSa1oiYzcyMKczk4dK8ic8enhqU8LroTjxLPrqueEZ6m0ztnL13mH3B3H
	bsMfMuHzKR69zvLOAr5UAgnqO6bWiA3tZ7LF9jzSQjlRedctMjnUeSO9k8045D1N
	34IojA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk3vpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 18:56:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so444367685a.1
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795373809; x=1795978609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
        b=jSQJdwYlo2r+9m3bOyza6XXx0si231V7050R83+Ylkf7R2gFpvpyaEi0CIMNnU6HQC
         42OpdyEgrio9wgNKDbmOEk7LZkMQ4Pek6UdXofSP7tvrqT0+v4s3fLiYrE6T0E71Ya+l
         AUd1C0Be4niaZxkBQBzi46Hg8iq35kU4Qv84xuXvuhNFIuG2HVC6ddZ0hxoehqDoDLdy
         MVl0gdmS1zZnfcKvERONgFTmxvoNbTo3phpAVuvjus1OZ8DHkgj/Q4H11Hk6mpNE02be
         4Yj9Xmu5eAP6FMU1PkDkrEDCCSzEMtoW+wTrDHchyLTasedltbvW3ykbEounxWin3lFj
         4TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373809; x=1795978609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRvN52s7z6Z6ebg/B7u9QoUXaIdsxgVH6C5C+S1jI1c=;
        b=t4Qdis+Q92oF3GZ1mL2ATk9jE90id7rIaoLxJXAwURmChWh/ZfVtrQ+mO4OnMM3uOy
         IAyh2NVGRkFqwPOGczt0BVhnIYBQaBxgjrG8mVnfk9MceKnq4NRO7cO85eEEc50tfFcd
         XmCtbeJANW14Z/zBSdMBo9g3xfZJ4rn4+KV21Y/hli/rdi0I8Lc2A+RLH+zbi/IMdyhw
         rjDzP21pCl8ETzmAc1IYXiEriSJFbDAsC+W4VTTwNbwrJFo3MIQfas7PbgdvyriVBdbb
         ocyvLTjxTu8jwAGTHRZy/c4eqWK/mX8Ho7xDVUkAZdWkcs/tg/aNIhZBU0z+UoxEIcHM
         0TpQ==
X-Forwarded-Encrypted: i=1; AL+hErGRzjXDlEaLUT8bWIroldkCdaLv+ceaFvzmg0Sqj9xPgG3HPJjELsooPa8Wha9JvYr0GMfbkW+tNohBoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z80E4bONtLACyfn2nIODzrsl+oWWBbJd7Xt6kP9vZfHTYy4wkWw
	JNbVCfoDd8ymmVYf+8chkH4iDVyoO04AZlnc1u9UJkOSdEqCxHINi/C6eR7GaSD3NHhNYOX9A33
	E5I5zHbeheFUUYaVExa8zRXwU/8fRsCKtcfpzzdPgTmRHOSb4HOioMayBNzTs5bTtwA==
X-Gm-Gg: AZFdTZeYSD8zn4fQlT8SIOgMNVZVrTe/rYMgjZviT8kvCEzJiShr5JNx5QvzOUEkbdd
	Efvb2WkGUT93Ihyq8S6m7tUhGL0PcO5dQe3dJrbqCclGYnCU00h4Lz5Hp2Fj9/0CjXP4iIC2870
	RRRyZ7vvxseTtDNUZbOpGIImo3Tj/udMSWoa30XK//q5Ob04k924o06lfIx9SzuONZ15SB/8OwF
	EqfbteLN21OG5ah1rxltYP1+oqrOO/FFr6CjERybjjlBDdlId6lcS7/HLl73K+BMVSo8fKPr52D
	FkqrEY8VqvKJ4ukQ+XSr3UV8Gm9aFRWwD9vuVCQQzrouh8fFsYgTdoqcipKgYmPwrIV8LA6KSjS
	KvFlTKHW2lZOOrzMkJTL0ifzSBN74ZEUpydoNwEMMf3ToQzjvy5w+3aKUXMFAhjFOGeCs8YT1Hz
	WfnZ0RabfMBqYT
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr1605107085a.30.1795373809445;
        Sun, 22 Nov 2026 10:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr1605104985a.30.1795373808954;
        Sun, 22 Nov 2026 10:56:48 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm12158751f8f.15.2026.11.22.10.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:56:48 -0800 (PST)
Message-ID: <8e4a9c2e-e92c-4491-8f7a-25f68d468df1@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 20:56:46 +0200
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
 <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
 <20261120220025.56887-1-allan@fatecpompeia.edu.br>
 <20261122002800.41569-1-jesse.casco@gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261122002800.41569-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GsXCpB_7E9SrhuOdDFUJ7ZH9f-jcTVtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX75ATDmzRKxpt
 4Z+hj81T7GS89Xf2hJVM4beRwrgmFrmza3alCUkToLCu7uUQndGaW1MVUyqP/2B1rKXWJrfTgD3
 pUcL7A6zkAY1m64NHZEhdOLb774RFOOX9oTHMHftwDYrAfHw56nRwBZJvCEATCJStDmEdN3BwRo
 gd4hTMo6svdqLWAFIZue8j//gJ1fdPxPuEzfDu23mRVmT6oVBm/gKcSNZgZ7GZvtzfuKnTfOd+e
 oLkTNpVqvBaMwGd5iUrzBc45uo4m1C8Ckx84tbH4cMcmNniTiAoxkdMfUM0KN4yVb+MBxFp9YFv
 4WbNTO5PZsSfvz0P9bpuZh9Vl7toFiHZAGCW5v4j37h97BjN1Z9SBddP5R1cvQcLrpVOZXN/EBE
 WVoqOYmbHkUCktVWN1Ay8qC8yM0Iys2RhbbXZVJYioFLmtAwm0QdAOs7feyEmv2uNGvEniOiv7+
 W7vRIrrE+1/OG9qQGLQ==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b033af2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W52NO4HEYjdIeXn2O88A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX7SvYXPz/ehUc
 rLc/iEkblUDO9zhOOcui7vASq7tF/5Dq5A6x8h7XlUGoIuktRM3WGIQ8uPFtfg0LcnoIheQHN7X
 N0v4SKPrRaQbanich3AQ2lbz9MH5XmY=
X-Proofpoint-GUID: GsXCpB_7E9SrhuOdDFUJ7ZH9f-jcTVtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220075

Hi Jesse,

On 11/22/2026 2:28 AM, Jesse Casco wrote:
> On Fri, Nov 20, 2026 at 07:00:25PM -0300, Allan Siriani wrote:
>> I'll drop it if the parent is resolved from the link as in Jesse's 2/2.
> 
> Hi Allan, Gjorgji, and Loic,
> 
> Allan, my 2/2 mapped CSIDs to VFEs by index, not from the link, so
> MSM8916 CSID1 would still fail. v2 drops CSID2 instead, as Gjorgji
> suggested on 0/2, and leaves vfe_parent_dev_ops_get() alone, so please
> keep your patch.
> 
> Loic, every CSID still links to every lite and full VFE today. I can
> add a patch to v2 that skips links between lite and full blocks, but I
> can only test Glymur. Are they never connected on any of the non-ISPIF
> SoCs?

There is already patch for linking issue as part of multistream support:
https://lore.kernel.org/all/20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com/

However this fix will not be part of new series for stream API. Bryan plan to 
post bugfix for addressing linking for all SoC's. Please wait for that and hold with
linking fixes.

~Gjorgji

> 
> Jesse


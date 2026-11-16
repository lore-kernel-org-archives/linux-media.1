Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832366;
	b=grCxbR2JMpXlZ6CmH6YI/Ujf9bULjWr1d9yKjIIAoIMeDDTopqU6PjIxV9dJw4oW7F4o
	 cZHk8Oo4c3RRRC9RVEn6OmVwyeeVfDpt7T3a/nqAwp5KJ86zPOJLj4gq7U0Wrkj4gegIJ
	 BA7sA33otbTkuSOwuyfK5LS7Bt3pP2gH8HMHIDVmsvY7vRqDfGQZgbUF93uOyYYvHgVhw
	 aC0evWdek249P30CaNm297dvJQ8A7HStuAqXPBXS45q6Ovfpy21PKd2Rd3k6XoMHoql2E
	 mSAFIJuXfPpbo0pqLX9LsYfwhgWkCJdMgqbIJj851xQ7I19XynvaCuw9+nPXH6elrPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
	b=MF9U+bElYdG/XWmJt+4S2it9IQTD6XItg/F3DG2A1RC4Ao6Xlq/pcC2ZEHwgvaqXYKND
	 zeR3DHpxMTf8o7gDjpU4gTRWhfEZrB0OMCcF462u60aurTEyTgwR+plhSGBeNOJp22ZFd
	 y0UH7Ho2YnjEIb/Xr3VPfKF6vh7asD0CywewKQHXHnoa6FKTYRWVa+jLatIjmXDDvna1K
	 k6FX9pSv0GiNht6U344ic51IIpmkiURXs42rn7lWMz5VBSkoLVtrsrxd1USty4PPzXjHA
	 cO8P6PMRI7kHfaOXXC5VJkDIoerT5JcTjmGAETBYWEp6zGKXw5ekhdkFxU5YL8dIQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9425606A33F
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9425606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1FPp1214648
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=; b=RNC3a1rCFItRQEKS
	NsN3B55/yQpgxTY8JmxABTsBARg+jQ+85Hz1JCyNBbPbMUStFxS3vHf+5jwUFZVC
	7RaWHqWeLg40NFhzQFRsI+ZwdsTwVI7g7K6AHST1Odu0BG6JQMJ3sD2VHHm2iAlA
	cZHO78ZBa5WveYkC0yGVzuNsjzg4EPEn3TsdZUe3OTS3hcacvhmhQu54cXy64PPH
	kMxysg98xx/KP2/AFgDEp4ZCvH7+OZvvPDp9JYq7SJv5kp7yRyzYEObaTEGVuTRN
	kmYJOBX+LUqgqJ7QXcZDAjRmZGDu8E8He42maR47VXAq8qXZRE1iUXKPsPiFULIi
	p30IEQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy8gp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99082f450bfso1398192241.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794832364; x=1795437164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=ViQVeOJS3q76jgQ/AIqwaFL3aCc7toq+ZnHN+zMXXOaHNCvcKeOaZD5vPTD5Kbvmd7
         aPwPwdzViMOMZftvlwH9cwU5kIbDL4vpPgEjho5zgZZin1BTq41IH9+IPd9JKU09MDoA
         2YBicTKbQuLYo6H9juXiuYV1C4fcJbS92Q0kPjYBA/rCBKZGr3kTf6exPZtVlKPdZSvD
         xSVNnFh67MeuwNX1rhdhXiUCwS9+bJsUA42J2zCY0OrIsh3BbDGQSMr8Am1t9jxRqvNx
         2POQdsJGhJHul7QcYWbLwjlIAh2k/W/uE6upPk/eaAM2EnCiIuTMd2BtHx+9T3S3fP58
         GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832364; x=1795437164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=DirRuUlWVA++ZIsLw9hm6jVIrHN1iDxvxoWo6VLt62dfqDy3U6r/P3uKSkc6wB0Nlc
         iy8rTHNdbODR39AwW3LxOMsgl2BvpQ+vnOhAy2uvvdIPQ/cgvAu+ZxOUnVUWfqHN54Ob
         1fh+PmuL3R32q8DhrBr2tXnJRyT+v8l1Z93tlsKIvwrOxm8EeBqocyWExlsr3FI/g+DH
         UWbPkVt9bprTo6CX4QAh8MsLO0cMWFssD3UBzyI1//Qqb/+7rptJ7d6KgjjodlQcxMDo
         NrQRSmP8+juAGxw0wwDunNHmAkeXEAbKyT18ehb6aCbZJiC/4DzFfgecKJLHR6Q3z4SO
         aSEg==
X-Forwarded-Encrypted: i=1; AL+hErFQaG/xM4ZHLbHLNKtKMiaJlr6Mrt+yxr/45i9LcnHUtiWtzAEDqmWacwvEAWXf4yxkOe3HDTL5F/cyrg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZCoCJ6EfL2zaus5JGEugwcY8ysz53yt7pqy+MUdSnaAUr/nxH
	21JYbRFC0l6i4Im3vKsHgpUCh54uxSGLJ/G3QXxYstvjSS8WgDEPV+lcMJGTJZaeY6LcLywduTw
	r0f17i8DfEdHwmhAPjGqIMjlWkm83F86av4BJbSy4JMd4W55Z73lJDjpzH0arHp9U3g==
X-Gm-Gg: AYBFou3YFO/Juzwf2x2Bk0WdMbFg/Nb0/B5n40TMwDee3ScIApTEj92kGzn9i3j9NKI
	4C7RguyM7dXOWwhipBQeX1c6m0pD3/U4jN2KbwPqMBQdxnyf3/4c58oz5J4TBcPGm8N4ybywIZH
	SAyJer3wfzUTPSK953hZFa5fOecB7H0LQEC+nojyk+hSeSc0asj83d7U+NLtV9ZDXzFUHMjE25l
	1VBBsC7NL8JakYNDWfvUi7POgChp+oPwqNNGFcLerLK2XuI1c++hUmsODnoQEJBog2G83JGp6iU
	jtfcmfBFOvsJnJN9aDp5RnPRh+JTnXEO4NNkjQN9FyOiu6chiFCxUBxSOlY9361G7mKgytWi9Hi
	yc6mf/fN0NnrM3hy4LOEVP742gKr+NQigjHhx9yGfP0bNaTjDnZCVS1bMbu6TeKzYPpvhc8UPty
	XY
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888656137.14.1794832363823;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888630137.14.1794832363350;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c4f6d8esm6654021137.9.2026.11.16.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:32:41 -0800 (PST)
Message-ID: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:02:34 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
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
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX+REcVQ8eU1if
 ywhN5KMxc9exD0li5Ec61KnT3EidAAH4ZvvalKvwI61wgH2jZm8hxwCM3h4N/jFKDDKmFr/3CMZ
 KHiZPHylQjgCx/j3zGcTTalud59ziCo=
X-Proofpoint-GUID: Kr6WxbNOgDyi9aInfatpusFqG3Y55xs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX42vSN82gJLSF
 AW4A/h0vuLJdjA6qIsG/0W+ViBUmq8RrMb9GO64sK+m5qBsViJx9qqRZg9RuVW3n8hbZTbkWusb
 7JIteKF2z/E1jf53lLfqZ4x+lr/cVa97f80uHGb2GM3rLFkrBEO7H9VE0hOUJmk+FKLcivQn4Qy
 5OX4UepKvkWRtSCMNGHX+zXnbib7VVzqKvNCbrTjKPcywjT20e7hT9z4dztRMdRsy8VXMVkBSQy
 uv7q8FPMbm5/WhAgu9FB0Rh1CrpbnN5rcpbopfuCuf9mn7IHnaez4kXzoUg7p0VzQ99Ic77TetO
 ArLSDRYYtZtU1OPb7kjweVlTm93mVAOeGgvrc+V4c5itU4urTQqMC6TTczwwQf2s39+G0ERAXzo
 MFg5cEIxLXSHHQ9ykK0WU0EY9bGC0tMonuNB/3F841pRjS7avLdhZ/aW4rJ3WYfulYq06qabp4l
 rYsMHhLNl+OFNlJEDng==
X-Proofpoint-ORIG-GUID: Kr6WxbNOgDyi9aInfatpusFqG3Y55xs_
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afaf7ec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=YRl-4mzKpuH306CQ8RIA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160049



On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>> It was not used in-tree yet. 
> That's different question. You added ABI and that ABI could have been
> used. Was the ABI ever correct in the first place?

The documented ABI was not correct: port@3 came from the old X1E80100
resource-table mapping, not from the Glymur CAMSS port layout.

-- 
Regards,
Nihal Kumar Gupta


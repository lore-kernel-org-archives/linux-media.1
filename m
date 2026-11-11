Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386285;
	b=UsCfQxsL5WJlA5j+dxIi4/dMTUxgrNmG6akx2YQJMCfIpu7Fj8ixgfb2J2GOkOSRZF+C
	 E0zy5bvM6qiTD8wCvR8EsCGPibe4JeNCa+Y58Qoah9DUiGby6040hCD3JRHujJAuOslyw
	 MnnHaHy2ICODbHLzJI+3rEKdmpcbsHDcJHE4I7sW9ddOUiHtUo+fNWzyvmqMcqclnaOP4
	 0Qde3SXhSQBlEkVx5c4GDuLh83QI+JWj9pwNqLI5sOqpwrzVjdd3OG6p5ZxwrLqpnOng/
	 c7SjWeGg1Pp/nFPG275hZxMal5of/V3snO49VXRTjqHWGAJDv0SzJ7wv/3NzW0hsnog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
	b=H9qE64EHYfeXEFJsCSzlGOsxhg6TIBxQiMnH2gM/UoOqwL7kpI0/Sekj+OXlKmpmCzDN
	 mS8J1C2SlhQLXdE6cRj+ePCz1CgfqahBrVqTXHM6R35/TGDdSuS08lrkjaBFoi55L7o2L
	 5FTWR9XqZpE+q5MclLg+zt63TwIOMcLMEEAN5KfYIXpFc7m/+KnGXYVB3WoLe2ne3OqMi
	 3CMLcxL1GGG6rLAyqiyWCiVRjvg6eu7xZbgziZBSOSDTOklsVkzv6bH2VGYkTL50CYM64
	 qD4ATJpJjHBGGFwZSmjl7OyFNg28EIZDzCYcKvLtcVex9qMM3gKZYhLqobg1+yK41fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="moXvA8H/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B5606A330
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F0B5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moXvA8H/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KhRt300709
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=; b=moXvA8H/k0DpUIk4
	lY9w/LdPlAq7sEgrI3Bg+iQMIbcqWwsIi7En6h0dWGcJ2wgIUmRWR9DqciOLeb9f
	3E4rtwvhCyBMp4XGLLSAtNQQgZj9MBsMVgXZURvzkD9A4dAfy47xPfP05yMHXc6n
	pNBuZngbFXr9ZgcXlLw6Fr6CPZZKS/2SFXNh+zo6L5foTdkrnTHPN6/DDLFB0yaX
	JGzH7c/jq6gDnFcZUzEg3FESgXR0wJlIt7o/5u19B+TNP4qpuxYtchW/DBiRfuqq
	Hk93+AafEtpisLIAsq9N2Mv1TzsxfCv0NK53xgo4ZCm7m4WfLQh7QJjRslA+kTZe
	UASsEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5kb8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:38:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5035626eec.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386283; x=1794991083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=hreAjHaY4pmPcE5AD6mScQ9iVhTUFHo7SXGwZTLyU1HJ6dZiyppUHo1vxnVheoiTFe
         qCILmTYu1sZYYbEQFPOm58Jt6y46BJ4N+hGrMEbEl2lFzizn8rhzIThi563lUzUqVWMH
         KkXrqBqMC+OcIlTWee/XeP560zYDs9qRjY5qhdbsStZcu/MXBoPL1+INqNbPB1ABJ3mk
         jlShdpbZZzqEN2f0+LrtUf8uhDWg8HbTpBPjldmGeJMic64npgSm2zLXpkIHBquXalmi
         XKxcexmnnQeX1/OWP05ZkOguWj2cBbEe6wr9/s/dSgEdB1+GahOJkM0/Vu3KN2+zYbSW
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386283; x=1794991083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=uM+ded19Sz6pl16+j6kh7Ia+u2G6Pf3w0LoFDHYi2Axu2BB1EcXcxW5TmpEZrqvLsQ
         wO3dcwZRnu6sl//E8v/ldibMed/eaDA+J9bMNTSxa14MGmh97UuzoYOLnPitv6rD87lj
         UIt8FrHBOL5I7A0TU0pMEUoyaQta0ru77oETV9X5aLEa357rOck5DWLTuBVYhMuFbM5b
         Jmjqp9rNShH8CfGADUAdSOOT593VA/54C8baNKGZIgrXyfd6bLPXVCumDjJIve3gZwnF
         73xWC2cmR7uVw/USN2XpF7wOcnF2wykjBmUHMdptXc5k5dyisCgh0bx7ReDs7/OvotWc
         CIwA==
X-Forwarded-Encrypted: i=1; AL+hErG2sczwkHAGoQbAJr4bvX9/1iC8cqarvWwodnTCGwRdZV/Sg88lJUJyL4XRALiFFk6KSVgfDeISzrP8jg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zX4jdLOOlUMZZJ1dEUZslYTqI6Ti/sg+KDVOWuEDekeD1uuUP
	gglL+4gZARb+v9ZNMz2hiznwh1RcFHp9nMgonyWw6BXKrWM3bcuU9w7ITbacPQEFz7hJil79VI8
	Gb6QzPSTgRgdkeiqDZvbEDjmDEfBJfBxGAGdk+C7X2bTOd162zMPhjVpFyJJtlfo9+A==
X-Gm-Gg: AYBFou3tDzQPMZF7/Xff4Bs0KfLOYR3WQkC17BDd3La2l9H1yEBTulNfegjvQiW4PW1
	qzBebtQBLCY1pb5l/aGDlf/FLnxPLjLGJRFDZ8T+I7s6CBBACNd+OD7r34n4j5s+cu1G6D0h6mU
	Z9d1/PVl6Sz8B3Aesd573ERGrmerEzHwf0B+Yl8voVS8lvP3XNjKux31MTtFnmbjsjAQOQ7BplZ
	xcvWAzibdhulSN3nEpHVFpiHi3rBf53ukOrqaTLldOjxeY6AxhhdhlbGuLu4FV5154Dl2zx4siV
	eNRCjUM3L7dqDZbFnyPZcTxjQj1Vh5M/+m7Z3PBPWzu9TARKllSf1J60u0Fz89gVSnALJ3uq72c
	Mjs7EYYfMPP8MooiHgHIwr4mxwX/cdxyDk/a9lLwNA93RBKI3Nm94G3p3xpN5H+pBME21uRtDq/
	TX6Q==
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252075eec.25.1794386282860;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252038eec.25.1794386282338;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14512824eec.7.2026.11.11.00.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:38:01 -0800 (PST)
Message-ID: <f915ffa9-e094-4ee8-84f6-ecac642fea1a@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:07:51 +0530
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
Subject: Re: [PATCH v4 16/25] accel/qda: Add DSP process creation and release
 to the legacy shim
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-16-88f2f24a5f0b@qti.qualcomm.com>
 <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX2Ng8uMDXjZSh
 EACMQ3atuXSjm69C6h/tBubu6Uok9CvJsc6DewwYAJxdi9GQFD3UTcNtoBJTos6Tw82C0AtApdx
 W5NqVnp0l3BNIWsNl+ZctbNN4QMByKenAaEnHJ7KBZefYkHUVi6GSjuZL4oUFSEFBXnH5imG64V
 Op9kVvG+8hmRwUbC1CgvQhmJ5PhYfgkrljwxyBcPjX5dS72I9j55S4WZA/SyBBjNezld2jA3QzD
 9xf3GYmBRQTO7LusUnlLsatzeTpZU5Q9ze5Szu9SX3hW/Y0uiZhoLSGERX0DcQPFd3dBpJFaJ2r
 ABelAka0lRQfgpasIYll40DbL0qA30wXea+KX8+Ab7Bj1puPABatQcyf0LYt4+iQaZW2V1zlyOa
 vmmj7QY+pmy3Ds1yW5rm+ys9GJzdtCRaBNGJJHLc3sqXl/7MuLGlSQoD1RZy3DHmSsWpJ26dyN7
 L/5O8BP8V8n5Pe1+bFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXzSLAsODECgvX
 bmbvV4w+lmHKKXgc9YbIHlMhZjj5//P9O7SrM8NzWRu0H6ut47Rr/0lFuB60y6W1WelAYO6Eqbo
 XCy5DLtxZ+cgEuKp7bp7c7BHtDnl4lU=
X-Proofpoint-ORIG-GUID: gIeZFk8jk46p_x7RMG9m_uLlsCWqPA7i
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af4296b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_9VnGE74eSGUFLHFbeEA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: gIeZFk8jk46p_x7RMG9m_uLlsCWqPA7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:17, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  	snode->sdev = sdev;
>> +	snode->secure = secure;
>>  	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
>>  	snode->miscdev.name = snode->name;
>>  	snode->miscdev.fops = &qda_shim_fops;
>> @@ -293,8 +346,6 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
>>  			  const struct auxiliary_device_id *id)
>>  {
>>  	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
>> -	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
>> -						     "qcom,non-secure-domain");
> 
> You just added these lines two patches earlier.
> 
> You are adding COMPLETELY new driver, so adding completely new code and
> then removing it is confusing. It means you added something which was
> not needed.
I'll restructure this properly.

> 
> 
> Best regards,
> Krzysztof


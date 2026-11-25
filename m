Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596396;
	b=0wHn93djKGp8xIpB9X+tBX1F67ZgLI8Akiuli2hTB6xhfTNgWV9MBSPaPb1P95Dp8BdF
	 9Y43FdHs0EZUf1+DfbYQUoSke5gBbY/TtlPpDEHmdwb0lMXQX1hiNJZanlPBLN8AG8a/j
	 gfHrm8ZCzRrMZZPOieuWU7bXDnVO+ntkdppth66hohAe6+LE5UawzfH72fjTVjO5WKMnx
	 fMcOp/yrb4pEpMigTol5kSpAzJvbivBWBK9zTA2xcOkBI9sVvkeR5BT8KZbMpu3TCbi7M
	 UeE2K1AeLaKXaM1U1JewJQDYqb9gjVaRk8+kGTHXaFCCMoms2OGEBy5g3egBJ4TiFSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
	b=mCv/Mzplb+Ie3PVKQAM7gYcCLeqLbCdFd2z9ZllN57RXdj+PRaZkvI5qQ3grLQKeecCY
	 sC9kiJOKN/MAG1j9Eh2gl9X1n8jXjNC0Im4zBIdVicjkTI3YABPflKSogiTVK4e2jhave
	 8oZNQ+RgR93P/y1mDgzUOI3qN1x85t/f2Lb/TBFPlM0CPtLFCn5FeM/0F1YF3oHGocTpH
	 bfFDUwyrWrjjMoQR+XyoXcHRlR9oFJEyrajGcbqKRUmUghrHk/VozuT++mV21ZqiQSHC/
	 XqqNV5+xEiZNt/6nWrZlEloXX/aXO5QBdLJj8NBUIBeZllnh4RiCY6PcszwQjHeVzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4A2rRQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFYkPXcS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C17606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4A2rRQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFYkPXcS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68fUE3630438
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=; b=D4A2rRQmHNjsn9qZ
	7CGgn+x/QEBQ43ddBcy28LJf53/3XBPIFbXlptTz2TKlwprHiA9KsIuQgmvmGOQo
	uN9t77tMbJdBP+SUtQf1buggw3Me8N18yqTbqxY1WI3uwUcqUJnP2InkWHaL0Vsj
	40tHf8swZu+xtQT17OB4PLI8w87Nhj/yijS6AGTfTVYMPuMHHaicKZWXUskdkmFf
	6h7/KXDRZMXzz+PnEUxIqfoYrS8Cecacium/klrtGvENWGrGlx7cTFvqIHW3C2bC
	03f2FGD3YojsjhTdmwx1vbXrqIHwIR7RWm5TWMIy5f28bdjLBUfc5Ldu6/PQA7TL
	guJWyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804ghy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:46:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so6476043a91.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596394; x=1796201194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
        b=DFYkPXcSpNXNI10LP/9KTWCquzqzBW1RqzLUTGh1/7HxeMxYYe9b5irpzyd5B6nKDs
         icXbJsr6TNHyAoyzNCbdiUicH4jloEyMMNMttxvMhhxCY5ay8vfd/zQf7FirtrN+5yLR
         FS7iyNRnLSl1iZsJS6DFH5Q8K7kIOehwLLnFj+6QJgNK5ekt8MDg7C407JR+5NlIcQLf
         tsch84SO32S006jKgyqkMrWZRVMfS6HQ5UnLsHlGDoE0dNGR5lG38mNUoWndpy9LuPn5
         5EKtol2f+dT5iJOMcxiTZ9ybLc38RLl3kQP9tXzXUgDXZPc/EgjH34PT3vXqs+31nOem
         4N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596394; x=1796201194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
        b=DeWEHcAljsj8I5SN6f4DwD3QwrgQvV40Lmztb6DIRqpE+w9SLMmKa85YiQRUl6oliO
         +9cVjJ4AYf7HzVnXPim7BrYQidnYDZyt4IhwF1DTtr/OsDXPcVLayxEE3jbaaV2kgEab
         wYPfaiZoAMoNnQnW9oi7aOsiO9/oj53q0rg4BsyMpaQfpfvyCi3ku79JVWTQ1v+qlij9
         JOeQX1JYAFYHwoRKwne3Jwbm+6KWoYe2o2t4IB3cKFGVQ7krKT+b/KQlVnRQPN24mJRx
         9o0/63iIHadxz4l6QVpozo8jUySFMacAy14z1mttViGHrZkXbhI6srq2Zn1pAgkuhhPr
         +3kw==
X-Forwarded-Encrypted: i=1; AL+hErHypWNHbTDcpt280s3/9QB/DrsdlbAJFi9j/PPVvM0k9v+nqzA76Ui3IYcjYc7iIgsgP0tlm0e1Hhrx/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jJshO3Vvv6w/OQ+JyYufR5hqw8yPOpQlMQvA1XGGpNu7Owq0X
	Hq0RYyAizvrAbxlIup/z9kBHL6LZJkRQzbtIDJQmlED4yiBXd5Am9/MrS6hlgEIJTDDlRNJkWMZ
	HbUhJZhAdZRfQMriffqP21z3Y7bwwr0M/aDDvGfZGun4HG3trWZjrbu9dR6AVefiO9A==
X-Gm-Gg: AZFdTZc0tqAN4MPvXNwrw35zEH1BhtTkoP7zigC4FBcma6rkimoBwJ8Mjco1tmwrBdz
	FmD6sbEYumkiGHm4omlg9S2jMUUksD6gI5pkVPCn44xC3ifnOVuQTzUFfsL5Bl/pu4fg+5b1vEo
	FOlNI27pxL9CFAONc/cCM7gkjUVxrM7+qLmWr4OBQJFcsGrVKx2/huxxOAaK60+ICBuavgoMxlg
	VqjRB0BGHt+yg1yTJcqfjtP5w6RRLIFPKKGs1UEZ7yszbhYIVmAvr39/2CCHlGGl0v15uSYlB/O
	dYod+njgxw3i/yqwM+6YO3/z7vNpKBWcHSkAYiJF6Pm1qQL2LCE5kiZHHQ0xXM3UMIkDe/k7DqM
	BG13WJFJ0HSJkMqJtd8KfVtsuXQ3tKXjPhgSzjRw9uEfEvqH3P9dscompC3knTVnTKO2pqqXWRp
	zs
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr14881299a91.18.1795596393938;
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr14881261a91.18.1795596393472;
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm13872331a91.0.2026.11.25.00.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
Message-ID: <dfb34991-ceb2-48c8-b1a1-bb6d07a594e4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:16:22 +0530
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
Subject: Re: [PATCH v4 21/25] accel/qda: Add Audio protection domain attach
 and its remote heap
To: Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Jason Gunthorpe <jgg@ziepe.ca>
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
 <20261102-v4-v4-21-88f2f24a5f0b@qti.qualcomm.com>
 <ab387dce-fa47-4fe8-90ea-d0b8013d01a6@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ab387dce-fa47-4fe8-90ea-d0b8013d01a6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX1WZW36mjXfpD
 riUbnCQr4n+5pfkpg119dSIcl/dq3Egq2Eq2TyZ5FPZV0lO2bXO6iwCAJl+WvNjmkwNu8eUqxzM
 TZLRKNrJoMbi55Yk/CB81ZZKOSukdjRU9VQhRgeDHgO8AhFbcyMElnXaknpGmaCPgJWxsR00wKd
 6Y880enjjEV5e5ab5PWC1ymnlhvBGNqMFhHVpOBb5erHmKHCVxeSD5vZytZPfU3mUW+2LN4eS0c
 THk1v2DIki1ut/yMQj8Xpqr5bfTJs7rWyS47vKex7UH4X8437ei+2NbzgeRqZhIma1Vh8ki2D2e
 thh1eXwnFe/i4T4A5+3FYed9DFmZEJqwY2h99mygrtCAZ6lqf+FXhSaKf87Aps+zGS2mz90Q51l
 HTk3KYCtM32nGo/FUOI4eGa3eWkaZgRh9nGcPrqmarFj8Zrf1DRWFJNWZ3yw3BcL5OHmkN99KR6
 Bz5WwUvMH4P8ckOBq8Q==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b06a06a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JiugtRSXLg-Y64xyin8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: h5AGFJRi1x_WmF3DjesdDstt-pG4UjWU
X-Proofpoint-GUID: h5AGFJRi1x_WmF3DjesdDstt-pG4UjWU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX3XDVVd4aB/vx
 unHXfOAokLnkXNk459QxjnfUJkDaW4/6vd7fNLDoa2OhzsVjiSA53cmdBgYcuorSJMWyvajFjAC
 yDiJ7FdM0VA+zUdDOgrW1foy326Lt1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

On 02-11-2026 14:13, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>  struct drm_qda_remote_attach {
>>  	__u32 pd_type;
>> -	__u32 pad;
>> +	__u32 namelen;
>> +	__u64 name;
>>  };
>>
> 
> This is an ABI change in the middle of the series, which isn't
> great even though it is harmless as there are no users that
> would see the initial ABI.
> 
> I'd suggest defining the structure in the final length
> from the start.
> 
>       Arnd
ack, I'll define the final form in the patch that introduces it

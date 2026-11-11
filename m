Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386107;
	b=A090ny5wsbb1iF7vbvGdkKG2CAQwAYVUQbH9uYb7cWUqH6+2qU4/qVeUSvvdMjkyKICY
	 k+50tbZEYNfvGVQkAylh6LCwvPtcjC2D3M24Ra0qsstLKOXgt04W9sf29q0n2sQ9VT7Hs
	 EJkq/wuGvRjXUwNdfg3qFi+NVGwzpUvwoOdJ1ni6Uu61N2eTItzA8QFX3Ab0s/M7fqt+C
	 Gk1jBBhrQvIFHOLRZTBEV1Uj7ynTqek7OKBq4/xAtQbTxZ4Iv+KSgzvf5oaGLUd1eTkvW
	 PGUSe/PAyVMSeRPWLhJMLiRBwMtfyGnWJ6+Vis/IIhKMzsovka6buEoUfwCNZ7Qpe9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
	b=RYjD4gmzcMwgqst4GtC++js13kWTmlUS46/7ZWgrWawgdJ5gh/cN+HHhXdH8K8anuyB1
	 wkpLxMVzw0bBfcqFqHlZLb+Dx41fC6eVkffSKgP0m73+CjQgTxwlpumvT3kvuHWAXxXWJ
	 V4YxTVhrXIsbHx/OJPHl9WjxKQ26QZ3uVqjz8qLhImUCXEexotn16Z3ZeH2o4z7UIZe9/
	 cxGTKUcdyIfzIzchrpxkWQ3scdRJJZPxEiy+yr6mbpC1ka/3bfW66tfloENpm2gKVG8yQ
	 JeyD5MGZi0tmLRF8jTbuJNk7ouxsC/tsXoO2hJb1O+OL5g8jVHlD80ZG0qLpjNugg2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE39606A321
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOVW1590037
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=; b=G3MTb9Y+8weOGt9Y
	0+2hSI46Wr9+Kwaj1870IOXSx1KuhQOGseWxevW0WyhgVw8JBLUG2173hWJj4OEW
	SHDGiOZsFx65l1TAU4ZmhIjNGzBFh68P8mW2IaUPqq4ZA7jdV8tVgdjZwEjw7e6i
	7riyufEhiwVMl2YbnQkGk2peswmp8dJtiOkc2ohko8HhjjZMSwMhSThbEFgvdPxC
	kWJTzxN0DUJ7vwdeerFRkDPPFpayGrBrunj6h30UpPUfay7A6PzJy4NYhC3bubv+
	D8uvY9d2+8itGgJXtEs2+RwMd6H/ZDeQJyPcClfnRuiNelMcSB5K8mnmDZZWIAZ1
	A2vm/A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm8ab6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2560308eec.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386105; x=1794990905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=ZjdZC0l8oV+sMnH0NSJcrkNuJQVoBfua7bNYTbzZwFz2tjDbhIxUrFCBZoixGFzVhp
         /9mFjptd8QeOxNqSc3AyyrzXePt34abTWh0ZdRWDl3V1KwPquP0lLwH+anVIEL+PiUbx
         gyMFVzoMHHFMTBpWqMFplu3Ao7YnWZXiHnb7PUaYqAaOpIyAJQ/bChRkugTeSY/PqqkP
         V/YHVFwKLuE7dJEK3PFLX4MBM6ktzY7Nh6hYXdATr7Py80qv1iBfljQoUWUJKzEzdlT2
         1JTtiSMReW56PgkDo5uAADv777jSmzdQd6kBPcbXI4yIdJeexewW3gzCRVnLnsrSr1sJ
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386105; x=1794990905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=F+e4zxJV07HQVr01AloUgxcPnryHn+H/8qD5pf1LvHBW9T3e8hbzDXGdvjpn/poteU
         LSJkr882uRpjMLfQucXQqSv4VL0xkAqy3ROdgSOez4ArymBHhdX1pf3z4JZcjv8Y8ADV
         vMcDASrvehegAxpXKuUjwtVanF3yGIxxennsw29cTsWc2J0cy56iRFgNHlq7h9hlWb4G
         M5KlbwxzFOHVQQW4+noOlY2K/XlJoFN99vL9rfwLvx6g8grhJ0U+FBohvZ62BbtXKrAo
         1DI4zy/Y1BpuGIVEvk4ppAkNoIkOzcVO1GNLR8vSWPUBnl2zsn6cebjbIwUB3SjxtiHR
         AOew==
X-Forwarded-Encrypted: i=1; AL+hErEcHVP5Lu+TC2zrFsCRkwLXnjzvzsDS+DZz6+TzItegl5ixOQnyxfJfM4N38tO23s9mJnTylut7JvRPzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/I+DCjICfATl69SHyPrWGOHkfkHs4PiPjGfARqzDtTwZi7Ppfy
	02Nxah06H0+BfEJ5oSVGjq0Z6TYbXAKFT7fcFxZURJC6NTPFIP8/S4UyVsRLxnfHv5w+EBSaP+8
	RRjt8dBFrZnFPC5MW5TfaDXsN99fTP1F6PUQOmiNRYtZpeLyiwfDjrih8jmT0yECtBw==
X-Gm-Gg: AYBFou2L6rBsqueqaenaMcFgxXrUse+wN8TSSVlE3eCXd60aVbVMcA7zFHdMDkgABDt
	k4MTSR3sJku6rK7tVVMLAJuqzCKTiMJHDHcUI+ZKSrMGV0RRS1OATR0heEUlW6h8RR/KeiiXop+
	7j2h9UkkYSXTT5E/dJZE285MzZfQaOtAe/P61EiITFc8t3sX7IOUd3TtxjzI84Xt9/6Za3nmnzw
	/OxwBvMiENla/T+1ir4msI/yBIMO4j6NV3f6znt1fyPqBRe/Yee7NO/VHbEkB8romYYbM+z9Ixq
	9saJnrHJafA1WWJJ7LcKPnPu7E6W6yS4yb9uV4bN1pXHoBemqOSZeLeonGUrBF6YGJ0PlqxrBVl
	PQqG+JIvpF/OwpzTxa0O/Zpon009H1qRhDuW0d5NpB/FOiNP/D3GX+u6rlBoOHXde9DiBrju5tI
	qII0A=
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633523eec.10.1794386104849;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633472eec.10.1794386104118;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm21766474eec.22.2026.11.11.00.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:03 -0800 (PST)
Message-ID: <0f24911e-83e6-4de7-9af9-3c1bd3e143d9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:04:52 +0530
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
Subject: Re: [PATCH v4 03/25] accel/qda: Add compute context bank devices
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
 <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
 <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p2isBZCFISHT1JZaFUkSf0T2rqwdsGrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXzJ4qqhZLQTO6
 2246tMuHgDI/Dgo+0F76JHbHGn0eIsCtUpwYfUCdpKwkYQcn5X8G6Njr9V76QE8wlZ8k4ctmGuZ
 MCINhyrHjCzOsk5JbKfOuBAZDXtVx9uEJuIoeL8ePXytNRRPtXIeshy53WzhHxi3tNKFMesxEkS
 L8DQ6GNE8abakZmvnJDgQBudBQKAtfl9689hAyi6Afk2XWFthS1N3BQj7KnkRo2j1P5/pmtI64S
 2UDr/iEyZ/QEscOkSGRk0hZZ7aCn03yk5n56TluhrsvEy/dEveA6tzrTgeNIDED1bKmnsXNugGb
 ZFvVSWRhwUU1gdHeGSRtkRqyhh/RYGR/2JBCyVEGB8MEC3oTtHAL0locHZW3zfRgz0ZLQwxerrI
 KRfd7rCM/wi7mVSr1H2FKybEfS6FlbBAg0Rk25gLezwCpKzdB5ZmwFYaCcP51bwxiLAHakyzlzf
 CRjT5CVKOD5sr+aiqmg==
X-Proofpoint-ORIG-GUID: p2isBZCFISHT1JZaFUkSf0T2rqwdsGrT
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af428b9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_YfdpRd3OS4PFdmd1n4A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX47qZ+xAK5VI4
 sRuQ8Lo2H4sAMu+3r2ZPsKQjlreBoAneWVSBrobkoW09pedExL+YnbIFgukQL6ULKOiA4BUAuFj
 63i6ucK1sYhjjh+wE3fFVrllu645G8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:13, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 6bd977e8d68a..78b5f31974c1 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -5,18 +5,18 @@
>>  #include <linux/rpmsg.h>
>>  #include <drm/drm_print.h>
>>  
>> +#include "qda_cb.h"
>>  #include "qda_drv.h"
>> +#include "qda_soc.h"
>>  
>>  /*
>>   * Both compatibles the binding defines are matched here. The glymur, hawi,
>>   * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> - * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> - * attached as match data by a later patch, once there is something that
>> - * consumes them.
> 
> You just added this in previous commit. Why adding invalid
> documentation, which is immediately removed?
I'll fix this in the next spin.

> 
>> + * compatible and so are matched by that entry.
> 
> 
> 
> Best regards,
> Krzysztof


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502963;
	b=3B3UycBYTfNSE6UN+tT+p7iqLdAdlJZccda7EA/A8cQ1QpMhJAvikxIGvqqODuqtSU6a
	 0k+kgN6/OGPnyY2fEOeL8zfS+R54ujFQ4Gb+9FFT/kk6pZYzk64A05dV/CjigpRM6yTwd
	 +otveDd11MP6WQCDESm8oKUpaWz2iEUdgMZwPp6LiZBpC8d1bQiv+NrDTXSckiWhtnjVc
	 OsQD8xfiVEaFXTDVmIdBtYagwbFrv2/mg0ublvwJGNunpZPKRSaPrFF63QtF7fexkBQ9w
	 odqJAiyCH35sI3V6pAONOh/b43A4e3/RB45jsRWLuE2pdxEwvtF//NT/D7YlEVi06VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zJiogDWBX3OsFfETCkenTdhcT3GLe0HrSMKv1ZHIkZE=;
	b=GVweGWUfAHT8ViVWPkoXEAWJR9uBmYSh47W9tnXV+hsgAw8xsmljxkjucmVKATPo4sKT
	 BGDcHDgtD1LMtybvrwh7HYCtxpZ7tl6E+pDs3+SyVhxA8qzECdv3wMcEp3m5PFtogJztj
	 hbBn23/tFeEGldHx2L3OaaOLDKlekf9aDv/ZgK2g5sXbjYa9fNxoJYBy2DWyYWZYF7hqG
	 7/qLJZX+JsQKYt9ocaA/a16ceENo7i2pxoxAJGwo19sYi0YN8sNYtvhozH/XgHzwdzwJO
	 u88oG3P/gXMnuRwCtly+Wc0xVtQWBYoK/i5jraKe/9K0oB68YJmObLtbof3gtDEeHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LyQjkQoD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVCSsrpg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479CF606A331
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479CF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LyQjkQoD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVCSsrpg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kGB93701759
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJiogDWBX3OsFfETCkenTdhcT3GLe0HrSMKv1ZHIkZE=; b=LyQjkQoDNFL4pbsu
	3PkttE0z8e+UOBZ9VrFQ4cB1AcTJwR8a/DMw9DsRU8jbAKF5tehB4eZUohGy3s4k
	N89DgcJdEFuxYoFX5jcffnGWSdmUt8/Gznjjjd0LujPVvhhxdpEx1Ar9oGqYkNrj
	0vFOeYvHjF44PU77l36A6BregYc+wWCdyLLGaGCOnyxikJYG33l+CSjhrdIhCnUo
	2SdP2RGEqS588h7SM0vBfjib5G22nLzTwnA1u8lp+TW8nw71evAMSku+nbTjwvRf
	5f5JvVtDghGaFH6jflof1Kvnfq8NBS6hp8rp6IIawDbtKgkXkI1NUkT7/1lrqdn/
	XQZ62Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky14jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:49:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869ab689c6so308388eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 22:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502962; x=1796107762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJiogDWBX3OsFfETCkenTdhcT3GLe0HrSMKv1ZHIkZE=;
        b=JVCSsrpg13FPZtd8hCehpzuln+TjjY3CCAOpQ/w7TVFKGRDNaabm8Y3NztBWwSzWPe
         8WZly8fMN7//i+jrh/kPbBxtiV3thsMlbvy0PM5tfJvCcNABdZ6vbgs73uSpSuiv7bDb
         RWJT0W9ZvCq4hONJ80OUUfrVcwvJcxOd15AGtZRmDNxcQ9fuZsumRS84CB1IETmxHQDY
         eAgcOEsinVbabdmsKndDijdozQsjum4PYZ+OjQA5hxLutcQUba3FnUhNOuqlAk6xZQ54
         Drr7s7mXw+SHbFH10nzjXncPfPqk1Hjbi3PDIzQ42x7w0vMCfWls306Aao1PQLcFd/iy
         xe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502962; x=1796107762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJiogDWBX3OsFfETCkenTdhcT3GLe0HrSMKv1ZHIkZE=;
        b=HUBijjaxgJM2CoLh1xC1ELBFMNPxwz6W0o8GpgpvmDhmfAV+ou4yXNmcBTqo6HcHQU
         KuYgp8SBWqXirpQ6cAvBldLenQA9f4gJO6MVBWqgMxuTAWDhBjlCtdnp/oqn5v1CCIz8
         r55kNPaoiWB0McDa5dD/mGIiSeefpr2setEGTcXzovp0anwRPLF2stX949KyMWXNVUXm
         Xy90KyoK4jSE1VKsKkXMmEeO6kRjEMqz/BRpKeSOutsokgEnLZHOdQ/usorBctlogDzE
         FgvLUJDSVliRsET+uIBumWjt+3cvTqSS7FZ17NprcD+SbHyonXJ59UZIgmYHhTbU87j8
         X14g==
X-Gm-Message-State: APuU4Z8OXX0DXUCmP2UcghAj64r/KbIAEqcGKaQF4W3nDlU044/mFJmE
	wYj5P5i6l/HyNBjLPMo9EosLFd79+JOn24TWzSQWPexHFWjOAY2Lq59XjHfJT22JmhZCvuASB9f
	qq47mnsTrTJzuYEMk6nMzvPOC6xCB6JOasg1vsLSO9kxrJuNFuGagZVCiyJgeKidTjlRd3XAd8A
	==
X-Gm-Gg: AZFdTZdVWknCBeHrGd1ChffOMA2ZBfgE5gLfF9ZzPaWtmJWOb8SOC3WBZVXsPAzfEoe
	+kZAQ0cSAzqRbyVlqfq9IK7a1owDGyU5W4K3B1+zO6bM0pm3rYsj4I/FJIIqEpQKINRM/SDBNeM
	Q0MmlTXpu57TUtca0LMb+VpPz+H+z0Vo7KO5aa7+JIDuvSz0y6ufJXrYBJOXbTRnML44WO6AIIS
	dH7KkcmEWLfin3T9MaFfohCP6+qX3pueLJlTTl0n/bjxb+HBBDhe9MZxzzrfnuiSILo4z12tm3K
	fTAirW2NAgf9JCj8TGvmSyjWQOntmIcxJknXik+8BFIPnVWqw9ZMnB28j3KrRpQb+8/Vz08v5Pr
	n7li5vrikKJ7Ho8HC2GCjiDwtQlYA1/2nFvh0PQXQM976i1zHp50/I9noR8/te/61paTAxlUuX9
	A1pOE91gL16A==
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21281220eec.1.1795502961596;
        Mon, 23 Nov 2026 22:49:21 -0800 (PST)
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21281180eec.1.1795502961016;
        Mon, 23 Nov 2026 22:49:21 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm39702049eec.7.2026.11.23.22.49.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:49:20 -0800 (PST)
Message-ID: <70eff4e5-4750-4e02-9987-526bc32381a2@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:49:20 -0800
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
Subject: Re: [PATCH 3/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
To: linux-media@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
 <3fc512e9-c437-494f-b852-204d0d57e005@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <3fc512e9-c437-494f-b852-204d0d57e005@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b053372 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=algVg_i5XjtqeSeM-pwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ifRN4hcorAjfWkx6JPFkIG950XlBLg81
X-Proofpoint-ORIG-GUID: ifRN4hcorAjfWkx6JPFkIG950XlBLg81
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX6rqaIds32SlW
 95LAM0r2VMk3OhBMp6kNyXab2A1nH/tEoTZw/Xc14CefRWBxTkyIRA/A2KQfepMAJxhJ05Kk4bP
 caXzPt8/HXdnTlhKayyr8tq9IpLsXDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXy0/xZRR1jJlm
 83tuTEcIb/qr/wdufUpcQMZPjo0gATaHZ1+ex7rs8ijlv7Efdp8etMVZ1Jm+TPWapfDP6XPTIKO
 6IfQrXQ5XvAwBxFTI/reigBgWMVB8DtVCl+UUI22aAArM3nEn4QR5kalO+aZA6Ur3svqtLwNwWx
 G/gjs/yAYBb24Md7lfUUcUvF2rZj7C+sD3OZoegXBGK5eB8vwjeCJtsyV7rzfPVVUcN5vNh9i/Z
 dmUPUBsGSUAKjAfDhx+dM9+JitVvxIPVNRdykCMueqQF0OR5FCpwEWDY1js+d3J8GR2hgHl9YqG
 wAnu2v28dnpwxsRsrAa05SNAxkT1Wu0dwGfADbBeScOToSW2X2cWn4kE8HLvA4zPF7km2aHTbQy
 i6XGarmmRrmWFLM2XQMvcwJhnBisb51r7R4hNHlGk9FyiHl/OtaEMjraKfe2zAsgRSmSID77I3D
 eovkWg99tG1xCANIkwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026


On 11/17/2026 2:41 AM, Krzysztof Kozlowski wrote:
> On 14/11/2026 04:09, Deepa Guthyappa Madivalara wrote:
>> Add qcom,mahua-iris compatible to initialize the hardware
>> and necessary Mahua platform data describing the needed clock
>> resets and powerdomain tables only for one core, vcodec0.
>> Most of the data is leveraged from Glymur as they are the same
>> Iris variant. Firmware, vpu ops, buffer sizes are the same as for
>> Glymur.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
>>   .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
>>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 34 +++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
>>   7 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 48570da56aa052577e05ead12bd26df090d97454..6c187d25980eabcd1c789b132e2f0bffa62fc805 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>>                iris_platform_glymur.o \
>> +             iris_platform_mahua.o \
>>                iris_platform_vpu2.o \
>>                iris_platform_vpu3x.o \
>>                iris_power.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 1024a2fd75a3ae2b7e194e583b91ec5f16e2773a..817b8a9e2712e7f1e335dbb8600dc033670c5cfa 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -58,6 +58,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
>>   extern const struct iris_firmware_data iris_hfi_gen2_data;
>>   extern const struct iris_firmware_data iris_hfi_milos_data;
>>   
>> +extern const struct iris_platform_data mahua_data;
>>   extern const struct iris_platform_data glymur_data;
>>   extern const struct iris_platform_data milos_data;
> That's random placement, no?
Thought latest was first, updated to alphabetical order in v2
>>   extern const struct iris_platform_data qcs8300_data;
>
> Best regards,
> Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597659;
	b=TRiDL4F8waGiPGkNs6W1Z9vnQ3KfyCsArDv7EFphZUGgvBa1OXiwvYYxBUSuMpd10lm2
	 VgkHn6zGHEBYOmoB6f0kpl/dKq7BAfXO4Tc+PGMaWjaiLvs+tQmc0PIAXgusnwj9Fe486
	 DTvnQBzeb80Y/f4yjjF8H6XGuLFOkskpdjwLqK5LYcUU1/EQFr6UUylwBzk3e8gDfpW2S
	 ayQJHETcQ32F8T+LyiUghqHZAgTcNk1iMZGbJoIQ5LvkqF9fq27eZexdidy5iomBvey7L
	 UGi6RpOAv79eVNssW4RDpHIwnVdAtNVRALIRUuodzm2SaHOZ57BetDFiytnv4RcNk5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
	b=vDxm7UVV06al82kbJUy4tC9xI/yeVR6Sls9cCZvdI3jCnuLVc1ePC0IuffaIc7l32Hca
	 bJsSLzTsx9D1pQkKDH5xEUs5tkbRW+E7j7X/AgkYtKDmmHARlMmf6GKbDctEf8JkStL0Q
	 UJZKuB8mBIiNND20nQXhc4patXaRLnMq9Dx4RtxBaGed8n97p4vn99oUSeoARv7RsoWES
	 awlATy6dGx/J61EzDRvGZSXIlSPI0Mp4WuvshhV5lEjsm+Jl/gRw3zVhJk1RYZkmG8Bbm
	 7spflLX/QNL6575947MjHIA1qCrw2638i06GlgnDjOjwnjbhe3H5W7oJ7JlZpbIHDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YyTBII+p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43BA606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YyTBII+p
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68jZA057309
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=; b=fNVD3cgM34B4gPxT
	E1UqbEwqyXMf9dZr+DGGozrZkWlcFONDD6cGM2JkGYqO9/bN3M64ZdxQ0+BARvyj
	XoczQLcRZRSqn+nGcdiYOg/KuvnLOs/A5sYUb5EN1z7a510KT60lCbOn7GoXZcTM
	TaNhZuaFdGpMdGaAXxaCim3lSN79hRU2/5mecKERJQ6sCXxl1ROK55hVV2D+g2ca
	qIQ/nu6tJB2cDnftA/Soz6CN4mibqYo27PkPA0wjIv1AjWioQwjQrjfMzunBsTlm
	nSnrfn2azHJTxjYXLnhEbnacrUKG41A0lu9e/jLl/Lm0m/Tb9I5vEK9//y48285x
	IVAu6w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfarar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:07:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so4402152a12.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597657; x=1796202457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=YyTBII+p0pxmV+/GwCWcs2yyQLlYhOdPenI8+rFrYBfvcTUv8dycBQs8gZH2SlnLxu
         RPE433nlYoZPRprbz9+O5dSLsmy9E0QijYq+efV3AzCFsd8Psq91a1y58Hn7FWG2F704
         bAAngZkcOQtdXhClp7zqdw3sraVANaU6SlsGe11aR7Lg0JyfMxDnNZRFW5vuGr1/MaZV
         RXKPrrF71hNr1JhM0wZNeaz5UVs3Atiw4VAh427wrnmNYQOU6WRKxIxipv0oN32937bR
         Y1h3oH/1M4AKyVbKOtlAm8waMgXLfSBzb/EgKJv+9jMueHJg5nZ8DqSniuhDHP2/wvEJ
         JXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597657; x=1796202457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=xlsf8F4LZ1x/C4y0fCXczzFfUkz4h6hhuSkH87rzCzFd9GiLNADv5yYb4CW5ctOtst
         575Glc42AYFYg5+mKw5SQ3cTtB6+i7CPWNCgadjlJIiOGWhxmeNDCvVMg6v3c9ZMyMHD
         DT3HTFj+4vmD66djSH00z7HctYQhs71s34wHM3e4+UVhCdnfFWaJDh6OvZS69/6uw2dK
         0NNfXbEfwKRrQF7C0SEnI/+ap6p3vVQpn4gi7yVHgXXOVABDyn786SOnMoWpXQhUibX1
         sVEexpgK9y+/pzTHzcxSJ4KHtztrUdl547/I2QLiY5F2bKQOP6jPfgCIpyQqV0ZtsZXB
         gYig==
X-Forwarded-Encrypted: i=1; AL+hErEfzFCj3WUy02oD/tbkvbuWzgUuMuy+AeTX4qr2bxqvCdynZbEAYDtvxbOnAAPFCpvyslAcEW0ehNxdxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CzCfGcYdma6PJ6W6ieCVy7rW0jahC+Gnj4GYgIqt2a0wSHWiv
	WBGUbtRfvCJya6kACFS3Zw8/vWqio77HpOKd9/2q+ZfsfKBtDqlT1u0zcRSa6yFL0Fr25Vloz7W
	FTDi3I6WTmn1YRTXzehHVZ0WqLFNdXKklSFAHGCklVcW9JOdn8nsdnq0ytGgfWcL/Jg==
X-Gm-Gg: AZFdTZdCa2e1c+53lJU0sYwjLTYkyXNNPrQ1p87rokTx49RYjmsSJ9NfY1TBtY6Lcvg
	UaSGpKOn99PXBFKawfUo/LTfxgFodpI0CG8R5cLxs+GMotpZUYXKrXg/A067hvHPoi2gaRJjwta
	SnWq1YOUvuj/FnhfT5wyqNAuEOQiy2W0Btjz/ni3og9Ae5v7Lv7HKCgnxPKUHqDwwNudNsk9llD
	d7kM2CE4ddNrewz4zi/2TXbsIBPCic0RkQdeD6E3NuOD5O5UDAvzz+cXri6100Na/XsYxVZsh9s
	qfB3PhU0x1+QkvkI//sjQi3GrLxUrgbHn2jn8dCMoxKrs9FyfsQyO+PZKesca52SZcOtqCnM3lM
	rPGOVUmF0+whjdluexIhDCDlHWAdIFZ7vHqZh4fXAZh+pwEcRGrSBFOxm+rucUJfGSEDn0LBCdS
	kd
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256429a91.67.1795597656611;
        Wed, 25 Nov 2026 01:07:36 -0800 (PST)
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256260a91.67.1795597651179;
        Wed, 25 Nov 2026 01:07:31 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25769550a91.7.2026.11.25.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:07:30 -0800 (PST)
Message-ID: <42920cf2-1587-47a9-a53d-d604bfb22b76@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:37:19 +0530
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
Subject: Re: [PATCH v4 23/25] accel/qda: Add DSP capability query
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
 <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
 <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX2X2zUuJX9KMG
 045Wmp4gu+okGvTMvCM2rBAwh3I5wHtkhaRpA4EeOrrEN+fOCq/lHgMHg1+1lzcCJ3W0r/VOOrO
 XQwBrBB2WgV4nHvCcIttScY1o7c7xW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX8rtK/RuEnLvW
 SjjIRY2xJL3xt3ZwE0gYblvDtnOYN3sNtien/JYoYJSgjq+CVrhFhL+1u8xRSH/Losw/BZOlmvx
 dze8dx/CYY8sRFpcdV1Wy64NeSDHtKrNVXEXIqv4ljxj3AvnkBhz3pqPsXWaWX/SPCYk835BbM4
 K6Ftc1GOYU7aJmNgMGQpewui8XdyDMPcsX32E0N26fdD+goQg47064U5YKt0umE7U/xialCC3dT
 l4FD+Z1LCG/LfZQXv9sFrXi98Ifv8eugjXXKv4BbWjSkcp4FnEjZ19HFGOU+5jbeMGrSXKJLwOT
 EeLzCwGFZyyFgUp/8UDzogw5D5mClEtYDZIfQKcv/mkkYd833f8ZDnfx56IuC6VohDd5yzWHqcs
 7PY6xCtx5x4aQfCLAaiTPEOnvb6hNUBGY9ZRoTzI+coiz8yjGtHWFD15VkzO8E7jBvacaC8djka
 wTD/Y9ZqLLcFL0y2VBA==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b06a559 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Uvs7DDoz1aZytBm4-AQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Rvq7TEZrTI20f6bN3l5VdpxyjPLZm46k
X-Proofpoint-ORIG-GUID: Rvq7TEZrTI20f6bN3l5VdpxyjPLZm46k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250036

On 02-11-2026 14:16, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>   *
>>   * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> - * based on @query_type.
>> + * based on @query_type. @dsp_name and @cap share storage, as only one query
>> + * is made per call.
>>   */
>>  struct drm_qda_query {
>>  	__u32 query_type;
>> -	__u8 dsp_name[16];
>> +	union {
>> +		__u8 dsp_name[16];
>> +		struct {
>> +			__u32 attribute_id;
>> +			__u32 capability;
>> +		} cap;
>> +	};
>>  };
> 
> I think it would be better to make this separate ioctl commands
> instead of a multiplexer for each thing you query. ioctl numbers
> are cheap, but complexity is not.
> 
>     Arnd
Apologies for the delay in responding.

I'd prefer to keep a single query ioctl, and likewise a single
SET_OPTION ioctl, for these reasons:

1. Precedent:
A selector-based query ioctl is the established DRM/accel pattern, e.g.
DRM_IOCTL_AMDGPU_INFO, DRM_IOCTL_AMDXDNA_GET_INFO,
DRM_IOCTL_IVPU_GET_PARAM and DRM_IOCTL_PANFROST_GET_PARAM.

2. Extensibility:
More queries and options are expected. With one ioctl, each is just a
new selector value. Separate ioctls would mean a new ioctl number, uapi
struct and shim mapping for every small addition.

3. Safe evolution:
Unknown selectors return -EINVAL, so userspace can detect an older
kernel and fall back. I'll also keep the struct size fixed (padded
union) so adding a type never changes the ABI.

To address the complexity concern, v5 will document each query type's
payload in the uapi header, and fields unused by a type must be zero.

Thanks,
Ekansh

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291111;
	b=rPo8N1k2zLmOPw5pu7nLXtJrrHS8Iv21FGFu4HhhB/Bel4dObWY16vBPqc3A304ZfHML
	 JmGE0KQFH5xYuWorQ7wzUIjpdUFE6gg0/eXC3RfXqqsQmny+ta2+IYJbbfgSPLmbK/zvg
	 nS6A4HM1ZK/emjZaTUD6w8oo0lO8F/7SEo4VdE/jgt+wr+3EM8VDv8VX8eWOrEYfh4WqD
	 SqvBYXQidx1y5b/8IBHHBoC6Xhn409OWxnlSSIu8WHrP8+3Lqf/iE+sa/Dm1oDnJC4HnI
	 DAy18R4kw569AmjIZfuEXNLv2GU7KMbX0Cyta7QbmYGPOScaDyWWMBIbEJsRnWapKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
	b=LpC3S1jGZ2qPfMSgIhP65W4MrQF9BuhoOe7xLHktJWevtQNJ0czcKhV1PCVM5p+rld8w
	 Snxok5cZWNaoaGW7Gs473YNa+w0Gx0+IE51oqjKCYBsg/AbzJDcHYfRA0RIJbLuZCEnj0
	 VWexSGGiGQizfxJOPxjfLqB/K1N1I7I8ETteTSuUwTazIqZ/RBkZxDFVLHcDnXl0NZMIy
	 LL/wWwia/+Vq7dJ5+VGd43uFwF9iKRqjLfg4XJhb4k4tSBF8x1GIcdJFASGElRfZdE959
	 z2W6YMuLeElrlz+ruOhkGfPp3hnpkwFnWK9IALu0PT7LZwffLy/2mx/53LnhTiIGjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RRG/BEGD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C8606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsZMex3M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RRG/BEGD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGF4Ed053039
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=; b=SsZMex3Mdtdel1lm
	rp7ABocgH78LHOS6rFNUdjwO8e0GHQbap18dU8eE1iWCTTyNNUUZpceerclrFupD
	UnVz5Er4GHVCg1xMWaK9RvUJYpXxcgVXErPqnV30Sh6w0YJwRKX96tx3AnmttYJL
	vai1q7sOz0ak4J57dq4yj4N/ifyAJNAmUThENFlnh0XNaTVVPXAWGW36S6U7CjnX
	ZdjoFhJY4IPiYqyS1wQlky1tSqIuDBMfzaW5FQI54S7Y/AH5w9RM0RXSyzTF4nwV
	y7kRJ2QNqbo1Juwl4PMkvIDFnYE80USRoZYGg4kh+dI8eB9FljFYI0L0YSYImsA8
	hTSJzQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nc13c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:25:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc23a549a9so1821202137.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291109; x=1793895909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=RRG/BEGDdeGvb5XVgKca3oIreRlRwTNqw1U75TuMyjEudtz2Nx+6f1qV3ccIRIjFQy
         HBNFB3Qc6YalX+TPnm2X8uVhwjxTOS4Dcrwq6VvtnAg+Ydg9m8I7HxluwCrwmraEGE6m
         ltAjWeb2nZzQA7eYitlY13OCMmeVynaGPnObBcIVaH8OaRwRcaomRq8oZ57W+Z5a0VNp
         E3n4OgpoqqBoqMvybeGC3Vf2ld3PpynWMNgu05la22UT52UDXQCazcPS33Lpy1VLWp11
         pzqs1/o5pfVc1sLsz2qyKNZth895Qvl74oJ++RAyoHySI2QSoao/xfOXqsfDgAdIxWJe
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291109; x=1793895909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHUU4GUOeN2ghgJK2ElUJumx5e8totePhzb+UTaIVko=;
        b=D9M3qjEIH+mKvwR4Es4c93stPCRoD2tCOXhWLvJY8WtZbrNubDUg137f1yjkiSTqtk
         DM3LqiN9KtbWoMLVPbpTaUcOMBTy2CUHe+aok6jVTVYqr+8gbgNzVlKHOqPvVMMMnq2x
         ptq4OEqDtyJ9GiPeG4cnkJNFjr49wha7ei0Z9esGmceHX3O1zU8l09KeP9dbNWGNnXuK
         hW8Fh6q3D/O1FFz3ak6WWWwPC2nUb4jfmofzhLC7U00APISgVs31ij8KhZVG7jA8wvEJ
         W2a6y6PlrwoTqLfvY4xLUX90QD/2TdalnixkSdd+DOKo7+10OBksWtCkekNfP235feIw
         F0fg==
X-Forwarded-Encrypted: i=1; AKwUvBzCu+q5p/fPCmJuWhkh9LF1MHykjjZ83fiQjhMYaxpHblNrxjW/d/cZCwk1DGX+jM5pWtY6omLeZ/oihA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+w0hx52uJHaarF1qG5AiHjhlaxDx5w1O2EWdyg6wShevUICfD
	5lz9oei8FUx/abgiW1RrN1tBWBadbN5Ej9wN46xjUS0zXWWOXrhJSh5qiKpqfk++yMNiWyrp5b7
	lEzBwMocZ0OqKc9VWwoVWRWpL850exRz4Q4pNh92NEcuaF3GJOZfF5oUgpH3XlyuzWQ==
X-Gm-Gg: AYBFou11aQxFq3e9aB9sOoNP+GL3cUgEu7FINrnDxBTXrIHo0I5EpYZkbUwVDwEwwrX
	shw8ixVsQTYtEUVqGyLQ7U8y31lJmHHqn49EYrh+i+LXoo5GxY9WtXnR6+o/9z8v07hIN6crDKq
	0JTmkNHP1AmnUCPk6EYRIexAT6/Pv5kub3wumesNwkgrnUUS3GRFwZIau3+wUa9mBWtXyC89hy9
	I5pJH3/873q9+1HqfBMchmXT0sqsJKzLiA8yK7kefLABTbVDgRdefIyQN/3cVdB+u/jRSnTDSTy
	ZSXdpk4me/KMBmyQxNCoDupQRZohTLW+E88IgS5cnBQg9g258DbGG3cZ15e9xXI+Eod46pfeK10
	+ROjyZMKIxrXm+hRcm+aCfVHVnA0YEToQjLD6NkmfOD+FiVg9RrFf6oNqkO3kcoJDSznBSprekD
	AFcSpYJyHrPvVf
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095925137.9.1793291108717;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d03a417ec3mr3095908137.9.1793291108222;
        Thu, 29 Oct 2026 09:25:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df9625bsm163829f8f.26.2026.10.29.09.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:25:07 -0700 (PDT)
Message-ID: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 18:25:05 +0200
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NkbbPwzjR_SpXxSVizwenQsSuH95l2vO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX8O4PHjypsSQE
 U9wXiTjKUEPF4E4XWTaqSaiAEtMu07La2Mqm08aINwgO2bfiSCFnh70yaqDEBNMw4iR6Ddrx6cN
 aKQXULgfPBX9u8rFZYPus8aa2k2JDYZQpadDGynhIouDTP1Pwqmb8mV5LFDJKfnNoxzAwKsgXCZ
 TGJflmc9pxrJBL82stAgSLd6wDJ+y8CUYOGQYP3cVwVAWy6F4GuZUwENoShOkl7M58Wmjy/qImW
 JD8jHVRnhFM/rME7+Qq7+EiYI7VVVRHIaAFGbNN2u6RMrTr9QCtAfWUc8Gl86XKFwU4pgX/ZnWH
 Ih1t3eZZSFtoZYwEjTXNc2lqI/4gx35R7eu5xJyEe/fiumtSkGZJLaEE5Sg+30s4gZ9DvzlLONx
 6a2MYhs1B21gcE0AQujg9x55CsbWqCZa8fEekZIlwCLw9l1IiRtRIrGbCHiayvcIkkUNhhGjf4F
 NocfcWbk0qTZpsLO6xA==
X-Proofpoint-GUID: NkbbPwzjR_SpXxSVizwenQsSuH95l2vO
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae37365 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9i6KQpN3WAVTwM4Z1z4A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX/v6fRTFzVThv
 EXSaa/3dNAr/igL2WRz/sTmjHoWuBvV4cGV27eCh9ToAXbjpoU+lifVXuVDn8TXUiVJ/u6w97T3
 NzWrSqLGJFjHkktdOsjKYKKNzPpslQk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064



On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> On 29/10/2026 15:46, Loic Poulain wrote:
>>> Is this something that should also be tied to frame_sync_en?
>>>
>>> Also, just thinking out loud, are there cases where we'd want to
>>> toggle this dynamically at runtime based on any V4L2 configuration or
>>> pipeline path? For example, should it be enabled for the pixel path
>>> but disabled for RDI?
>> Obviously, if userspace subscribes to the related framesync event, we
>> should enable it regardless.
> 
> That's the behaviour already :)
> 
> Again though we want SOF so that we can drive seqno which really 
> _should_ come from the CSID signal not from buf_done() *

My opinion is if userspace does not need on SOF events, the buffer
sequence may not be  important. However, for use cases that require
bundling and matching frames from different outputs such as DOL,
it makes sense to tag them with the same sequence number.

Therefore, if this feature is enabled/disabled if userspace
subscribes to the frame sync event, this behavior should be clearly
documented.

~Gjorgji

> 
> ---
> bod


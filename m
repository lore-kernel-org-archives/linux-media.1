Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038526;
	b=r+Yix5huKb2Pfzk1PRv1ttcls027zt8K1faBfRxW7fSEcdWNO3Fm98vju19wNwa5/Ee2
	 C4F8AtHLySz5z4Z5VttH5fFIHIWK8tfdWE+2pDuXi58FrjkfDi+5BxObc2R3u45Iggohv
	 3fqae/gKAxCyN0tueeh2evHJlASLOsAV8wGf86OzkpDQ1nsnDrRkV6+uyJXAAEvOD0xTw
	 Kcf6fAARdtEmti5QeLyPwJiuBzjt8QS7f5NgtozjbbA8H8T890S+NAJ47olY0olpZMziH
	 RHccaLeDCfWlGJCV36q3GhtmRe0tABIoNmmmCInwDjykbtdv0O1saPDScF41cJlZlUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
	b=wovG7fV6VvMCORXLqMQp7vmgo+zWm12rbyo9u07D0nBXrdwyQF6RIbOQ0Al2HZMXeEaf
	 e9YIfzH6EFZ87HgCnGxgh8xDY39Z13oDSG2deCbxiLShgzGvnwWmZq4vW3Sys1oUO/JWA
	 5wz6vqqovejPmaq+lIR9Imy6+7DIvGyln6mT/9XoN0iEwLJVTAEZJwfyqQGbmELwbJJpf
	 DFFVF8g2cz8mX6lWQ5Ij8PYEIe3mGSJowMb+PXLDw0u5bYKr5RRvHtSj5HKexWEGKTWLA
	 cB1gFL9PVQY28XHZmIByFDJTsKcZi1DpDsIpKRtusUrITLmCeQlv0VbNWbyvoBAnGLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hPaVEk/+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC837606A32C
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC837606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A235TU8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hPaVEk/+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvxcl2707789
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=; b=A235TU8wtxM5RILd
	h42gaibcHoYge2tpQw2jJ/bgLJagAFeCWSRcvGwgKm1OUpFtr6BzHUpNTHS4+OpA
	I//hJvjRcAvAoE6yvOhDq7FikBAPRwy+MitJJhGIE0nk3y9vVbTOCi4U+8a+Zpvm
	Khhrj00Fy11josRZ++NOgXGeLP5armkjlHIJ0cE0IiZJx4HS8/lh8C/Et+DpZEJS
	stp8WIhiBg6jCCxNEdXfhoYyiexjHAzYxcjEhmrfENVFYmx3q/Ty3/HVgo4eeTh1
	3cykqjXB/APH6WmG4TFimNUwOGd/fP8zqWxH/FXNg2e4L3CNFPCxa04w1hIcwkA7
	RzoZUA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u6251r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:15:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso626420c88.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793038524; x=1793643324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=hPaVEk/+qt+a9bVaNa7MIhtHWiga9VpWywnxsTCljT2sg9PZq/krqK36vxTq8eyZXe
         7uiBOgog/LeKIOvRmB1BVU7Be/lah1fRn9i9hjaKhKdJVLoCVsqChD5f/+l7LFn3lLG/
         Lk9Rs5mIfkemVRVcJ7uZc9SNK7Zr675JMg/IYjZXJz1YjfI9KjvAU2iXhE+LMfxXUdf2
         cgALs/hvOgm0bS73m9mMqPlwdv2zk2zOtTL/Hf8J3BS8QVVQlGcQMZSMq0vSnt9id5Cs
         ZA4mwiiBLsBlludesm86qTM2M3XXxV/bpvH/Pmehi76FV6udwVP5lyRz/3vcc1KtHbh5
         EY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038524; x=1793643324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzxC/mlDfiFU5gNlalakyp7W3bN2uLkMFf4OmwpYJoI=;
        b=vl7PB5tmaDwlER/K24AvskbQqeTeRe2J0ykJkcac+9LsyBA5i7yjdaeFFkzMD+X8TZ
         +Am7HK5KhORLd2HZWcu9EIbJaN53ZVAbKBVJasIBMBsxjDV3H1Px4ycMbu9SkzFPTvsQ
         KkjiLK+3D/9Zr+lLbdSBEW8K3Znuf6ADjGYwAoLdhrk/Yh/pPl39gqZJZPtitq79Vwv1
         87v3gribRsbGYOALwLks9rkrQbjMSd8GDClOJvmiH7YFbRjW82Znl5Ug5Lc5FYA3ZYUt
         o7+WW5bNIS4MSdfcjel5fXwD9f0Jf4rJQ+YWbOh9WsWi4yDY2g+Jul9c4QoWmiQQyqh1
         UUgg==
X-Gm-Message-State: AFq9FYKzw9LFfmsDyh4I3R8gAjDdhLp49LpG/B1blt0n08UGszMUDKOO
	TcNaxFu/oexkAJ+FDevkZ3b9GimpME/8KNYZFDeGUcZYpRe0YDq9Y++VHS4G7U5tqU12ojvIWZB
	C1WQyVI6G10ymtwNAzYrJCiMF3ygqwT8L5rU1g955kOT8m4MI7j2H7VWLcqu6R/RavQ==
X-Gm-Gg: AYBFou3hj/KqTy/y4flH3O6PfTAGPxo5WSm5PcNAix483tbkw2J0c5OfsbRN1jyfaN2
	lNH/WflIqcEw29GHvDIZaaPgdQmekCJjKFx4oe6T1JrM2Zu5UdScrujE3OEcdv6blj6qXyQ/uMs
	CLCF9R0NjfGxhJ2VHeY3t4pXgF8Nga3emfF1L/L9XjkEga5JFhJSLRr4lcNI5UVJhy2DC1tswSd
	4S9pHBviHm6uhtMfLVY7Iq4am2iBc8yMWGcxb8UUo42e1zvANn7h7aLK3GdzNEvZN691Nr13hCp
	C3x5d0w+KGUAZlH9vWIN+LgexQqJO1ri49oXl8aPHv2DVxuoxmBEQoQ0i4h7YA0MPEocEDlw2es
	UoNIihYCkOhm9+vWEV94PGm1hUtT8nnlB
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782930c88.1.1793038524363;
        Mon, 26 Oct 2026 11:15:24 -0700 (PDT)
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr9782902c88.1.1793038523606;
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm29204742c88.9.2026.10.26.11.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:15:23 -0700 (PDT)
Message-ID: <91fa12ce-93ec-4a39-b0e2-ed5e79e03ccc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 23:45:17 +0530
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
Subject: Re: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uytnjJHPup70yNX2Dyj-4fYZz5OIxOlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfXwK9sB/nN/bkL
 5CtEiepDVHD0rnyvY3An7J1edT6vUxS7hE5eODrZUnZRupGFV3wcbB1hdFVU+0uXcqUnrlRTnOR
 im8TSFRlSHT5DvZdZhSpV5Ndm+zMh26N7nxr1+faW8z+tagB6BvBra1pzY7AslCY9xBvaQEva6Z
 MBJV/vRnrSBUzM77IDS0ryJEcfZbs1kQdM1u03dFNuiuDvvO7zouVkqHwKsVplSp/BMZ8vLO4Y2
 EV6VNoG2cgkiMmPOXPkTgiJ0S/eHQaOKoskXX9FfLkBoHGs1QlPTzWhF9AgeTFRXgoe3JpS8ZMr
 K1RLQOBe2rDxwApRFAsrLT96li3ExUPSaywBnNOXcvRBX5+HIk7/2gQf8tuHWQIYPTugRDFKPxr
 uyWLbqEXubbkeuqNGm7JVwrbx09op5JH2THxaETpc69npNdIu/av6EYMH2kzxObXejxk2uL5OjU
 8iZFKSeg3YOjjP87wWQ==
X-Proofpoint-ORIG-GUID: uytnjJHPup70yNX2Dyj-4fYZz5OIxOlB
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf98bd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=H7Zjl3+OYEgA4r5vDjEDjA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m_4LuSJA5yVraRB4MqYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3MiBTYWx0ZWRfX6tctedTiX7xy
 P5gnwyPld6Zd3dGq/Zjpek4nTs1OTJhqJfyLApfb1S4a6kRIZk3lpmBR1CSW/KjOqwGwQKSwj/x
 XoS/1MMussg804rkgOFAev09kL2S05Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260072


On 10/23/2026 8:46 AM, Gourav Kumar wrote:
> The Gen2 AR50LT encoder capability table advertises only the RANDOM
> intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
> exposes a single menu entry and userspace cannot select CYCLIC.
> 
> Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
> that userspace can choose between the two intra refresh types. RANDOM
> remains the default, so existing behaviour is unchanged.
> 
> Signed-off-by: Gourav Kumar<gourav.kumar@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


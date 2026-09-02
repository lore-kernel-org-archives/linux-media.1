Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F023E25B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339445; cv=none; b=mjB5Hs93hDJfD5qmkn3Y+5sgC6054oUDtjT/ixHhZCorMm4vcTCFH+ioQu7Yh9tKl45OB5FnZ4oJIkROpypEpCCF6h8WK5INqgcjaaIm2gAxgUKr6OGbGp5KjGb+X/Rzvggrx3z47J6kVE822KAED4CZ8MG6s6o2B9shMf43wFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339445; c=relaxed/simple;
	bh=y+mJO+b+vyKXbk+mtczFnjdFHd1eTDSIlsF6E1v/WTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZ1gejaHjE1MzbP5pToOC3pPNbpQJJRSHjawllT9/68oO+ArSG3r1YQ9SD7H9cznP/gNh372UkTAdZ+iLolzOOyXZwZPWDjwja7ZQLRJ56JU3uBlcLwO2iC2DcmmRf3Kw6PxIRczon/3/OdGdHUUQxbTpznqv9AJDtiXIUK57ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihdlTz5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp5nwn8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihdlTz5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp5nwn8Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vkdc3758947
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 08:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=; b=ihdlTz5EjrmSKiCb
	ySKgOO3kepGb3YMjx7/N+Eoh+ebbW+oZQpZc7uLqr4gqgou2tIybTWQnakSpnA5j
	ZH6IcEaGlgt0bpzLcKc42qMzyEEJKb/a4r30a9+Wup24PQERU4UzLqxrCfV4F7Nk
	3ME9C+Fi1lNCYa0OChWF0LE6U14aizRkj9uX/BCaPY8JrH0iJ/X2+6gSXE2onfvT
	uYEx1gTi0hbJN/87Al4Hs5B1O3HIArBO6B6jK3U/vvQWlMi5sr2Jxu0fGJb5UBck
	pgPAVmhw6slgUE1rlRSvHIVZLn2z8nz+ErmVpClK0qKu3o8aFOjffiY9SL7dYzPj
	3VkFeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck0t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 08:57:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so24806985a.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339442; x=1788944242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=Xp5nwn8Y1PPBKD9NXkrpy3nkcT/YzNFdErENoWn4IPVLSuQz0kC030yyosqCog2X7o
         r/a18eOg/yWlyj0fn+tlgCBzwFkKmcDku8xcJ24YT6XvH1fRBxVD+b471lPfT4LiUpnr
         M+qTFjU/2h76zld15pOa7gHjt/cwTZiP0f+2Sf+EBbHjNMVbZRujqkZ0Z3+TFoKam0ac
         Z43NW5LsDUQ748IsM19jsb7CiivxgqlAn4+LwTOphLTxL9rss5Aw64ZQLO6KOpm/Tagi
         K2TkleAISgDofA1ukJ6XcXzq76V0UJO2Tdv2xXBh3lcG7IwoYE27OQvdaJGRsOM5SgWb
         KHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339442; x=1788944242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=cilZ3l8JuwWF0q0ceX7wYjrN3mtY0zlkObQ41yaUjBQ23NSwCMqOXQc2bYD0W5jTDq
         POGmeYgRCOaNm2o4/hWibZVbD63zypd6HDW12zbPKB4N63h+DbDHcyFgASW6xr6DhQiQ
         RaHmReMnisihl79+T8x/57e+EKN7wc1JqMhhrL8drbFVy+P096mXJOkhoJHBdPSeVDoV
         QD0fdnln3kvudLxjlhExfDfzW3GapexXjWL89tCpQfbJYqFAd2pMc6cPr9kS4bimU1S7
         kPNK5GqgfJaUArWpZ5t08DH021qkNd07r7J+htzhTUfYxaWU9u4G8uPjJBC27o3OIsz5
         9erw==
X-Gm-Message-State: AFuF++ngVa27iSbjzNt3U3tWx2kooT8XTPfggMfZqXlq2aUQQmhV1lxj
	8nlOQa2KDTnfulKECdDVJP4bNdor8Kh2DniWCh+zkYj+MfqsWkHwiBq3EhpMxTNCYHD3ceqClFj
	sYWAViF6lJzpobKAkGgXuV5be6whsM948p54EBAoFPf7ZjBZyN8wTKDqK6OEXSYLh5w==
X-Gm-Gg: AR+sD13TQqESc9l/pQoUI9EeQmgTxDc4fhhiEPHskzZQBig8elVb49VOXtnv3T1tLNu
	ZPjEZaCzjjaTRUgT1xWQdBNzv94GDmVZvoaa9NT46hZVrfN2litnToAYVYiF3V066Ow83jS8L+C
	uy/6r7nAJJdOV69wz8RdDCxH18/zpvJR8+HIPoEmk2LnWwvbQe41DuOkho5/rE353Tzc3Yp/Qjh
	LekdosMvkFtcSBIfIm1c9kY/ShVVsLR/yoDfyk9iL1pCg5IrO0iicKVnn0IL5yuqwai/AeZVIUg
	c3HhnljVqqKt5/OcoAYylDdQEfbvXCREZ/IFxJAJL0YH+M1O91MrBGyaP1nnyfwft/8Nvu65O+t
	rfTjgte9wjOc3VIk3a9jFUw==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200029985a.3.1788339442628;
        Wed, 02 Sep 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200028185a.3.1788339442200;
        Wed, 02 Sep 2026 01:57:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm727706a12.13.2026.09.02.01.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:57:21 -0700 (PDT)
Message-ID: <f4234555-212f-4700-ae90-ba895e364667@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e4f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ICu83Fd2_dlXxx7a8cMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _Xm8zEpkVMkQEX4lBxr1oFamWtYq87vZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX7vDTmLlOLPCU
 JceERNeiIPXqvbCfIn9XkSQJlQvO6YNN0w/ADbjKiFe5xDJrRnCbyb4r8sArqGU7/eNDOLaZNDC
 xHAjwUfmPxp24dDYgP155X4WdKN63D8=
X-Proofpoint-GUID: _Xm8zEpkVMkQEX4lBxr1oFamWtYq87vZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX57tagmPs26An
 Ho6vDTo7CnHS7Dm0GvFPVwcRzWUEYzqWvq8124ppsFVCtHbu9hKWvjY/tnGjcytVwKW28fzTGd2
 eKF1y6Zkdd7mFhaJcYAqBTmGwb6C4bS+L2NL8fOKMKhs/65EVPvzn0r60AhIYWgJ3CXeuXKves3
 fv8EEvo9B05FsATK1/buf0gAqeu8MKEV5m3nM4bsYaEfLncC7ynM49jHLmbM+VYlUa5M47bCJ9a
 CC+lcaqyqjwW8BmJE+x1Tovfi0c5D1/fBI5YjUhDHOZcxhads7uh0lioYHG5gRvoZurDG9r5I4k
 uDlQamo0liJcH58A2RFXW53jKDCScqDPzslJ6HyX47h/thq1iuRlF/+q0mvkalzxersZUKPwiOs
 jhpyF4nCXAoLvIrS6rV+m8o4VWRBxYqt9fgLNcIVh+8YGISipImncaLrbnAcpRVYpcKbE4EsezU
 FCBH48tbreHf7PQu+pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 3:31 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once
> per group of pictures (GOP), because playing a GOP-based in reverse

"playing a GOP-based [missing word?] in reverse"

> means decoding each group forward first and then showing its frames in
> reverse order, and every time this happens the driver resends the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. 

This is a single sentence and it's way too long to parse.

> The real problem was
> that the driver never stored the video_format value that firmware had
> last confirmed, so each time colour info was resent, it used a fixed
> unspecified value instead of the real one, and value firmware received
> kept differing from what it already had. 

[newline]

> On every restart during rewind,
> this looked to firmware like a change on the bitstream port, so firmware
> sent a settings-change notification, the driver treated it as a dynamic
> resolution change and paused the port, 

[full stop]

> and the client removed its buffers

"The client then removed its buffers.."

> and built new ones for a resolution that had not actually changed, causing
> playback to stall once per group of pictures. By storing and sending back

Please use imperative mood for describing the actual action you're taking
(per Documentation/process/submitting-patches.rst)

Konrad

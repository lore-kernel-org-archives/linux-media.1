Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280506;
	b=aPJBifvBY70qmJa6xZqma+MM51KBzFElTeMWBHOuBAebbPOzb9PiWme15hIsn5IveeMx
	 NVVCnkU0YZ7xQAgjc0TKhZ3oVbxylHkkscykdnHYdPJdFN4o5j+yTs2tsTT9TirUK7bxd
	 KwyaKIdpBvlBhKBCPMqim4L6c8pVTAhewcX0PL7Ygu4PaMhQ15GxgginecSI5J3ukHuN9
	 WK592obeRrNCURMx29330za5Yr+Bo1hz3+MC51KPmP0BW1X2MQGTDmrkaSiex5gqMe7cA
	 uhFlQEG5I4A35EkMsiK73n5MJqHSCvmU5Jur1vF/LMNJhGZvYDl4S4y+rCj89StVQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
	b=cK0k8vie0pR7zjp0b7xkxRspPsPrmSjgp+G+u/YsO1NC3YfOmWkgIvdp3DTywvfsjlRl
	 lXaNM2xwOVplgvkh7/Cua/PXc7T2uOlSaAyk6ulkXxE3LJa1QCcdVnq0XB8lrMnpX7THk
	 8cHHowkxfo60L5qBo4FIGSSRjdW6YwGmrNUq0OQmek56uyLJvF2KjiXrevXy07DdJ4MIJ
	 PzT85scKZB+lpbimvStnCUSNEQglnxZuGTVBmwCLNc0SXXduxN0VMVwJ8JZOYqLVk42k9
	 HbcT+UNXgTCCbwVr925SVa5FJJ36hh7Ser4oE0uqv8V1qMyBG1s21JHU4lnTbZk3Glw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COVF4gct;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A3606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COVF4gct
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe8NS068204
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=; b=ladCPEJ3fJGgNUnu
	Q6vslGflvT/5r37724+q1QME0Y5rc95Cwynv0h6HFvuyIEN2qgmE4SzB5SMdWhE7
	3WwOgd8+1pouWOpm5bsomyb6HEcNAdFryo/GW22gUhTVtVgLfDMlTG9XuRdm2Rqj
	gufdSBnQDlP0G/jjZdXm7s4GV8bV1hhl4PvQm9rZTr9T1PhkZrptQzMnIUsEy0fM
	pMUDmaSvtMUb/IFiISVbRKESXJT4bavxk3WRf7KuiJRG41O/jKRmPnVEXEhbo0Qt
	uwM9pZ2sC6SfdahUmAuO47uPIksnblHG0ylKQRlQIm1tcciYupA8/Px/yx7jycK9
	Z+64KA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsxhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 13:28:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so381243885a.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280504; x=1793885304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=COVF4gct45wH8WsRLchmp40/xaS9QqQobVFihMDwSoiaBvHI5VrE9F/bADazAKuWnZ
         2sGJL9qJr6ataSusGlYj/cKem5Jy4tt1RlttcAPk1rsyU25LKtni8FOKlR1ZzIQxZiVd
         MTdeU7ALiP37bUxnpczFH1o8ISL6U95w6BaVHuDlRxr/xRDSlDmPB2JdjO2+y5s4h9Xn
         qUVcI98IF1ZEO09r2ZwWq6RjP1W1OhJeqDlYfnVJB0fsFHCkr1uiLATdbRTr48UMKhbK
         8Bq1BL7p2bzSomis+V+ALoFm6p8Rzca5zp6HZczb2XR1K/NDGpWxkqc6XAfi4u/R3AKW
         4IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280504; x=1793885304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=ifIqZpl1S++yQF4VZqb63iklzKJz38eF3rI+l4YobzKhtV3KOhzZ+kdYEQJAC1F/Lr
         TYj1FTFYd2A9Pyri6XNvBPAcQ8UYPuCOIANpm2AtTHzyB3wPf2nR6+KXbJUZ6Mgav29Z
         v/C9TsBBBvwM72gv8tE3fm5SMTfuNk3AA96TOKyDl7DX0M65Ydj/5P6XTRXvvpKvjVmr
         MyA0P9aSGFHJi8+rB/W5uhC4iOJ9GcvhH0SOjoRiR1hH/KLRKwjJuRty3LtiWFZ5Hlkc
         G0EQWAzOvLAF14mxcdt06ZZF5RZvEsSts0T3rrHVB08yDUoFL8b8oTeHElp0kqBku5Ev
         XLLg==
X-Gm-Message-State: AFq9FYKDdvM3r3pvNlwTg5H3x/s2b3e7LiyKFz+679WCu/dN7H/ZYNOR
	Z8SPjYB9lUErgtDFEa3nTpphJKMhbi5nkzdAg2YqvTr+48eJMe8UswTdPLobbFTTGQaZ5ydEgEA
	YV+46wzS002kQUglwJcpo9xg2g8GnnnTR1dNv5IahKkmNJ4NrJDmKTMZHEMJ+9Epweg==
X-Gm-Gg: AYBFou39RxjMOq+ss1l11WyD6rcRIECrQffg8phRK6cMikwsbz+ve93vbNajmLmTGfe
	xCZ/VqzUZ5nHzLSUEzLz403FgTGNkKPzdoj6WAEUNRLnxCByLAPblCiUmR1jVcDHrFibf900kxE
	uOYdyClqbOgaKoDsBF3VBdGVP6VntxOifNtJoytlESriwIJPw2vJcAeLixH7jgrJ9ilfsToepoe
	y8lP0e5dbdKvqr2CFoiQVDr90iUebCXqVDuen/orqtcbjLCtKsYR4nGZx9TkI6+QbROzwJGP22S
	vuUAHpHWrWi51rPVrDoy0JUQBGKuO9K4ykYuIeum2jnI6J+ef/ruLhtg6Fdb2PmOyu3OWeDfPlj
	ruX9UFWpe7e2ty3uFnnvXy6cJL+Yc1SSt8n4SC9+NhkhkJR8NR4oREyQyDDvTbNrVYygZv/OiWk
	qLVJofY2mGhYuC
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826050385a.28.1793280503561;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826046185a.28.1793280503080;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm67364985e9.7.2026.10.29.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:28:22 -0700 (PDT)
Message-ID: <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:28:20 +0200
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
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EaXvR3GjboAuukzTMSr_wR3TqQF8JVV8
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae349f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=382KtSWcDXd1BgHnxQMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX6Y49WEvmtqn+
 AYMTvnAzEUbBowlejwihrgVs6G96SJSOslCMsIHAyQrJdDwwrUVxN/6fJTqCH9/dnI0Xi84hhYi
 vj0Lx6wO8yitQS/NKRQSV0U5LbvpHYM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX0DQhLAc+T5IS
 PwMLu/tydUv/NFteduA7mgG7UbdxxpYxZazPm4TX2abzgP2bXQcqQ9SAe6afHzYXSxxdd+oEBzX
 aHElAjbh/LF+u6dXzluafWq3YxAErWU+XxnJbVR2N0lrtvyPAQNfMYuXXK69uY10y8b3Kmgiu51
 5Z4lve7MgmJQQG3AxNWEm5vRmE0nABM4sUFW68nLogZQUZK2VIF5Co+TvuroYHIKLLhKvZa1iTZ
 zZTOCocwAKgXSxwSZp3sWo4jrpmzPp05ppPKhEp8PB+GgRAt+uN726wYk3Ji0GYYHFNmx6mQXFT
 Ol0ur2IyT3uODtGpoewYPxPQ8JDBMPXxigI+EkD5PWrh6iZtjqRLJ9yLJ2xvg90sTF1JrmdZXQs
 Tjx4XESym1n8zrSp/p/SpSSPURHWB0e1CbiUUtzdIQBUYxpkg5ioyHlEVqiIbgZMSADmdVURK62
 bupagy/5sPl9up2LaMA==
X-Proofpoint-ORIG-GUID: EaXvR3GjboAuukzTMSr_wR3TqQF8JVV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290052

Hi Bryan,

On 10/29/2026 11:55 AM, bryan.odonoghue@linaro.org wrote:
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 

It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂

I would like to share my opinion on tagging vb.sequence at EOF.

The EOF event is received from the CSID decoder when the EOF short packet
is decoded. In contrast, buffer completion is reported when the write
master has finished writing the corresponding buffer.

Because the processing pipeline includes buffering and line buffers,
buf_done on the pixel path may be received after the EOF.
Conversely, when cropping is enabled on an output, buf_done may be
received before EOF.

That is why using EOF to assign the buffer sequence may result in inconsistent
sequence numbers across buffers.

I would propose:

SOF
Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
for userspace.

REG_UPDATE
Once REG_UPDATE occurs, we have a guarantee that the configuration for the
new frame has been latched. At this point, we can iterate over all active
buffers being processed and assign them the current sequence number.
The bus-write active-status register indicates which address is currently being 
processed by the bus-write engine and could also be used to detect frame skips,
if necessary.

BUSWR_DONE
Complete the corresponding buffer as usual. Optionally, we can verify whether its
sequence has already been updated. If it has not, we can determine how the buffer
should be handled.

This approach ties the buffer sequence to the point at which the frame configuration
is latched, rather than to the arrival of EOF, which may not be ordered consistently
with buffer completion.

~Gjorgji


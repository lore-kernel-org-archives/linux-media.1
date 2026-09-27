Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355EF2701B6
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499703; cv=none; b=F/XMc6UaEzupx6BYzR3A1NJ75wJ7+51KYCaer7nO4h7GXTXq1XsDKhKKcgLnkRlZmTKQojK2rfoFWh0+OIjAsApmBVDa9mUgTkTDRzLn5ASiJTNitENc2NYXvyOWmLvO1XGp0V5YmUS7XHpkH2wswJZzKK6hPftW5keQ+igYA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499703; c=relaxed/simple;
	bh=3wdlqAJ3PLGOAOQpdby9oYXvpBLpWGkGBV4RBok8rwk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=DN++NYWvlMf3GWZFMmWESs8TJrz3551DlNCZbHdjHMpaogW6YghMRe9oJopf5K78Z17kUTL6Qp8C0CND603SXYmXSyM0HpeGYI+Z6Ym1JgVFSZZRTKF/ukpWNN73AcLbVHrdZ24pULlJwKFpx4UPNkRlcSSlk2/2TPGbN9SrLOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWBWN87V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/SD7n9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWBWN87V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/SD7n9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxLMs3792974
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IFvfNEmGbqqnw4l2btJOO0L1dbfxjLCxM+CuBXKiMo=; b=hWBWN87VPiS5vR45
	xQzd4HeoWdVWtnhXNnDgTvo431mWJr9hqz86YDFUWplsJFYB1pM33nb7oD+0n4mb
	GhIluUeUEnL3iMDxlfRbYL+PtowU/p2zUWx2aGCHjlS7O/p8P5ZbQoQaTTSDC1AC
	AnEBAV9rlUDQow64rGhVPWa3ltHptJh4YY8DDLaWZR0VZvgdvPATngKD53Pfovp4
	apNBfZbpX1zL5h5jHHE3mhHzacer4qzCGD2thuwKwujXV5N3/2vX+61LpRQF4srd
	F1CBhGonO3W+RZZiZBpzMAL6HKf+G3U6glA6OHZsJwwiEYbkBI5waVy4B7CFgwXI
	vBQzHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9tg55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:01:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso287668185a.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790499700; x=1791104500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IFvfNEmGbqqnw4l2btJOO0L1dbfxjLCxM+CuBXKiMo=;
        b=hM/SD7n9Q5xkV0cvwJrlgPKm+4x5QPXlEXlzqRP7AmDFWTLjYIFLYRNtEG7GVVRVPv
         PD8W/HQP2CXQcr8MUGGYYyq73wXUVmWokB1M5uvUU897QDhW/xgOPExDAW/O8d0KbRs5
         w354ThdTKxIKhThPFjP1q9MGuZQHSDzl/I2smKenAzfWjkqholQ/UsBQyeqbhRjQUeJe
         P85yU9nKyFZY0RalK9+XcUbDts+or5eBIQk0gWPDuHkBg66rSb87vZZgq7JFRp6bpXej
         yJqkwJlLQioJto85W+r3AKfRDnAURAVnbxmZCb3pbRCPdMjTNX+L1wqSEYMTyw3iHb0k
         ze6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790499700; x=1791104500;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8IFvfNEmGbqqnw4l2btJOO0L1dbfxjLCxM+CuBXKiMo=;
        b=gJvk345Kk+VFUsfHTgOrGc6NRpwl5WXiKmE/rYswNWRWE0KPOsG8VDcVmMZO+qr1Di
         aP9Qd0EtmPYKjChJESQrn1u4O9FHOTZmRSoVtxFz/4o0/YZ/sTqYMss4MUHdyNFRwq8T
         ilmzkkDrHeRNEOt2G50YvtYDQeL4/KbQxz3raJUrLL6h4Zf2msy7Ze5hKJ8RHvGsRbRo
         TmexgWW1jhEO9DyyVYH2Fi7IYmYSk5gkspfrXt9yoHrfTezCH+m5BWxIAguyC3dWqy1o
         qcmYRrlmYYvhHp3yAi10JzQ3lj6lK6q1nd1XyQL7EM6rjy1jQMg5hW7pvcc9MWUiCkkb
         ZY6A==
X-Forwarded-Encrypted: i=1; AKwUvBxfdnfwK+n2wpkyw66Vih9rZBucslHEyZl7VDW2BAOtyY3wMOR27mqJPw72SA25dMEHGB9cbJrms7dogw==@vger.kernel.org
X-Gm-Message-State: AFuF++llQMH+QwjBgel+TTXzOJbbJp/IrCLS+M3Sy11okE/KIg8UlG88
	IFS13ENxcdi06Jnww+Gj8plWgLtZJxGAVYx/ctzg3iDSFK6TrgX+CwBCSqFRY4UtzehhJiTwMaT
	/rm/Xhc3+xshET59RnRNVV81mSI41f6ueIjspMY1BKb/5HLTfqS07soVWs5frhh+Tx/CV3+Y7gg
	==
X-Gm-Gg: AYBFou1R3D357om1YpSWojqo+awrkF0qcDybIEjM1WH1WfwOnJvkMCFrLkhmK4E67ea
	I6Ag3vLV8azYR4KiWdWuSQXULUuqvKDP+oOZ0GFONKsyXKvurBzp6rEKc0nPwFjXSBYgJxfJCLt
	5utWk9Bk+JbgiU2WAKpuhwbtLXfKUR/SKb66rq9nRRrCu3rOSCadAuBelINyfSBFx/w5N2iVpvF
	ThE1Vm/t6SkAupt99VgbVoXcMnMOKjMJ/hNk9JMBBnVCxvxoamn6BoPEPmkFekFcu8frCJjcaLE
	+7k1JG81k22G7I3pcpSEUuxFdeD5I/rgOuTRb0GSE1QsQKhIz4BSQVrJEDJEezdV4pE9wbe38sG
	a1oRI7bCiUAcFTGtu2FTbolgWI+MORi62HHeJX5GWRr5N7HbKqRzO7EzU1okRJEgOovW4HXTk7r
	+XhgDNuLwsYEUQfYHsO9W0xbjozHY7G7V2JxatdNMbMB3ItLY4dT0xMA7tcG+mML1/XqY=
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr1409669385a.43.1790499700007;
        Sun, 27 Sep 2026 02:01:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr1409665485a.43.1790499699516;
        Sun, 27 Sep 2026 02:01:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0fecsm2974416a12.13.2026.09.27.02.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 02:01:37 -0700 (PDT)
Message-ID: <5e4080e2-56f7-4024-8fcf-a39dffa94839@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 11:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAzNSBTYWx0ZWRfX8FGCm5sk2xMU
 QqWBBzIUl/UrcGp2UwjND8qC//1fGf8dsQvy5xGeLc3noOxYSVkxmr59i1+9XiRq0k37eXSOLYI
 xiIcOMOSH7dVLBooszRKJ1gmiRatqzc=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab8db75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=OGjWj8McAAAA:8
 a=vugxpd_pAAAA:8 a=yeTrJ-wCmjddjYFInAcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=UYjydHh6ynBBc6_pBLvz:22 a=dlIDbnWlQMEhdIxAeUMX:22
X-Proofpoint-GUID: Mt82lQNrKkXWcPsYnAy3M8bXnJy74Cbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAzNSBTYWx0ZWRfX9d8vDL7RWQTY
 y28xXdKctNGsfys9eLSi2SFBzuU607k42cCFfV6CGbtVTtUkMuNADTHN3fduZXqoBJiclyHzv53
 hPVVkaNyAbZwXzMjwam7jmGG9mxBLoV9aQn/JmxTDZjYcQ6GtSm37Apbt2fj5j165l3Df8DMZt/
 recNGQo66pqiHOYvzUeazrB+S6lyf1K4pzKaEqLfB/3AAS9QIYwiv9JE1BtGs7UGuoxZ+JaOOhN
 SJTf6rvVSyZRvpIpixKAGziXJEgJCe867zMn4f1RLstdEgi1UJ1Ifyz2Yh9EM5HGCpfxNteJauJ
 wV1v3r3Baq/DG3jpzlvaz5RtWCMzb7JtXOSpOjGY8zLYkOU9Uiz+Y/o0lu/KfHbrZMjRBNFrCVL
 DjBXtphqxjhfqOw0SE36rBckt4aIfLn9s6WNQQdbEahfwgNqwtW/FxF+N1NOHWanfJu4tLYmgNT
 SkX35uxkf9+hSqFLkvQ==
X-Proofpoint-ORIG-GUID: Mt82lQNrKkXWcPsYnAy3M8bXnJy74Cbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270035

Hi,

On 15-Sep-26 01:38, Laurent Pinchart wrote:
> Hello,
> 
> As most of you already know, the Linux Plumbers Conference will host a
> Camera & ISP BoF in Prague in three weeks ([1]).
> 
> The initial proposal for a microconference has unfortunately been
> downgraded by the program committee to a 45 minutes BoF. We have
> therefore decided to limit the discussion to three topics at most. Two
> topics have been approved so far:
> 
> - RGB-IR support in V4L2 and libcamera
> 
>   by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> 
>   The Linux kernel V4L2 API does not support RGB-IR image sensors.
>   While building blocks necessary to handle those devices are slowly
>   being merged, RGB-IR support itself hasn't been tackled yet.
> 
>   Rishikesh and Devarsh will also present this topic at the OSS Europe
>   conference ([2]).

Related to this, we are seeing various people working on plain IR
sensors found on Windows Hello capable laptops, both on IPU6/IPU7
as well as on Qualcomm Snapdragon laptops.

I would like us to discuss and ideally agree on a userspace API for
the IR flood LED-s on these devices. I hope we can schedule some
time for this?

I actually just got send a Devicetree snippet off-list which enables
the IR flood LED on a Snapdragon laptop using the already existing
Flash LED support in a PMIC driver.

I think this, combined with an auxiliary media-controller link to
link the Flash LED class device to the IR sensor probably is the best
way to handle IR flood LEDs, but we do need consensus on this and
to document it.

We also may want to offer some sort of auto on in flash-light mode
when streaming support for these (1) to make things easier for userspace
or we clearly need to document that userspace needs to enable this
itself.

Regards,

Hans


1) With a v4l2-control to turn it off when userspace wants more
fine grained control.




> - Camera module identification
> 
>   by Stefan Klug, Ideas on Board
> 
>   Camera tuning and calibration depend not only on the image sensor, but
>   also on the lens and other characteristics of camera modules. While
>   Linux supports identifying image sensors, it completely lacks the
>   concept of camera modules. 
> 
>   Identification of camera modules requires coordination between
>   platform firmware (DT or ACPI), the kernel and userspace. Discussions
>   will benefit from the presence of DT maintainers.
> 
> We can consider scheduling a third topic. Proposals are welcome.
> 
> Due to the 45 minutes BoF format, we will focus on discussions and won't
> be able to afford presentations. All topic leads are expected to
> circulate discussion materials on public mailing lists at least a week
> before the event to give attendees time to read through proposals. The
> materials should summarize the issue at hand and the ongoing work, and
> clearly state the questions that will be discussed during the BoF.
> Slides that support the discussions, if any, should also be submitted
> prior to the event.
> 
> If there is enough interest, I am considering booking a meeting room on
> Wednesday morning (location to be determined, likely outside of the LPC
> venue) to extend the BoF. We could continue discussions on the topics
> listed above, as well as schedule additional topics. We would overlap
> with the following LPC microconferences:
> 
> - Networking Track
> - Containers and checkpoint/restore MC
> - Rust MC
> - Scheduler and Real-Time MC
> - Build Systems MC
> 
> Please let me know if you would be interested in attending a Wednesday
> morning session by replying to this e-mail (publicly or privately). If
> you would like to propose additional topics, please do so publicly.
> 
> 
> [1] https://lpc.events/event/20/contributions/2364/
> [2] https://osselceu2026.sched.com/event/2RaZj/enabling-multi-stream-camera-sensors-in-linux-rgb+ir-streams-and-embedded-metadata-rishikesh-donadkar-devarsh-thakkar-texas-instruments
> 


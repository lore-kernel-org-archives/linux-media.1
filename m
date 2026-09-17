Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9654E4310
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648794; cv=none; b=DKs+qAB9egT6kVOiX3lz3MUil3R3Csz1zZIAPb6Brd8kl5iZC1kOifBV+QJNYL5RivUblspfB8dvMmQWmZaB1rxLNW/L/P1RpaoYiQ5eajrkEGkAZIhzflf0QPCnE32S2oNdw+jffVAEbwxIhS3vc2w/QtVP5Vfhaj7fdswI/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648794; c=relaxed/simple;
	bh=j0Db79yyv1CIHcblXQX6Kjv/Pb3VrcMtm1rzKl4xt0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjZ1aqcrcVd8YbHt7b4xQkZD8V69pyphw1QndujnKL8Idu2Xg97Uvv7p9Jv8xmhK2B07Z07Ecehs7KyalaY8EE+TLwopQ5Pd/DwGNGcib/bSRODR45T/H2OczTfXfm7sceb2Bd6/pj9lSskcYxguFhbQJP0gibOj30T+xxYib0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6wZ0RhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk+BMI54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6wZ0RhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk+BMI54"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZanI1150010
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LbAxVWA9OOlIdTHARrvHvKJ4x3+w+nFnE/FNB5ZU9BY=; b=T6wZ0RhNOhSWErff
	hVO8b5K9NwHVXZ4lvzsl1229ifActg2fzmFGak0mIGYqYxXrwPgcKojMmW+3V/6+
	SErqz2bNFCW+NlEfjjC7qL6wnUVRrqw26zd2fxvayIB7NI0ZcFwi4aBWdQmeEtMu
	1rZh7ZvWrH+BTC2jUyeI3wJDiM8bJdbnBdTsD5cU/RHKJzjGWR5p5Ew2rCKB/BrW
	Stt1nPZcDVB56ltkVp+4ANqyDNCs0va6os9qDDcuxysBDz0FKL2XmWfKNKKylJyz
	ZdtTIWO11VPcUyT12QAdp36rptxM5TLTgpE9l9jbCqatdv3CT52mb8BswyDKrxpE
	7UfWsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w92s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:39:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so163323985a.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648787; x=1790253587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LbAxVWA9OOlIdTHARrvHvKJ4x3+w+nFnE/FNB5ZU9BY=;
        b=Sk+BMI54ACMtAt6FSnlSvvbUV1zprF37PUiIMUGX0cxaRZwr152nDDtqOLC6sHvSe6
         GVGi9iscYIrFabHYSPkLg+wjJE+GZw7sw8DQFQeRRMSxZbw6zjzX4vUc43XNaPrbqnDV
         3XU8kCr9uI70d7wEt6vFuemx491nLbmmgvyMitMUSrHCud0xhzPtApwwnURqYaQsYi8O
         yHqaE96g70ox7uuD8IuVBkhMQ5k9wVq+KVw9YySN6jrDegBGFNncfUVAvt1+UPx3VfuR
         9KQSXUENeeY2Er4ojYHp48TWlJwL9BDIdUihq2V/+EnBWGc5p9CgxsT6mFX0b4+qvuRg
         8wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648787; x=1790253587;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbAxVWA9OOlIdTHARrvHvKJ4x3+w+nFnE/FNB5ZU9BY=;
        b=V9xoZ9ZVlyJ/fYdL+BVc8R24HiLiP4AOuFmPbKa3E62YFz5gpJ7cTHb5HPV2J2stn7
         HlRu4z1kYSrSsAwRx15DiK48A15WN+ZNOHVsx3Ks+lI/nJRSUQfBsOrDZ4r8bN+sFCy1
         YKSbRnueaHEyCQ/cZwQUj8lTeNnjLZ0alJ8mZrh73MlzvsIMs90S+PBhi9W0mKvrx61R
         beUJgq0X5ShS+p0XZt3v5xf+jy3KhLWqjrNYMJf1+9RyAPCRDhAPYR6yBCLqBUrGTB6t
         Un2h+RW6WYWqLYydmGbyfK/QKJKo84AmIJO9trWokGV7dD354lM+4hLvoeovRvDT0Q/Y
         J/4w==
X-Forwarded-Encrypted: i=1; AKwUvBzbeQY0onOD7pRRQahBNFNTl4wQ8+uB8KCqJ5I247Onn3y5hG1Tdt28fzm8jaWzEyN2dwidxIEqyHOD+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l+LLpUFFTsPirYbMXwDOFOC2W+JYutxYDjXWemWppCEVsIkzwL
	Roc9HKjgGAh2UfxzYVUwNG1+UJGuepQydZ3S6kgdsqIKdoXD5JKc5mfWz9tW2hTeAHBT28/T2EA
	B5a9iKc1hooW1u+Q+UiXp4Z7aKsG7SbdFVFli9UVrcutZ4RwLW7tN2guI3+ze/Uf76/TuQi9tFa
	tR
X-Gm-Gg: AYBFou1mmXc/DCldYyZphJLCSAD27ObWs/j3Wpx0dPrCATvsXSWyrQAACQJkE8P0H5P
	J6YhgevpNU3SIM8f+IWlofsEAcuoDxPCsHql9MHxP1BOB7yEJc48mKXbmj3wU8UTy8ypu1WbzWp
	7GtYjlsRl1CDZtjcqEh9Bmzd/LMyeGwmXg2dr3DrZbOPM5O4/vfzNrAnZmHqJgr4kze66/PNo2J
	522Y9ifIUoYVVPiWekJujLhXoLbf5xwxD8ViCwrSxMFuM4gZbNEojm+SckEoMW79UDtxxXo6ZwE
	SVu0RpQQRIagSizQFPvuwtsrmi+7P2PodsDXLYaBlpYbCOHo/9r/VyscANpiDWohLWjw0IiIpyO
	Yt6PcL/294upkTdwyEEiADqBvA7xnzNAAypVCmirPOiLgORrZWfUIH4RZu2SpKzI=
X-Received: by 2002:a05:620a:1a13:b0:939:a095:e458 with SMTP id af79cd13be357-93bc6240a74mr479436385a.3.1789648786773;
        Thu, 17 Sep 2026 05:39:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:939:a095:e458 with SMTP id af79cd13be357-93bc6240a74mr479433585a.3.1789648786320;
        Thu, 17 Sep 2026 05:39:46 -0700 (PDT)
Received: from [10.38.246.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be64c0dsm48863086d6.9.2026.09.17.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:39:45 -0700 (PDT)
Message-ID: <d23074df-fd14-49ad-9372-b1a560c9a6a6@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 20:39:42 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/6] media: qcom: camss: Add support for Nord CAMSS
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <6aa92fc5.2eca3aba.387881.68f4@mx.google.com>
 <UI2I4KRjCFt-BlTZh2zvw-TUHyLxtAk7EUQKiQVBnNDyNRdkH93Fb6ORrhrno3ljiR0940VHGO8fGUyxj_JRhA==@protonmail.internalid>
 <c9925024-b293-4349-9105-45ae8aeef75f@oss.qualcomm.com>
 <d4dea739-9803-444b-ab6f-346eaa511559@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <d4dea739-9803-444b-ab6f-346eaa511559@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NyBTYWx0ZWRfXzeuj8jaxsLjM
 5hO4x8O7VGnYf9pMP1CPP/8Lr52oeeZSrSs6vPrJk3+7Xz+B0CJqlFqptZtWx2wY3+w/2tlOz2r
 f+bAlmL3OBYXIHU9EZ/BrZTK8aW2d4+Vpc2LXl9TImHptp/ukXQL1MMMGBDxxbwq8t51oUR1hs4
 7W06oalcL7dMIH7ZfGBeKe528mXD8JndBeFmrzZ3jzxaAioI3tQgStm8lXreyir0ggaFFt4WOwA
 Y8uy3CJPvHcEPb1hGylwBOfnZ/TpC8CJQo1SZpx/33HLlkii4SmZX1hUyNMf16aXOw+JmPFT6kL
 8TdPjboukqnZZ2lAMkLRyzhGDXXOfhu/CUKJJEHm2setL83waYyGyHaKdFsO8+dn1mbVsI3MTlU
 CqhpYdn0jSqK1KVxBi9kgl88sBwDaOgsvMVR317IzOL4PQKpjtFghfBxi7M3E3XqNxf0b1aw6Z0
 8YBIPsxXFEP4irykKYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NyBTYWx0ZWRfX29QxKZM90EKG
 FB1AsBvugkHy+SSSl/F23Gj948MOkXHmIiEgLPp3QiGPp8e3QuFWplQ2dfHABla3M9IpIz6WZKM
 Ztkq5viw1okzmqvDCmCGdojOV1+9V4w=
X-Proofpoint-GUID: 0ufcgu-fbwPsASNU9atsqh6uQLrqekqJ
X-Proofpoint-ORIG-GUID: 0ufcgu-fbwPsASNU9atsqh6uQLrqekqJ
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabdf93 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Huyn7OE0nn5yvolxRN4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170177


Hi Bryan,

On 9/17/2026 6:57 PM, Bryan O'Donoghue wrote:
> On 16/09/2026 03:57, Wenmeng Liu wrote:
>>> Please fix your series, and upload a new version. If you have a 
>>> patchwork
>>> account, do not forget to mark the current series as Superseded.
>>>
>>> For more details, check the full report at:
>>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/ 
>>> jobs/110294816/artifacts/report.htm .
>>>
>>>
>>>
>>> Best regards, and Happy Hacking!
>>> Media CI robot on behalf of the linux-media community.
>>>
>>> ---
>>> Check the latest rules for contributing your patches at:
>>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>>
>>> If you believe that the CI is wrong, kindly open an issue at
>>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or 
>>> reply-all
>>> to this message.
>> Not a issue, linux-next branch already have this file.
>>
>> Thanks,
>> Wenmeng
> 
> Point the machines and the people to the series you depends on
> 
> - Depends-on: https://lore.kernel.org/r/20260903-x1e-csi2-phy- 
> v17-0-26606fa9a039@linaro.org
This series currently provides TPG-only support and therefore does not 
depend on the CSIPHY rework. The CI issue is caused by the media tree 
still being based on an older RC that does not yet contain the necessary 
updates.

Thanks,
Wenmeng

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7545DF58
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930117; cv=none; b=jlqoOzGXWcoLje1zDK6O68CNn37SWsj30kwjzfsOsHr4qd6ux+1jN4uJPXSPzAHT/tWC4HwIa9zXvcjBxQ3Jz8R/fcir9H+ATVvbJPPWD7crXHPOxfLX2mv03AICXCrvDDl2L4J4LoVRbO5p35KUd0QbqaQcjmvc5RledaUyroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930117; c=relaxed/simple;
	bh=2FqSZwIhLL+hBFn3B70OLXca3SyJSCS0FEdxC3TtLFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkLoeZm7fkIbv4YVbJV5Cn33O58IgaWlQzC9yHP+D8FnZbgGmn+lcJ9GQqxZJu2lABSVIiHVpmmLB892SgPFWkbWW/ocZPJ2PeJao29NUgGAf0H13Gc+CNg5ltBl5+SfMbsXznfaznsBJca6gimgJFZMZCKQpDup+8gg43sqTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0P0aebU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYTbAGFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0P0aebU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYTbAGFk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jGlh438100
	for <linux-media@vger.kernel.org>; Fri, 2 Oct 2026 08:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBdLJZiAUN+I1poeyF/rDzWR4oEkqSam6qPf+SznPoM=; b=G0P0aebUu9CQfftL
	JdCB24ihGyh3XgErYZVOzLP4FjV1+Qbv8QdUx4gCUeazD1qoLcjWNtlm+heENLsy
	XH/RTsFNKGJ10aNg9NGERZWsp3XV2Pxnx6HOg7vN/zu9GuL617nD3FdNHGtUvAG1
	YJHjhdQuVSESNfsSD72My5BcFxk3jNhZA0Vfs0T7cWuVFw4kDwhSPqpFn1vxZTUo
	O503QRA/gB+ZcHGd2TWZM/tonAQhlosql5VqZ8uh6zQtGpGz17AjDDxzf20RbdM6
	jQrn/WmKnpMVOWHJ9yUu9nqCqrCeJXB9I3xrK/Q4aYnvTZk7OFPdfguDBEvAwvbm
	gAsFGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckpj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 08:35:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so1956136085a.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790930114; x=1791534914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBdLJZiAUN+I1poeyF/rDzWR4oEkqSam6qPf+SznPoM=;
        b=iYTbAGFkxf3y+gArBRowMWA/NPw6znk+jygWC7Ki0mW53aAnfy/BYTg6urafh5bxB/
         VoiJKbmoPgyRFb387QMTfwdfjbEtqO1/g2Wsx/PAKMhjVMIxJ7HdC5aNj3DCxqIYtZ0B
         QblroFPfF0fKEjPRHtKrzp0wGdCy854UEC1Moi74LTEmur/3InJXwQINO1SbCTGHBFBN
         avsnpDD2ts43jGdk64Emb1vlbT/3JaosgtqpUSQczLzYdh3pH/XzuY3IgkwcR68yyLXj
         2YLSuso+nT6IWpXUVivCOiZ4C2EKbov0LjD2ZBV6/M7OGekQpbX3At8IxCfjJ1Wo28oD
         drkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930114; x=1791534914;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBdLJZiAUN+I1poeyF/rDzWR4oEkqSam6qPf+SznPoM=;
        b=J5TGHQI8pPxf/SqH4rNDOysV7BgPy0Lf1E13Z+V5xuyDFE6KCTadxpJzfEc8pDr78J
         n9WaOR6WkJQH8msN7NDEP/NaU21uyEJKuWrxefeu5fhmYSlLKJW/iz6ih3orL4LLhU4x
         fadycSYVcjGF5xgijurDAxAJA3NjTTli8bDWjpuslEYL+IGHTK19iIfVxYOnNqM8gduE
         tHtOe81nxlc/zuHkBmyqsoQWA9S9vkn8lndNjr7t69mgXFv9G7fHUBFqaWUsMvpOtrba
         gExXvxSRcFY0ehwXlPVqrLOL2U+8PmPkgBhQvaURUQN/dS5Bi49GM3oo7wQ0cUACQOCz
         rRcA==
X-Forwarded-Encrypted: i=1; AKwUvBxEnuAlncOqrVutND4FwF/MNyHkJTwz1AFWqNmSgkWbFOwgkzaJsVA1k4SFPxDAbioFKUbURjcNSLtp+A==@vger.kernel.org
X-Gm-Message-State: AFuF++m1NsoSzmXe8c/DFlrqQOIsSK+VZaY8SGAw6ggtyKC0AU2TNlP1
	xNcKthU/srYmg2TGcYhvy4JBhGq346x4q6lSxfqmxad7wEMgU6JaaNSY3zW162GeJhafJouKFI5
	Gou/wmPrlDb7kKbgTv/qpu4Teb/CmpltKlC8Om0aYB1FbFoQOfHpJHcCmuS6sdBDnRw==
X-Gm-Gg: AYBFou2HAm8EIGg4/GjjPPpBDASSa4Zy34P1ki+8WqGV9+/kSQCsdemrRsG7cp8fux3
	+l7t6zGkcj9Jf3Q0At3tB4qKyYFmSB+AnUhGV0a82MfvxyCub87EosSAKgX9aX61bDuFNCWBHdl
	QuTdCeBQh0QF/8K669Ao40/bcdOD9f8uZBvzc8djzehmED7yRukeu+r9RP+D0h+11ueX3YiXwvQ
	hG4y8nbSx2zyy+59Hwt7u27nTefNoYbbEhND9LScHe10kVUNr7F11h+TdANL1r6ThWYYV2TFQMc
	rlMhElq5BXO16ultX+eUxPQ9cGBgWaeAH2lXDjpC2t9TYCNupaXj6SGkdYVI7hvxZJStLC1wKzK
	WfHyLXTJYmLWJvk8B1lfDcvNKJdI/5EbxYD4xcNmQYkLx1QrIexi01sSAKDvJWkuk4CSlfAoEVB
	mlrRj+N551bz2pNwTIjT7i5H733VeuTdV8UMJWlUsfv47hdbUWV0s0qK6RSFl6r1FFFpA=
X-Received: by 2002:a05:620a:800b:b0:93c:75f3:e146 with SMTP id af79cd13be357-93cf170c92dmr323416285a.33.1790930114217;
        Fri, 02 Oct 2026 01:35:14 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:93c:75f3:e146 with SMTP id af79cd13be357-93cf170c92dmr323413185a.33.1790930113554;
        Fri, 02 Oct 2026 01:35:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9edb7f04sm544723a12.4.2026.10.02.01.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:35:11 -0700 (PDT)
Message-ID: <ddd78345-0604-46f7-a65c-fc865b5003cb@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 10:35:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] media: usb: gspca: remove driver for old webcams
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Frank Zago <frank@zago.net>, Olivier Lorin <o.lorin@laposte.net>,
        Erik Andren <erik.andren@gmail.com>, Brian Johnson <brijohn@gmail.com>,
        Leandro Costantino <lcostantino@gmail.com>
References: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
 <9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
 <d421060c-5bc4-4047-82a1-58698da5dfe9@kernel.org>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <d421060c-5bc4-4047-82a1-58698da5dfe9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FYPLdJPe5vF16wfFecrP5tMUj7lz8Pt-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfXwiozZEEef8W7
 0SVI44bWsHz1sH7mzUQ2JRyW2Xvcr/ZKU5cMQMVMaVgEWzryD+0dx4vCSnbopPVyQ1jmPX3Xyvw
 G54eoFleMy1tMYsSX6JehMhZA5ZX1k0=
X-Proofpoint-GUID: FYPLdJPe5vF16wfFecrP5tMUj7lz8Pt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX3EcKry9NTYNQ
 rjz9QDdyd/IVWuovD2Kbcik8jF8mI1b7nJ7sYhCfcvdk4zQgPaN6o33gMejge+4Wq07IlvPHLzW
 HnknXmaqYnjOJ/XpZTvX4e9j2nT06XTsvlrQpdcf8uo6ph8ZazsBbRhXsMUBgxaNDOCChXBkJNX
 CDCt6x0CgVl1DAB4RA61nj2aQnxZczTBUUR38sWifgjn0XHQvlXFK2VwbTuqA+NOjc/C8qJLVTj
 6SuiM651FEM7yEDUUCFoAZyN4oPZnxYlQL0eqqeEUtWSfOQx2Hd9sz0BDoorIup6c5J/d5GQ+WY
 jvJ82WHrJpp15AzFBkJwDDqvZ05yAtUnZVnQlJBV04dH60fgLK8TMsqBq53eO/7MPDnEerXxF+V
 Jnju+koYe8mMQ4b9Ol/PerQjILHJvErW6YxAThQAa7eTPxK9NnwjXZ8iHwtIkv7YALJ+D6tBFfT
 wKKaiykTJEwCimxYv9Q==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf6cc2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2x0QISegLF4trJqOEioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020034

Hi,

On 30-Sep-26 12:27, Hans Verkuil wrote:
> On 23/09/2026 17:29, johannes.goede@oss.qualcomm.com wrote:
>> Hi,
>>
>> On 23-Sep-26 09:32, Hans Verkuil wrote:
>>> The gspca driver supports a large number of old non-UVC webcams that use
>>> proprietary formats.
>>>
>>> These webcams are poorly maintained, have very poor image quality, and
>>> there is no use-case for them anymore since even the cheapest UVC webcam
>>> will be better than these.
>>>
>>> The last time there was a 'real' change to gspca was in 2021, one in
>>> 2019 and one in 2018.
>>>
>>> We see an uptick in the number of suspected AI patches in this driver,
>>> and I really don't want to waste time on that.
>>>
>>> So let's remove this driver.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>>
>> As someone who did a lot of work on gspca I'm a bit sad to see this go,
>> with that said I understand why you're doing this and I think it likely
>> is for the best.
>>
>> The only worry I have is that some of the earlier builtin laptop USB
>> webcams might not all have been UVC and replacing the builtin cam is
>> no were near as easy as replacing an external one.
>>
>> Bur for that I guess we will hust have to wait and see. I guess we
>> may need to keep some gspca sub-drivers. sn9c20x / ov534 come to mind,
>> these also had pretty decent image quality. Those basically were the
>> last proprietary format USB camera bridge chips AFAICT.
>>
>> E.g. ov534 is used in the Sony playstation "EYE" cameras.
>>
>> I wonder if we maybe should keep those 2?
>>
>> Anyways I expect we might get some pushback from some users on this
>> but a minimum that will be helpful to decide the future of the gspca
>> driver:
> 
> We have three options:
> 
> 1) Remove completely
> 2) Move to staging/media/deprecated and keep it there until end of 2027
>    at which time we remove (or perhaps keep a few sub-drivers if they
>    are actually used)
> 3) Remove most subdrivers, keep sn9c20x and ov534, perhaps others?
> 
> Hans, do you have an overview of which subdrivers were used in laptops?

No, I have the feeling sn9c20x may have been used in a few laptops
and as Michal Pecio mentioned I forgot about the m5602.

But these laptops are quite old and likely 32 bit x86 only which
most distros have dropped support for already.

So I would say lets go with "1) Remove completely" for starters
and if we get regression reports we can see what is the best way
to deal with those then ?

Regards,

Hans



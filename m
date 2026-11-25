Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611536;
	b=XQPSmyx0eBQ3GHWVhvMh/QVGSzQ3A32iO/9LcFZVXOt6bcw+6LNISqhpkW///vad6zlA
	 DvjqkC8wbezS+BYNqYOpc3VQOKkkYm1DJO1PcsQB7av/TZd/6iXS8d1+xkTZIkrQ+AA2Z
	 IsrDvYClfSzJ4oKGnyHua7btIsOTKU542d+3sE62LrP0+ioupMCQB3talnN4rUEWifVcr
	 aIMS3njBS2MSmXd17pmytItYguBnwcEgNadIq5nHzGtE3m6B0Q3yYJ9bn7HYnp+r6ooGm
	 7vY34Vnn17+xUwSad8OQhl8zkuOMIyyIIVAbISnQh/y+mlFauEldzNSP+pUPT+U6C8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
	b=X0YowTleqRFVGB6S8tYqgvfMDySF6i8WJux2kvhsKaXlg/caSu7fZCH9dm9LFzJJWlPZ
	 +7Pq4jfMp1HxLynRqUll7f/TTDG8qH3PE2vMMOpE4OWuCbH12tp+/zPDN93tlmrhCOw2G
	 VDMLkfFYtRyP1aYTI6Veo35NNF3mz2oyRv7JyqYRWSMWQuJfHBbwlvbq7ArSO6DcXV0Sc
	 3EKohYO4NF7n7XZ7a7eQ15CTF0KmZkn/ZxlH16G657pRXVQlbVHWZwuU79ummVlqsdhjU
	 E+5SNsZfupbRCW3jADpbJmmqTKchOfprAKuFa2tDNtbWxymwwaXcKLyNrBosaqX6Sfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="p/DI/Nj4";
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4C6606A338
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4C6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p/DI/Nj4
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4716d76fso574323e87.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795611535; x=1796216335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=p/DI/Nj41CvRYVlg9y550Y0THmM1nyk8wmWmigoBB+no6LIx/8W+/VK5+p+oIzIxAV
         eFHUc07Hrx+FpwgNuFpWhO4Ju0QZT7jUf5PVOoTG54+Buo8ByjNf9BCMoAt19CwDkCSt
         Y3fcyPH9dmUmWj5j8c7JyZD8BwuSv9ul+tt8PyFloswbKfmoHFQCUfUlLFNtBtCo4/Re
         rup0AXGG8sR6XOufLrnxiZ/vWv+Y8nMO72jcepwtKCfnraOwNDFg7mzf9ORl5OtVlNk9
         cOpKycv0rYpHdwHEhOIepEKfsDDkWPUwiiklPFa5VKVzFglw3f4bzE/08DR3MkmZ5916
         FOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611535; x=1796216335;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6oxRIu4SdFQBMsaAB9eGVbDqvQ/rHbglgjh0h20EkM=;
        b=rcazD+4ydstgqeZFJ3a9Hujb69ovoCQcmMHbYbnsZbs9OL1+C6yiTYhR3O0yo8kQYN
         36mnQJylMtGFpAheODu0jEhMznsfPX5X4ytV7gfY4NvGJAYASG36pYLH4+lFFGsPZjWW
         yu6Q98pyycTrypuELCF+I79dmdm9J2YNhjKcuoXm8RvyKAmnM0mxgL0nB1DbI1v9/d78
         vGUsWjNbXQclVi15II9mYphulAF+ZaZ96uoM/gvfRIN0BT5vhcKLAqkf2GXLMuDGOkH6
         ZXzlReDH8pVO5tRa3YDWyuIrsadw6XlP8eIldIWpmPFPwQ8k6YEqDClNheJnhKm89q/+
         606w==
X-Gm-Message-State: APuU4Z9wFxTow8cTLsO4E0iR4BSEC1jRIwuATLtfDGhJH3StEmt0zdwW
	GmFDYIh3DmCmvlEDBbYuja0F5K8zZ85eTMNgiQsFV8m7ATFwcyZcoZ6+vM+Rd/toorY=
X-Gm-Gg: AZFdTZctWlKl0omP2wD0++omSF3EAy5uWefdAbDf8vs4MD7jIKIcCmXcS90AMYOc3q9
	f5ucHEPV86PqrSqqVtAwWwf4UD12c/4NbTdkSZnIo/is99rwHI7uNX38OxG+FFB+vJgJMFDLfo1
	cvdMH0Dm92ThVZ+iU+HwogDPXIDmYsSbwbQkFJGtVVLdKrw58hA81nmGC0hIaPTDfb/OYhfPh6T
	7yjnuwhnePJ6YJNiEYiS/S8WR7INS9hk73WO6fo80D7gqOAr25c5s3oL8JdY8aRFJ/W+a5JD9Wd
	+V2CRz6vn01uZjkpuDkTUbnkVIbm8mgzzZG1Y4rKzP5LC5L4Pc63HaZvq4fJwbk7T6CWjw9An4o
	GPlJju+emTAdYO+EP3bnosxa0N/bGtq9KU224L2O6a8kg1X3PPXqbpEIw4ciHQeCde4UnUbxNLG
	jaNX+5Bk/8hFGgndep61HdhANcsG6K0n9bELC84b5QctdOQUXcsVO6csTkRF4D405cW8AUxF5EC
	B6Am4qTmlnzzJ/vBB/eUuLUkSsjPTLvMFLWv9osPM0zD/zGFB9l817B85WAQS2r52UHTfj3srq3
	hWXq7DJScZF6zSveYqnIFhhch+LvzCl1S3rpMwErFnufPPZcmfrxOyOYIPifMfjQYSHbCN4iYNs
	OS4y4TS4=
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id 2adb3069b0e04-5c1bc75212cmr4845380e87.2.1795611534560;
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff87c8sm4512834e87.19.2026.11.25.04.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:58:54 -0800 (PST)
Message-ID: <2bac2b46-a124-4f41-8a19-7dfe1c936caf@linaro.org>
Date: Wed, 25 Nov 2026 14:58:53 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 14:29, Gjorgji Rosikopulos (Consultant) wrote:
> Hello,
> 
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>> The timestamp reported to userspace for a V4L2 event is taken when the
>> event is queued, which for an event signalling a hardware occurrence is
>> only as good as the latency between the two. A CSI decoder able to latch
>> the start-of-frame against the system counter knows that time to within a
>> few microseconds, whereas the interrupt handler that gets to queue the
>> event can be hundreds of microseconds late and is not consistent about
>> it.
>>
>> Take the timestamp from the event when the driver filled it in, falling
>> back to the current time when the field is cleared. Drivers have had no
>> reason to set it so far, and every in-tree caller either uses a
>> designated initialiser or memsets the event, so the field reads as zero
>> everywhere today.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>   include/media/v4l2-event.h           |  9 ++++++++-
>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>> --- a/drivers/media/v4l2-core/v4l2-event.c
>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>   	wake_up_all(&fh->wait);
>>   }
>>   
>> +/*
>> + * Hardware able to timestamp the event itself reports that time in the event,
>> + * which is more accurate than the moment the driver gets to queue it. Fall
>> + * back to the current time for the drivers that leave the field cleared.
>> + */
>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>> +{
>> +	struct timespec64 ts = {
>> +		.tv_sec = ev->timestamp.tv_sec,
>> +		.tv_nsec = ev->timestamp.tv_nsec,
>> +	};
>> +	u64 ns = timespec64_to_ns(&ts);
>> +
>> +	return ns ? ns : ktime_get_ns();
>> +}
> 
> I think it makes sense to add an additional field for hardware-based timestamps.
> Converting the timestamp to the monotonic time domain introduces precision loss,
> so it's better to expose both to userspace and let userspace decide what to do with
> them.
> 

I support this.

-- 
Best wishes,
Vladimir

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635560;
	b=Z7IsyXnrgKqqSO5IZHQ8059dpCqRkygbPd7ZnP+bCmXEpSz0vrfhQB7RAHlzCuYCFZQY
	 RaMXEnOzqNDSrJANhKM25XjRVdfCxo4Hh0F+teuSZzZ+2VAZ+xkMtoNcVV/vMZb+SE0TJ
	 J6HAhz7mEYSHMW14ayN03p9nJ1HB3WiuQHpP2z0fjVj/o9KSDcWCRsljVWV5F7ioa/nUI
	 hBhwWdmstY3yfbDjvFRQbnB3Up68ncFAd/ge9abGa4UJVgJNB2uvtI3Vzu9R83CtKRbFJ
	 8MCV1EMGuHSpqS4KUNXcz86Hf84fMBS9AsiEzlXl2Nw6RjW+a5u6W1GnD/74sZXg0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
	b=I4Fd4u0dH2oygBjGkNVy1GQ2/wNXw8hoyW839FEdpRn9DgBT5PQHMDQxJK9MA6jtRIGx
	 A1JJDz4vZKUxyjboE54zfCJPN3XykiRcT6hHnA7/wFXEoeJJ86ATlHH7zHafLVBbTAcYq
	 FACPIUXeOfRTB9MPQxAvA7SO+yGrJYVGx/cd0pNL6DPWsHvek3yJDIqpol3mXdkoGP0E4
	 Oeb39+SELkY1fO0r/W5uZzhWjFfiMCnH+CPk8IfSKXz5/u50xtqoTPd9NZDmlHEnWzIx3
	 4EBfKsWNOK0fPjqPUU0obTMW5wvawQm9J3nrIvWJ/XFF8Vyf2DHAix6tb4Kd3FigIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE4606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pZbTuoUd
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso5248411fa.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795635559; x=1796240359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=pZbTuoUdSAJLh2Oer9e2HrWRgMZr5zDSucwcrZtOXNa6DID1VfY6xiJQp5apWyc00Y
         VWI/5GbqOnnPIg7XU4zeJqme1N0+sRi7RY1Les3CkolXNezn121ARAiuPAba8ACYA8Zv
         S1GFWiDvULRpDNMuIKILBNBRZitruRtqf9JwsagYcrOQiAsDTuIL6ew6WlJi9CrEvuzS
         p7ufqcekp1JSrjgj1TChFnTakdZ11cS68khCZ2LxiVxrJUOiXF63bmaY9Li1k0ZFG21M
         pyRXQtfFHhp4tyvI+Q8BCCMkY5j7PIyMsmmiZv8pmIn7EYwQRX+0VjaC5aw0g74yLNXU
         RIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635559; x=1796240359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVx5Gqftnjtyz2vbbCDAxrIo5XSl3YV5aN07+6VrgUU=;
        b=aiR6YvmZE87mo75Jg8K50TADsi96ecHzcms4io/nJvNAgEnkLTxm4GSFgIqoP4ty9M
         8LU/BSDZdj0LJbU8MwtzKeHKRwvTwroQ2Bf92KKqfFjXILyizDA/wJE8nCaKeylQqlFp
         asdfsVanKA4gBgdnrl5/hgOLhwOh4dOqnF6PL/M02nAAxoFRvQa54twkpxM1EM67wIV9
         J7k7NoG8Lbzq+PmpPb4ehXr/lef+gvKyaKkCfP2fqByE13n1J8FClKuvpeRKhgBi41x0
         dqd0NMesD83GqW0cckNnfceWTXVjCe2JjtISuGT4uVIPA360S28XlOvovuUlpActXejX
         7wlw==
X-Forwarded-Encrypted: i=1; AL+hErFL05V3tfaSDlY5JTWBqzmU0iNLsnHqV1RiMgX7QG1c1A+9U+QLQVYn2C7svEYsKQ7DLU0jxk/OKKvFiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/U2qUmCIht2tNrxp+LRNsNj7QMmg4jRz9qEIMn/OitG8U62Qiw
	/XditPnVXu7cnUacz5MmHFRqJGnULxRSBxmsvzVzwyBP+cqomg+UVsT1RQjrnpun1FQ=
X-Gm-Gg: AZFdTZd1IgaEaXdpy06yY2dKSO32NVSL1LURsC8l+NmCXZx5hZdsE5+iNXgj9mf4wPC
	Z8csGrYKl+HHew6ZG+aC3mNdQ6ZFsyzbImjDRPEd0mbf82l1L6UwnHdOlM5DSsUqvKbdrN1zXhe
	BccZUBpOz2LLlYx1cgfVknbF1fxt1QeZXv8KirQEGzbxBhK9kDGy8A5q6MPrGV9kMj/G8xZxziR
	coJDKYbknjMJ9j4KutNn6f3bgQSV6rAglX0m/4vt/T6l6cZKdupTAP9Dz7QWsS2Kt3FE7xZsse8
	BuWgY4tIjMwKGLo5VsVRY3sjeR5x08yeJtzuHweer3TEV2zHiCYTH3SnwqcPu73O/LNcQ/Kgf2a
	OYRsupXwcmkAFydwhrS1zk4fmGnfcF+GRfShn5nMWD+VuuxF0Fk5Z5gXagupX7Pr42yXttCd+h5
	ePESRgiEY0lvT58SOP1MaNGR8ry1NPIT0rYvCqipbD6tDsYTmMB5ChWRecqObiXDMWHAhx8NiN/
	89u1ZD0c9nnF75NBmkeqpFeTkTbKISYjw3vrWOXtNDDDgE8rH7eNzYXrfRUTLpWmNzXH0sIp9P7
	L2lqBMfS8ExnuSdo+l5DTdKSO8Yc5hSMU5Mb8kw6Fi8QYpI0xFH9HJ0/pF0rCPXbAMWH0GAlUnA
	tcfVqAd2i
X-Received: by 2002:a05:6512:1048:b0:5c1:4e17:1ed6 with SMTP id 2adb3069b0e04-5c1bc80fd9cmr5765974e87.6.1795635558529;
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm52215571fa.12.2026.11.25.11.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:39:18 -0800 (PST)
Message-ID: <ff986bbe-7cb6-4733-9f95-bf788f4f1f07@linaro.org>
Date: Wed, 25 Nov 2026 21:39:17 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
 <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-35qT9Ow8SOWWBxf75geq6s169+SPJmw27TnkkD3o0wow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/26 15:21, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Wed, Nov 25, 2026 at 1:29 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hello,
>>
>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>> The timestamp reported to userspace for a V4L2 event is taken when the
>>> event is queued, which for an event signalling a hardware occurrence is
>>> only as good as the latency between the two. A CSI decoder able to latch
>>> the start-of-frame against the system counter knows that time to within a
>>> few microseconds, whereas the interrupt handler that gets to queue the
>>> event can be hundreds of microseconds late and is not consistent about
>>> it.
>>>
>>> Take the timestamp from the event when the driver filled it in, falling
>>> back to the current time when the field is cleared. Drivers have had no
>>> reason to set it so far, and every in-tree caller either uses a
>>> designated initialiser or memsets the event, so the field reads as zero
>>> everywhere today.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>>   include/media/v4l2-event.h           |  9 ++++++++-
>>>   2 files changed, 26 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>>> --- a/drivers/media/v4l2-core/v4l2-event.c
>>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>>        wake_up_all(&fh->wait);
>>>   }
>>>
>>> +/*
>>> + * Hardware able to timestamp the event itself reports that time in the event,
>>> + * which is more accurate than the moment the driver gets to queue it. Fall
>>> + * back to the current time for the drivers that leave the field cleared.
>>> + */
>>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>>> +{
>>> +     struct timespec64 ts = {
>>> +             .tv_sec = ev->timestamp.tv_sec,
>>> +             .tv_nsec = ev->timestamp.tv_nsec,
>>> +     };
>>> +     u64 ns = timespec64_to_ns(&ts);
>>> +
>>> +     return ns ? ns : ktime_get_ns();
>>> +}
>>
>> I think it makes sense to add an additional field for hardware-based timestamps.
>> Converting the timestamp to the monotonic time domain introduces precision loss,
>> so it's better to expose both to userspace and let userspace decide what to do with
>> them.
> 
> There is no loss of precision. The timestamp is actually more tightly
> aligned with the actual event. So I don't see the point of having two
> values, with one being less precise than the other.

The hardware produced timestamp may serve as another unique id associated
with a data buffer, under the circumstances it might be helpful to receive
and rely on this kind of information.

-- 
Best wishes,
Vladimir

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285085;
	b=I/aCFyyM54NbC8jo3Pv4ppNdwZ8y0PZHFhfGy4QLraMKqjXtrBcHYjJ1bBXWug0VYnFi
	 L3BiU2hmcBIPHjH+tnkTImLCP4wL3vlwbOkmBSDEItKeAop+o9Do81yV2u2svrDdcgpUS
	 SvQU1DoDo8Nnrzi2AokoYBYsjHOzrfNQnehUr4grbWCY2lz5GOqMciGQ2GD6pTNfLPv6C
	 BU6KL7P4ul6Nmij45Vq87qBNqII1s4FPyKu9R/Td0GukKZu2YXtZR6WXQ9En6x6fv9Aq7
	 KHr45X3Dhz1n81K9rYUQm8c3JrRY1lYMSn2lEpEk3fsWrYeHPZ9TKvmL5oOLKaTWiDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VXJiIJztfvKEYzgXyd91oDviaSHCAjxYzQPx+8XFimc=;
	b=p/ErR8igLByMpe8yfZalZ0lMUWDRUhfRR2knbzM838SHpI9R6liie0muIe8OWVIhmHDx
	 j/N+zlIA6Wy+OZ2O1HhtykxcJSUD5PmuUL0vb5hrluFgwDSrQ5DISjNF1gRRmUtoLmJ/7
	 yNBwR70G6GpqpPrNakCdoPOFaRWAEuZQOrmjHDznrpv6ENZCINFAiqJn0nvWrnT07jdnF
	 ssQO5Kfmxz9PvW47DrgV7iyASok06uPngtAMMMp3sNKJUPqrTK8pbcLwZO5qP9eKmEYBs
	 obnvmEzZiwnA2keeE36IDhMDxCKQaXeBJbRsG3LzYcaCHcvYYGwDYjC0cMgqBN9IHUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f35w1GXN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED9E606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f35w1GXN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so19902295e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793285083; x=1793889883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXJiIJztfvKEYzgXyd91oDviaSHCAjxYzQPx+8XFimc=;
        b=f35w1GXNb+QP3vb1z/ZT4B9wxGtYH3rCUt78LQMgmP14X/rgFyiKTLepY9jvV7Ntkz
         rolvC3pUztbkQQFX73wE06y9kP00UY1/mHlLshrZUbGqmUrPAIF1IZZGFFSLHF1HeoaO
         meNgj5byKe2ntEP7bZOmVVl9z/8qWRTwo8R9XQFOq3brfm0pntzSg2oTHi8YB3XfDabD
         czmZ2dSvLzi/f3IlDItTAHSkUfm8wnR4HG237kx889Q48ee3Eicf5UJnNVWVTRKD8V2h
         LsHO9hTjEZa34zvE8owpPVPwNOpKjX/Cd0zF1Ma2MfXcytH+3pirIJFUbvFBF8ekSX05
         VQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285083; x=1793889883;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXJiIJztfvKEYzgXyd91oDviaSHCAjxYzQPx+8XFimc=;
        b=gRCeRm+P1r02jSahg4PSncPr7QxmSJ5IukcEpPN0+3GNrgDqG64apIc9EnReFMxNaK
         A5u6lmNkrD5+Jjju4GUcBC5UZ2xeFU8JKsPVdB5lQ1JCza1NInPybJxbiuu+bi8TTR7f
         WoQDhC9raw/MHuUHfmm+hfycWFGqIo96ffilhzM46QGTSUvNCrdhe/70eItUEgk/g/Ud
         +GUBzQqfnhG4yPYEq56Lwgma833SdOzxv4KXkTfiiJ1y9HzWKoqyG4XZB/ZLsa54A38H
         2thEwffcYYLQ40awtyyf1EDoLbEpgzQy1CIQUv3b3jOjoU11OY9yzyaqaGJk/2G/D3vK
         CZkA==
X-Gm-Message-State: AFq9FYJwaOVn7urgu2s6piwvCWdFvAqmjQIfIH+NKOBpD6GvQZPkAUjc
	dTgljaZ6X3JXZXzdyQ9FNn8VKBsptTGHNi4R+4rcTrHGtzi0yg83h8wvYm4EMGQ9h4Y=
X-Gm-Gg: AYBFou3vH/6CvnoITol7fRZst33WBeL+xkPvXZuOhrSCo6noPMI1ESWrKOsevHLDqI7
	qFVImjNckuCM76bYoB2WdVsxHw75PyMvzSyj3fRh7s0GPDIbDWRKcMXaWmNdNB5C12+DY0Yyl1H
	QMIHna1Zpwim4rSbOkcv2hY9pDQ8yWN8NAgsEbw4aJr04hMxD7o2fD1K/osgkrwYLmZlbToImGB
	Hd2dd0o0vdYR6eWgIzmGSbnrw4e4raD9l1TA27XLroGmaCcZZSx3E9PmtDIeNm6ug8xaJY3yIyL
	792NtAhdoic8TGedj55PliJ9rGRzP4nnK8bWtcGr1DUwYgGUOZrwRh30dccVLzHWwpYOqmc6eh6
	0gBlBwf/NsxIsn0PTgVIQ+KBl5ltSrqu+pGpMgzj8O6s2hDnlG0DhodouZ4DLFUweiBteoh25ex
	sE0uQuRr5FolInDJB9478BrlpY8do4bqU/VyupcFBVzW413IIBdHas6AcbfYqfNJg05YlDzvz4m
	k2sZZLjxXiS54pEVjIG8JAGjEXGPY3bKvXtZ4WkCnRzh0RuInvvFJYlBEJZS7gbjidXbkFsHwh9
	Q9M22q4HUglB/EVUmK3/EFYfKYORnXW+p528m3dA
X-Received: by 2002:a05:600c:4445:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4a9674e5f2fmr123956765e9.27.1793285082985;
        Thu, 29 Oct 2026 07:44:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a32eef4sm80961585e9.3.2026.10.29.07.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:44:41 -0700 (PDT)
Message-ID: <22d2cfcd-045d-48dd-bbde-c1ac2d958737@linaro.org>
Date: Thu, 29 Oct 2026 14:44:40 +0000
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
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/10/2026 13:28, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 10/29/2026 11:55 AM,bryan.odonoghue@linaro.org wrote:
>> This series enables SOF AND EOF event tracking making use of both events.
>> Whilst the code is actually very simple the functionality we want to build
>> off of that simple code is not.
>>
>> - SOF
>>    Serves two functions. Firstly. Informing user-space of CSID SOF events.
>>    Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>>    User-space wants to capture this trigger because it allows user-space to
>>    better align the time a frame begins to events elsewhere such as IMU
>>    event timestamps.
>>
>>    That functionality is directly applicable in this series.
>>
>>    However we will also build on the SOF event in later patches to allow us
>>    to begin programming of shadow-registers for the next camera frame.
>>
>>    When the EOF event happens, we switch from one shadow bank to the next.
>>    This is only possible if you have the SOF event.
>>
>>    So SOF serves the immediate purpose of timestamp alignment in user-space
>>    as well as the 'evil plan' to trigger off of it programming camera
>>    parameters for the next frame.
>>
>> - EOF
>>    EOF even on its own is useful because it allows us to increment
>>    vb.sequence for each frame as per the spec not just when we have
>>    buffer-data.
>>
> It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂
> 
> I would like to share my opinion on tagging vb.sequence at EOF.
> 
> The EOF event is received from the CSID decoder when the EOF short packet
> is decoded. In contrast, buffer completion is reported when the write
> master has finished writing the corresponding buffer.
> 
> Because the processing pipeline includes buffering and line buffers,
> buf_done on the pixel path may be received after the EOF.
> Conversely, when cropping is enabled on an output, buf_done may be
> received before EOF.
> 
> That is why using EOF to assign the buffer sequence may result in inconsistent
> sequence numbers across buffers.
> 
> I would propose:
> 
> SOF
> Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
> for userspace.
> 
> REG_UPDATE
> Once REG_UPDATE occurs, we have a guarantee that the configuration for the
> new frame has been latched. At this point, we can iterate over all active
> buffers being processed and assign them the current sequence number.
> The bus-write active-status register indicates which address is currently being
> processed by the bus-write engine and could also be used to detect frame skips,
> if necessary.
> 
> BUSWR_DONE
> Complete the corresponding buffer as usual. Optionally, we can verify whether its
> sequence has already been updated. If it has not, we can determine how the buffer
> should be handled.
> 
> This approach ties the buffer sequence to the point at which the frame configuration
> is latched, rather than to the arrival of EOF, which may not be ordered consistently
> with buffer completion.

Come to think of it, I'm not entirely sure an EOF or reg-update 
additional variable is required.

SOF.seq should do.

- Reading SOF.seq @ crop is fine because the SOF.seq always preceds
- Reading SOF.seq @ buf_done is fine ditto
- Reading SOF.seq for params return stamping is correct
- Reading SOF.seq for stats frame correlation is also correct

We want the EOF signal but we don't need a second seqno to accompany. 
And with one source of seq truth we don't need to change the point at 
which we latch since pre-frame-drop SOF < everythign else.

---
bod

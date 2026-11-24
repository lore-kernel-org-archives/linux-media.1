Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520876;
	b=jXCcBWXKvhtoe42BR6FZ8tLIKeKiUTq/S36zj9bDi5eEZU0mwvLW1hjvVLOFIHbf8W+3
	 GyK1HeNCz1P2FFWzrV9S+xT4+GqzXlV9kYAmP+ZU119sPgM9EpYVpNFcN3Ilihy96jZL5
	 Ovz++LsaHtif16/KuT/GVai7yeA48XoVqJxsmEvyvhh1mJRcbBAsA+Ov+OUQRJ1UtvZbl
	 exaeUvqHE4SRJqk1VmZleUlgAFaKK0IH6zcIxN1h73+w7vtEA2AhyGwBpnjXDNjv6s8bR
	 QX0CIVR8PMbLcc9qwFyeciqRS2MHosgosWVphwz5E9eMTl5zkaBWsvRog95XzJWBSRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
	b=LBT0kF3Uh7urKzM7ju+SKQeL4yWBzxThNHZsJUL0DhWyjju5XZRwWQVkqZkMK7rVYvmH
	 g56AI6GxZzXUHRzB9UnOPoYkJQDtauyI36uJ+7o5LtXMVa7bv2syMfQqmguyMlDRej90V
	 WDpNwTz26scRgR/oR1ysgMPPn+DfRCbzvzTYVqDx/TS9++OK+ichb2tzFyoY4u2Q24Sse
	 SiI4ICFUSO7o0E+OVpbgp1t25WN9nZvayPmFk16ffBqnNYTGi3tXte/an3/KTu5u/jvZY
	 L93DFIzZdCl6ruJgf2+/1v5F9aUuZjk4jw+3JelG2gUS3k//WswOhmfFuVw6pEf3JIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mek0rg0H;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CB3606A322
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CB3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mek0rg0H
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so4028725f8f.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 03:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795520874; x=1796125674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
        b=mek0rg0HoMDQQWqq3r+W+sp1S6saVIYENtmuVRsWObbg6ISEyXh7jzBRMYFADOwxT6
         uZhHPGi2/jy225RsceAaiHdW2kehAopL5/4UNRFFtcWVAZZ73SIKlUYpCoujjBoaLg2z
         2E10xdXgjgvnkA3mjDmbVEGQ1n5euxXYgZn5ikrml2L7HY0wYm63dVT7HIITxkGFNMSu
         tbceSaVfgNMvO/btjSHL5ZaIiP9CBj0wtxDutWgeVQO4LPxUPnabrztcBuPD07NP/uHk
         D2ZUnWrLl0Ne+RwfXmUH3JQb+whItJoxQY9K1jEjgguj6blAkvEtdNvS+pfrxxUQNRUB
         kbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520874; x=1796125674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY4X2427yKwcvmSccJzJO+cyNWHTwTN9g9RJkbIPSls=;
        b=lH94pAjiQEkgBtGl7xTkyqfEr9X2hIhRsLOl3vcBfq0R+HptzSJEk7WZaTvNckswvw
         RKPjYL5CVJqwsxM0IgJ9XqRRLI2d0nKaL5B3WDDAE5HSZUwUq+277+VoSA6CvivaL/bx
         p8nEr9fiPUgeZchQxgam2GTHxGmnavBUblNnETfETHK9zb0b5R9OP4cFcOJ7RnqdK741
         IpSGAzqnj10yGRbMcWpX7AmDaifYo9fI/tib7nyFBXQlGmZjvsFoKMF2uUa/B/d4JFHu
         hKM7R/j4jguISP6FXcUYe8UMSGfxUe/3TlyA0cJJjLe8ZxzUIFS6BAQZblzmlIUEtoCq
         dFSQ==
X-Forwarded-Encrypted: i=1; AL+hErE6qRdVE+MNbpdda6p1rgYQara2gqGVKQL6fqjg2I0nUfRZf+nskZEJ3S0CDJuUZBUc4vlnmyT48HXFog==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JuFqj5+ZgGlIuIOb0k2p9hHgge3oL9tpdi9NvHDYyBUA0M355
	uYacuB8zFf7NBDT1cCPxarBVLMYLB7V4eLZn00mlkJe3EtLg2hlrjBzzUx1K0fSkMH4=
X-Gm-Gg: AZFdTZdjhWWs2NKPeGjaY1+FdVxnxAWbx1UQacoMK5JanqyZIawhqDIWQqeuPdAc1eI
	wtP/ZzpUeK2g/oSaK4I+t/vd20ZkedOEs+5JIDO6qZ9ZYHinWqcMB8sni5KLVJGTCzWQ8+QtFXG
	vzq7sQ1iiwx9EGHo8Gu1mkUZvRBAw6xUzOMwgO+6VdreXA2QbXp62h1VpHRt7fG4CBEpuMjpPXi
	+Vy2nbS47Qt3apK9mXOtEJZhI5gAhbVhtde/H/zinbp9kuiiAfuzTn7WM4phiyTOmVl3hn9EEd2
	tQ/TIETLVIk3kShpx5bjwRO2PqNl7GXjaM/RWtB4qMa575tUhhs5bu6qiQ9l1Ru3JWw8diSXDqS
	LJvvp8zwcKatSqH72jbInUt321yW0PxJvfQS4Srlft0eqN/xGIbNq8xSBD+VtspbxYgs4T5w16q
	fHtvYizKLQRYIUMHKfHbM/ayOGCTECdA1/xRZi21oc1HHrBE5570+25Havc/uj+BgJA69nJSNAj
	uOwNHByDp1dj9+E3dkP23zckIZG6y+sFCmliTsJoB/tF2vywoAA4DTItRks2DLEOCzTnHN1GZrw
	kS/o+dJ5aqzx6R+6SX4elgXqgFfb2fqDvfI7l0QG5D5r
X-Received: by 2002:a05:6000:2c05:b0:48e:870:7791 with SMTP id ffacd0b85a97d-4abb18cbe21mr28231125f8f.26.1795520874481;
        Tue, 24 Nov 2026 03:47:54 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm3362842f8f.54.2026.11.24.03.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:47:54 -0800 (PST)
Message-ID: <d695ccb6-f8f3-40fb-8bb5-ba138bdd0814@linaro.org>
Date: Tue, 24 Nov 2026 11:47:53 +0000
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
 <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 10:21, Loic Poulain wrote:
> On Tue, Nov 24, 2026 at 10:59 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 23/11/2026 17:16, Loic Poulain wrote:
>>> The CAMSS CSID latches the ARM architected counter on every start of
>>> frame. This series exposes that time to userspace, both through the
>>> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
>>>
>>> Until now both were taken when the interrupt was handled, or worse, when
>>> the frame had finished being written out to memory, which is about a
>>> frame period late. The hardware value is free of interrupt latency and
>>> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
>>> with other timestamped data such as IMU samples.
>>>
>>> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
>>> having the core take it. Patch 2 passes the SOF time down to the common
>>> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
>>> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
>>> uses the same time to stamp the captured buffers.
>>>
>>> Patches 4 and 5 are picked from the timestamp support Bryan shared
>>> earlier, with patch 5 adapted to use the conversion helper added in
>>> patch 2 rather than its own.
>>>
>>> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>> Bryan O'Donoghue (2):
>>>         media: camss: Define timestamp registers for csid-gen2
>>>         media: camss: csid-gen2: Report the hardware SOF timestamp
>>>
>>> Loic Poulain (4):
>>>         media: v4l2-event: Allow drivers to provide the event timestamp
>>>         media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>>>         media: qcom: camss: csid-340: Report the hardware SOF timestamp
>>>         media: qcom: camss: Timestamp buffers at start of frame
>> So I was offlining this change and kind of left it at comments I
>> received to make the type of timestamp selectable on a per-buffer basis.
>>
>> IDK if that's really required for a first pass but, its where my own
>> reviews were left at that time.
> 
> I can imagine this being useful in some scenarios, but today the
> timestamp source is configured per queue, and there is no userspace
> API to select or switch between timestamp source flags AFIK. So I
> would consider support for that to be out of scope for this series.
> 
>>
>> ---
>> bod

It's on at least one branch I have its not finished but on the way

git://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git 
linux-next-23-04-03-sm8250-typec-camss-qtimer

That's where the other two commits you've picked up come from.

Please have a look.

---
bod

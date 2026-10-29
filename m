Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288869;
	b=B/ran7coNjugj02wWi6uQgRTD7kx3MrARG9o6zVbdA7Vi6YUhEI5wWJHdfPebI2/56yB
	 4UinqUJiyXEw52k+9bxNVzrCibmw/RHrCW08MOxwvjjGh8xOaNCy03dDWFEW8aNkfMPZz
	 t1SbWKu4zaZryk8hTfiQE8/OP716zeAFMvdUcWMMdpYiYJYDlqABJJtWhIBgj3gHdPpqk
	 EYbHaCtc8ohY4kHrH2VHq8uz89i8HyGgq1kDR1bRbehs5VZzgv+NszMOwEC9WcexRESxw
	 oNiz8zJcUnGqhQHTQu1E0dV9BwG/T+lnfpzsmeqyOSwqUTxUBELsc45YwSTG/HF56NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
	b=xSK7BKsfc42PNdbWDBVUvQrUKv51VspQTp1uQL8kvJsgkHx5yE71KecN4af179OrA3R7
	 ByMNtet1XiJuPEH4WWIqOpDwJG6SbXeQbJ9kpwHtEhq34u3HSnoWVnQC/jYMelHKTu2VG
	 2gsYxQ63rrvHtK2vKbRvCrljcaYvGo9a0D+zc2KRrA6iKnaPqlqOi5rT/zVj4gtKkgK7d
	 nk38ypwFVh8QZoXeFJAmAjz727f6MF4G64WcpS66vHWdPX+AtxFKAA4fZsfFKo+C1f06s
	 sTwL3apCa4qX5lAuumyshg8mDsoNZ/7dZK/BbGV7v8QVyBC2YsHIhYjDPvyssQuGHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KSwjS1wy;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C3606A32D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KSwjS1wy
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c46822eefb6so298710266b.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793288868; x=1793893668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
        b=KSwjS1wyFZZ0wmUt7u/O+xAKuUIlPR8di9BtQxjno2CwsgUh4poj4+MFpIlSeziGb8
         SUYlPuXpDxk2dhQu1/2Uh4gaBh+UB70pg/VgD2V/QMbKvypYOgm8Op1mjXhha3JQ4Zr8
         KivtJJ+TYGcApPb/6StRX2AQneR+Lh5B9TWbyOyUY2VhKvWLQeS6kAMovaM1byI0CvP0
         UZsLZEHmiuyGa8f2JwJu8lJwULONhI7kUhFclX4vWj71BtulpM416/M56H98HF7/eaZN
         tOF6pubgIFNpj9vAj+YG0AMiGqFuGtiy/UUMg3newc5piiEm/dtpD0uPj0XdFHIuJrq5
         5fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288868; x=1793893668;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
        b=LH1ARTqBKIJwx+MSmcC6cZPEQwSZtfLqSMxdKYp2zQA2xA+BMDp15jO2//9dhdO0IO
         188c45YA1NPvAwg2zB94TQUNFtMUbXvk/sFH6h7qpsDHl53mkgZQ0PinwoiQ1dl8d+9l
         rR6OU8bLws2X/OpHLcplcPtz8EC7L2bv4jjv24RjiXy/PgCuaQer4erVrFlLnnMjef8R
         BiaUxpwTgjnOw5kGjfP+6i/zq28ieZjtnmKcFfZrKKj5NMABpe+M6cnfibpN3fzh6DHU
         KZljuid1CjVhaWYG9VynlfzGBFISKEQwiRBa9blbS6rBkdH24+Cs1ruv3966rgHsK5gl
         Ckuw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ0o1Ybs3gcAgq4EaTtDF81sfTJ9Mp07jlDv/GoUFE4V1tGxCpOMhGuVWKwrgWQIQ5kf5NmyX16gV46A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdR+f0PUIaxf7FHalEDF4heNkhwNAJjgZv0HdJiLFubO0/ZlSP
	p9c7WGmnfjHCvQRPD1Agf6ZgqvUZFA+/aK8lFPmiBQ/GY4etNtRU1+gq0zu/dIHaNAw=
X-Gm-Gg: AYBFou3Ifovs33QRdhVPzi9tAz38jZYj8JRudJAIXCvQL4+hXZ0ktb8ctKyuRXkoCC4
	JmJj7+h7qgvna9Gi4eRwiR4Z0RUO1gioJIXadvT7nsy+Xv89EB3dlyJB2dtoZHORINbZPj4/3QJ
	9i7uYbtaT6kGeLZv8dbvs5gWkA3wLIO3+WQaRoPLXVrN5hakm1ENwYUUzXCO72QdQjUnoSL0/s8
	WnlnttDhoBEYhWddogDAXCYxp8Hj0UV/65tA/6rfzG8u1UiPGV4UJC4p+wb9GZ3zcIa/90eIlso
	iWwEi1bYYF1xFk7nMaLl9BJMWS6YTlhbzdFw60URnIC7xJoxFVdA0f2xr33x0YqA65dCiJTQ/bO
	64IMtALi1iwXpfxbP4UcTpXzNwMDYHklCGMdumT/dcHTj7x0s74qIt9UcIbdcfnu/LEHEjYvhpc
	2jjEM5MbX5tRAyc8SqSOSgjdDKOslqtpJww5oP+12BmnjG4xPILctasO7khc7tBje/ndvSUkan2
	H98MoMh6sYFN1Z7My4CUhq1HynSF3plXs1LKEOdVpGiFltCI3GY5may8ETBA/ksaRxR2GpAlhOp
	gijK07rhRsWmYklTzyzZM0fTRI3DuGvdr3VD4Xhi
X-Received: by 2002:a17:907:cb88:b0:c40:80eb:c544 with SMTP id a640c23a62f3a-c49bdda7123mr536994966b.4.1793288867635;
        Thu, 29 Oct 2026 08:47:47 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca255d350sm8340566b.11.2026.10.29.08.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:47:47 -0700 (PDT)
Message-ID: <a1f10794-d816-4d52-9868-2fd14b02d5fe@linaro.org>
Date: Thu, 29 Oct 2026 15:47:46 +0000
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 15:43, Loic Poulain wrote:
>>                          __csid_configure_rx(csid, &csid->phy, 0);
>> +                       __csid_configure_rdi_irq(csid, enable, i);
> Is this something that should also be tied to frame_sync_en?
> 
> Also, just thinking out loud, are there cases where we'd want to
> toggle this dynamically at runtime based on any V4L2 configuration or
> pipeline path? For example, should it be enabled for the pixel path
> but disabled for RDI?
> 
> I'm asking because one of the appreciated strengths of CAMSS is its
> relatively low-latency and lightweight capture path. As we add more
> features, it may be worth preserving that characteristic where
> possible. Not saying this particular feature has a meaningful latency
> or compute cost, but more as a general design consideration.
> 
> Regards,
> Loic
> 
>>                          __csid_ctrl_rdi(csid, enable, i);
>>                  }
>>   }
>> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>                          val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>>                          writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>>
>> +                       if (val & INFO_INPUT_SOF_IRQ)
>> +                               csid_sof_event(csid, i);

I considered dynamic enable but

1. The design here is to move ~ everything to SOF vb.sequence
2. Standard design pattern with FRAME_SYNC is to generate the event
    having consumers either trigger on it or not

For that second case I opted to only send the signal when we know 
there's a consumer though

=>

+	if (atomic_read(&csid->frame_sync_users[id]))
+		v4l2_event_queue(csid->subdev.devnode, &event);

---
bod

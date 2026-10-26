Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005698;
	b=GCtUv5cLzoWrZyP4StuW81JeLgB1wKda8fGgAhBn86hkkhnn+D0Z2ujqMRx+avUHG1t1
	 rJ98tttQMqftQ0LBdSGUCKzq49z3hH6svsRHlg8jH3fQBjr1Kgmr0xdLgJXFDtRDKP34k
	 PaTJwB8cJATpSzdFH5VL5L/1KjPGx8FXwJp5quVQBzDgCHlGUmTEUfSr0rFOhXiGEas7X
	 99BvkbCbhy1hbQD3gkGRJinwLONoGM9F4ctDnWfJMlba63GH4iZPZBr9mRSFZleHbnRkG
	 mbxNDYXcQGcZlBnUKtPhCWrS+bo2i/AMwV4BIWXoVGiNVEzh4gBvVwSETM2yX0JFz9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
	b=lwE7ypac4bV85PGYCdBjKCQSkOLWEHc045DIj3OfU4HiA7bKyIKKTura1qh+y+8b61ak
	 AvCAOItV3w0AtCSX0I7g0t8hIsJ4Dgx9NYkAsuvESMfRveOdrEtabu+2+ooF/RLhWquWn
	 JD+S97Qmp6J6r1GIBELPDer5AWa7RzKeUYFKN8P+xq4EV8TtuzN9AJX9w5laqLjWjsosQ
	 fe0HCMgqzGqHgXIsZXfikW0z7w9weub4+9OoTrmnQQ4hdO8EidhpSKfnvaFm5238X23pm
	 oneRFu0A3lW23QgD1Lqd/FFygcuqCmpaFPeCZeLucTWl0idCwl4uU3P3RM23p9xQGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7F606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y4efgHo6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2511775f8f.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005696; x=1793610496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=Y4efgHo6f2uQUfgBu6LlKapCdLVtJ/9Jq2r6veR7FmHxZW0Gk7M/8OXCpxpKXQhH/6
         Hle3zjGBdLBEcSglhs5YSab0EaZ8o3SnJDDtUi1oieRfAVWv3oWJrrV+9foFwo85Upg3
         Zx3M1PZRAv94CambI4tsHrJMj4YqZsRfhhTUsCOHNAMHxByhIxgSr5sEJb8T7dqRu7su
         AEJyUzsY7YgDQt+yeRYNLZHmcuxVAdTeYj3ci0v6t+iqcTgaovEoCOTNUYbTm810n+0/
         40lJIaS6oAn42zLYjtEy65RTllGTSYNG6SApOzNX5JhL+uGbKd2Eq2Fj/7kpbQyQqrQr
         OmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005696; x=1793610496;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6eJIBhWX1USRCD2CgCyvJUw5bujIBHqBINSB1Ts9j0=;
        b=2zEXVRKFnGD2p0ovTh9hR1oVM4jnnc3xaIb9EqrlfWhEf40uFqgb8G+0zKwVTHdCP6
         xZy2cl5BVtQfJ6qs1l5Yq+DRWrcawOrrAId0+deaZaFZAyGNauP9BDIGaZbt+lB67UzB
         DVEdiBteWCHDKcw8/7RLJDVjjUrvxvA6M+mRyZ6ztWSyCYk0bV+NkdiRYePU2xqlY7lF
         rvvyPwljqRy+DscVwld0X7H2vN+eG8XkCkyyR5kllizlEC6/Tffsfb4kFhIH3aEc+XS7
         nYKAGIb16EbUSwxDwVfLHXUTh8N1KoqKukuHTwntmn5Qug8U0NZyoH5BKoANXtp2VXeZ
         5mXw==
X-Forwarded-Encrypted: i=1; AKwUvBwENRlRrBRcjXYpJoQmP9sBlzZQ4fU9YkDHlnKxRUWjjFripw8B3DeXkkAOslRVR1UjxBpWwGio64YpYA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Flat6xPWdQDQqfJGgg0bOQKO7EVrDoCG2S86Vk8/04Ckl63T
	MxvgOopYR5d12cDj3os/eq0l130P5ClSxtctRMIvJ8toC3fxTDDRJq+jSgoYcf7IPObwzZGNdZC
	8TJw6
X-Gm-Gg: AYBFou08fA6CjhkgJIFBkydInsCG2jmp6/Y/dLaC1hMWosjLQ+Th60brPOLRgvLdFIz
	HIGH85/FG7Wy3uwCNjCpFh0+HmQYF6EthVsnwOp8oKqxOOAqXbNGZz11y3vcaGul+k0XXhRYE5N
	4Oqnp9q8/CQzV6M1lPzbO4juOUuAqXrat1wO0kXC1y+fx6ymVDlWFSaIktpd3APkf+cDecxvpzd
	9ZobWzugiIgrfbzNOtlP6xuMm65JqjC6b2z/SutUTwfanplFObBdK34JjeQjC0un05eArKdBpRO
	z0tXJo+xww6wvqI3cIVY9goE/UI4sMm7UB+FLy0/VnAK/eTpf17kPhaGpYA3jagWnsXoiJQSfDF
	AcplgSyS81f+ueDYevTfW89FrxGwCfwpYTnPHF8fV5Bq4Jatt1fRMZrXf3q6O1JB8cn2BRC7LPC
	V75uYMwmvwRf04Hzpu0LtmOzwRPjj5MA8tPvFiJ+ie8Yt/RfR7q0AFlnCVnYyWIhZI/Wpv9OqBd
	MgcCXGgdNJBnu3QqaJd1QtYsP51RFBApDUoqdZScUmp1f7z2boU5nbV1xSJVuA3NnQ=
X-Received: by 2002:a05:6000:4b0b:b0:48e:3473:3c60 with SMTP id ffacd0b85a97d-48e3eba34a2mr10341811f8f.57.1793005696454;
        Mon, 26 Oct 2026 02:08:16 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm16380307f8f.32.2026.10.26.02.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:15 -0700 (PDT)
Message-ID: <476b23ab-4a9b-4902-8d94-541ec539a9b8@linaro.org>
Date: Mon, 26 Oct 2026 09:08:14 +0000
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
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <D2XTuBJMTMPZaGrUZYisimpk5Xwm95Ms6ofRtgYOPmXT-xG-3Db5oAjBKeneMRsN9rp1OCl11piUQIlKIhsNzg==@protonmail.internalid>
 <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
> 
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

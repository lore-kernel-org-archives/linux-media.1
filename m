Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE8CA45
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531636; cv=none; b=dcbEOKktgghwUXzICljR8WmCUsN4pL7Eax7/PX/XEEgxW+m5jRMN82g/HodcFbRSfpPP3fGEiskk65MFUmgTq++9yjIigqqIzXIjj5YomuGMs8Ghp+yigmEGZ4X2FGDKovHG0/VXV79qCY2NXkC80CtyE+lJMe7Heo6WSL8k850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531636; c=relaxed/simple;
	bh=C637yNthbMUvn8T3TsDQxIEK1Jz9TI/2RKy1ek0Ml1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEZF/n7scjTcMM8br7GReOAyQ+3ZCzUTI57LheayzYb8bk4XLy/cvGE/S74g/YSSchRktR6Ia7FY8aJiDWPxnC9ao9NrMiqQKx04nJLzSCG6rCsVgqxaz1P5N3ZbPB1o1uIf4eGMheS7JU91zl9j2IEHF4whGBVddIL05Q+fEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1Z4nW+n; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1Z4nW+n"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39666c7c910so10151fa.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780531633; x=1781136433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WKFOB3y1f0a/8eMDecdjOklsltsKxIJ4YPYh7+XMfw=;
        b=a1Z4nW+n7g+0A30hcKGq266GFg8E5rlkT+NcLCiH9MPZfIvbymxAhKDPHkpVzyAo2A
         RXq+fIav85jUTs8vgvUF2oVgh5AW0LTDbWxWB7YtHPaSzUfDlyy3vF+oPvkUE2BuHq8W
         5N/ksiXggPwhZbpcOKKFhpGgj4joDjTc64W40pw771ucwqkBjlk9TP/bx+GdI9I2PgzW
         /2c67CPVLuXoD/tuK22bxwPzKYYECff5gou/PUDmhOuchxMGoxgf4ZFn5g54v1eIkrO/
         Vu41H0KRWIGfipFbX4EVoGooWrUcREarUe0RzXnuSQCeXEI5L503FDNdt4TdN2XrJhO4
         5ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531633; x=1781136433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WKFOB3y1f0a/8eMDecdjOklsltsKxIJ4YPYh7+XMfw=;
        b=YwR5QPLotsThtQlFKWj8/aw+KQtO5MLcz5Z3LlSom9fTzm/O77TJdRdy7yd+A+Vd1d
         WG3P1Q7P5wfhkCdlIf7p5CUV7A4gnXJnxaLxOI4U+jpNbq7biICHPTGrEaVGe9MrJZOb
         Fz4m79gzB70Hn0XN9z08QyJ0/8O2BheeSLZsRR+O7X+1Bwfqlf0iFAw/OWSWbxZA+cic
         1LGvWl5JR1U7giL2lQ++oSJGcieaeeko0nYSfogkF5W/WrEYV984r1R8zgqBrhp88OKT
         B0X4WUGPvC0NluDv+RXMpDDqL8qWzz3CMA48LbZ4p2cz2ywZq5lxPdoyj+wUWkk6Itl1
         XP3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+fkvNN8Vi/m1/2bu+L0jblsWyEOFFV+myo1hMcmHftFkcgDdLaBLX/j7lpd4szbt4/41G6RSmeAR6XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLPx1fF2qOPw/37Lrh3wVRUkMU/JYEwJQfafQbp/2R44iK5k9
	PtsnMJ1HeSjQ+l/HvCt7QDrlM6F1sMLbufHsKFjJpANqm4AJ5mY892U7l0NFvziQwQE=
X-Gm-Gg: Acq92OEVCMjL3b5eNWg+xQBeZw3z/yzWatgu0m4hTEDMMt+/arp66ta8i+zDRsjUZT0
	LbUrOYYiy1bX0UDxf7UHWsVmyH+5ApNfUkFyzJOf9D2+R8uEaisb0RcUMdYF8nzOAqQP0wp8TrL
	9A+WZMe0DLxnAKEbqCvHB9tmXhPxZBi/Wu+MynmyQ9TT4m8M/Wro/943dyTLzNTU8IDKQYV75k8
	S3kLjIjBt5hhu46FXe7eGTv7QG26WHdMEvQSRMLfd4SWNo6hiBFzT/xpEJXqqg9rhjOr+BigIc4
	mAh1ZJ1dGxhWdAVbbgN0jk/nM11DGG9CJT1mqoD8gO+S9i8PAl13PWiMr9cQm1REAe3FVIJg9A2
	/RP2uefAB6pFiRs3PNeXePu8QXMrD/EFa+WJ4sdkDhhUcTGoxh0qq6VJHprI/sDI+76TNkcyWcF
	naZt/SMElads7w5kjaA6TceCCOrbwtSnZ9xLXFg0qxFeK2BwHtzDjvm8VQcZBBz6a5gcTd1n5Za
	wy64SgPvnjFoV2P
X-Received: by 2002:a05:651c:1594:b0:38a:325a:8a0b with SMTP id 38308e7fff4ca-396bf26804fmr522041fa.5.1780531632840;
        Wed, 03 Jun 2026 17:07:12 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9e1sm12353711fa.38.2026.06.03.17.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 17:07:12 -0700 (PDT)
Message-ID: <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
Date: Thu, 4 Jun 2026 03:07:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/26 00:18, Bryan O'Donoghue wrote:
> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>> described as subnodes, then likely none of power domains are needed to be
>> repeatedly described in the children device nodes, since this information
>> can be obtained from the parent device by the driver.
>>
>> Technically 'power-domains' property can be safely removed, I believe.
> 
> The policy is to describe the power-domain dependency fully since DT
> describes hardware not software architecture.

It brings no contardiction to the statement I've given above, the needed
power domans will be properly described in the parent device, and there is no
sense to repeat the properties it again and again in every child subdevice.

> Also for a very practical reason a sub-devices can probe/run
> asynchronously of the parent device being active so in fact we do need
> to describe the PDs fully.

In opposite to the above this one is precisely a software centric argument,
which should be excluded from the consideration, as well it's not a big
deal to make a proper async initialization, removing excessive dt properties
is worth it.

-- 
Best wishes,
Vladimir

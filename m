Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB9D4C92
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332864; cv=none; b=MfkU6Nz4AV0wwBNY5Hl4S/34Pw2uL0OsW3jHbEyxjoOxBYI5VOuXZtFr4lkFZlXHoVjvADB9EPPJZdIhyqp6A2GcgkDpYo2a0J6lriH9Utu8LUtSeCUmUInbR9Ku/0bKveLIyx2Js3tCPWxIdu2Qn4mD+V8W5mpNKzWH1P1PPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332864; c=relaxed/simple;
	bh=O9XWIB7s+52lKhjPWNhQX2ou/n/o1lKkV+vDmWxhH3U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gRtgMY3dBsrPrZ3eKcgO179mRsLs0YslSKqAgfuqaHmlyAjx8FV4rU5efGsCAo0AVcr3KIEhDtn+mS7qm9UBntrD5/3QCeJLbVPArZlJsjjEwBLLVLAfEK3ZghRQQjuO50+Z01i0voti3ZBQ7J8A3ZaRtTBgWgfUoju1swXkFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baseflare.co.uk; spf=pass smtp.mailfrom=baseflare.co.uk; dkim=pass (2048-bit key) header.d=baseflare-co-uk.20251104.gappssmtp.com header.i=@baseflare-co-uk.20251104.gappssmtp.com header.b=ZFF6Azo2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baseflare.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baseflare.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baseflare-co-uk.20251104.gappssmtp.com header.i=@baseflare-co-uk.20251104.gappssmtp.com header.b="ZFF6Azo2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so4766393f8f.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baseflare-co-uk.20251104.gappssmtp.com; s=20251104; t=1784332861; x=1784937661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9XWIB7s+52lKhjPWNhQX2ou/n/o1lKkV+vDmWxhH3U=;
        b=ZFF6Azo2m0x5NoANWdy7uVN/+FqTNLRS3lndi9akE6g04hZUD5C2mynCyxUEAVCQNL
         yNMQQLpIwZBJmWiG2qOgTViHKSRjGPBQGIMEBKiq89vKZk+h7hV9a33C1/X4noEsSr0+
         rKzClUzTgsbUYyhX0ubPHkTq6U6EL2pZpBwiuGMvjHRvzuEsUOYUk/XtGhgTBX3MFKDn
         SMo9W7TijcFav01u4XnNiDj295Tc7NNhizRA/huuwWmCYU3AS0P9gmA9sPs3yDULWL38
         sqDfCUrYvC3xMnQlTyjsNy7U/bDy8P1/NixvadbNBsz8rPosH7brXOBzM/Xi+KymgaQa
         5yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784332861; x=1784937661;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9XWIB7s+52lKhjPWNhQX2ou/n/o1lKkV+vDmWxhH3U=;
        b=DJShA1mu7Wb2EMnnokwv83YpivPeCmHEDBP2oeYpSRtJNwApURlRYa4gbvHimiS43i
         YFm83HXcdxLSMFUex2cucjgRZ7iVjacF6H6So/jlCKKoeVjv0n8Kd00fe8jiHIgD7HSa
         NMkWTpHcDPlc97es2GKbW75jigpghgB31VTWjt+cxTs9r31MbP3gZdI55C0RFlmRbCzz
         pJ33oqc649XB+kVbwExf4wMwJohJXoZRy88YM/CA7k0FG0PwwwV8AfNQHwpYma8QWPPd
         Ptx1llqJ3OUSedkNB08ScECuFqh6W+6Iy/UaSoRMSq/NY7H02fkABRHlPT0bxCC5RjJ/
         lGmg==
X-Gm-Message-State: AOJu0Yym1QV/9eNWhZ3PJOXIouuAffT4VPuuGcVdSq3ADXSYPFfqHutN
	RyvO45HhNFReRrz5R2Yaglvu5/HFlyN/pnTIovk8tZoDLsjLe3oFF+RS9Gw8gZgBWpE=
X-Gm-Gg: AfdE7cncVPx/UNSObHsbrxqNcdknMAs0Rl4smGVg4SLcASmFBAHMH8gbaGbZEtb8AYb
	HUc8O/JnttIoWw/QtsqLDtH2HnlGwHmQatEj58rUgVXA3R6jRHbwcAruTq81NGquBuIHIyEOJDT
	XqW+eNO6S5m9l42JSKMakiMsa7JvkGyp0xHa+8CD3hBQjcsJ1dZS6Mo0DjQUjF7YSnGpC/SPY3R
	iwAhxFImxqnb+ByQcolgU8ybjEc6/MbUo1EezyjPvCZvHkycA+gsNfaQyhII9Q7WHq9homG/aW9
	rcvKH2IUSpZWhovgG1b98BK4ToQ/Fmy3V1m1VUA8svYnK87ZbnaS4G0ciB+l6di+nWVbzkgM/um
	h/wMmq+/nS3c5b2kg+ZSMSlkTK3TGPSgzfeCBBSpiOFzZu5iRUJPrVS1HCJlmUnbQSl36psMa71
	uiFCL+PMWpYw/7/GNoavhPipeLAuHMPk73sKnP1ByKOwStRIIXUXcPsg==
X-Received: by 2002:a5d:584e:0:b0:475:94e1:29d5 with SMTP id ffacd0b85a97d-47f622f85c1mr5453700f8f.20.1784332861065;
        Fri, 17 Jul 2026 17:01:01 -0700 (PDT)
Received: from ?IPV6:2a02:6b67:d9ac:1800:25ab:96fb:e894:c747? ([2a02:6b67:d9ac:1800:25ab:96fb:e894:c747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm8182802f8f.22.2026.07.17.17.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 17:01:00 -0700 (PDT)
Message-ID: <d43b8eb4-a297-4638-9933-838644c3d757@baseflare.co.uk>
Date: Sat, 18 Jul 2026 01:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
From: Alex Petheram <alex@baseflare.co.uk>
To: hpa@redhat.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 johannes.goede@oss.qualcomm.com, serin.yeh@intel.com,
 linux-kernel@vger.kernel.org, mchehab@kernel.org, hverkuil+cisco@kernel.org
References: <20260417083214.222189-3-hpa@redhat.com>
Content-Language: en-GB
In-Reply-To: <20260417083214.222189-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Tested-by: Alex Petheram <alex@baseflare.co.uk>
>
> Tested on ThinkPad X1 Carbon Gen 14 (21S3), Intel Core Ultra X7 358H
> (Panther Lake), IPU7 (8086:b05d), Ubuntu 26.04, kernel 7.0.0-27-generic.
>
> Sensor at i2c-9, address 0x1a, ACPI HID TBE20A0. Chip ID 0x0471 read
> from register 0x0016. Working pipeline via v4l2-relayd producing
> NV12 frames at 1280x720 (max resolution TBC — may be a v4l2-relayd
> scaling limitation rather than a driver issue).
>
> Out-of-tree build of this driver against stock staging intel_ipu7
> works with no kernel patches required — just blacklisting ov02c10.
>
> Thanks,
> Alex

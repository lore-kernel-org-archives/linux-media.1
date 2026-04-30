Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754C39FCD6
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535052; cv=none; b=n4lkMe/JIxJVf9aK31VY/iwYdF4autpFuL/vSrFUn6rzvEhBU0SPGjoPjiqdnsjgtVksSPbOX4zJnHjPusJAxT1DLisn+vwZkOoPFMwqpCvquMwXW6b7IlQlgvQJbpT9uXLuKf0x76j8tp/nR0km7QkKPv4MKs8KB0tLTE3uq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535052; c=relaxed/simple;
	bh=xQAiWiKRZknMt4OiF6xRbP6A9xpo4UcsDr6nkkq1v3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXK+CEBLhalXU1hfXX7VAnRNDf3XiJqS2+yS/7Jn9KTLNbHl7RFzg8y1Ik0xYCgtiRrk2OXvLnxKjgFn+aR8iPQHsRNVI/Yc5xUpwBAAq62pIjwG6B7XFXt34m83TqvdVjRFDh93S6J2zmI795tO+6cyfVQtu9Jk7bfHvGTqFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bFb8c50c; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bFb8c50c"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe62837baso318547f8f.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777535049; x=1778139849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xjr3lQ9N85a7v4wbfT9HJYQv0tAfWVt69OdXRIx5aeQ=;
        b=bFb8c50c50RLq/L6Hp4X+Dth1+9LEo8KPouDqKcw7hc7Zmg2I9MptGukJnHL2UaIly
         HD4aLwJHDl2u1lKZS3rWxYr2Evdu9D/Tmj2/xyktSJX+zACz83lAAxgmaleQK4feSVEz
         kUSCJvP0qkpcugfe2wNFildvbehSg6ONQ2TbDrT28NBbYfGKX3s7P14vw8UUy59aPItG
         vYrItOZtAJzlz6pJPfNtkbNHKMM1ci8zQCrYQQ4+JlhCf/BitBMdmf4UfzSQBMLu7+ye
         Pu+M8m215PqdOxmYrWr8gTzg/Y7sq6GuVefmNEfivraTkWxNKJyGkoURQDCcvUhQLsat
         ABMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535049; x=1778139849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xjr3lQ9N85a7v4wbfT9HJYQv0tAfWVt69OdXRIx5aeQ=;
        b=A4sK+8e9JY46jaIsJ6+bMGjV7GeSeD9NeZ9GYTnFUhpUV8iQKRVl41Hy9veNQXTnHI
         UUNZck1nJcupkAaIfeObRFXYb74oe6aZ1LEtJ8D7yyFw14+AS3Wkqkd1YzOlRd55KmJg
         tL0o3MCRavpEEp3hRxiPgZy6n9oUeDNDGZU0GpmBjPGxwKuITmd42UU909VFPT/Paz6Y
         /H6mfRA22UMo/AdN/hHCcmDuv3EW5XL1Eb6Yj3J7I2Kjcm1lndnCf1KlxPDJX25zVCtT
         j3m3ezD83gJRtMOguRsMp43qvj4z081Hj8FpHLBpSkWGGjcD3xnQLBUSAwMRZSxqrklz
         QPsw==
X-Forwarded-Encrypted: i=1; AFNElJ/wpicEOXKGRtbu5g1aLxbeFhn/q0OGkDS52F3To+c5JiaNeBxZ32hDiOVZv4gYsBdlJRjKe4+xiOuL5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+gz/nnc5qpeOdryZKwuT5mH9gW3635uVTNZvHLXWOpIHVLLa
	WQvHCrQ5fWmhCstQnoHbZ5dybULn3SCkirdvAoAZZ59Tdw6CkVT3u1vziqRYKrvX9NU=
X-Gm-Gg: AeBDiesdHNIK9QJS9fREsX1MEjBT46AGwJdSZku2Bm3JJrA+up6YhSBJ2H1TGC4nIlu
	yNVYXTLTErpuoefEirjmO/gBW0J1ZF49CyvTFPYvlQS8veNVt649oDpnbdQGi3EnLHzNPZAMlpM
	tIrbF/bcNCthaCYEVGTm8GY6SoLb0sgQAApNSa7/6s3Ppmsgno7+ez61S34Ig6+SpI7cDM8BV6D
	s0OuHBR0rPzccZtKOrlHWvVA6DIywTNev9ee0UQRdOEtPoeHRBL8bFg5sBgKemrVHQwB821bZ+W
	ZHn5VQTFQHFLWNg7tFJTzZGIKx+oSL4ioN6TuLOQXJfL1nFet9igdT8a9GBNppa2zRjcxNImGwU
	eqQkklBZN+YIJ/dsp/tjYnfMOrRWPMeFjeZF5Rj7Qz+C/LtzM9nLVxGLVAMS2jxJoacWhSfKo10
	Kk9obyEKL0B7gmyXHYQ2hAqs0mhwjAN9aL7hHhCiRloG9qmjUAdlwm7ZKsjote3zqvjWKhKSwKG
	cAcpK4RZBGAQzdr
X-Received: by 2002:a05:6000:2389:b0:43d:14ae:1340 with SMTP id ffacd0b85a97d-4493f812569mr2534686f8f.23.1777535048727;
        Thu, 30 Apr 2026 00:44:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597? ([2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b72176fesm10563356f8f.17.2026.04.30.00.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:44:08 -0700 (PDT)
Message-ID: <8591a0ab-2d53-4223-99e6-fdc15851f737@suse.com>
Date: Thu, 30 Apr 2026 09:44:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
To: Haowen Tu <tuhaowen@uniontech.com>, stern@rowland.harvard.edu
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 pavel@kernel.org, lenb@kernel.org, kernel@uniontech.com
References: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
 <20260430021433.2083281-1-tuhaowen@uniontech.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260430021433.2083281-1-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.26 04:14, Haowen Tu wrote:
Hi,

  
> But after your replies, I agree that this is not really a USB-specific
> problem. The more fundamental question seems to be whether, in the
> current S4 flow, resuming the full device set at that point is the
> intended model, or whether there is any room for resuming only the
> subset of devices needed for image writeout and whatever else must
> remain functional during that phase.

In principle you could do so. Your problem would be
a) computing the subset of devices that need not be thawed
b) error handling

>    1. a full THAW of the suspended system, as it is today, or
>    2. potentially a narrower resume of only the devices needed for
>       writeout, followed by broader recovery only if writeout fails.

Well, that is a question of motivation. Why do you want to avoid
thawing devices? What advantage justifies deviating from the simple
model?

If you really wanted to do this, the implementation would be rather
straight forward. The difficult question is deciding whether you
want to do it at all. Do you have systems in which going STD is
critical in terms of performance?

	Regards
		Oliver


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29D381EBD
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075437; cv=none; b=tnCNtQ0VtSvu15sQazztV+32XveXyFNjKVXQlCGQW5EVDEt9c0xG072oUdp6TB2EcwOvJ4e50pN62vPc/UPLssMyGfIwuG7fRRq65zAHHAoI6WBRRzTMI8yP3xCmneZ7hufWsh3QtlGA1uiUWXAmJQLjWwbKqmuPcvP4wjW+DVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075437; c=relaxed/simple;
	bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AZH/Cb58IYmLWCKX18hJXGAL8GD8J0tfHzaUG2kMhkfnx4xs3stDP9Ea+quwl8Bs/eC8zeVU4kR/OR89lh7qwYV/d9/0ks3HP2l9kItgC8yA6kWS8ukcbxtrbkw9P93YCgWvi9L3e7VkD9N0Q7GbOmAJ1P6XEgILpzEwVlLhrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkwh9Goa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkwh9Goa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d5335cf904so23351415ad.2
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075435; x=1788680235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=Rkwh9GoaBrwMxLrMfUsl7S+1x6p2Bwz1AeKPE/4rr29GaMBwPpV51logrpAE6tHP5S
         Oi7bGjH3qMdEuyjed6hvp4Ge7KsLQePC1MuZ6W5ac5ZZ1acqmxfgTqXG2U2pt2p2vaH5
         +wDhwCSqzEsQxYLwtZ7NubB0srAFh15SCG+UkqN3+UINEWYAB4OUe1mH8TFapv/KlJC/
         A6XTlwUAymM7gLQDtTKjZgZV7wxBTsg6UekgBLg7mkrMV39G0nd486M0d+1LD9FaYt2K
         c+RViA3V1aeENSnqqNW7zguXV02dMmnLY81b5/DY/4l/DjMGNoxtLID8U9WGaQIwyKwk
         XoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075435; x=1788680235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASrGp8zTgurRcysp4W2GZweU1AMnNyJvAleGf5hP4hA=;
        b=ouZ+yh7iJeqmGaXzNYkoJbyNagWh0ZL3e4e/BIgeDgAdtt1MujGFs0fSlJwx4PgBfm
         5i3XQ8vO/u6myb5UQluUYArvz+Dqpkq6GtnVcmlHzdy7iR3Bp/bm5lPST2yi0jQfQpRj
         d4g4YEa/R5owCvi0iOOj18SmBftT9AAZc4SnPmc12NfHjmFvWP1u+3ETWhcPrfMYgrKE
         dmFoReDrAFgqUF8mW93VE7qkDVvhb5b7QvT0+4xGwyZOp2mwd9CMlaS1sianLVAKE667
         OqpgowWkxqvijJAhFpL42kQOIfY0NeyI55M5QKHB2mO8aDePUPaaw1RPzN0sCSlhJqu+
         4M3g==
X-Forwarded-Encrypted: i=1; AHgh+Rp4IRZXplP4v/6urlXyXJLm0IlaJZiGOoOJGTC+VPCcAGMrdT14cQ0qFI78LhGWSXci9ZLhpGfmxtNaVA==@vger.kernel.org
X-Gm-Message-State: AFuF++nqpF/aN1zN6lhcsxNyxq6lcL5HH9RnKv4v3Aw07f2/JW+b1wWG
	ASdr00p3JfIPAKasScfEldHsB3SScOYMcDWl86hYyA0yDk5SCUjx0bX/
X-Gm-Gg: AYBFou201zWMK4bvqSiFCr1UTG/BTdoBFTTvQk3pl0hEVDHyx+MPBgDDPsCRmw41Q/k
	M7elu/UssXdpci13S7sEOCAmgwLr9/xkE7MPh167Zg7ukzO6fHbv651sfa/alj73Fav0pwBo8so
	ytRguf0b6WynJFUfUhCPbB1o+BOFu0WaARYXcSujgnX135aASuU9JjZwwbdOrnzOmkNk8faBaVr
	JHwiurEmrL9Xq6xjwzxRMxf0hBu2vp6+UaUBcBMB2k5sWQHbFxwlNIKbhTsy4An0bUHieyFFXgO
	im+wVm4HhhgT/5VQIIA+zxHva+u+eqa+jjq5fplHmmVguMqxdxO9B5eLdIIA8TIOnOwana29ILp
	Z4g1J0Dy/6jD75qfeRT34/FKfUGFbZTtPLZEWyW6hNUbE+5tkUK8gKWbI3K03nM495G9WWtxmpn
	NRQIEtoy9kNdLAt8pP7qOv8shRhk+B+fA5SutIu4mPqYZjYw2sX9WD6br/818slwF7h53B8bCGR
	Njj7L8yfjg8laY1dmlL4voXTKv901+A30s0p3KDrEo=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d8d4ccc92amr160990335ad.17.1788075435070;
        Sun, 30 Aug 2026 00:37:15 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm22814491eec.24.2026.08.30.00.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:37:14 -0700 (PDT)
Message-ID: <edb89cda-3c2f-4e1f-a545-2f2fe52c8b5a@gmail.com>
Date: Sun, 30 Aug 2026 00:37:14 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 2/2] media: i2c: imx258: Add reset-gpio support
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Rudraksha Gupta <guptarud@gmail.com>


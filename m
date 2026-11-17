Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937709;
	b=PdGREuij4Y+mbl3Plec7aL9pvWCKGWRUL+SUymmwdQ/jbgCbmlmfbQ0iLr1t4/G5nyYP
	 CbgoifxSyJI8UIvIjZAhBvmd70LdqdYHCcI6Tz2A5nk87rCcyOGBX7JrLLZH0FDm24Ne8
	 hEiBMgj2jNBEWCXmpostEcMMwlp2DOqCBWK5m437c9IZfozpn+RASy5inVCLNcg3Xf5Hz
	 t5ejyEhaLmEAB9P12o5qWMytDKRAeWhd0iq6W8sPN8F+6VJYfwTwiIIoAWuWINUuRaPvx
	 TeR7x3/B+/0eyiGq/H2CsgGFIsC+lpC8OdIP36kPStlEJJXYJc8xUXRQ/7XQRMcAZvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
	b=cfkkvRbNbxpJAgSeqvUOVIfpzRIvigcjC/UL6+ncnOulYyQomHjs3Cx+ic+AFs9tcr4q
	 q2dkN+PjM1GBibn4+/XSGTBRUWzqxDsSe4dLz0zFdA9EyjJpZ0aUcRaH/I19AyfaPKxZs
	 jhvINUhU6xXMOAvLZSmTsaLDTGoqOnLfvA82X/q9gEpmocKg7gI/VgT3mg6BbeyC8lCm0
	 QsECCVr/vBAeVkA9C37UH4KqxnLN9fJcOMRzMGQZXr6vvqAbmK12G8enLJ/VX9rsCBbkJ
	 adsFFZpVHW7+B05ey9Op7pwUaoa0OEz9CBuiOF7lGz8tE+9Ysga80oANENG9UpL7cqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rqhDE/nL";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19174606A330
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19174606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqhDE/nL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so1061295e9.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937707; x=1795542507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=rqhDE/nL59qzysxrZBMp9N0c8t9CwG3HJ17ynNInH6IzvB7CllhOIxIzhnNEhwyQ9M
         La+lVAWJhd49w76wt8b3GP1Gf+pg1A5PekCQYPlQRLEobpSxBbVPzL9HUFuJYyb0mK8A
         80xaPFc5ypkeyKnMlpVwE6N2+jqJJlj97weqzjO1dxSlKLnQnnFVkn1yQSKsySk3IUKi
         i1bURKp7Xyq3e/tELhQ1WVQV6P0wldRc5pqsuQgg4v3yKD3AzmIVXVYLf65Xa7xBiHhM
         zGNHNKZRq1lWnEEEOUsHgUVljsK5VxdW5fsswg893xoat0wj5uamijKM9ovaCAN1o3/9
         yRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937707; x=1795542507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgnwr2P9uJ+QpfiPOUlt8DPsw41jue0qV/UrisGiK9Q=;
        b=kSpnktXVzz7rsSGBSQ5RXjyz8MaTLWDe6UONjnmCwhIYH0O94Zi0WMHnnbIfWxCV70
         1fmyuVoy238y3oi4JLTZKuxe6VgL+PTzIQ41FUIquqiFZSxqzfSoUAaA49c4hj79x+4a
         Yj5oseju6sctOnuUP0Mjek2X8ExqRp7sf4zjBCuYGUbSByp7r8bHhui0+N5cQBIym41S
         xqTLwZBgWw3FZOtLRHmkbmLxzkG5Xnq5kOcxfDKOIPosNdES+8QkaWYDhfmpGiBYBDFB
         QrnXggg3oqViU3TWP1mkY+JPkG3fHJWkKea7uy+JH189up/gOaBa0TlAtVK6DebfVFtl
         Q09w==
X-Forwarded-Encrypted: i=1; AL+hErHwVc1WTyLFR/CSNpWoIJeV/vX4wMyR0TFvy90x8eufjpEPpUqb3zQfYEAtz027vJ3cmANmxDz4aOIWnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ua5RSFAxnWLdmC6UgZz+SBHebTiEEEOz4t0WDFiVZaiCl7pf2
	IFhvvwqc9Djgzra1b8Kcm3vroQfhxBpmM+KE5OidWc0tArgK73qfYYj3
X-Gm-Gg: AYBFou1Ve1CoJjC4bm2PxzSdE7OpITrq7Gt0fA0dYua5qT2ZsGWrab63lo++Av8G21E
	cDdDzRi0d32fhH+MS0VagU81oEgQdpMi+YZTEzaWk3HHnrHu7jP3eA6sFFChBN1RJSlf57vAhLr
	StFLMMzbko6XEtaNzcpx3ZOoCmohdItvht/vKfCG04eIKBmgQkGjSh8L+QMoKnFpalaxYDe23zU
	CXn87sRVwwiwZHtTjsdivslEciQhmsGGEqy3lSyPbitfsvGJebYtqijDoY2OMbe8KW4uEU7Ve01
	NFVnENyvuji8u9nbrwxD5VFcDY1i1PW0ObWc+AIZ9Mkah6uKGoouItzG42Sr0Ne52GrbU96bOG4
	1qQOAtdL+gsQEJGM0lIzAPbZdgSMAosEOEYYvEYQz7AvSANYJrqVQ6Eki2+y6rZ7bVXpMay151P
	hpTfwmEL5N6WRbSsy5qJRmvC9TlKgcsCoSM1cR87fau5rH4vS9/O827+Opz1BmEdKrRZeL0O8H8
	7Jox07Qo7YhAzHxmkOLQfBv7iMXko4ZD8QyHvqUNcBfZ0o9fNFsOkuyVOD91ld9248BaaZ55Wgj
	Ij8ZcwyZtE9ht6dNfVkUZ9maJDBVKTGpdG5GGeA5LBZSwbU=
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr250423555e9.32.1794937707327;
        Tue, 17 Nov 2026 09:48:27 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d287f92sm413055e9.0.2026.11.17.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:48:26 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: mlevif@gmail.com
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock rate when needed
Date: Tue, 17 Nov 2026 17:47:35 +0000
Message-ID: <20261117174735.10182-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Manuel,

On Thu, Nov 12, 2026 at 03:39:29PM +0000, Manuel Levi wrote:
> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
[...]
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
[...]
> +	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
> +		clk_put(clk);
> +		return 0;
> +	}

I ran into the same problem independently on a Lenovo ThinkPad 10
(20C3, Bay Trail, Atom Z3795) with an IMX175 rear sensor (INTCF1A,
driver pending on linux-media) and an OV2722 front sensor, and sent the
same change, which I have now dropped in favour of yours.

I tested this patch as posted, with the atomisp driver built out of tree
against a 7.2.15 kernel, over 10 boots (7 reboots and 3 power-offs).
Both sensors were registered on every boot, with no chip ID read errors.

On this Bay Trail machine the clocks used by the sensors are already at
19.2 MHz after boot: the DSDT lists CLK0 in the IMX175's _PR0 and CLK1
in the OV2722's _PR0. pmc_plt_clk_0 and pmc_plt_clk_1 report 19.2
MHz, while the unused pmc_plt_clk_2, 4 and 5 report 25 MHz. I read these
after the bridge had run, so they don't show on their own that the
skip path was taken. Together with your clock trace results, it
looks consistent.

Tested-by: Volodymyr Chapman <volodymyrchapman@gmail.com> # Lenovo ThinkPad 10 (20C3)

Thanks,
Volodymyr

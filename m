Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249042DC339
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771669879; cv=none; b=PxwIdWkN8OpVHtSEO/fZODNPuyeZZySi6pg8M7DMULf8jaq2FwYncVmPd9W2LhchnzkRDbfpZon6dr5veBEgrcvm/oayRn2j7/7tendWpG+ezhEJ1OYG9zz8xZqCPDeRvZeMohTjnVv5DXZ8I5qzZyJku5SNPfcl/aU+s0uplEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771669879; c=relaxed/simple;
	bh=6zvToDREd1uqPm2JTRwIInPJzKLUWy++t7sTHWHSMyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gygck+s88/6bMn1zP2E/x4aX3ldR8PK3Du9i5j2OaDpqmpHvVYYDnWXkx3QHFw0QVAhYwZmrOQeTjf3Jom65iP+QONKhvqUL33ugx2m/JbsPE09zHAjp7uc2CZGj7fyt7T/g85l95+eJejtj3uciqa6UGlsus45zOgJG6akX2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWMR/K2a; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWMR/K2a"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48371bb515eso36882215e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771669876; x=1772274676; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+lIaNVUZXvl7y4PjfhU9T+cs11HYw7PgGKqidav9Bo=;
        b=NWMR/K2a2x0iftw8rKZG4KNi+rk/B4uyFyVw4Z4nV/zMeEbpcPRj1pKWaWg9itYRRo
         FCX89+UqobYI5cToIdy6Z8TFRf4f9SmiVm+rvvwm5vhVbbJDaDbDqhHfnytaR4ov48yy
         TYYjuh9FhkQwcwzBvc5YEBf9SFKqWFjsM0dSlnXmnBR7dEUr5HIZQzwJXj22UmkVh30i
         Ulb2utl3toOX0IwSlkFIDgg1SbrSRZUIJNZmJ5DcOVHevcwAOAMJSPuqf28wWTVfBA8e
         9vgMNxP4RM3znVxMIEOMlhYLwd8j9tdFcOwbx6T5K1PefMRrswcLB3C/Lk7dM5t+AtXA
         oTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771669876; x=1772274676;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+lIaNVUZXvl7y4PjfhU9T+cs11HYw7PgGKqidav9Bo=;
        b=TQ7ma2dXLvF/tB8PVlnsm+3PQa0hwfNV3R7BzOL/jh16Te31qM5b5gzcBncu93plCU
         52xYQS2YOFhSyi2qlW4kSoLHr4bEpQBeJcuVwiiXofgaetHJqIE6BjA86U0G7SiZPjAa
         /OJLOj7txGp6xARvwMLnHZgpIKkpbmCETWRX9eeyscLQZFPcPFJBU5Y2mNmQk3VIaPFv
         nly62Na1hA0XYyFG0mTQC7EgyX7jvdqYQt5F6nWhHLjrOrh+8yMkGTI5DQG7gAiIFIII
         zt7GCRdzikvMqZYKv8EGgDOf0d9iHWJmw9LLtRITFzmvk48ko6FQr993sDJyr4bx7Z2V
         5Efw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1FEQuKqviPclvVbI01Q8ihrb7rh1QkvLpYblmr+vjTticHxbJZKhV3im7FnDf1YWpBCVxOboAz33mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xesm7ywx1XQv8sV9yCoHphrMvDYm/p+AAp+iNH4Z3g5XUx5H
	meljfsXw/x9LT+pCmJCJ9oHCZvPNnd6Ro5n1+UVZ6TuHAWXpAPTmeH15
X-Gm-Gg: AZuq6aLTpQQbG1CLWJ3bwnRZgxMine6St1mpZqmktPhdMvK8MUuH2lII71g7S+IgEg8
	TOR346v9zRDPgRUj10P59K9r5AY4BjT9no+Bgs5cQUY1AbgFUucgPgY+tc4b/3c6b1hTtb/ca5/
	RcYf9WPXHI6YwRmExCAXYvWFa+hTZyohJ6cLXOC40JTU+0gH5jtdRb5VSI+Z1KOjemW+lseVwHT
	t8S9hWSbKM7gdTkIsMXVSuoZLmySg84LKIVUPD55utnrVkc6HQx+6dxv0Rqp1G7KSXWUhIJ1jnP
	0ukhJtj8Hg8JsHp1fmsf092D1dq0+seyaIBwBroBiIeWWGX41XR2F1NRPNvDDYbQZkOX2kM1ymg
	cjAt1Nl/6BFwxJea/lZUX7lJOjS4PcUX4azYti4NU6ZqmDcssgZqvtvkwxmaFw+4EEUkmIOfYTa
	LXEfjDGI92tDOWGMpVpiun3N7Ra5IJNXJmu/jXbNAT+njqOJaeqCeYqq/KevF7t/+ACQ==
X-Received: by 2002:a05:600c:6298:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-483a95fb23amr40728085e9.10.1771669876321;
        Sat, 21 Feb 2026 02:31:16 -0800 (PST)
Received: from Abds-MacBook-Air.local ([2a02:3037:22e:87e2:bdae:6d22:aff8:39f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c96csm5243449f8f.30.2026.02.21.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:31:15 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Ding Yihan <dingyihan@uniontech.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
In-Reply-To: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
References: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
Date: Sat, 21 Feb 2026 11:31:14 +0100
Message-ID: <m2342u5qx9.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 20, 2026 at 21:39 +0800, Ding Yihan wrote:
> Hi Thomas and Abd-Alrhman,
>
> While looking into this exact same syzbot report, I noticed that 
> `vidtv_ts_pcr_write_into()` in the same file also suffers from the
>  exact same pass-by-value anti-pattern (passing `struct pcr_write_args` by value). 
>
> Since `pcr_write_args` also contains implicit padding, it remains a potential trigger
>  for identical KMSAN uninit-value warnings during fuzzing in the future.
>
> Also, regarding Thomas's concern about modifying shared data: passing the struct 
> as a `const pointer` (e.g., `const struct null_packet_write_args *`) 
> would perfectly guarantee that the state remains read-only.
>
> Thomas, would it be worth submitting a separate patch now to fix `vidtv_ts_pcr_write_into()`
> to prevent future KMSAN errors? Or would you prefer this to be addressed together in Abd-Alrhman's v2?
>
> Best regards,
> Yihan Ding
>

Hi Yihan Ding,

Thanks again for pointing this out earlier.

I've added a fix for vidtv_ts_pcr_write_into() in v2, and I'd like to
include a Suggested-by: tag for you in the patch. I'm still new here,
but my understanding is that Suggested-by is the appropriate tag in
this case.

-- 
Best Regards,
Abd-Alrhman

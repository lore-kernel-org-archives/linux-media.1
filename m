Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318431;
	b=CNc8HoTnUCPk4XjVtxe7VrtTSQ02JWWGBa7mgpkqVDB6ZHSwpOTBspIH7NMu2uJ0EdEX
	 +Hzp3RyI/TX5a1kiq7uiw5eTd1JP0E0SOZeoC0qcCGbC56kMjR1gxwoD3/VIdsqYxcSEG
	 +h2QVv2U5xBa0Yzrem0XrobW3nKzeTTNbfsYm7c4yyblxy1fNGNp3TCycXj8YpX4D5s1t
	 Dopc1Do2BT/UAM8g4m3/EOJZ3Mq9TdxDN04ECSUc6SXXTxg7prSHvA6N/h0QI3NlX2oMw
	 TZXwXidvWUQCKtZ5Zo5nlwxOMILQDjjY4UfXrwX9zczfG7v5llac/iXQyFmkOJHanXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
	b=qMWoZE2MNMZyfSc3SWEP7qF0m0zbG5xCzz9CpmMvDm88p+pslS6SM8oEvXJlqGJEoD44
	 IE1RISau9OZm5VPByW6s67P/jBMHfD1gToJh2+jq5mo46p3SXO07AqCzA+A4SZP6OUxnB
	 eNvTLRrT3rKmgF/MYLdrFnmD2D4MndMABNUnsxL4AyLWDYCfCQHTc4eZgBdwHT8rh9qt4
	 R/fKiD8YLT3MbWWfFP1YDT/H3PaK/cX7dXiCYWMdc1b4zvwR1bDDu/HMu68+0KpGACXJJ
	 a7qDpr+O20qZQERTbD4v0nWsMNQ1NC+Er2FKiUQxIyCmvFFG/17xJvDGVkF7uOjIstw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8sN6Ut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC560A2604
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DC560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE8sN6Ut
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0dba37a7fso21234487b3.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 05:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318430; cv=none;
        d=google.com; s=arc-20260327;
        b=Nzv/VVjFJ/wxjxzKKyWXlMDeQh3KIDw8AruBjSE8IaQgu8AJeUvYHqs/2zJDNcCwRs
         kTSFYDJ1G9Bs/yUIRx2DKvQJIr3etSY0slG4thAfw6dqLYwKWPM9yy2s5QkEXvBgFWjd
         yuVJ2CojMEqrfFq3NDifEXVPTdbSbe1tkKKsN7joOtnbqdFjAuM2NvsUZ9UmYucmNFeA
         OrqpPo5MyQRzVUL/IPpmaz7A9UWHGRiy1cfVyaGasQVSPO06Icqx5ENIZGQp6AOnSI27
         wlY7tQWT51PS7c3yzj4P4K6JZ4y5/JIY+plzPlHNevjfAUIjz0ZJP+kwtamnlDpg6amO
         g89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        fh=LvyH0RrFlDN88e7PYviF2D325awwb2fW5jhtHPJoqg0=;
        b=BfLi4bGYtuUjTaiVoS9qtaMYhQGWh+1TRNFb+Ux0i4WcSVjyn/hPzqgoQJ1kwQFhvV
         jgHhbSCv2iNMMulTYHs066s9ADu67cQf+1aIPKJ9jsYhA53Pr2rINN4A7kHmJGW07BW+
         0uQlrAwe38lQJXqyhwVAQ0D8hqudebQEy1Ls8atrms6nu6CYsEkmdccnd8ZvMU9WQR4V
         vKGbINT49q9mkPIR6G4ayaX9GTZmKCe5CBMOy20XclqZ3PvOkmfHGvmyZ9ur+fjQey16
         Dpfef5Q8bJL+U0QTg7stHhxG9tfJp7VyvnxXQH4Pdvjloyxh9ZytPw/31MGSomyl6LuG
         2vkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318430; x=1794923230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=tE8sN6UtbnLK9T824CuHAZRmFIpT5Ylywx+1fuBBFE0es8VuFROFzbnONKd8D+2ubk
         slnwcMjiWNoIADseH2Nesv4w943hikH07eQhFtwV6S5JTO2gfu0nS/5qjp7jclYHi9Ex
         BnxwIXrSp7jFahnc5fzWF5dwIUlVIwnlcV8QYzoDI9Aem3j47vio9YBA6jvYYsEejVYV
         WHsoxP6VQjJu4m8w1leZe272Yx5iFj+yc5fnVVveKZrsH0Sbzoo7mzQiz22/Khe4bTv2
         GWV3H0ah4+FLki6XQMW20F4BtgcwItwaY4hrMMVbMspeh1bQeWwrX5fqTwtVVd2uzjZ7
         Qc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318430; x=1794923230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=ZGJ3no+yMpTXRDBgwMCvSa8z8WKGRBj+K4VE9qmTK6Qffd8vhLwxmAFfNw2JZJmL86
         XTeNWbcQxPMlcusN4e+2kYiKRcbOj8pHl7UuP6Eepa9SqIsBpwslq+9k8wf6BKbfoXQa
         UQ1JGI/pegR0ln95yp2gLLGTirVy+R2DpGCNdVk5Td7ibdoVrJADhJVqK8ELwNEHdcYL
         9AURot6LXnw5jtRkLD/1dDr7FMv7U1mHn7hyr7Y394PfNgEey3mOvgMQt4qKlRpfxQh/
         auWV3RzSld4X8KrW+oe0kFfEbLFLZM0vWHKSTSYN1q4k56yMGhpnTH9VGF2DZartat8S
         OYdg==
X-Forwarded-Encrypted: i=1; AL+hErE2RtXwwKpIslNZnz2Pzw7RYVTQfCZB3wEVJ7bZQYJcHyQrdAfeuEq+zhtKy3qSZX6ePHFrokXzR1yl/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XDmSTiB0aY7+u6fd34you39ZSx9i6tp15HTbbbDsxr5nDZR0w
	MHKtAHZRQh1xZPHpNVXPcQlRJQ6+nd/4IwRa1thh0E2+DDuN3wObdaay4r+yr5mT/1zZ4sB4kdx
	VPJFKg7Hni7+WbKLGEGDAtY2YbBE8RCQ=
X-Gm-Gg: AYBFou3XyOhOMxkTt9prdDaMgZ5VVO567JMSseezX4tZUqcSKxN+pB1jWlhYyDAOdt9
	/F63L6k3MGYUJOZzhX9sm4ZZwm9FLM2JVSy2GtAdmj5+Ua1JkZ9B4pJuNQfHRJoFDClGmC9ONGP
	OWOma/LeFulsh2HCQ/EFG/Vsmujg3HCg1l4FS9ipJDL6BvodcXhJZJr2YvWX/Fh17o3rKVT/Jz9
	CysDBpq1fn084uYA5qPZ+RJlQP6kbjoLb/YDfng093P4TDGpj/WtCdHA29OydwDPeLNan+K8pg3
	FDO7atUwBgwprskCrqrbrVTU0LZOznZh5/VgN/1k9j/bmu445A+QOUuIvyb0Dk7tgZeBG6AM26z
	PzfDT7CLqn1mgVmhx52oLgzPkN7YBlaqppy5mL9MO18KXCefv3bxRzr1lN8KXBddE83UyHoodCG
	bOy9RiNd5m+WHrojqvuqFI4qmAlLAreznLRzniDum/znL6IWRQYw0vc9vZYB8EvBkYmjudwFzwd
	CES825mQAg0AZcjuicCVWignOUo3cY3tDesQ0ynZwLWinH9puDCRmZ3f16A+g==
X-Received: by 2002:a05:690c:82:b0:8b3:150b:43b7 with SMTP id
 00721157ae682-8b392a0043bmr15689387b3.22.1794318430086; Tue, 10 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 15:46:32 +0200
X-Gm-Features: AclHuK--urMkAZ8a1GYQVxfw2ZUUBbdPOWGmQEwXiTmVu28rFGKUFoTFy7m1p3c
Message-ID: <CAHp75VcaoGMkUXX6WqpfmVsudOZvkS2bbotqJ7oatjkBJA8=pQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:58=E2=80=AFPM Kincses Benj=C3=A1min
<kincses.benjamin2007@gmail.com> wrote:
>
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.

Don't be a meat proxy to some tools. While grammatically your patch is
correct, I think it will give wrong information as the used (wrong)
English word "binded" comes from the definition. I haven't checked if
HMM is a HW-related piece of software, but if it's, we can't change it
without checking on the datasheet. Otherwise this needs to change the
constants and the whole usage of "binded" in the whole driver.

--=20
With Best Regards,
Andy Shevchenko

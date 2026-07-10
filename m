Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595840928A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687093; cv=none; b=puXUmV3rBqPlWPoSJm3K2bQsyncyWal/CoiDzXxQNusdVNWc7K5exinwzs7WvKmKUNGMtsWyOGgFcyjd5oq8PlhzfdwmE+0iuR1ZqoZ9S0/B6wVUS4NGjSrZ8/IzDOHblC6MoseGmi+oLvjXQB4YL5Gu08JRV/N7FDeCWRp+mMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687093; c=relaxed/simple;
	bh=C3HhkpWE6qU85b4hr6HvJtthh4oucD293NGx2vb+4Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fqFinta0ceUN0b5ntGjsFuLkwOYXFIEAbH14p5A+myy4S4x2IjXzb7OuPQiIOt+CDbHmn+u7UUPJ4q3aAbp8uSFZilBMWDZrx7T/IcU5uHfAQu+kD17Fypj3ue3muBlpmE31an4Rgh9FtC7oLE68TKw1DRmPSbsvNfBJ3wUI7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=YI7DAuk5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b="YI7DAuk5"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b015532f7bso922542e87.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1783687088; x=1784291888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG0KIih+vx57RDic8M93xs1kz9fPC82KqiNSjebxkcE=;
        b=YI7DAuk5f4Ug+9+yT5XQ8xLc+RLSBljsssn19UH8KPmiCCXW7zOlzIbT5vtsJtjCNv
         yI/aoN2c0J2mepHN+eVB4EDrBJ0HYzBhDpxSzDl3/RQRZ9XmhYdi7xTsQN0Bgg5sEqmq
         DeqF2iEr7mYBtprt6oHG+hO4Rwm0qGEUS58tOiODwwttfXVTBt2oEQqUad/A1rlQ25ar
         h1bpRWZz8WOMuA1QvCjk7W6qYBqhF8VsmP1ja5pXxggcIwvhBFSAOxU3YLYb0NAcp5bV
         17roL1f57wUcFBuLXYXOYUDvVJv6eyj7y3cVbpKhWEwvjiF4YXaGoKSWigvUQrDhoHL+
         gfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687088; x=1784291888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG0KIih+vx57RDic8M93xs1kz9fPC82KqiNSjebxkcE=;
        b=M/vOZ9Fu2DOVSjESLo5PElTX55WbgrZlRfM/8Q87/YqyeTPyxcksawdkbkBnQ4anC8
         TDDFsTzXG5JfNhU9wTBvrQyIUlSm+0qTrbLdI5uZRPf5+2mU8w/jGdrmVzgEusZKlH3I
         EiiOjBs3yIDoekib/Ak+ZpkQqP4JYf8710au2gmKQfsAL/7BmT5KlxF9CQNyhPG98L1o
         QipoAvh9keJ2av09dhegDYld8ZNPrvPRHPKhQ4m5RtDoVZH/bv0WUhe1g5tQYABa8Elr
         EECKUi3FilLZrcVggeZJbcMoBmGx2F6ts+FuinEi0Plb8E1ErOp2uhxFQOiy0PdqiX6d
         VTVg==
X-Forwarded-Encrypted: i=1; AHgh+RrH69YiJllpIUJR5JmdvbsCJqqwx573S1HQFgGFgc9g2SuNCXTOJtaYkkn8sZ18bikGqQ+KvoZDF9eQLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuGXaLZppctde09rJAXxpXRy/qBDl7aocRACJYo0KNdHEup8u
	ipcOtqqAm13V+MzS+zLAPQVRRiuam2+bVQAmOH7ELlvPQe958dFqG5AaCQneFrYDbTE=
X-Gm-Gg: AfdE7cmG246E6qBdixPLjD82DzRyzKQxKP6TgHwthLrhHd0WzvN4xeyapVnoEr0a8ss
	lrp7PRZpJxXUKsmhiqxY9PE+5eDE2R8dBOy7nqNLhI7FqRCSaukRZrdRaix4baQGxtrYRkTKw9d
	Hn76Mpw+JtzDer84YPine0mGg1B+AhfedzrtzYVqQTe4xITaX7dFmP5uO11Ucdtpc6TV7YwvXmw
	4kNSc5TGv3AKj0YKa7wedGDruTawwJoTyW7CJ9h9ftCrzOfHcsj3Cv8Bsi83mtVCne6oQegjZUl
	HVbx6hSIZXR3XpyYcvtUdfG7zCekmjRmp1ekqB1h57ZQHfrESqXizg2CYEk7DjNFFWmHBCeMC0Z
	09xcgUOI1Pr7A4UTLTr2WioS74iVWH+qLCb1sMgXjoEaknFJwXjx2UqouRCBXvro8WWBAZpMXhw
	SMVm8h8sr68m8itIDS8shEYsV3LUrfewNcMPJLKen9J8EosXqJqPfTFV+HOR68PgIWreruxrp07
	vm5RjDvmQtqklQrof2cAvCvcv7M0owb/MjlG8MO/cb3XKPuzO8J1ILaVPY=
X-Received: by 2002:a05:6512:314f:b0:5ae:c3c1:822a with SMTP id 2adb3069b0e04-5b011478028mr1822557e87.58.1783687088448;
        Fri, 10 Jul 2026 05:38:08 -0700 (PDT)
Received: from [192.168.2.43] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa667asm580895e87.66.2026.07.10.05.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:38:06 -0700 (PDT)
Message-ID: <82c74030-88c6-4bf2-ae76-41c2a68ced61@qtec.com>
Date: Fri, 10 Jul 2026 14:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bad wrapping in some tables
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Language: en-US
From: Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

On 10/07/2026 08:55, Rito Rhymes wrote:
> I just got caught up to speed, reviewing the links, the regression, the
> prior state and other relevant context.
> 
> Daniel, thanks for pointing out the regression. As Jon said, it's
> always good to inform the author of the patch, and I'd have been happy
> to discuss and test out solutions with you.

Sorry about that, I'll remember that for next time.

[...]
> 
> The best solution:
> Make targeted changes to the tables to make them fundamentally behave
> better on smaller screen sizes.
> 
> I began this effort with:
> [PATCH v3] docs: wrap generated tables to contain small-screen overflow
> 
> Jon hadn't followed up after testing out the fix with CSS and my
> explaining why the wrapper was the better approach, because it prevented
> regressions. That fix is a start, but more would need to be done.
> 
> If Daniel is willing to help test out table fixes and provide examples
> of regressions, and if Jon has the bandwidth to review my patch
> submissions to improve the tables, I am willing to tackle this systemic
> issue, which will result in this issue being resolved as well.

I don't mind testing some stuff if you want me to, but as Hans mentions 
the media docs is full of tables which have these issues, from a quick
check, almost all sub-pages of the Function Reference are affected:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/user-func.html

> 
> Rito


Regards Daniel

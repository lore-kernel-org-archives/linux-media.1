Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC23E6DF7
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777353; cv=pass; b=Eu3h7xR77O1T/NKNJKUKYoa5BVEflBGGlCEQcQ1KL/pEQ5tG2+yYEI9HwlEr7WTZJmPOmhhj4G6Tf48Gsr7+ZdMBBVo+Xo5FlgYYdacxfnXl6929G+qhotp30vsn17o+qIRaEeQ859pCCLU9XYl1vx75jtJgKoMgmrk2Ao1ebYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777353; c=relaxed/simple;
	bh=AgVNHFWYWYu1rcKKkrgWZENohHqRa98sREX2M4kbe0s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ksBcG6rmUuayNQwPo6fkC6+hj0F+d0oxsyPC/O31eboi+Z/O1EoCNn9Ixrr8RhvzSuV/yZQcIIXE79rhTYlN5DJ/trI6ldgztkph8+CsfmuZNh2fKTrRDFjwfzbyN2U590rdTr8lW3wayisYp8RNzozBavUJ6hqdnpn00CnklIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vcbz+RlB; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vcbz+RlB"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6caf94b4dso86761a34.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777350; cv=none;
        d=google.com; s=arc-20240605;
        b=FBaLf59YzITMK9O2+bFpgi6XXI7/DujtjgnOcGILXApM8ZK+9TTmTD+4P37lQKunWo
         XNoyWYMHLpV3iL3ohu3CIBkitotTGJmx4I2f9HB68AQy9GzpOnQzoLrw7oBnUe6BgfWP
         5gZtw1g8tg7K1JSfBWWvBarg6tFIxAkbujpc7n+dShh9X77e5zDvzIcHfRr7z5hJcT+1
         X4xmzo4NHKtyf76KF2K8oR0sU+MzgxgjUp7xZttsyHmyZ5WFcQ3ZO9vCaGkLTxdWXYNm
         gjzda+wYPcXqvASv8SxxN2HJltdLzRYMbtD1ehyXEwzKrEI6+qtSrCLp81az9FOByF8G
         BJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AgVNHFWYWYu1rcKKkrgWZENohHqRa98sREX2M4kbe0s=;
        fh=cLu+eyOOLy7D31Z2Ub+fGPEjvSpa32oAhVAau4RlqMU=;
        b=QTydLvquy/c2dMpUs5SLsWF/8J0jHoWyB4RPsTwMKm9Hs8g8CQ8YzEq28QiIIlo65l
         x+lIcrHiX+dDjI8xNiZNuDKUY+GgXkzucPfkueigQPLu6Td7eIVYmFZ5C7bfM/TjpxPb
         1Ysi0LxPIOE+/Z3D2otMR3TW3VnL4Or+4gDS4adGQ4UO56HWX14xb4ucmYUbcIDNN503
         J07637obo8uYYuGKzq3R8GlhYXap1T0FlhWNxXacvg5MfeeUvfnWGanjwq+zuN1OUlPI
         UJfIs09P2VvraVpk0PB9kJGE2bMUr9dFu8lsItKoFxe+Hy7tYfagdzfKG6dJKeR0HnnU
         lyFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781777350; x=1782382150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgVNHFWYWYu1rcKKkrgWZENohHqRa98sREX2M4kbe0s=;
        b=Vcbz+RlBIypLNqmQ3j/JlPIjYUMttN0AT+RolVV9VwdvxHArDdcGBQ8DuT6kD8UMKu
         7G/Xoqb5ND5BUGnz2qQZGdSbffjce8Nicn0c9thgx3Nas0QamybIjJBNg329hFtIA8Xj
         eLPWYbgGC3CVXtdY4dqvRcMsOOXr8tz1lOcdF43ZQM3q5kEUMOMCee+jvio5hsnyf/r6
         99rhQbqWqlZkOS5aUOQjkvJgeM39OY6KXLd+RfdKcU9JXVZXcR2Kft0+1XoTNnruKoWZ
         KWM/fEWiI+jEgQeJhnzxoqMXQG5ARoX7GiYKhopaT3wjonJUsJtRVTRS8zZNxxpRc5jQ
         j/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777350; x=1782382150;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgVNHFWYWYu1rcKKkrgWZENohHqRa98sREX2M4kbe0s=;
        b=rVkytEwVzxIIOdRqqwgCE/TmNrmeXLJtmAAN5EWbCIaOrqTE/TT1bhGsDjtJvRUlo6
         7jiGtUaTQkXtd05b1u9puh2AvPj0isYfq/L1gNVeq/IrnUxk40xni4Tr0eTnCqoiujI5
         OZdr/9G8EAyKAGCiLjC6LAbHy2C8T9G8u7vRwxXjXIpVdXrYqDgQRH0L8JCMdyylZQ5N
         hqgIqTBnaur7bgkLhvBsKYShHhaZsxDIzgQ0K+pGPpLNGh2KDDkexCEqTSW1e8Hpyllg
         LLmAWrXYFd8scvz8xf/+qRybbRU1NxLCFHTHvUNGp8R1WFtsc4WR7ViPzmd8YyIB9CZb
         rsEA==
X-Gm-Message-State: AOJu0YwsHYO0gShMLfw2ViA9/JeURHFZPNWoXitEHqnbjMoLsmK22DjS
	SQuoZIQmyY+KwuCUvVH7YqxL7Ibv1eEtro8yRjN32Zl7YJsjISodqkgSm9eRL7Kwj8ntxTQph33
	QvjCZti8bsGXe2yxMkMo2LeVAaiNKchM=
X-Gm-Gg: Acq92OHLG22XUaCaJCb1GxNqp059PquBE2OijGyG54k4/TBmXkGcA5UKMCcwRheEP4d
	oq/8H8kETrknNGfgrsRmv1v1kmwjYIw0FehJo0KaYpIlvsNR1KOwtQavbd0OcRJOhGrWTDVQR7I
	lMVjqF4Ip8QjcyuFVFoDFGDV6IakaQ9rRs3KjzDvN2u0QtMHfd5JEEbSBb1OxSZYxqp3XSyTbs1
	OkDc8m2j/T+8vMwhlPhxkPJIMOmhxkG/joP9wLapH9r2+TSfmRJ5+in+waHqFtl0YSBIL1xe73z
	iBsChH8/M+FU2SaOo/Xamk0xfJOZ
X-Received: by 2002:a05:6808:170c:b0:485:467f:a322 with SMTP id
 5614622812f47-48957024ecemr1318308b6e.3.1781777350025; Thu, 18 Jun 2026
 03:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: evily <kalennar@gmail.com>
Date: Thu, 18 Jun 2026 13:08:43 +0300
X-Gm-Features: AVVi8Cfy4lBtr9551LKIUazgF6BTZjr5y-DU0KqiaRHZAom9t1Bnj3a2RjFsOXQ
Message-ID: <CA+7Ldxn2FzBqCH_OztSDOnvayyCMk7DSnSJrBadLrXbR7YDBmQ@mail.gmail.com>
Subject: Re: Testing ISP Radxa5B
To: evily <kalennar@gmail.com>
Cc: linux-media@vger.kernel.org, paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

> And got something weird: many '1', '2', '3', '4' to stdout and
> stream-count=1 doesn't stop it.

Okay, it's really an image! There're no problems!

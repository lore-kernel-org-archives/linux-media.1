Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788D939901C
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035422; cv=none; b=ev5ark9tGuMK6UREqaHzMtj9v/Lo1ehcWW5yDFb/b0HgT3jh+0SMh+MArI9KMTuvmsaa/MiWWBEYzIWuG0QMwYF1xQIK7qpuUIUwYtx/lLnGvEEbRy8N8piHvMgPY6OgWWtZVfumrG38ZbMunCDaVFNIyOUPiCX07Hm/5BN6wQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035422; c=relaxed/simple;
	bh=T6QHUXXan9RlQRVyU2bv9a5SpuOrQlV9z8My9p1kMzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Lvx1idubIw2geevpprMNQBOezNKP9A+de8PoZstVlU3eCGgcKtM73xr3JwyMrlbat4AZ9MGAAT5fGA071Kfbw4/J96+EfCNrqEMa6K8gyzzvECJIn9X8bU3klBVsjHcjZQW5E/NDHFu+28YD9SJDJunZHjr8sR/CWBhTKHgjlNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=1BjFvPpi; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="1BjFvPpi"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4ba9abbecso7226791a34.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772035419; x=1772640219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQzwfTuurdHrCRbQq1Lkz9HB0o+Mxk5jPOjkJ+sWd20=;
        b=1BjFvPpiDvoA8He3wratHkzQ9VNWHza++V90u+WOLgPpIE49Nwdtyf8jdUZ0ToiNNT
         4UDQdy80hugQk59xXsjJIE39f1bYdAR8h3SyDq7A1W+GeJL7EJEMsp2B3MJwjazUAyz1
         4hebAWKCoDIjFNRAmZ/7O9P0J1BikZJ/DayceyfTvLr51/aK0chevxhyU26Y9hV4Z75V
         j9ny588TUqb+AmRMoVfz5TdZ+ALWi6YzY4NfGeTr3HMof0psPIX4b3IINNjsZ9A3FhLe
         MDDeyh9E3rPNNjm0WK1dVp3Wmm/WcIi4DW+U5TQihLJ5gcREA8M8P/DciF9YcvIknwRh
         on0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772035419; x=1772640219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQzwfTuurdHrCRbQq1Lkz9HB0o+Mxk5jPOjkJ+sWd20=;
        b=Q3/wasvFCPGLWqgO3LvHsJur7271IadZt2zM1+xpYWyoz7dKDqtoiP6DyXM+5AGvID
         ydhgDMUGX78iLUtMNBGqB8VYnPIqDGEhMA+oDGiu9qnEN1g7i5WvnBGAonqbUlMJsMOw
         3Y7ZpJJTTesZuXKrz9/IseeedjvjuVcTQWM85qzBjrL7/664yvkjDYUhG+/hvLmGUTJp
         lPqtwx0BPu5jCpKiyEnjHRnpe0qmAj/wci4FIZRq5SBFQvZCkbA2WVELztvKCc/NnAsz
         RPzzjTlMZWgx0exxNIIDZHyGQ69FgUy7fJwvr3SU8xdUjBbLc+uFVu45m+mtWUd6QEi3
         02xQ==
X-Gm-Message-State: AOJu0YzHoZUnAR6Ndu7XBtf0kVdNemN/ur6Z0H71NucjziRQC2T3Wcti
	3cQCJzD8UaqiSHZb0qE2HLLd+zQjZeaTEUEGNedxLWmEBsxVXgxh4Y5+6nLEDdZENbeDPEv+Woe
	7bLnn
X-Gm-Gg: ATEYQzy534XxW83bv878/ykP31YYkegtEUy89DnzzgXDCkFXgQhH8z5LBow5uq1qWro
	y8a3pQMc54AuCsfJLnDysryJoHzYQ326A6BI9D0YQqlr46rfJoMhJiNJe7dAvWu1pZA1tzlg03n
	+bMc82Q+qSvPlODvSDrkRZNKfZg0ac5M+MuoStDdrH8DnKPUbpt/VJKF47nZnpo0k8DsmdGdPAV
	kroR46rXGWNJ8Rnr7yAsypZIte/Dbzil7Yf2OPu21cQyvDGRvRg2VVnk+xscSXijlXh8cKzR1hO
	BiNqGJcoZ6c4GfyN8Krz93gpZ/srEKTE2c/rUVFAsW8kRvblqRhnTEGkYO6OLoJLumOLFG3v8pt
	RbYTYvIRzQZU7TpTBxiTpSuTgOMBx6bONyuJ5PA1XMyI0KlYG4UZxtDvzKSeV/OidCAXYj7RG6y
	BJZau1YdFvmqIuocA8Vxn6xozRzYR65blxVXTrua2l5+28zHsgPn6pT4rDUwZTZUm8rEPGPLdo6
	rxnKvChXA==
X-Received: by 2002:a05:6870:16e1:b0:409:6862:aba5 with SMTP id 586e51a60fabf-4157b1033f0mr8810637fac.25.1772035418618;
        Wed, 25 Feb 2026 08:03:38 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157d34a4b2sm13440375fac.15.2026.02.25.08.03.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 08:03:38 -0800 (PST)
Message-ID: <df2b234b-59a4-4c90-b7b8-01b8f3e49dea@kernel.dk>
Date: Wed, 25 Feb 2026 09:03:37 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: dvb-core: fix wrong reinitialization of ringbuffer on
 reopen
To: linux-media@vger.kernel.org
References: <32f48179-b51d-4513-b6a4-054241bec8e9@kernel.dk>
 <699f1b50.050a0220.356767.518e@mx.google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <699f1b50.050a0220.356767.518e@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 8:54 AM, Patchwork Integration wrote:
> Dear Jens Axboe:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0001-media-dvb-core-fix-wrong-reinitialization-of-ringbuf.patch media style
> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> #25: 
> Reported-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
> Tested-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
> 
> total: 0 errors, 1 warnings, 10 lines checked
> 
> ERROR: Fails one or more mandatory checkpatch tests
> 
> # Test checkpatch:./0001-media-dvb-core-fix-wrong-reinitialization-of-ringbuf.patch checkpatch
> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> #25: 
> Reported-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
> Tested-by: syzbot+ab12f0c08dd7ab8d057c@syzkaller.appspotmail.com
> 
> total: 0 errors, 1 warnings, 0 checks, 10 lines checked

Add the Closes if you want, I'm not resending this patch. Already wasted
way too much time on an issue that you guys have known about for a year
and did NOTHING about. I sent a fix, take it or fix it yourself.

-- 
Jens Axboe


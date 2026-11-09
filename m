Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206749;
	b=Was65inxGMhq63eg3+gjhN14gIE26moz0DZV7KxRkLA7NZqUByWfsD3ExAtB4j9JAKj/
	 Zspre7RMUQBB0uZRC/TY8bDlxHTd+K1qRnHLKcrs6ahzvyfOO+sl0oEcF8m5F7gWQjtMK
	 wtzmlrdVZGwRQTvEWL9mWyhOtxtbtwwZzeJf8x+Y7ef/ZID3AIoIo+pVhyzLIuKv5/Zf2
	 9+l5Jnruwlz2DPsXJVRn8qnCYMRUgpwkSEqcm2eemRIWNX+FCNSX3ekZynkldZGRQKzKb
	 q83IfRAend4JKYvZfAv2Rbq7g8mgiKu2keIu0Dp7YjSCXcGi655HNE4tccOlAMj4xCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
	b=0dZRmh/fbGFrjt1WMKVkcDfP586Ajq28pcceuKblM28DhzTT5N+n2CFDZLF7TPN/wznO
	 GgXVGoDULT5vAQzqEEo8lHgvN9/C+KsLuW+dnRuLDgi+PNWx3T4fflVb1peW3urqZ6Cat
	 EjKCCi8YGa1Htbo11whuIl91HCuFNp0XiSR9N7kCRyOok/qIIgWjE8VhlMaJvIs02sFsG
	 7yyH1UefY/G0YwB1dOHFsgjhhaV9ZR3BNccg89owmAXSrT5synkGZNT5zb1c5l5ZJFgVd
	 8FGYjbebqWif8/pdn5n9YsJ4xAPoXSqUHRwRHOZlkZkbhb7R2QgFXnJmaTE4HJZ2ebg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVTyJbIB;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB97606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 06:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVTyJbIB
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f563d1c6so94801f8f.3
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794206747; x=1794811547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=wVTyJbIBW8123YwTpvcYXtYZ2PFI3g3DMU5rLfnSrNe+HxYzRz+SKdSW1fiimbF32t
         plqF1bSOfaXVme8V1AdPppWM+sVNPic0XqMKTs56dWyGdMo5PKa3aL+ZrCFlb7D+oDrj
         FveVWWGHm4ABApszy5NPmEOT884aXB0s+eO4jfRhIzJX3TmkM/4M03qCEyCn24Lmrxe+
         pZLVVhvkm2K3a2fY9Bs82fe0wRe+j0WAYw+trXLNoCQQuuNQTCm1RADlxpY++6iqlRAo
         UOkbabAvXrf7/D9DnEE6s70XcI7pgicycuil9GZe8fhZ0+NP1FCH6XPvvYRI9pPyXA85
         tgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794206747; x=1794811547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbgrA0BhhyOaMNoYIr3wWIPZv+I5yFfOyDuxCpBBfGk=;
        b=BhDgsFRMLTXqGgtFe02Bi4r0EwaP/P15ON+BKDuHS/61TQukYBEaZAf9PqOE8n9S3f
         qFfNU6eKHlhNfiZkYBaiCq4HfEWw460yb0UOxlDno8Uajz0FrNMZJdb8dRrCB6sp4S9z
         NtBxUx8qpyr7piWX03xVhE7B8Bi7Gnwi4M/R+X7sRbmV3ai1IcuYYEr0etg6YCCHsnGb
         3bNVQmICZgL/T96UmLVKOswWaBP9UF0mfTNbcEBvfH647Ee0SGvh0TJ6cMc4tx6NfFMa
         m6ohpCbmo0tms3wdnQc8tHLRDj2AWqn58bmabWXJIP2LB19V4Y35bI1O2CC26jKtACqP
         pVkg==
X-Forwarded-Encrypted: i=1; AL+hErHSGURE703mwlYFIqUEciHtzzmUkb31UdDhobpMhlzn4YIFu61tAiUBC+M7Fe44jkezUjLWsIyrAOrxRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AMrPtrojm3crpkX8P0pZc4BNIJuCHm0Ig/+EVTrjulGWSPGk/
	4yqdvlbiXibveoQPRj7rr0fbSvUqR5WiMqjWx97ANegeDAAY97YA/NEX
X-Gm-Gg: AYBFou1JgaK6uGEstxyPiwbhTsriK5VW1sfEnWVj+QBKvBV1SSIPEE7fXso3AEaQX2a
	+el5R2tTkF8xIyNsW3DS/CwmEU9gDWZGLcqMcMiGAeD5H4gUwpQQOE/qmr2zk204tDViMra0n2V
	sTBvTO6EZJ5WwQ5jYeTAnvVqXqJtAsQ1AnwXqDCPz9M7zyojQnf27FU0yUlR6eyYRGRUpyyLqXr
	scSZ5Z/wbhgRmqqwDTjbsp4yUJrl5aUJKJULwaRa9/B7tkBwp0kdWZY/nxPUFid8pt2fKRy0sFv
	pjlgHllHf3aTL63kSgvh7rVVMKxjsipJA5SE2nax0XpDJhKs+eJg3sfXhAy10lSl48B/cpehwik
	FpShfDljJudjDysUvqw/aY+LbpYKNteoqCjSkGbsvsw2IwJi6IViHRH+BUudpW2+haPzI2XIJuU
	HEEueAiAT3f4oND+3zwEB0oNB6woXClJWuLgkMJpKmpBeevc8XsvVjMzAxXeEuFhltMS+qge9xm
	mJrryzTWQ9IfYbSkvvVnPYOk7USgYkZpvnf/+mxRTjUA8ApyPf660kOT3uymndrObfyEYw4V0KS
	T+MnHA4e6+zX4SkjWTkd6EjezT56GUGvNALbZM8DTDsCYbralXWybdphYhTWL+hbUQ1slrP9OIL
	IB9Mr9fnRbeI207LroEjf71qNH3D5f9Aw7oZ4Kv2rBOi1NjZxmkWsi4E0C5mdnu+ElOyuLxAw1G
	RvQytazgZmSDI=
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5438445f8f.49.1794206747118;
        Sun, 08 Nov 2026 22:45:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm7827905f8f.35.2026.11.08.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:45:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:45:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout
 comment
Message-ID: <avFsFu5YzloDMbNb@stanley.mountain>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
 <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>

On Mon, Nov 09, 2026 at 06:12:23AM +0000, Lame Morupisi wrote:
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
> 
> Leave the frame layout diagram unchanged to preserve its
> existing representation.
> 
> Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
> ---

Why are you sending a v2?

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

The lines are not aligned now.

regards,
dan carpenter



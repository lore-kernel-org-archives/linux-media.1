Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F03D8103
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718122; cv=none; b=An3PMgA5WsPvkzhTnkA5DNBPtOBPvAKTkOkHkR3JsznCU1QlpXsAMWpXiAammQNM+IWRAqkoUeU42u+arTtSkV4WKhQWXFXCDy6DH3UeEXfivstO3QfIPSztEyapIXL47Q4e/IEUPCUjPa0Trrymu92yu+6bM3Rg4zMSd+uiW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718122; c=relaxed/simple;
	bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVP2DDHGc4oJUPy67DttrvpWxQmHQ/CE0iJdRdA4tL2S+O7oQI+HfBzzfYc2w+0WxBiJhSCfjK+1vuK0xOLK5PEJqHjIjKwBtvQb/D7/8R2b7aybqqyGakHzMkKmQdL+ZPyCagc84cTRYXnWXAtLMmXcElwBbw6bQ3SwW8Ensls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrOxzvN/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrOxzvN/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4629051c946so1568736f8f.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782718117; x=1783322917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
        b=UrOxzvN/VLZyexkM42OPh/9OB+oBzCCqGQnoAOCIPya+wOdsU0frbhCb2fR7dUu7T+
         IlnRyU7B8j4zKGbfdKVaHuQxRGxpsx6/YtqSkvLFEsnai3kZuY1cWl9NDpckegzAqfQ4
         Ao3bcEPd1zl29neZKxRM6iionnN0nE/ZYbQKSOEu5UhwFBFYacqYtiQ3hlVIBHkZ+eBR
         Q8EFYPW7bgSTvEo65YBJ2j6JBqQsa+IruDkro40c/fidgxZljjdRzB7MKKETNBcGo7ZY
         lLvXj0kTHJFjcbGUu/XXAEAJgKp4p8Wo3NUv5kBwSygAVWDbkl1ZJgOrAjNfKYzn2+YA
         XYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718117; x=1783322917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQpHZi11cKsP2uCr/CzXPM2KCFMIncW7KSkiCY3Sf8o=;
        b=VVOF5OTG85tvmo1IJm8FP+SeLEsln/7aVk8aBJN/JPJliCUclgVr5W4/dJqSNK0biF
         Ikzq46BmAv2pvSRU4HCjBekOoUtg7r1yC0emtwQKsgqO9vmKXdSx1khkJonxSJPVzTXc
         Dxve3Jh2Go5NOScRJe5q+3tDpPNWfi6fd+WMK+PmFb6FKqIVR5qTVzKTl+8BeB6mNeMB
         429BuWizg9IlQCUISWko104jY9J5exZDIl4jFZPnJOMWx7STxqjcGVOzYBTLod42icP3
         XPbGTMF1M7Dnq2MNLstAWxl+kx8TsOhiAlFZH7UxE7R701g/LeqqKQcn0sQWeFgb57mh
         14QA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw4lwoIHVLErYA1AFURL2N2jjknnJOuwq3EnNCNmLb8vg9ebo9/ZNImZVsu7V3RYflgtbq9oNhEIE7aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwROxYzw28HTidY3/gJTw27QT0PCO+WlrF+f8k5XkPrJWKYwMY8
	nzWydzm4Is9v0jjTHsqdp7BqScF6eLKG5IPEbdVkNUIp31xeRKTDMiW+
X-Gm-Gg: AfdE7cnMt0aPLJCwXCC42hPgFV0BnxeM6OU9ryzNxc3VKPw8zvn5QMcAir6Ht37MkLc
	RYgQ5JOq0L59/SiM6x7bw3eg5m1ix1TSrOXWFmraZx0ovZ4GrqMK9v0CBA7C+i0Tty24LmgeEtG
	yaKUAuiHV9Rs643rygF9M23nYA1e0jXuy/Hz94au3EvSy7oSEzUn4HaANw9A1YkuzVchE+LQP6S
	bmCKPdvQgj/axfFBEqxPid78Qwv/9wMKf+Fs7E30oYPqjBh08/i9NZSNxT+iKECG/7AhWxR5LEE
	lynVJV2VK1oC2c2YG1VJvAOvC/7wMg44bwRVpuVThWDcFWOZLqeK77+uDQTN4M6VpJ9Acn2Dc6S
	zBte+7DJpjVnkGMmrW8CDqiS7Bptv/DoPBAOvNjZhAIp1Q5d6ayRy4BzfMQfm+JIrFJ5dSfiwLa
	605tynF8kyhe6olhdnVARWWGn4
X-Received: by 2002:a05:6000:3110:b0:46f:1b89:999 with SMTP id ffacd0b85a97d-46f1b890a94mr16268450f8f.30.1782718116866;
        Mon, 29 Jun 2026 00:28:36 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm40122019f8f.4.2026.06.29.00.28.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jun 2026 00:28:36 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:28:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com, contact@pgazz.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Dinghao Liu
 <dinghao.liu@zju.edu.cn>
Subject: Re: WARNING in usb_free_urb
Message-ID: <20260629092832.355327e7.michal.pecio@gmail.com>
In-Reply-To: <20260629092033.4a83e91b.michal.pecio@gmail.com>
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
	<85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
	<20260629092033.4a83e91b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 09:20:33 +0200, Michal Pecio wrote:
> The free(buf[i]) loop should simply be removed. It was mistakenly
> added by d571b592c6206, then a26efd1961a18 recognized the double free
> but attempted to fix it only by changing the order of freeing. Sent
> from .edu domain, so probably an automatic static analyzer fix...

Correction: it failed to recognize the double free, but it fixed a
different (real) problem that the buf array itself was already NULL
and couldn't be scanned for buffer pointers to free.

So it turned this NULL dereferenc into a double free.

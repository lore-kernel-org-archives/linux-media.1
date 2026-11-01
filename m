Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552749;
	b=zgUFoWhqCcCGujJmZpWEJUg0lMIf3BoqCEKzENb6KcXyttX6ymy+8K74tOh7YvxCO5Po
	 /KIw3TUKvQza28FymDWYaNEuSxmQ96KC+CXWF/naG0nUlNxn48Ksdy+mZMJTRl6vrkAG8
	 4HmXNhkjmEHQrm+X0ejOtASrXw5QzknUUO4f00vdQQ8Fw2LHJMHeo15oC+BrMpq6FC5Ym
	 WMsMhJOktqBhjSLO7MqKnbQaHCrCBq7E9BONxtGVC2xTBwNAGJLjrZsgR8wjVgORGGcMo
	 E2EoK717BlrxWaP75g0AGcDiplR5G3ZfUFS/Tzh6apesJYg8RQCveLYeG5tYLxF8m8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
	b=4nlXPpZUdRmbFVWBHhU/zreMxMwQdoaaPdmlnJsQuOkPf6VgTbXpDnfNrI9V957EnF+d
	 El+vX/zmhSoDS/fTA+qWblFcRtAodTEfDblyuem3PTYkSLkM2lOmvZuyDnYv/r50oloZz
	 LCgBMmKLtRh0wiJnV1IncH2kpo7IBjUqEgJXToRt3BKAnwW0yV4pPZsDrjlSRfVaj4qC+
	 knLz8qNDaaqOhQwdQWDHSlJ3zI3MqB6kOSpDu0MTbO14sSlH+vJGcHambE+FdXM24Q/kk
	 9QKdn+J2yZdSeN6cMvcDDk4DZVebhxDcOOVf2rl7BHeG255bxDKpeaqVZtgPZlPHbyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z5BYZyEe;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B136606A324
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 17:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B136606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z5BYZyEe
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso389632766b.1
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793552746; x=1794157546; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
        b=Z5BYZyEeTmuMSDHQvXppeyFakK9w+gHg3pVD2wgA/AQ8I14M/yjbNnvwPBu/MKtu/P
         7t0f183O9E/rnWYIDCR4DePHOpackA9HIMFYgj948YKB4xB/DqhlXl8hJ3+mDvENkikF
         RK3qqE4gygB+Pg4sm0GnTDvu1WtJMZcamqYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552746; x=1794157546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGp4jy0/mnk88TT9DGzx5ZXJaAepnvlzTn4tFZXcRUQ=;
        b=Y0+gdMW36wPVqTEGn9YkfKeM65NFGyKNwhItg16V13QIdIk17ZIvZrh9AZEYfYv8WO
         2Lzt5vCpDCLxwPQmHfkxceLhJtosPETY0os05+e0PJL5LQReV/hIQO8FgnuLhsxIXZLW
         SHRtXVCgeEBz0pnzwbD/ORp1B6Vr0PiOyNmMyRtJrSRk6YhzjE8dW9FqwMYqSx9fc2rS
         U4tEQDxRX5VNsyUPWtgBPNxRxjD6Gj4nTIY7kVdtyaBSg14y5qk6JZz15RspbuZqQKRn
         CeZDF1vCzQq+NryeGM+CglxwhgLtegB+SHyQUcwW5CNqihyCBrkwJf4a/LpZ47Z22JOW
         P19A==
X-Forwarded-Encrypted: i=1; AKwUvBzDNhNcuOfujraHEBSsPKFChUB7b/IOCXbvrjHwzLPq5PLPApXsE7oA1dcMYru3u2a0TqyHWonQwqQhoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUqvpDXX7mWCGNaiQBkPiM0rZagsUtB9tf2Zj0nzTPwkap4llD
	p0cAm820Uyuth76RHRGu6kemtliD2ZsaizUAIIEEKwH/+ocdmnkGZ4jrwPd/aTIfYGOZUGwsInF
	3Kod+oR8=
X-Gm-Gg: AYBFou20XHdRXjWhQ15O9PWJaLVGW9FxRhZAAd4oX+ELb0H0/O7wZfwGHB3zoKYJgIA
	3qcjDvZK3xRbfX/+VwlyzoZwNJ7N/8FPAAE3MepYYjUnQXzHcnNp7Y3KGPDSO0R8JinMfTytjJp
	rcUuq2d6W+8uxOMCT1xAnPDslpzxSMGAdHNCrS4K4fsMxqXTYhvhl1FeLQZB/B1Maz6+3aBo+7E
	zydkcMp+xdulobMvt5gr9zjagM6PDv4+Vv043oAYHWAWECEO9jkGjioSBnG1KeJtDgdEAoEjZ7K
	dokISLX/P5GePNGnMFoHdzYe3pfx9dilTebef1K7pJXbkutWSE/PBbMm3otB5Ljx+p6JwPvLSnb
	wDzYoZxrcfhDRg9p1pr+3CBQzcdLVF9C+HiMPQ5zmfB+/4cDY4FA6Sb21nOCMzG/0K+LTJTccFI
	cyyjI8/goeLKEvz4ZDqV9Xf923ayzAS/Fcm36JZwgWWe1PHsUaLOuXERrY0iziVtGtjRozBbIKE
	ZqVcqFODj7BfUlhj8tJ7wtxe/PHPpDSN+elpM0UlorDMwPXKoyeeHTtUe2NnpHwX25VUyfQ7kRG
	oWsB4VuVxgn1ECEXfl4lyFBV/BFLeePk/Dzs4ooIYLdIqV+zjwdcuDoPl+gaePrnxfb3Ur20KB3
	7dw==
X-Received: by 2002:a17:906:eecb:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c4ca7935dc8mr686900666b.1.1793552746390;
        Sun, 01 Nov 2026 09:05:46 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f606sm290158166b.39.2026.11.01.09.05.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 09:05:45 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso269087566b.2
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 09:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByGEjTU4GXGctXcwwPGSXUUKxoLAcpmCRr0J5Ak/smw3tog0AAbOQBMGXA62Fbgdxp20hckKawaWOKlPw==@vger.kernel.org
X-Received: by 2002:a17:907:d91:b0:c41:44f2:f7d2 with SMTP id
 a640c23a62f3a-c4ca7a4ff1amr616714766b.24.1793552745656; Sun, 01 Nov 2026
 09:05:45 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
 <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com> <20261101084528.53a1e83e@foz.lan>
In-Reply-To: <20261101084528.53a1e83e@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Nov 2026 09:05:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wifT3KtYFGxKBTcvOhXZ=Et6vMas95Y5LTCfqvYq6ic_A@mail.gmail.com>
X-Gm-Features: AclHuK8EIYK57ipaNaIf8oLyMNo-kh7kxRzYHxcOr1tewjlRB074sPPF9NpHMOU
Message-ID: <CAHk-=wifT3KtYFGxKBTcvOhXZ=Et6vMas95Y5LTCfqvYq6ic_A@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Ricardo Ribalda <ribalda@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 00:45, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> We opted to do that instead of using merges, as sometimes we're
> picking very small merge requests with just one patch or two.

So that appears similar to what github does by default, and I don't
hate the workflow for your kind of setup. I agree that it would
otherwise result in lots of pointless merges for small individual
commits that make it hard to see the big picture.

But I *do* hate how the commit times go bust.

So _please_ stop the commit time rewriting. It's really wrong. The're
a *reason* there is a separate author date and commit date, and the
commit date should be the time of the actual commit, not the time of
some *other* commit that does not exist any more.

I have no idea who controls that 'marge-bot' thing, but it needs
fixing and until it is fixed please stop using it.

                 Linus

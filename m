Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28C4AC163
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596918; cv=pass; b=ViBRdvNjIPdODWoUu72y9sXLE5cICpAmuGtPbXZlypFTEd+1xPU2Ndb+ulWECM+DgQUYrKUS5d6vFABYHLBLaKC4uUJzw/0Vq/ogNHl99Czc0/fAVgOxZuf68+ePg3fKvrzslmnxfbkzsY8K9eiaiy7smQ+S6ZqNLHzUBZkbWQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596918; c=relaxed/simple;
	bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pMBYf2yGccgp2uKFaKq0E7jseIAj0av3iH374ga8rh9ij/d7llCDgeccGiMwkps9CVs9G5j+Ae4aQaDVxH585MJZ4gSBh6sE0wQVmUKOo/RuTrDnpZz0YuckB5fi/c7jiQ6HFwYTm2PECoc/8O7UIsH9+zTaQ5qg4qGxtwhiAGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nrq2lmcs; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nrq2lmcs"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7a9afe43so2340405d50.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790596915; cv=none;
        d=google.com; s=arc-20260327;
        b=HL/xqV1YAWMYeaeNXKbRYpP8IBbqUksH9uKRei+sWbgYakcZ3dhymhrUmeJKOqg2M5
         5W/ZYMG29Rxze76/HSN6ZL+GijU7QWztC2E+eWm62ZGIgTJEeqA9Iwjy0ZzjAfsGkIK4
         WufSNbi1DZtbtUd4KktQ4kADROmEa3uO6ut9OK+QQol0ZA+EmTVYNVwyJhHHJVMsbY4i
         fyHFpDZcZ3axSKbH+PYYSQ4CVuWjEzvl8zHQcJRKHkdCL1ENibL1S0GXlkBJlSfIir3S
         Eh/1tZiUUA3uR1pPZmXfNGc4RrtTwbB0lVWYS26/YVt078xoyHUKPtdzwonCNg4kN1Vp
         6MZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        fh=ETrOcHwQ58SyLvzGb4JHKQwCU2L0lWzdsCnRWBxhxDw=;
        b=Wxd7sPxgpxadFC364d8wCBupVjL2HWbmrjlD4voVuGAkse8fwfWW+1c9SdPsn5gIjb
         UI8zN6ilL3gvgOhugP45UjaqhZHKZ/BHAI9sNWyGlHx0VsX7/KEejMA/bzmudHCtm0QW
         w75UuKGJkGlXCD+MBj/rVdZ/AomXmP3lcg9MxPDXFs+rVP+5S7LPg61K+7akT4jkp3Cp
         3BdkWzHB0A4R4c+EZvdOR3sLWVmFYPEWq2jFE/1XMbG1XJsNHNE5Imq0hFPoEEaoZl/u
         qoS9nTTFGNjGFSWTQ4CZRMsPCJVaHIrn3WDImTdwUERkWbjo4NWIgU7DC1po76WSmIfE
         qDeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790596915; x=1791201715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        b=Nrq2lmcsxmCdjnPgCHG9KquqJ8QgDJDLeN7+qgTfVB8B0U4V9n4q5gmT5cQJm8YKcd
         J/PrQpF/EmjTwa5up0y6JDgoYVWHrH3qpsZdIDCYO4Zk+MCIJfDUS7Aw47aDR7ZHcJpV
         P+0OoRRcdDi0jaBnb/JwV7D+zpctPDSp4xMQwsKQvMep2hTQ2UWVZ1uL4i1c6Zlzv8Id
         1He0aXE5JHsj1/2lu2fHMRaSZsrp6OhpklYtNSrwpnnjyKrr/Yde6DXtaFWYK5HmOcUo
         AFbr542PEcbwkH6n3qj/u57M8F+YvN26LD6D392APlr0e9mSIfwtdfj6ujGqvqXWdPS4
         EJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596915; x=1791201715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gA7wkBUxcv/CfOVMRSoZHWpisowbgGaWVMz60ApuciE=;
        b=FwSmqHy9h0aEve9WmH7msGARBU8DTeqQBeRLMNTymXHZ6XnbQtKvzDvSEaYJmUWWrt
         /GhrRh1Y04q17J4rL/LclYckxThpUO/esMWmW5LhoSndkR/fUk+7nJxbRrCSCPiepia0
         gKtqdhD4ORUNyqlUvgeTuiwaF/dXem1AJJ5YhoczfiZz8kkg5QaUdOFVVR3hAVQNhFXL
         nVVHpSRuDndPkXBDogN4dUes2oULB8lG6lrMutId43GU/wnrb4EhSmq3VogWdoHtFxUd
         Z9oJhlabeSiltI57XgIrblaVG7hhTZBA9DQqbYUk3TorMhAESMFbHVS3PTDh2dBZWEn4
         GXEg==
X-Forwarded-Encrypted: i=1; AKwUvByoDEFf4lC6NkS2hy3A74Z0oKiUXvp9d6/ddMBHoEwViU0KE/m7U6sw481DPoZ+pNvRNAt4snm+kNTL2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIal3KdOMpChBv+4UOdkE2L4CK6I0rmgqg76MFs4y0aw0JiHe+G
	vvr02TVUskdYNaePuHj4oZM6TXqZP4n6zrD8IAKboXbL8Utg3jGZOGTnrlHfjSIGPSyp0wS5KUV
	NdWfM20eQwvBPn45PMknwuvD1pFn8iefoYA==
X-Gm-Gg: AYBFou0sLnpZZGBKQ5BfpCwpeTL92DHsMe/wCtXfMpdwznrZ+vPo2O5w/65C4Rv+wzc
	A/vfinM6uvv+g8adZefZ8tQvgiV/4d9Ig5KXswn9jwp1NQQtYGPSThXi6RxaxW/6ERFH4ngVUhB
	FlH8asojJJeg9bStsHadJTa08U5aoNqpWMpXbTPiv81uRe1fAMtoZZ6dL00s9h72pYh+lPYkZkY
	FtXeOPPDoGqimvBOKbab5qseuZYaV5qaS2nmV8sLmhbJQHvMKqtfmaDSsQrBWOlxstImmS638jl
	T4TWLnGQreg9YqgLeQFO65JbtdmVCnTRtPQl3c0TGczKagZVWZ8VLd59bYMDl/HIBfcZPy5K/iV
	dm9xY/4W7EHH+Ddsow97kfhe39Lz06d5d/Phmap58txxe
X-Received: by 2002:a05:690e:4104:b0:66f:c1bc:c084 with SMTP id
 956f58d0204a3-672ed46f22amr4346039d50.76.1790596914854; Mon, 28 Sep 2026
 05:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918054851.26083-1-kartikey406@gmail.com> <arey7Lyzlb2lq09P@extorris.mess.org>
In-Reply-To: <arey7Lyzlb2lq09P@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:31:42 +0530
X-Gm-Features: AclHuK_DElKr2bW_YcTnR1z3WAtVyL-4qOXaLC7wBY2eg2tywusqgjLLtA0gkzk
Message-ID: <CADhLXY6CZkmhMqVDDf=u=EgPC7ni8M9Oc7WxpwVai-jxUh+f0g@mail.gmail.com>
Subject: Re: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:26=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
>
> The debug statement is pretty pointless anyway so why don't we remove
> that instead.
>
>

Sure, I will remove this and send patch v2

Thanks

Deepanshu
